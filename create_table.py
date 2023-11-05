import sqlite3
import logging

from random import randint
from faker import Faker

NUM_GROPE = 3
NUM_TEACHER = 5
NUM_SUBJECT = 7
NUM_STUDENT = 50
NUM_MARK = 20

fake = Faker()
db_file = 'hw_6.db'

# Відкрити підключення до БД
conn = sqlite3.connect(db_file)
cur = conn.cursor()

# Заповнити таблицю груп
for _ in range(NUM_GROPE):
    cur.execute("INSERT INTO groups (group_name) VALUES (?)", (fake.word(),))

# Заповнити таблицю викладачів
for _ in range(NUM_TEACHER):
    cur.execute("INSERT INTO teachers (fullname) VALUES (?)", (fake.name(),))

# Заповнити таблицю пердметів (з вказівкою викладача)
for _ in range(NUM_SUBJECT):
    cur.execute("INSERT INTO subjects (subject_name, teacher_id) VALUES (?, ?)", (fake.word(), randint(1, NUM_TEACHER)))

# Заповнити таблицю студентів
for _ in range(NUM_STUDENT):
    cur.execute("INSERT INTO students (fullname, group_id) VALUES (?, ?)", (fake.name(), randint(1, NUM_GROPE)))

# Заповнити таблицю з оцінками
for student_id in range(1, NUM_STUDENT + 1):
    for _ in range(NUM_MARK):
        cur.execute("INSERT INTO marks (student_id, subject_id, mark, mark_date) VALUES (?, ?, ?, ?)",
                    (student_id, randint(1, NUM_SUBJECT), randint(0, 100), fake.date_this_decade()))

try:
    # Зберегти зміни
    conn.commit()
except sqlite3.DatabaseError as e:
    logging.error(e)
    conn.rollback()
finally:
    # Закрити підкллючення до БД
    cur.close()
    conn.close()
