CREATE DATABASE Catalog_of_my_things;

CREATE TABLE item(
  id INT NOT NULL Generated Always As Identity,
  genre_id INT,
  source_id INT,
  label_id INT,
  author_id INT,
  publish_date Date,
  archived Boolean,

  CONSTRAINT fk_genre FOREIGN KEY(genre_id) REFERENCES genre(id)
  CONSTRAINT fk_label FOREIGN KEY(label_id) REFERENCES label(id)
  CONSTRAINT fk_author FOREIGN KEY(author_id) REFERENCES author(id)

  PRIMARY KEY(id)
);

CREATE TABLE author(
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  items ARRAY
);

CREATE TABLE Game(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  multiplayer VARCHAR(100),
  last_played_at DATE,
  publish_date DATE,
  archived BOOLEAN,
  author_id INT REFERENCES Author(id),
  label_id INT REFERENCES labels(id),    
  items ARRAY
);