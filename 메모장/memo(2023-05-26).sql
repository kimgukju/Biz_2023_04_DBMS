-- 여기는 memo 화면

-- tbl_memo 테이블 구성
--DROP TABLE tbl_memo;
-- 테이블 생성하고 칼럼명 m_seq 잘못만들어서 드랍한번하고 다시 생성함

CREATE TABLE tbl_memo (
        m_seq	NUMBER		PRIMARY KEY,
        m_writer	nVARCHAR2(20),
        m_date	VARCHAR2(10),		
        m_subject	nVARCHAR2(20),		
        m_content	nVARCHAR2(400)		

);

INSERT INTO tbl_memo(m_seq, m_writer, m_date, m_subject, m_content)
VALUES(1,'나','20230526','테스트','테스트용');

INSERT INTO tbl_memo(m_seq, m_writer, m_date, m_subject, m_content)
VALUES(2,'나2','20230526','테스트2','테스트용2');

-- 테스트용으로 INSERT 한번 하고 실행
SELECT * FROM tbl_memo;

COMMIT;

-- 자동으로 일련번호 넘버링 하게하기위해 SEQUENCE 적용
CREATE SEQUENCE seq_memo
START WITH 1 INCREMENT BY 1;

SELECT seq_memo.NEXTVAL 
FROM DUAL;

-- SEQUENCE 적용되나 연습
INSERT INTO tbl_memo(m_seq, m_writer, m_date,  m_subject, m_content)
VALUES(seq_memo.NEXTVAL, '나', '20230526', '테스트5', '테스트용5');

INSERT INTO tbl_memo(m_seq, m_writer, m_date,  m_subject, m_content)
VALUES(seq_memo.NEXTVAL, '나', '20230526', '테스트6', '테스트용6');

SELECT * FROM tbl_memo;

COMMIT;



