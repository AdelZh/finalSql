CREATE TABLE university1(
                            id SERIAL primary key,
                            name VARCHAR(50),
                            address VARCHAR(50),
                            location VARCHAR


);


CREATE TABLE faculty(
                        id SERIAL primary key,
                        name VARCHAR NOT NULL,
                        university1_id INTEGER REFERENCES university1(id)

);


CREATE TABLE teacher(
                        id SERIAL primary key,
                        name VARCHAR(50),
                        phone VARCHAR,
                        salary bigint,
                        university1_id INTEGER REFERENCES university1(id)


);


CREATE TABLE students(
                         id SERIAL primary key,
                         name VARCHAR(50),
                         phone VARCHAR,
                         contract_price bigint,
                         university1_id INTEGER REFERENCES university1(id)



);


INSERT INTO university1 (name, address, location)
VALUES ('Cambridge', '456 Elm St', 'Town'),
       ('Harvard', '800 Oak St', 'Village'),
       ('Princeton University', '44 Oak St', 'New York');



INSERT INTO students (name, phone, contract_price, email, university1_id)
VALUES
    ('Alice Johnson', '555-123-4567', 15000, 'alice@gmail.com',1),
    ('Bob Smith', '555-234-5678', 14000,'bob@gmail.com',2),
    ('Charlie Brown', '555-345-6789', 16000, 'char@gmail.com',1),
    ('David Lee', '555-456-7890', 15500, 'david@gmail.com',3),
    ('Eva Martinez', '555-567-8901', 14800, 'eva@gmail.com', 2);



INSERT INTO faculty (name, university1_id)
VALUES
    ('Computer Science Department',1),
    ('Mathematics Department',2),
    ('Physics Department',2),
    ('English Department',3),
    ('History Department',3);


INSERT INTO teacher (name, phone, salary, university1_id)
VALUES
    ('John Smith', '555-123-4567', 55000,1),
    ('Mary Johnson', '555-234-5678', 60000, 2),
    ('David Lee', '555-345-6789', 52000,2),
    ('Emily Brown', '555-456-7890', 58000, 3),
    ('Michael Martinez', '555-567-8901', 54000,1);



ALTER TABLE students
    ADD email VARCHAR(100);











CREATE TABLE products(
                         id SERIAL primary key,
                         name VARCHAR(50),
                         manufacturer VARCHAR(50),
                         count INTEGER,
                         price INTEGER unique

);


CREATE TABLE users(
                      id SERIAL primary key,
                      user_name VARCHAR(100),
                      phone bigint NOT NULL,
                      address VARCHAR NOT NULL,
                      products_id INTEGER REFERENCES products(id)

);


CREATE TABLE sellers(
                        id SERIAL primary key,
                        seller_name VARCHAR not null,
                        seller_age INTEGER,
                        products_id INTEGER REFERENCES products(id)


);

INSERT INTO products (name, manufacturer, count, price)
VALUES ('Iphone', 'Apple', 100, 1200),
       ('Puma', 'Adidas', 180, 1300),
       ('Redmi 5', 'Samsung', 139, 3000);

INSERT INTO users (user_name, phone, address, email, products_id)
VALUES ('Adel', 0505457890, 'Dubai', 'adel@gmail.com', (SELECT id FROM products WHERE name = 'Iphone')),
       ('Michelle', 0707567890, 'Korea','michelle@gmail.com', (SELECT id FROM products WHERE name = 'Puma')),
       ('Sam', 0555673423, 'Singapore','sam@gmail.com', (SELECT id FROM products WHERE name = 'Redmi 5'));


INSERT INTO sellers (seller_name, seller_age, products_id)
VALUES ('Smith', 20, (SELECT id FROM products WHERE name = 'Iphone')),
       ('John', 18, (SELECT id FROM products WHERE name = 'Puma')),
       ('Obama', 34, (SELECT id FROM products WHERE name = 'Redmi 5'));

SELECT user_name FROM users WHERE products_id = 3;

ALTER TABLE users
    ADD email VARCHAR(100);

INSERT INTO users (user_name, phone, address, products_id, email)
VALUES ('John', 0712345678, 'New York', 2, 'john@example.com');


ALTER TABLE users
    DROP COLUMN email;