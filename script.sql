CREATE DATABASE test1;
DROP DATABASE test1;
-- Ejercicio
CREATE DATABASE Plumbing;
USE Plumbing;
CREATE TABLE clients(
	id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL
);
CREATE TABLE services(
	id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(250) NOT NULL,
    price DECIMAL(8,2) NOT NULL
);
CREATE TABLE plumbers(
	id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL
);
CREATE TABLE invoices(
	id INT PRIMARY KEY,
    client_id INT NOT NULL,
    FOREIGN KEY (client_id) REFERENCES clients(id),
    service_id INT NOT NULL,
    FOREIGN KEY (service_id) REFERENCES services(id),
    plumber_id INT NOT NULL,
    FOREIGN KEY (plumber_id) REFERENCES plumbers(id),
    date DATE NOT NULL,
    total DECIMAL(8,2) NOT NULL
);
CREATE TABLE discounts(
	id INT PRIMARY KEY,
    invoice_id INT NOT NULL,
    FOREIGN KEY (invoice_id) REFERENCES invoices(id),
    amount INT NOT NULL
);
CREATE TABLE payments(
	id INT PRIMARY KEY,
    invoice_id INT,
    FOREIGN KEY (invoice_id) REFERENCES invoices(id),
    amount INT NOT NULL,
    date DATE NOT NULL
);
CREATE TABLE audits(
	id INT PRIMARY KEY,
	audited_table VARCHAR(50) NOT NULL,
    action VARCHAR(50) NOT NULL,
    date DATE NOT NULL
);