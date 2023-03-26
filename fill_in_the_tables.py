from datetime import datetime, date, timedelta
from random import randint
import sqlite3

from faker import Faker

fake = Faker("uk-UA")

subjects = [
    "Математичні задачі енергетики",
    "Електричні мережі ",
    "Математичні моделі електричних систем",
    "Методи оптимізації режимів енергосистем ",
    "Регулювання режимів електричних систем",
    "Теорія автоматичного керування",
    "Моделі оптимального розвитку енергосистем"
]

groups = [
    "EC-91",
    "EK-91",
    "EM-91"
]

NUMBERS_TEACHERS = randint(3, 5)
NUMBERS_STUDENTS = randint(30, 50)

connect = sqlite3.connect("SQL_basics.sqlite")
cur = connect.cursor()


def create_teachers():
    teachers = [fake.name() for _ in range(NUMBERS_TEACHERS)]
    sql_ex = "INSERT INTO teachers(full_name_teacher) VALUES(?);"
    cur.executemany(sql_ex, zip(teachers, ))


def create_groups():
    sql_ex = "INSERT INTO groups(name_group) VALUES(?);"
    cur.executemany(sql_ex, zip(groups, ))


def create_subjects():
    sql_ex = "INSERT INTO subjects(subject, teacher_id) VALUES(?, ?);"
    list_teachers_id = [randint(1, NUMBERS_TEACHERS) for _ in range(len(subjects))]
    cur.executemany(sql_ex, zip(subjects, iter(list_teachers_id)))


def create_students():
    students = [fake.name() for _ in range(NUMBERS_STUDENTS)]
    sql_ex = "INSERT INTO students(full_name_student, group_id) VALUES(?, ?);"
    list_group_id = [randint(1, len(groups)) for _ in range(NUMBERS_STUDENTS)]
    print(list_group_id)
    cur.executemany(sql_ex, zip(students, iter(list_group_id)))


def create_grates():
    start_of_studies = datetime.strptime("2022-09-01", "%Y-%m-%d")
    end_of_studies = datetime.strptime("2023-06-30", "%Y-%m-%d")

    sql_ex = "INSERT INTO grades(student_id, subject_id, grade, date_of) VALUES(?, ?, ?, ?);"

    def get_list_of_date(start_of_studies, end_of_studies):
        result = []
        current_date = start_of_studies
        while current_date <= end_of_studies:
            if current_date.isoweekday() < 6:
                result.append(current_date)
            current_date += timedelta(1)
        return result

    list_dates = get_list_of_date(start_of_studies, end_of_studies)

    grades = []
    for student in range(1, NUMBERS_STUDENTS):
        for _ in range(randint(1, 20)):
            random_subjects = randint(1, len(subjects))
            random_day = list_dates[randint(1, len(list_dates)-1)].date()
            grades.append((student, random_subjects, randint(1, 100), random_day))
    cur.executemany(sql_ex, grades)


if __name__ == "__main__":
    try:
        create_teachers()
        create_groups()
        create_subjects()
        create_students()
        create_grates()
        connect.commit()
    except sqlite3.Error as e:
        print(e)
    finally:
        connect.close()
