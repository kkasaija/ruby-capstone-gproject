CREATE DATABASE Catalog_of_my_things;

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
