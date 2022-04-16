-- Keep a log of any SQL queries you execute as you solve the mystery.
.schema
--CREATE TABLE crime_scene_reports (
--    id INTEGER,
--    year INTEGER,
--    month INTEGER,
--    day INTEGER,
--    street TEXT,
--    description TEXT,
--    PRIMARY KEY(id)
--);
--CREATE TABLE interviews (
--    id INTEGER,
--    name TEXT,
--    year INTEGER,
--    month INTEGER,
--    day INTEGER,
--    transcript TEXT,
--    PRIMARY KEY(id)
--);
--CREATE TABLE atm_transactions (
--    id INTEGER,
--    account_number INTEGER,
--    year INTEGER,
--    month INTEGER,
--    day INTEGER,
--    atm_location TEXT,
--    transaction_type TEXT,
--    amount INTEGER,
--    PRIMARY KEY(id)
--);
--CREATE TABLE bank_accounts (
--    account_number INTEGER,
--    person_id INTEGER,
--    creation_year INTEGER,
--    FOREIGN KEY(person_id) REFERENCES people(id)
--);
--CREATE TABLE airports (
--    id INTEGER,
--    abbreviation TEXT,
--    full_name TEXT,
--    city TEXT,
--    PRIMARY KEY(id)
--);
--CREATE TABLE flights (
--    id INTEGER,
--    origin_airport_id INTEGER,
--    destination_airport_id INTEGER,
--    year INTEGER,
--    month INTEGER,
--    day INTEGER,
--    hour INTEGER,
--    minute INTEGER,
--    PRIMARY KEY(id),
--    FOREIGN KEY(origin_airport_id) REFERENCES airports(id),
--    FOREIGN KEY(destination_airport_id) REFERENCES airports(id)
--);
--CREATE TABLE passengers (
--    flight_id INTEGER,
--    passport_number INTEGER,
--    seat TEXT,
--    FOREIGN KEY(flight_id) REFERENCES flights(id)
--);
--CREATE TABLE phone_calls (
--    id INTEGER,
--    caller TEXT,
--    receiver TEXT,
--    year INTEGER,
--    month INTEGER,
--    day INTEGER,
--    duration INTEGER,
--    PRIMARY KEY(id)
--);
--CREATE TABLE people (
--    id INTEGER,
--    name TEXT,
--    phone_number TEXT,
--    passport_number INTEGER,
--    license_plate TEXT,
--    PRIMARY KEY(id)
--);
--CREATE TABLE bakery_security_logs (
--    id INTEGER,
--    year INTEGER,
--    month INTEGER,
--    day INTEGER,
--    hour INTEGER,
--    minute INTEGER,
--    activity TEXT,
--    license_plate TEXT,
--    PRIMARY KEY(id)
--);

