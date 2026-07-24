CREATE DATABASE IF NOT EXISTS rcb_webseite
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE rcb_webseite;

CREATE TABLE users (

id INT AUTO_INCREMENT PRIMARY KEY,

username VARCHAR(50) NOT NULL UNIQUE,

password_hash VARCHAR(255) NOT NULL,

firstname VARCHAR(100),

lastname VARCHAR(100),

email VARCHAR(150),

role ENUM(

'SuperAdmin',

'Administrator'

) NOT NULL DEFAULT 'Administrator',

active BOOLEAN DEFAULT TRUE,

last_login DATETIME,

created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
ON UPDATE CURRENT_TIMESTAMP

);

CREATE TABLE events (

id INT AUTO_INCREMENT PRIMARY KEY,

title VARCHAR(255),

description TEXT,

location VARCHAR(255),

start_date DATE,

end_date DATE,

registration_link TEXT,

pdf_file VARCHAR(255),

status ENUM(

'Entwurf',

'Veröffentlicht',

'Archiv'

) DEFAULT 'Entwurf',

created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
ON UPDATE CURRENT_TIMESTAMP

);

CREATE TABLE news (

id INT AUTO_INCREMENT PRIMARY KEY,

title VARCHAR(255),

short_text TEXT,

content LONGTEXT,

image VARCHAR(255),

published BOOLEAN DEFAULT FALSE,

published_at DATETIME,

author INT,

created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
ON UPDATE CURRENT_TIMESTAMP,

FOREIGN KEY (author)

REFERENCES users(id)

);

CREATE TABLE tracks (

id INT AUTO_INCREMENT PRIMARY KEY,

name VARCHAR(100),

status ENUM(

'Geöffnet',

'Geschlossen',

'Veranstaltung',

'Arbeitseinsatz'

),

description LONGTEXT,

training_times TEXT,

title_image VARCHAR(255),

gallery TEXT,

updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);

CREATE TABLE regulations (

id INT AUTO_INCREMENT PRIMARY KEY,

class_name VARCHAR(150),

version VARCHAR(20),

valid_from DATE,

content LONGTEXT,

published BOOLEAN DEFAULT FALSE,

created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);

CREATE TABLE sponsors (

id INT AUTO_INCREMENT PRIMARY KEY,

company VARCHAR(255),

website VARCHAR(255),

description TEXT,

logo VARCHAR(255),

type ENUM(

'Hauptsponsor',

'Premium',

'Standard',

'Unterstützer'

),

visible BOOLEAN DEFAULT TRUE

);

CREATE TABLE media (

id INT AUTO_INCREMENT PRIMARY KEY,

filename VARCHAR(255),

original_name VARCHAR(255),

category VARCHAR(100),

description TEXT,

uploaded_by INT,

uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

FOREIGN KEY (uploaded_by)

REFERENCES users(id)

);

CREATE TABLE results (

id INT AUTO_INCREMENT PRIMARY KEY,

event_id INT,

class VARCHAR(100),

driver VARCHAR(150),

laps INT,

best_lap DECIMAL(8,3),

average_lap DECIMAL(8,3),

position INT,

created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

FOREIGN KEY (event_id)

REFERENCES events(id)

);

CREATE TABLE live_sessions (

id INT AUTO_INCREMENT PRIMARY KEY,

track_id INT,

name VARCHAR(150),

status ENUM(

'Training',

'Qualifikation',

'Finale'

),

started DATETIME,

finished DATETIME,

FOREIGN KEY(track_id)

REFERENCES tracks(id)

);

CREATE TABLE drivers (

id INT AUTO_INCREMENT PRIMARY KEY,

firstname VARCHAR(100),

lastname VARCHAR(100),

club VARCHAR(255),

country VARCHAR(100),

transponder VARCHAR(50),

created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);

CREATE TABLE cars (

id INT AUTO_INCREMENT PRIMARY KEY,

driver_id INT,

class VARCHAR(100),

chassis VARCHAR(100),

motor VARCHAR(100),

esc VARCHAR(100),

battery VARCHAR(100),

body VARCHAR(100),

FOREIGN KEY(driver_id)

REFERENCES drivers(id)

);

CREATE TABLE settings (

id INT AUTO_INCREMENT PRIMARY KEY,

setting_name VARCHAR(100),

setting_value LONGTEXT

);

CREATE TABLE logs (

id INT AUTO_INCREMENT PRIMARY KEY,

user_id INT,

action VARCHAR(255),

table_name VARCHAR(100),

created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

FOREIGN KEY(user_id)

REFERENCES users(id)

);

CREATE TABLE backups (

id INT AUTO_INCREMENT PRIMARY KEY,

filename VARCHAR(255),

created_by INT,

created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

FOREIGN KEY(created_by)

REFERENCES users(id)

);

