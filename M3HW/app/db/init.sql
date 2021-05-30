CREATE DATABASE IF NOT EXISTS somedatabase;

USE somedatabase;

CREATE TABLE IF NOT EXISTS sometable (
    id int NOT NULL AUTO_INCREMENT,
    somedata CHAR(240) NOT NULL,
    PRIMARY KEY (id)
);
