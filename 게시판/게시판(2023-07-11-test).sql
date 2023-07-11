CREATE DATABASE root;

USE root;

CREATE TABLE tbl_bbs (
b_seq	BIGINT	PRIMARY KEY AUTO_INCREMENT,
b_pseq	BIGINT,	
b_date	VARCHAR(10)	,
b_time	VARCHAR(10)	,
b_username	VARCHAR(125),	
b_nickname	VARCHAR(125),	
b_subject	VARCHAR(125),	
b_content	TEXT,	
b_count	INT,	
b_update	DATETIME
);

SELECT * FROM tbl_bbs;

-- 정규화하기
SELECT b_username, b_nickname
FROM tbl_bbs
GROUP BY b_username, b_nickname;

CREATE TABLE tbl_user(
	username VARCHAR(125) PRIMARY KEY,
    nickname VARCHAR(125) NOT NULL,
    tel VARCHAR(20)
);

-- tbl_bbs 로 부터 user 정보 정규화로 분해하기
INSERT INTO tbl_user(username, nickname)
VALUES('callor@callor.com','내멋으로');

-- 3명의 유저 정보 INSERT 하기
INSERT INTO tbl_user(username, nickname, tel)
VALUES('hong','홍길동','090-1111-1111');
INSERT INTO tbl_user(username, nickname, tel)
VALUES('lee','이몽룡','090-2222-2222');
INSERT INTO tbl_user(username, nickname, tel)
VALUES('seoung','성춘향','090-3333-3333');

SELECT * FROM tbl_user;


-- tbl_user(username) 와 tbl_bbs(b_username) 
-- 테이블 간에 참조 무결성 관계 설정
-- 1:N 관계는?? -> user:1 bbs:N 

ALTER TABLE tbl_bbs
ADD CONSTRAINT F_USERNAME 
FOREIGN KEY (b_username)
REFERENCES tbl_user(username);

-- FK 설정이 되면 
-- 두 Table 간에 
-- INSERT, UPDATE, DELETE 에서 이상현상을 
-- 방지하여 참조무결성 관계를 유지한다 
INSERT INTO tbl_bbs(b_username, b_nickname)
VALUES ('aaa','임꺽정');

DESC tbl_bbs;

-- LIMIT * << MySQL 에서만 가능함
SELECT 
	B.b_seq,
	B.b_pseq,
	B.b_date,
	B.b_time,
	B.b_username,
    U.nickname,
	B.b_subject,
	B.b_content,
	B.b_count,
	B.b_update 
FROM tbl_bbs B, tbl_user U
	WHERE B.b_username = U.username
LIMIT 10;




