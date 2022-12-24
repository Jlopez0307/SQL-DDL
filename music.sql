-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT DEFAULT NULL
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album_id INT REFERENCES albums ON DELETE CASCADE
);

CREATE TABLE artists_and_songs
(
  id SERIAL PRIMARY KEY,
  artist_id INT REFERENCES artists ON DELETE CASCADE,
  song_id INT REFERENCES songs ON DELETE CASCADE
);

CREATE TABLE songs_and_producers
(
  id SERIAL PRIMARY KEY,
  song_id INT REFERENCES songs ON DELETE CASCADE,
  producer_id INT REFERENCES producers ON DELETE CASCADE
);

INSERT INTO producers
(first_name,last_name)
VALUES
('Dust', 'Brothers'),
('Stephen', 'Lironi'),
('Roy Thomas', 'Baker'),
('Walter', 'Afanasieff'),
('Benjamin', 'Rice'),
('Rick', 'Parashar'),
('Al', 'Shux'),
('Max', 'Martin'),
('Cirkut', NULL),
('Shellback', NULL),
('Benny', 'Blanco'),
('The Matrix', NULL),
('Darkchild', NULL);

INSERT INTO artists
(first_name, last_name)
VALUES
('Hanson', NULL),
('Queen', NULL),
('Mariah', 'Cary'),
('Boyz II Men', NULL),
('Lady', 'Gaga'),
('Bradley', 'Cooper'),
('Nickelback', NULL),
('Jay', 'Z'),
('Alicia', 'Keys'),
('Katy', 'Perry'),
('Juicy J', NULL),
('Maroon 5', NULL),
('Christina', 'Aguilera'),
('Avril', 'Lavigne'),
('Destinys', 'Child');

INSERT INTO albums
(name)
VALUES
('Middle of Nowhere'),
('A Night at the Opera'),
('Daydream'),
('A Star Is Born'),
('Silver Side Up'),
('The Blueprint 3'),
('Prism'),
('Hands All Over'),
('Let Go'),
('The Writings on the Wall');



INSERT INTO songs
  (title, duration_in_seconds, release_date, album_id)
VALUES
  ('MMMBop', 238, '04-15-1997', 1),
  ('Bohemian Rhapsody', 355, '10-31-1975', 2),
  ('One Sweet Day', 282, '11-14-1995', 3),
  ('Shallow', 216, '09-27-2018', 4),
  ('How You Remind Me', 223, '08-21-2001', 5),
  ('New York State of Mind', 276, '10-20-2009', 6),
  ('Dark Horse', 215, '12-17-2013', 7),
  ('Moves Like Jagger', 201, '06-21-2011', 8),
  ('Complicated', 244, '05-14-2002', 9),
  ('Say My Name', 240, '11-07-1999', 10);

INSERT INTO artists_and_songs
(song_id, artist_id)
VALUES
(1,1),
(2,2),
(3,3),
(3,4),
(4,5),
(4,6),
(5,7),
(6,8),
(6,9),
(7,10),
(7,11),
(8,12),
(8,13),
(9,14),
(10,15);

INSERT INTO songs_and_producers
(song_id,producer_id)
VALUES
(1,1),
(1,2),
(2,3),
(3,4),
(4,5),
(5,6),
(6,7),
(7,8),
(8,9),
(8,10),
(9,11),
(10,12);
