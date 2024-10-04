DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist;

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    first_name TEXT,
    last_name TEXT, 
    email TEXT, 
    preferred_region INTEGER REFERENCES regions(id)
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT, 
    location TEXT NOT NULL,
    user_id INTEGER REFERENCES users(id),
    region_id INTEGER REFERENCES regions(id)
);

CREATE TABLE categories_posts (
    id SERIAL PRIMARY KEY,
    post_id INTEGER REFERENCES posts(id),
    category_id INTEGER REFERENCES categories(id)
);