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
