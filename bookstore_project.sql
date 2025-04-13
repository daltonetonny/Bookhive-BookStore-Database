-- bookstore.sql
-- SQL Implementation: Digital BookStore Database
-- Developed By:
--   Courage Joshua          | joshuacourage9@gmail.com
--   Babatunde Folarin Joel | folababsscopee@yahoo.com
--   Tonny Oballah          | daltonetonny@gmail.com
--
-- Submitted: 13th April 2025
-- Module: SQL Database Design & Development
--
-- Description:
-- This script constructs a structured MySQL database tailored for an online bookstore.
-- It includes normalized tables, foreign key constraints, and role-based user privileges.
-- The architecture reflects practical database planning and real-world commercial needs.

-- ===================================================
-- SECTION 1: Initialize Database
-- ===================================================
CREATE DATABASE IF NOT EXISTS DigitalBookStore;
USE DigitalBookStore;

-- ===================================================
-- SECTION 2: Supporting Tables (Lookup/Reference)
-- ===================================================

CREATE TABLE book_language (
    language_id INT AUTO_INCREMENT PRIMARY KEY,
    language_name VARCHAR(80) NOT NULL
);

CREATE TABLE publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    publisher_name VARCHAR(150) NOT NULL,
    contact_address VARCHAR(255)
);

CREATE TABLE author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    biography TEXT
);

CREATE TABLE address_status (
    address_status_id INT AUTO_INCREMENT PRIMARY KEY,
    label VARCHAR(40) NOT NULL
);

CREATE TABLE country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL
);

CREATE TABLE shipping_method (
    shipping_method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(100) NOT NULL,
    delivery_fee DECIMAL(10, 2)
);

CREATE TABLE order_status (
    order_status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_label VARCHAR(50) NOT NULL
);

-- ===================================================
-- SECTION 3: Main Business Tables
-- ===================================================

CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    publisher_id INT,
    language_id INT,
    release_date DATE,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
    FOREIGN KEY (language_id) REFERENCES book_language(language_id)
);

CREATE TABLE book_author (
    book_id INT NOT NULL,
    author_id INT NOT NULL,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

-- ===================================================
-- SECTION 4: Customer & Address Management
-- ===================================================

CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(200) UNIQUE,
    phone_number VARCHAR(50)
);

CREATE TABLE address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    street_address VARCHAR(200),
    city VARCHAR(100),
    region VARCHAR(100),
    zip_code VARCHAR(20),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

CREATE TABLE customer_address (
    customer_address_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    address_id INT,
    address_status_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (address_status_id) REFERENCES address_status(address_status_id)
);

-- ===================================================
-- SECTION 5: Orders and Transactions
-- ===================================================

CREATE TABLE cust_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    shipping_method_id INT,
    order_timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    order_status_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id),
    FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)
);

CREATE TABLE order_line (
    order_line_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT DEFAULT 1,
    item_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

CREATE TABLE order_history (
    order_history_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    order_status_id INT,
    status_changed_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    notes VARCHAR(255),
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)
);

-- ===================================================
-- SECTION 6: User Access Control
-- ===================================================

-- Read-Only Access User
CREATE USER IF NOT EXISTS 'readonly_user'@'localhost' IDENTIFIED BY 'readonly123';
GRANT SELECT ON DigitalBookStore.* TO 'readonly_user'@'localhost';

-- Full-Access Admin User
CREATE USER IF NOT EXISTS 'store_admin'@'localhost' IDENTIFIED BY 'admin123';
GRANT ALL PRIVILEGES ON DigitalBookStore.* TO 'store_admin'@'localhost';

FLUSH PRIVILEGES;

-- End of Script
