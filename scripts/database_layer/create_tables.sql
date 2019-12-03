DROP TABLE IF EXISTS admin CASCADE ;
DROP TABLE IF EXISTS publisher CASCADE ;
DROP TABLE IF EXISTS author CASCADE ;
DROP TABLE IF EXISTS category CASCADE ;
DROP TABLE IF EXISTS student_table CASCADE ;
DROP TABLE IF EXISTS book_table CASCADE ;
DROP TABLE IF EXISTS inventory_table CASCADE ;
DROP TABLE IF EXISTS inventory_table CASCADE ;
DROP TABLE IF EXISTS serial_number CASCADE ;
DROP TABLE IF EXISTS last_inventory CASCADE ;
DROP TABLE IF EXISTS sequence_issue_id CASCADE ;
DROP TABLE IF EXISTS issue_book CASCADE ;

-- Create tables
CREATE TABLE admin (
    sl_no           SERIAL PRIMARY KEY,
    user_name       VARCHAR(100) NOT NULL,
    password        VARCHAR(100) NOT NULL
) ;

CREATE TABLE publisher (
    sl_no           SERIAL PRIMARY KEY,
    publisher_name  VARCHAR(300) NOT NULL,
    profile         VARCHAR(100),
    added_on        VARCHAR(100)
) ;

CREATE TABLE author (
    sl_no           SERIAL PRIMARY KEY,
    author_name     VARCHAR(300) NOT NULL,
    profile         VARCHAR(100),
    added_on        VARCHAR(100)
) ;

CREATE TABLE category (
    sl_no           SERIAL PRIMARY KEY,
    category_name   VARCHAR(300) NOT NULL UNIQUE,
    profile         VARCHAR(100),
    added_on        VARCHAR(100)
) ;

CREATE TABLE student_table (
    student_id      VARCHAR(300) UNIQUE NOT NULL PRIMARY KEY,
    admission_no    VARCHAR(300) UNIQUE NOT NULL,
    student_name    VARCHAR(300) NOT NULL,
    profile         VARCHAR(30000),
    grade           VARCHAR(300),
    section         VARCHAR(300),
    added_by        VARCHAR(300),
    added_on        VARCHAR(300),
    status          INT NOT NULL
) ;

CREATE TABLE book_table (
    book_sl_no      VARCHAR(300) NOT NULL PRIMARY KEY,
    book_title      VARCHAR(300) UNIQUE NOT NULL,
    category_name   VARCHAR(300),
    category_num    VARCHAR(10),
    author_name     VARCHAR(300),
    author_num      VARCHAR(10),
    publisher_name  VARCHAR(300),
    publisher_num   VARCHAR(10),
    edition         VARCHAR(100),
    volume          VARCHAR(100),
    ean_code        VARCHAR(100),
    isbn            VARCHAR(300),
    price           VARCHAR(300),
    purchase_date   VARCHAR(300),
    language        VARCHAR(300),
    total_book_in_library   INT,
    total_book_available    INT,
    description     TEXT,
    added_on        VARCHAR(100),
    edited_on       VARCHAR(100),
    added_by        VARCHAR(100),
    edited_by       VARCHAR(100)
) ;

CREATE TABLE inventory_table (
    sl_no           VARCHAR(300) PRIMARY KEY NOT NULL,
    book_sl_no      VARCHAR(300) NOT NULL,
    book_title      VARCHAR(500) NOT NULL,
    count           INT NOT NULL,
    added_on        VARCHAR(100) NOT NULL,
    added_by        VARCHAR(100),
    FOREIGN KEY (book_sl_no) REFERENCES book_table(book_sl_no)
) ;

CREATE TABLE serial_number (
    sl_no           SERIAL PRIMARY KEY,
    invertry_sl_no  VARCHAR(300) NOT NULL,
    book_title      VARCHAR(500),
    book_sl_no      VARCHAR(300) NOT NULL,
    bar_code        VARCHAR(300) UNIQUE NOT NULL,
    book_status     VARCHAR(300) NOT NULL,
    added_on        VARCHAR(100) NOT NULL,
    description     TEXT,
    shelf           VARCHAR(300),
    rack            VARCHAR(300)
) ;

CREATE TABLE last_inventory (
    sl_no           SERIAL PRIMARY KEY,
    bar_code        INT NOT NULL,
    book_sl_no      VARCHAR(500)
) ;

CREATE TABLE sequence_issue_id (
    sl_no           INT NOT NULL PRIMARY KEY
) ;

CREATE TABLE issue_book (
    issue_sl_no     VARCHAR(50) NOT NULL UNIQUE PRIMARY KEY,
    student_id      VARCHAR(300) NOT NULL,
    admission_no    VARCHAR(300) NOT NULL,
    student_name    VARCHAR(300) NOT NULL,
    book_title      VARCHAR(500) NOT NULL,
    book_sl_no      VARCHAR(100) NOT NULL,
    barcode         VARCHAR(300) NOT NULL,
    issue_date      VARCHAR(300) NOT NULL,
    renew_date1     VARCHAR(300),
    renew_date2     VARCHAR(300),
    renew_date3     VARCHAR(300),
    renew_date4     VARCHAR(300),
    renew_date5     VARCHAR(300),
    return_date     VARCHAR(300),
    returned_date   VARCHAR(300),
    status          VARCHAR(300) NOT NULL,
    description     TEXT
) ;

GRANT ALL PRIVILEGES ON admin, publisher, author, category, student_table, book_table, 
book_table, inventory_table, serial_number, last_inventory, sequence_issue_id,
issue_book TO postgres ;

-- Insertions
INSERT INTO admin (user_name, password) VALUES ('j', 'j') ;
INSERT INTO sequence_issue_id VALUES (1) ;