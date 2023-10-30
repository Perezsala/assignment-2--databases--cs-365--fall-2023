--Create a new entry into the database, which already has your 10 initial entries:

INSERT INTO user_data (website_name, website_url, first_name, last_name, username, email_address, password, comment)
VALUES ('Example Site', 'https://example.com', 'John', 'Doe', 'johndoe', 'johndoe@example.com', AES_ENCRYPT('example_password', @key_str, @init_vector), 'Example Comment');

-- Get the password associated with the URL of one of your 10 entries

SELECT AES_DECRYPT(password, @key_str, @init_vector) AS decrypted_password
FROM user_data
WHERE website_url = 'https://nike.com';

--To show the plain text password use:

SELECT CAST(AES_DECRYPT(password, @key_str, @init_vector) AS CHAR) AS 'Plain Text Password'
FROM user_data
WHERE website_url = 'https://nike.com';

--Get all the password-related data, including the password, associated with URLs that have https in TWO of your 10 entries

SELECT website_name, website_url, first_name, last_name, username, email_address, AES_DECRYPT(password, @key_str, @init_vector) AS decrypted_password, comment, timestamp
FROM user_data
WHERE website_url LIKE 'https%' 
LIMIT 2;

--Change a URL associated with one of the passwords in your 10 entries

--First get the password for the specific URL
SELECT CAST(AES_DECRYPT(password, @key_str, @init_vector) AS CHAR) AS 'Plain Text Password'
FROM user_data
WHERE website_url = 'https://nike.com';

--The password was 'DoeJohn123@!

--Once you get the specific password input it in place of 'specific_password' below:

UPDATE user_data
SET website_url = 'https://newnike.com'
WHERE password = AES_ENCRYPT('DoeJohn123@!', @key_str, @init_vector);

--Change any password

UPDATE user_data
SET password = AES_ENCRYPT('new_password', @key_str, @init_vector)
WHERE website_url = 'Example Site url';


--Remove a URL (Will delete tuple)

DELETE FROM user_data
WHERE website_url = 'https://nike.com';


--Remove a password(will delete tuple)

DELETE FROM user_data
WHERE password = AES_ENCRYPT('input password here', @key_str, @init_vector);





