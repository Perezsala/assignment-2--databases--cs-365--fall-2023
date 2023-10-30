DROP DATABASE IF EXISTS passwords;

CREATE DATABASE passwords DEFAULT CHARACTER SET utf8mb4 ;

USE passwords;

SET block_encryption_mode = 'aes-256-cbc';

SET @key_str = UNHEX(SHA2('my secret passphrase', 512));

SET @init_vector = RANDOM_BYTES(16);


CREATE TABLE IF NOT EXISTS user_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    website_name VARCHAR(50) NOT NULL,
    website_url VARCHAR(100) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    username VARCHAR(50) NOT NULL,
    email_address VARCHAR(100) NOT NULL,
    password VARBINARY(100) NOT NULL,
    comment TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



INSERT INTO user_data (website_name, website_url, first_name, last_name, username, email_address, password, comment, timestamp)
VALUES ('Nike', 'https:// nike.com', 'John', 'Doe', 'johndoe', 'john@aol.com', AES_ENCRYPT('DoeJohn123@!', @key_str, @init_vector),'Example Comment','2023-10-25 10:15:00'),
('Snapchat', 'https:// snapchat.com', 'Liam', 'Harris', 'liamh', 'liam@aol.com', AES_ENCRYPT('LiamSnap2023!', @key_str, @init_vector),'Messaging','2023-10-25 16:10:00'),
('GitHub', 'https://github.com', 'Sophia', 'Roberts', 'sophiar', 'sophia@aol.com', AES_ENCRYPT('CodeMaster789!', @key_str, @init_vector),'Code', '2023-10-26 13:20:00'),
('Amazon', 'https://amazon.com', 'Sarah', 'Brown', 'sarahb', 'sarah@aol.com', AES_ENCRYPT('Ama$on123', @key_str, @init_vector), 'Online shopping.','2023-10-26 14:10:00'),
('LinkedIn', 'https://linkedin.com', 'Emily', 'Wilson', 'emilyw', 'emily@aol.com', AES_ENCRYPT('ConnectMe567', @key_str, @init_vector), 'Professional networking.','2023-10-27 12:05:00'),
('Instagram', 'https://instagram.com', 'Ava', 'Garcia', 'avag', 'ava@aol.com', AES_ENCRYPT('AvaInsta567$', @key_str, @init_vector), 'Photo Sharing', '2023-10-27 13:25:00'),
('Netflix', 'https://netflix.com', 'Daniel', 'Martinez', 'danmart', 'daniel@aol.com', AES_ENCRYPT('Str3amM3!', @key_str, @init_vector), 'Streaming entertainment.','2023-10-28  09:25:00'),
('Microsoft', 'https://microsoft.com', 'Chris', 'Anderson', 'chrisa', 'chris@aol.com', AES_ENCRYPT('MSPassword78@', @key_str, @init_vector), 'Business','2023-10-28 10:25:00'),
('YouTube', 'https://youtube.com', 'Laura', 'Wilson', 'lauraw', 'laura@aol.com', AES_ENCRYPT('YT123456@!', @key_str, @init_vector), 'Videos','2023-10-29 07:25:00'),
('Twitter', 'https://twitter.com', 'Robert', 'Lee', 'robertl', 'robert@aol.com', AES_ENCRYPT('TwitterPass12@', @key_str, @init_vector), 'Media','2023-10-29 13:25:00');