SELECT * FROM crime_scene_reports;
--id295 describe the cs50 duck information
SELECT * FROM crime_scene_reports WHERE id=295;
--  2021 | 7     | 28  | Humphrey Street  --Theft of the CS50 duck took place at 10:15am at the Humphrey Street bakery.
-- Interviews were conducted today with three witnesses who were present at the time – each of their interview transcripts mentions the bakery.
SELECT * FROM interviews WHERE transcripts LIKE "%bakery%" AND day=28;
--| 161 | Ruth    | 2021 | 7     | 28  | Sometime within ten minutes of the theft, I saw the thief get into a car in the bakery parking lot and drive away.
--If you have security footage from the bakery parking lot, you might want to look for cars that left the parking lot in that time frame.                                                          |
--| 162 | Eugene  | 2021 | 7     | 28  | I don't know the thief's name, but it was someone I recognized.
--Earlier this morning, before I arrived at Emma's bakery, I was walking by the ATM on Leggett Street and saw the thief there withdrawing some money.                                                                                                 |
--| 163 | Raymond | 2021 | 7     | 28  | As the thief was leaving the bakery, they called someone who talked to them for less than a minute.
--In the call, I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow.
--The thief then asked the person on the other end of the phone to purchase the flight ticket. |
--| 193 | Emma    | 2021 | 7     | 28  | I'm the bakery owner, and someone came in, suspiciously whispering into a phone for about half an hour.
--They never bought anything.
SELECT * FROM atm_transactions WHERE day=28 AND atm_location="Leggett Street" AND transaction_type="withdraw";
--+-----+----------------+------+-------+-----+----------------+------------------+--------+
--| id  | account_number | year | month | day |  atm_location  | transaction_type | amount |
--+-----+----------------+------+-------+-----+----------------+------------------+--------+
--| 246 | 28500762       | 2021 | 7     | 28  | Leggett Street | withdraw         | 48     |
--| 264 | 28296815       | 2021 | 7     | 28  | Leggett Street | withdraw         | 20     |
--| 266 | 76054385       | 2021 | 7     | 28  | Leggett Street | withdraw         | 60     |
--| 267 | 49610011       | 2021 | 7     | 28  | Leggett Street | withdraw         | 50     |
--| 269 | 16153065       | 2021 | 7     | 28  | Leggett Street | withdraw         | 80     |
--| 288 | 25506511       | 2021 | 7     | 28  | Leggett Street | withdraw         | 20     |
--| 313 | 81061156       | 2021 | 7     | 28  | Leggett Street | withdraw         | 30     |
--| 336 | 26013199       | 2021 | 7     | 28  | Leggett Street | withdraw         | 35     |
--+-----+----------------+------+-------+-----+----------------+------------------+--------+
SELECT * FROM bakery_security_logs WHERE day=28 AND hour=10 AND minute<25 AND minute>15;
--+-----+------+-------+-----+------+--------+----------+---------------+
--| id  | year | month | day | hour | minute | activity | license_plate |
--+-----+------+-------+-----+------+--------+----------+---------------+
--| 260 | 2021 | 7     | 28  | 10   | 16     | exit     | 5P2BI95       |
--| 261 | 2021 | 7     | 28  | 10   | 18     | exit     | 94KL13X       |
--| 262 | 2021 | 7     | 28  | 10   | 18     | exit     | 6P58WS2       |
--| 263 | 2021 | 7     | 28  | 10   | 19     | exit     | 4328GD8       |
--| 264 | 2021 | 7     | 28  | 10   | 20     | exit     | G412CB7       |
--| 265 | 2021 | 7     | 28  | 10   | 21     | exit     | L93JTIZ       |
--| 266 | 2021 | 7     | 28  | 10   | 23     | exit     | 322W7JE       |
--| 267 | 2021 | 7     | 28  | 10   | 23     | exit     | 0NTHK55       |
--+-----+------+-------+-----+------+--------+----------+---------------+
SELECT * FROM airports WHERE city="Fiftyville";
--+----+--------------+-----------------------------+------------+
--| id | abbreviation |          full_name          |    city    |
--+----+--------------+-----------------------------+------------+
--| 8  | CSF          | Fiftyville Regional Airport | Fiftyville |
--+----+--------------+-----------------------------+------------+
SELECT * FROM flights
JOIN airports ON flights.origin_airport_id=airports.id
WHERE flights.day=29 AND
airports.city="Fiftyville"
ORDER BY hour
LIMIT 1;
--+----+-------------------+------------------------+------+-------+-----+------+--------+----+--------------+-----------------------------+------------+
--| id | origin_airport_id | destination_airport_id | year | month | day | hour | minute | id | abbreviation |          full_name          |    city    |
--+----+-------------------+------------------------+------+-------+-----+------+--------+----+--------------+-----------------------------+------------+
--| 36 | 8                 | 4                      | 2021 | 7     | 29  | 8    | 20     | 8  | CSF          | Fiftyville Regional Airport | Fiftyville |
--+----+-------------------+------------------------+------+-------+-----+------+--------+----+--------------+-----------------------------+------------+
SELECT * FROM phone_calls WHERE day=28 AND duration <60;
--+-----+----------------+----------------+------+-------+-----+----------+
--| id  |     caller     |    receiver    | year | month | day | duration |
--+-----+----------------+----------------+------+-------+-----+----------+
--| 221 | (130) 555-0289 | (996) 555-8899 | 2021 | 7     | 28  | 51       |
--| 224 | (499) 555-9472 | (892) 555-8872 | 2021 | 7     | 28  | 36       |
--| 233 | (367) 555-5533 | (375) 555-8161 | 2021 | 7     | 28  | 45       |
--| 251 | (499) 555-9472 | (717) 555-1342 | 2021 | 7     | 28  | 50       |
--| 254 | (286) 555-6063 | (676) 555-6554 | 2021 | 7     | 28  | 43       |
--| 255 | (770) 555-1861 | (725) 555-3243 | 2021 | 7     | 28  | 49       |
--| 261 | (031) 555-6622 | (910) 555-3251 | 2021 | 7     | 28  | 38       |
--| 279 | (826) 555-1652 | (066) 555-9701 | 2021 | 7     | 28  | 55       |
--| 281 | (338) 555-6650 | (704) 555-2131 | 2021 | 7     | 28  | 54       |
--+-----+----------------+----------------+------+-------+-----+----------+
SELECT DISTINCT(name) FROM people
JOIN phone_calls ON people.phone_number=phone_calls.caller
JOIN passengers ON passengers.passport_number=people.passport_number
JOIN flights ON flights.id=passengers.flight_id
WHERE flights.id=36 AND
phone_calls.day=28 AND
phone_calls.duration<60;
--+--------+
--|  name  |
--+--------+
--| Sofia  |
--| Bruce  |
--| Kelsey |
--| Taylor |
--| Kenny  |
--+--------+
SELECT * FROM bakery_security_logs WHERE day=28
AND hour=10
AND minute<26
AND minute>15;
--+-----+------+-------+-----+------+--------+----------+---------------+
--| id  | year | month | day | hour | minute | activity | license_plate |
--+-----+------+-------+-----+------+--------+----------+---------------+
--| 260 | 2021 | 7     | 28  | 10   | 16     | exit     | 5P2BI95       |
--| 261 | 2021 | 7     | 28  | 10   | 18     | exit     | 94KL13X       |
--| 262 | 2021 | 7     | 28  | 10   | 18     | exit     | 6P58WS2       |
--| 263 | 2021 | 7     | 28  | 10   | 19     | exit     | 4328GD8       |
--| 264 | 2021 | 7     | 28  | 10   | 20     | exit     | G412CB7       |
--| 265 | 2021 | 7     | 28  | 10   | 21     | exit     | L93JTIZ       |
--| 266 | 2021 | 7     | 28  | 10   | 23     | exit     | 322W7JE       |
--| 267 | 2021 | 7     | 28  | 10   | 23     | exit     | 0NTHK55       |
--+-----+------+-------+-----+------+--------+----------+---------------+
SELECT DISTINCT(name) FROM people
JOIN phone_calls ON people.phone_number=phone_calls.caller
JOIN passengers ON passengers.passport_number=people.passport_number
JOIN flights ON flights.id=passengers.flight_id
JOIN bakery_security_logs ON bakery_security_logs.license_plate=people.license_plate
WHERE flights.id=36 AND
phone_calls.day=28 AND
phone_calls.duration<60 AND
bakery_security_logs.day=28 AND
bakery_security_logs.hour=10 AND
bakery_security_logs.minute<26 AND
bakery_security_logs.minute>15;
--+--------+
--|  name  |
--+--------+
--| Sofia  |
--| Bruce  |
--| Kelsey |
--+--------+
SELECT DISTINCT(name) FROM people
JOIN phone_calls ON people.phone_number=phone_calls.caller
JOIN passengers ON passengers.passport_number=people.passport_number
JOIN flights ON flights.id=passengers.flight_id
JOIN bakery_security_logs ON bakery_security_logs.license_plate=people.license_plate
JOIN bank_accounts ON bank_accounts.person_id=people.id
JOIN atm_transactions ON atm_transactions.account_number=bank_accounts.account_number
WHERE flights.id=36 AND
phone_calls.day=28 AND
phone_calls.duration<60 AND
bakery_security_logs.day=28 AND
bakery_security_logs.hour=10 AND
bakery_security_logs.minute<26 AND
bakery_security_logs.minute>15 AND
atm_transactions.day=28 AND
atm_transactions.atm_location="Leggett Street" AND
atm_transactions.transaction_type="withdraw";
--+-------+
--| name  |
--+-------+
--| Bruce |
--+-------+
SELECT DISTINCT(city) FROM people
JOIN phone_calls ON people.phone_number=phone_calls.caller
JOIN passengers ON passengers.passport_number=people.passport_number
JOIN flights ON flights.id=passengers.flight_id
JOIN bakery_security_logs ON bakery_security_logs.license_plate=people.license_plate
JOIN bank_accounts ON bank_accounts.person_id=people.id
JOIN atm_transactions ON atm_transactions.account_number=bank_accounts.account_number
JOIN airports ON airports.id=flights.destination_airport_id
WHERE flights.id=36 AND
phone_calls.day=28 AND
phone_calls.duration<60 AND
bakery_security_logs.day=28 AND
bakery_security_logs.hour=10 AND
bakery_security_logs.minute<26 AND
bakery_security_logs.minute>15 AND
atm_transactions.day=28 AND
atm_transactions.atm_location="Leggett Street" AND
atm_transactions.transaction_type="withdraw";
--+---------------+
--|     city      |
--+---------------+
--| New York City |
--+---------------+
SELECT DISTINCT(receiver) FROM people
JOIN phone_calls ON people.phone_number=phone_calls.caller
JOIN passengers ON passengers.passport_number=people.passport_number
JOIN flights ON flights.id=passengers.flight_id
JOIN bakery_security_logs ON bakery_security_logs.license_plate=people.license_plate
JOIN bank_accounts ON bank_accounts.person_id=people.id
JOIN atm_transactions ON atm_transactions.account_number=bank_accounts.account_number
JOIN airports ON airports.id=flights.destination_airport_id
WHERE flights.id=36 AND
phone_calls.day=28 AND
phone_calls.duration<60 AND
bakery_security_logs.day=28 AND
bakery_security_logs.hour=10 AND
bakery_security_logs.minute<26 AND
bakery_security_logs.minute>15 AND
atm_transactions.day=28 AND
atm_transactions.atm_location="Leggett Street" AND
atm_transactions.transaction_type="withdraw";
--+----------------+
--|    receiver    |
--+----------------+
--| (375) 555-8161 |
--+----------------+
SELECT name FROM people
WHERE phone_number="(375) 555-8161";
--+-------+
--| name  |
--+-------+
--| Robin |
--+-------+