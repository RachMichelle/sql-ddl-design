DROP DATABASE IF EXISTS med_center;

CREATE DATABASE med_center;

\c med_center;

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    specialty TEXT,
    degree_type TEXT
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL, 
    dob DATE NOT NULL,
    phone_number TEXT,
    address TEXT
);

CREATE TABLE diagnoses (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    icd_code FLOAT NOT NULL
);

CREATE TABLE patients_doctors (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients(id),
    doctor_id INTEGER REFERENCES doctors(id)
);

CREATE TABLE patients_diagnoses (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients(id),
    diagnosis_id INTEGER REFERENCES diagnoses(id)
);