# Arori
KH Final Project

# 클래스 테이블
CREATE  TABLE classes ( 
c_no NUMBER PRIMARY KEY,
MEMBER_NO REFERENCES MEMBER(MEMBER_NO) ON DELETE CASCADE UNIQUE,
c_title varchar2(256) NOT NULL,
c_public NUMBER NOT NULL,
c_subscribe NUMBER,
c_when DATE DEFAULT SYSDATE NOT NULL
);
CREATE SEQUENCE classes_SEQ NOCACHE;
