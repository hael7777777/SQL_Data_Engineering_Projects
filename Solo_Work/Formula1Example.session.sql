--@block
CREATE SCHEMA formula1racing;

--@block
USE formula1racing;
CREATE SCHEMA IF NOT EXISTS formula1racing;

--@block
CREATE TABLE racetrack (
    racetrack_id INT AUTO_INCREMENT,
    name VARCHAR(250) NOT NULL,
    city VARCHAR(50) NOT NULL,
    PRIMARY KEY (racetrack_id)
);

--@block
ALTER TABLE racetrack ADD COLUMN capacity INT;

--@block
ALTER TABLE racetrack CHANGE COLUMN capacity max_capacity INT NOT NULL;

--@block
ALTER TABLE racetrack DROP COLUMN max_capacity;

--@block
CREATE TABLE race (
    race_id INT PRIMARY KEY,
    name VARCHAR(250) NOT NULL,
    date DATE NOT NULL,
    laps INT NOT NULL,
    racetrack_id INT NOT NULL,
    FOREIGN KEY (racetrack_id) REFERENCES racetrack(racetrack_id)
);

--@block
ALTER TABLE racetrack
RENAME COLUMN name TO track_name;

--@block
INSERT INTO racetrack (track_name, city, track_length, type)
    VALUES ('Circuit de Spa-Francorchamps', 'Stavelot, Belgium', 7.004, 'Road Course'), 
    ('Silverstone Circuit', 'Silverstone, UK', 5.981, 'Road Course');

--@block 
SELECT * FROM race;

--@block
CREATE TABLE winner (
    winner_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    nationality VARCHAR(50) NOT NULL,
    team VARCHAR(50) NOT NULL
);

--@block
ALTER TABLE race ADD COLUMN winner_id INT,
    ADD FOREIGN KEY (winner_id) REFERENCES winner(winner_id);

--@block 
ALTER TABLE race
    RENAME COLUMN name TO race_name;

--@block
ALTER TABLE race
    CHANGE COLUMN date year INT NOT NULL;

--@block
INSERT INTO race (race_name, year, winner_id, racetrack_id)
    VALUES ('Belgian Grand Prix', 2023, 101, 1), 
    ('British Grand Prix', 2023, 102, 2);

--@block
ALTER TABLE race
    ALTER COLUMN laps SET DEFAULT 0;
