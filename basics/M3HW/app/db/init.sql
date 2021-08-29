CREATE DATABASE IF NOT EXISTS somedatabase;

USE somedatabase;

CREATE TABLE IF NOT EXISTS sometable (
    id int NOT NULL AUTO_INCREMENT,
    somedata CHAR(240) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO somedatabase.sometable SET somedata="some random data from db";
INSERT INTO somedatabase.sometable SET somedata="some more data from db";
INSERT INTO somedatabase.sometable SET somedata="some different data from db";
INSERT INTO somedatabase.sometable SET somedata="some all the data from db";
