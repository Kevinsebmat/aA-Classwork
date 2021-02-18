PRAGMA foreign_keys = ON;

DROP TABLE question_likes;
DROP TABLE replies;
DROP TABLE question_follows;
DROP TABLE questions;
DROP TABLE users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR NOT NULL,
  lname VARCHAR NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR NOT NULL,
  body VARCHAR NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  users_id INTEGER NOT NULL,
  questions_id INTEGER NOT NULL,

  FOREIGN KEY(users_id) REFERENCES users(id),
  FOREIGN KEY(questions_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  subject_question_id INTEGER NOT NULL,
  parent_reply_id INTEGER,
  users_id INTEGER NOT NULL,
  body TEXT NOT NULL,

  FOREIGN KEY(subject_question_id) REFERENCES questions(id),
  FOREIGN KEY(parent_reply_id) REFERENCES replies(id),
  FOREIGN KEY(users_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  users_id INTEGER NOT NULL,
  questions_id INTEGER NOT NULL,

  FOREIGN KEY(users_id) REFERENCES users(id),
  FOREIGN KEY(questions_id) REFERENCES questions(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Ned', 'Question'),
  ('Kush', 'Question'),
  ('Earl', 'Question');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('Ned Question', 'NED NED NED', (SELECT id FROM users WHERE fname = 'Ned' AND lname = 'Question')),
  ('Kush Question', 'KUSH KUSH KUSH', (SELECT id FROM users WHERE fname = 'Kush' AND lname = 'Question')),
  ('Earl Question', 'MEOW MEOW MEOW', (SELECT id FROM users WHERE fname = 'Earl' AND lname = 'Question'));

INSERT INTO
  replies (subject_question_id, parent_reply_id, users_id, body)
VALUES
  (1, 1, 1, 'Hello Ned'),
  (2, 2, 2, 'Hello Kush'),
  (3, 3, 3, 'Hello Earl'),
  (3, 3, 2, 'This is a child reply');
