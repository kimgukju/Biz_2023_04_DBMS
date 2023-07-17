CREATE DATABASE carDB;
USE carDB;

CREATE TABLE tbl_car (
c_seq	bigint		PRIMARY KEY	AUTO_INCREMENT,
c_division	VARCHAR(20)	NOT NULL,		
c_sdate	VARCHAR(10),			
c_stime	VARCHAR(10),			
c_sdistance	VARCHAR(20)	NOT NULL,
c_adate	VARCHAR(10),			
c_atime	VARCHAR(10),			
c_adistance	VARCHAR(20),			
c_place	VARCHAR(20)	NOT NULL,		
c_cost	bigint			
);

SELECT c_seq, c_division, c_sdate, c_stime,
		c_sdistance, c_adate, c_atime,
		c_adistance, c_place, c_cost
FROM tbl_car;

INSERT INTO tbl_car (
c_division, c_sdate, c_stime,
		c_sdistance, c_adate, c_atime,
		c_adistance, c_place
) VALUES (
	'출근','2023-07-14','07:29:00','180,000','2023-07-14','08:10:00','180,022','회사'
);

SELECT * FROM tbl_car;