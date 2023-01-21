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

CREATE TABLE books (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  publish_date DATE NOT NULL,           
  archived  BOOLEAN NOT NULL,
  publisher VARCHAR(100) NOT NULL,
  cover_state VARCHAR(100) NOT NULL,
  label_id int,
  CONSTRAINT label_fk FOREIGN KEY (label_id) REFERENCES labels(id)
);

CREATE TABLE labels (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, 
  title VARCHAR(255) NOT NULL, 
  color VARCHAR(255) NOT NULL,
  items TEXT [] 
);

CREATE TABLE music(
  id INT NOT NULL Generated Always As Identity,
  on_spotify Boolean,
  genre_id INT,
  publish_date Date,
  archived Boolean,
  
  CONSTRAINT fk_genre FOREIGN KEY(genre_id) REFERENCES genre(id)
  PRIMARY KEY(id)
);

CREATE TABLE genre(
  id INT NOT NULL Generated Always As Identity,
  name varchar(100) NULL,
  
  PRIMARY KEY (id)
);
