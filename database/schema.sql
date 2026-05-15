-- PostgreSQL schema for IMP
CREATE DATABASE medical_center;
\c medical_center;
CREATE TABLE users (id SERIAL PRIMARY KEY, username VARCHAR(50) UNIQUE, password_hash TEXT, full_name VARCHAR(100), role VARCHAR(30), created_at TIMESTAMP DEFAULT NOW());
CREATE TABLE config_settings (id SERIAL PRIMARY KEY, category VARCHAR(50), key VARCHAR(50), value TEXT, type VARCHAR(20), updated_at TIMESTAMP DEFAULT NOW());
CREATE TABLE patients (id SERIAL PRIMARY KEY, file_number VARCHAR(20) UNIQUE, full_name VARCHAR(100), phone VARCHAR(20), gender VARCHAR(1), birth_date DATE, registration_date DATE DEFAULT CURRENT_DATE);
CREATE TABLE doctors (id SERIAL PRIMARY KEY, user_id INT REFERENCES users(id), specialization VARCHAR(100), working_hours JSONB, commission_percent DECIMAL(5,2));
CREATE TABLE services (id SERIAL PRIMARY KEY, name_ar VARCHAR(100), duration_minutes INT DEFAULT 15, base_price DECIMAL(10,2));
CREATE TABLE appointments (id SERIAL PRIMARY KEY, patient_id INT REFERENCES patients(id), doctor_id INT REFERENCES doctors(id), service_id INT REFERENCES services(id), start_time TIMESTAMP, end_time TIMESTAMP, status VARCHAR(20), total_cost DECIMAL(10,2));
CREATE TABLE queue_entries (id SERIAL PRIMARY KEY, appointment_id INT REFERENCES appointments(id), priority_level INT, estimated_wait_minutes INT, status VARCHAR(20));
CREATE TABLE drugs (id SERIAL PRIMARY KEY, scientific_name VARCHAR(200), brand_names JSONB, category VARCHAR(50), form VARCHAR(50), requires_prescription BOOLEAN);
CREATE TABLE drug_prices (id SERIAL PRIMARY KEY, drug_id INT REFERENCES drugs(id), selling_price DECIMAL(10,2), effective_date DATE);
CREATE TABLE invoices (id SERIAL PRIMARY KEY, patient_id INT REFERENCES patients(id), total_amount DECIMAL(10,2), paid_amount DECIMAL(10,2), status VARCHAR(20), created_at TIMESTAMP DEFAULT NOW());
CREATE TABLE lab_tests (id SERIAL PRIMARY KEY, name_ar VARCHAR(100), category VARCHAR(50), price DECIMAL(10,2));
CREATE TABLE lab_orders (id SERIAL PRIMARY KEY, patient_id INT REFERENCES patients(id), test_id INT REFERENCES lab_tests(id), status VARCHAR(20), result_text TEXT, result_date TIMESTAMP);
CREATE TABLE employees (id SERIAL PRIMARY KEY, user_id INT REFERENCES users(id), job_title VARCHAR(100), basic_salary DECIMAL(10,2));
CREATE TABLE payrolls (id SERIAL PRIMARY KEY, employee_id INT REFERENCES employees(id), month DATE, net_salary DECIMAL(10,2));
INSERT INTO users (username, password_hash, full_name, role) VALUES ('admin', 'dummy', 'مدير النظام', 'superadmin');
INSERT INTO config_settings (category, key, value, type) VALUES ('global','vat_percent','15','number');
