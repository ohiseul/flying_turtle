-- 회원테이블

CREATE TABLE tb_member (
member_no INT NOT NULL AUTO_INCREMENT,
id VARCHAR(20) NOT NULL,
pass VARCHAR(20) NOT NULL,
email VARCHAR(45) NOT NULL,
name VARCHAR(20) NOT NULL,
profile VARCHAR(100) NULL,
address VARCHAR(200) NULL,
birth_date DATE NULL,
goal VARCHAR(500) NULL,
major VARCHAR(100) NULL,
member_code CHAR(2) NOT NULL DEFAULT '50',
PRIMARY KEY (member_no),
UNIQUE INDEX id_UNIQUE (id ASC),
UNIQUE INDEX email_UNIQUE (email ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '회원';

alter table tb_member
modify column pattern_pass varchar(8) NULL;

alter table tb_member modify column pass varchar(200);

-- 그룹코드

CREATE TABLE tb_group_code (
group_no INT NOT NULL AUTO_INCREMENT COMMENT '그룹번호',
group_name VARCHAR(30) NOT NULL COMMENT '그룹이름',
PRIMARY KEY (group_no)
);

-- 코드

CREATE TABLE tb_code (
code_no INT NOT NULL AUTO_INCREMENT COMMENT '분류번호',
code_name VARCHAR(30) NOT NULL COMMENT '분류명',
group_no INT NOT NULL COMMENT '그룹번호',
PRIMARY KEY (code_no)
);

ALTER TABLE tb_code COMMENT '분류이름값';

ALTER TABLE tb_code
ADD CONSTRAINT FK_tb_code_group_no_tb_group_code_group_no FOREIGN KEY (group_no)
REFERENCES tb_group_code (group_no) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- 질문 ( 예전 버전 코드로 남아서 code_no (char)> int 로 변경/// 날짜도)

CREATE TABLE tb_question (
qna_no INT NOT NULL AUTO_INCREMENT COMMENT '글번호',
code_no INT NOT NULL COMMENT '분류',
member_no INT NOT NULL COMMENT '작성자',
reg_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '등록일',
title VARCHAR(200) NOT NULL COMMENT '글제목',
view_cnt INT DEFAULT 0 COMMENT '조회수',
type VARCHAR(45) NOT NULL COMMENT '글타입',
content VARCHAR(1000) NOT NULL COMMENT '글내용',
file_group_no INT NOT NULL COMMENT '참조키X, 번호만 넘겨줘서 select로 가져오기.',
PRIMARY KEY (qna_no)
);

ALTER TABLE tb_question COMMENT '묻답게시판';

ALTER TABLE tb_question
ADD CONSTRAINT FK_tb_question_code_no_tb_code_code_no FOREIGN KEY (code_no)
REFERENCES tb_code (code_no) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE tb_question
ADD CONSTRAINT FK_tb_question_member_no_tb_member_member_no FOREIGN KEY (member_no)
REFERENCES tb_member (member_no) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- 프로젝트

CREATE TABLE tb_project (
pj_no INT NOT NULL AUTO_INCREMENT COMMENT 'sequence',
title VARCHAR(100) NOT NULL COMMENT '프로젝트명',
member_no INT NOT NULL COMMENT '회원번호',
PRIMARY KEY (pj_no)
);

ALTER TABLE tb_project COMMENT '프로젝트';

ALTER TABLE tb_project
ADD CONSTRAINT FK_tb_project_member_no_tb_member_member_no FOREIGN KEY (member_no)
REFERENCES tb_member (member_no) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- todo 프로젝트

CREATE TABLE flyingturtle.tb_project (
pj_no INT NOT NULL AUTO_INCREMENT COMMENT 'sequence',
title VARCHAR(100) NOT NULL COMMENT '프로젝트명',
member_no INT NOT NULL COMMENT '회원번호',
PRIMARY KEY (pj_no)
);

ALTER TABLE flyingturtle.tb_project COMMENT '프로젝트';

ALTER TABLE flyingturtle.tb_project
ADD FOREIGN KEY (member_no)
REFERENCES flyingturtle.tb_member (member_no) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- todo

CREATE TABLE flyingturtle.tb_todo (
todo_no INT NOT NULL AUTO_INCREMENT COMMENT 'sequence',
pj_no INT NOT NULL COMMENT '프로젝트번호',
content VARCHAR(200) NOT NULL COMMENT '할일',
endday DATETIME COMMENT '투두마감일',
deadline DATE NULL COMMENT '마감기한',
code_no INT NOT NULL COMMENT 'default : 미완료',
PRIMARY KEY (todo_no)
);

ALTER TABLE flyingturtle.tb_todo COMMENT '투두리스트';

ALTER TABLE flyingturtle.tb_todo
ADD FOREIGN KEY (code_no)
REFERENCES tb_code (code_no) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE flyingturtle.tb_todo
ADD FOREIGN KEY (pj_no)
REFERENCES tb_project (pj_no) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE flyingturtle.tb_todo
MODIFY COLUMN code_no int DEFAULT 31;

-- 누구나묻고답하기 qna

CREATE TABLE tb_qna_com (
com_no INT NOT NULL AUTO_INCREMENT COMMENT '댓글번호',
qna_no INT NOT NULL COMMENT '글번호',
type VARCHAR(45) NOT NULL COMMENT '글번호',
member_no INT NOT NULL COMMENT '댓글작성자',
reg_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '댓글등록일',
content VARCHAR(450) NOT NULL COMMENT '댓글내용',
PRIMARY KEY (com_no)
);

ALTER TABLE tb_qna_com COMMENT '묻답댓글';

ALTER TABLE tb_qna_com
ADD CONSTRAINT FK_tb_qna_com_member_no_tb_member_member_no FOREIGN KEY (member_no)
REFERENCES tb_member (member_no) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE tb_qna_com
ADD CONSTRAINT FK_tb_qna_com_qna_no_tb_question_qna_no FOREIGN KEY (qna_no)
REFERENCES tb_question (qna_no) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- tb_file Table

CREATE TABLE tb_file (
file_no INT NOT NULL AUTO_INCREMENT COMMENT '파일번호',
ori_name VARCHAR(450) NOT NULL COMMENT '원본이름',
sys_name VARCHAR(450) NOT NULL COMMENT '시스템이름',
path VARCHAR(450) NOT NULL COMMENT '파일경로',
size INT NOT NULL COMMENT '파일사이즈',
file_group_no INT NOT NULL COMMENT '글 등록시 파일그룹번호 먼저 생성',
PRIMARY KEY (file_no)
);

-- 상담일지

CREATE TABLE tb_Counseling (
coun_no INT NOT NULL AUTO_INCREMENT COMMENT '상담글번호',
code_no INT NULL COMMENT '분류번호',
content VARCHAR(2000) NULL COMMENT '상담내용',
reg_date DATE NULL COMMENT '상담일자',
member_no INT NOT NULL COMMENT '회원번호',
memo VARCHAR(450) NULL COMMENT '추가메모',
PRIMARY KEY (coun_no)
);

ALTER TABLE tb_Counseling
ADD CONSTRAINT FK_tb_Counseling_member_no_tb_member_member_no FOREIGN KEY (member_no)
REFERENCES tb_member (member_no) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE tb_Counseling
ADD CONSTRAINT FK_tb_Counseling_code_no_tb_code_code_no FOREIGN KEY (code_no)
REFERENCES tb_code (code_no) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- qna 답변

CREATE TABLE tb_Answer (
asw_no INT NOT NULL AUTO_INCREMENT COMMENT '답변번호',
qna_no INT NOT NULL COMMENT '글번호',
title VARCHAR(200) NOT NULL COMMENT '답변제목',
content VARCHAR(2000) NOT NULL COMMENT '답변내용',
member_no VARCHAR(45) NOT NULL COMMENT '회원번호',
type VARCHAR(45) NOT NULL COMMENT '글타입',
PRIMARY KEY (asw_no)
);

ALTER TABLE tb_Answer
ADD CONSTRAINT FK_tb_Answer_qna_no_tb_question_qna_no FOREIGN KEY (qna_no)
REFERENCES tb_question (qna_no) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- 공지사항

CREATE TABLE tb_notice (
board_no INT PRIMARY KEY AUTO_INCREMENT COMMENT '글번호',
member_no INT, foreign key(member_no) references tb_member(member_no)on delete cascade on update cascade,
title VARCHAR(200) NOT NULL COMMENT '제목',
content VARCHAR(5000) NOT NULL COMMENT '내용',
reg_date DATETIME default CURRENT_TIMESTAMP COMMENT '작성일',
view_cnt INT default 0 COMMENT '조회수',
file_group_no INT NULL COMMENT '파일그룹번호'
);

alter table tb_member
add column (pattern_pass INT NULL);

-- tb_group_code 데이터

INSERT INTO flyingturtle.tb_group_code (group_no, group_name) VALUES ('1', '회원분류');
INSERT INTO flyingturtle.tb_group_code (group_no, group_name) VALUES ('2', '묻고답하기');
INSERT INTO flyingturtle.tb_group_code (group_no, group_name) VALUES ('3', '상담');
INSERT INTO flyingturtle.tb_group_code (group_no, group_name) VALUES ('4', '출석');
INSERT INTO flyingturtle.tb_group_code (group_no, group_name) VALUES ('5', 'todo');

-- tb_code 데이터

INSERT INTO flyingturtle.tb_code (code_no, code_name, group_no) VALUES ('1', '미답변', '2');
INSERT INTO flyingturtle.tb_code (code_no, code_name, group_no) VALUES ('2', '답변완료', '2');
INSERT INTO flyingturtle.tb_code (code_no, code_name, group_no) VALUES ('10', '미상담', '3');
INSERT INTO flyingturtle.tb_code (code_no, code_name, group_no) VALUES ('11', '상담완료', '3');
INSERT INTO flyingturtle.tb_code (code_no, code_name, group_no) VALUES ('20', '출석', '4');
INSERT INTO flyingturtle.tb_code (code_no, code_name, group_no) VALUES ('21', '지각', '4');
INSERT INTO flyingturtle.tb_code (code_no, code_name, group_no) VALUES ('22', '조퇴', '4');
INSERT INTO flyingturtle.tb_code (code_no, code_name, group_no) VALUES ('23', '결석', '4');
INSERT INTO flyingturtle.tb_code (code_no, code_name, group_no) VALUES ('30', '완료', '5');
INSERT INTO flyingturtle.tb_code (code_no, code_name, group_no) VALUES ('31', '미완료', '5');
INSERT INTO flyingturtle.tb_code (code_no, code_name, group_no) VALUES ('50', '학생', '1');
INSERT INTO flyingturtle.tb_code (code_no, code_name, group_no) VALUES ('51', '강사/메니저', '1');

-- 용어사전 과목

CREATE TABLE flyingturtle.tb_dic_subject (
sbj_no INT NOT NULL AUTO_INCREMENT,
sbj_name VARCHAR(100) NOT NULL,
PRIMARY KEY (sbj_no))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- 용어사전 소과목

CREATE TABLE tb_smallSub (
ssbj_no INT NOT NULL AUTO_INCREMENT COMMENT '소과목번호',
sbj_no INT NULL COMMENT '과목번호',
ssbj_name VARCHAR(100) NULL COMMENT '소과목명',
PRIMARY KEY (ssbj_no)
);

ALTER TABLE tb_smallSub
ADD CONSTRAINT FK_tb_smallSub_sbj_no_tb_dic_subject_sbj_no FOREIGN KEY (sbj_no)
REFERENCES tb_dic_subject (sbj_no) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- 용어사전

CREATE TABLE tb_dictionary (
dic_no INT NOT NULL AUTO_INCREMENT COMMENT '용어번호',
content VARCHAR(2000) NULL COMMENT '내용',
sbj_no INT NULL COMMENT '과목번호',
PRIMARY KEY (dic_no)
);

ALTER TABLE tb_dictionary
ADD CONSTRAINT FK_tb_dictionary_sbj_no_tb_smallSub_sbj_no FOREIGN KEY (sbj_no)
REFERENCES tb_smallSub (sbj_no) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE flyingturtle.tb_dictionary
DROP FOREIGN KEY FK_tb_dictionary_sbj_no_tb_smallSub_sbj_no;
ALTER TABLE flyingturtle.tb_dictionary
CHANGE COLUMN content content VARCHAR(2000) NOT NULL COMMENT '내용' ,
CHANGE COLUMN sbj_no ssbj_no INT(11) NOT NULL COMMENT '과목번호' ;
ALTER TABLE flyingturtle.tb_dictionary
ADD CONSTRAINT FK_tb_dictionary_sbj_no_tb_smallSub_sbj_no
FOREIGN KEY (ssbj_no)
REFERENCES flyingturtle.tb_smallsub (ssbj_no);

-- 용어사전 on cascade
ALTER TABLE flyingturtle.tb_smallsub
DROP FOREIGN KEY FK_tb_smallSub_sbj_no_tb_dic_subject_sbj_no;
ALTER TABLE flyingturtle.tb_smallsub
ADD CONSTRAINT FK_tb_smallSub_sbj_no_tb_dic_subject_sbj_no
FOREIGN KEY (sbj_no)
REFERENCES flyingturtle.tb_dic_subject (sbj_no)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE flyingturtle.tb_dictionary
DROP FOREIGN KEY FK_tb_dictionary_sbj_no_tb_smallSub_sbj_no;
ALTER TABLE flyingturtle.tb_dictionary
ADD CONSTRAINT FK_tb_dictionary_sbj_no_tb_smallSub_sbj_no
FOREIGN KEY (ssbj_no)
REFERENCES flyingturtle.tb_smallsub (ssbj_no)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- 용어사전 null 허용

ALTER TABLE flyingturtle.tb_dictionary
CHANGE COLUMN content content VARCHAR(2000) NULL COMMENT '내용' ;


-- 비디오 과목

CREATE TABLE flyingturtle.tb_vid_subject (
subject_no INT NOT NULL AUTO_INCREMENT COMMENT '과목번호',
subject_name VARCHAR(450) NOT NULL COMMENT '과목이름',
PRIMARY KEY (subject_no)
);

-- 비디오

CREATE TABLE flyingturtle.tb_video (
video_no INT NOT NULL AUTO_INCREMENT COMMENT '동영상 번호',
member_no INT NOT NULL COMMENT '회원번호',
subject_no INT NOT NULL COMMENT '과목번호',
title VARCHAR(450) NOT NULL COMMENT '제목',
content VARCHAR(500) NULL COMMENT '내용',
reg_date DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '등록일',
view_cnt INT DEFAULT 0 COMMENT '조회수',
like_cnt INT DEFAULT 0 COMMENT '좋아요',
video_addr VARCHAR(4500) NOT NULL COMMENT '동영상 주소',
PRIMARY KEY (video_no)
);

ALTER TABLE tb_video
ADD CONSTRAINT FK_tb_video_member_no_tb_member_member_no FOREIGN KEY (member_no)
REFERENCES tb_member (member_no) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE tb_video
ADD CONSTRAINT FK_tb_video_subject_no_tb_subject_subject_no FOREIGN KEY (subject_no)
REFERENCES flyingturtle.tb_vid_subject (subject_no) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- 비디오 댓글

CREATE TABLE flyingturtle.tb_video_com (
com_no INT NOT NULL AUTO_INCREMENT COMMENT '댓글번호',
video_no INT NOT NULL COMMENT '비디오 번호',
member_no INT NOT NULL COMMENT '회원번호',
content VARCHAR(45) NOT NULL COMMENT '댓글내용',
reg_date DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '등록일',
PRIMARY KEY (com_no)
);

ALTER TABLE flyingturtle.tb_video_com
ADD CONSTRAINT FK_tb_video_com_video_no_tb_video_video_no FOREIGN KEY (video_no)
REFERENCES tb_video (video_no) ON DELETE RESTRICT ON UPDATE RESTRICT;


--그림판 과목

CREATE TABLE tb_can_subject (
sbj_no INT NOT NULL AUTO_INCREMENT COMMENT '과목번호',
sbj_name VARCHAR(100) NOT NULL COMMENT '과목명',
PRIMARY KEY (sbj_no)
);

--그림판 소과목

CREATE TABLE tb_can_ssubject(
ssbj_no INT NOT NULL AUTO_INCREMENT COMMENT '소과목번호',
sbj_no INT NOT NULL COMMENT '과목번호',
ssbj_name VARCHAR(100) NOT NULL COMMENT '소과목명',
PRIMARY KEY (ssbj_no)
);

ALTER TABLE tb_can_ssubject
ADD CONSTRAINT FK_tb_can_ssubject_sbj_no_tb_can_subject_sbj_no FOREIGN KEY (sbj_no)
REFERENCES tb_can_subject (sbj_no) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- 그림판 테이블

CREATE TABLE tb_canvas (
can_no INT NOT NULL AUTO_INCREMENT COMMENT '그림번호',
ssbj_no INT NOT NULL COMMENT '소과목번호',
sys_name VARCHAR(450) NOT NULL COMMENT '시스템이름',
ori_name VARCHAR(450) NOT NULL COMMENT '원본이름',
path VARCHAR(450) NOT NULL COMMENT '파일경로',
size INT NOT NULL COMMENT '파일사이즈',
reg_date DATETIME DEFAULT CURRENT_TIMESTAMP NULL COMMENT '등록일',
title VARCHAR(450) NOT NULL COMMENT '그림제목',
PRIMARY KEY (can_no)
);

ALTER TABLE tb_canvas
ADD CONSTRAINT FK_tb_canvas_ssbj_no_tb_can_ssubject_ssbj_no FOREIGN KEY (ssbj_no)
REFERENCES tb_can_ssubject (ssbj_no) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- 그림판 임시저장

CREATE TABLE tb_tem_save (
save_no INT NOT NULL AUTO_INCREMENT COMMENT '임시저장번호',
can_no INT NOT NULL COMMENT '그림번호',
canvas_info VARCHAR(21000) NOT NULL COMMENT '임시저장내용',
title VARCHAR(450) NULL COMMENT '제목',
size INT NOT NULL COMMENT '파일사이즈',
PRIMARY KEY (save_no)
);

ALTER TABLE tb_tem_save
ADD CONSTRAINT FK_tb_tem_save_can_no_tb_canvas_can_no FOREIGN KEY (can_no)
REFERENCES tb_canvas (can_no) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- 취업정보

CREATE TABLE tb_employment (
emp_no INT NOT NULL AUTO_INCREMENT,
title VARCHAR(200) NOT NULL,
url VARCHAR(400) NOT NULL,
date DATETIME NOT NULL,
PRIMARY KEY (emp_no))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '취업정보';

ALTER TABLE tb_employment
ADD COLUMN end_date DATE NOT NULL AFTER reg_date,
CHANGE COLUMN date reg_date DATE NULL COMMENT '등록일' ;

-- 취업정보 중복 크롤링 방지

ALTER TABLE flyingturtle.tb_employment
ADD UNIQUE INDEX url_UNIQUE (url ASC);
;

-- 취업정보 사이트명 추가

ALTER TABLE flyingturtle.tb_employment
ADD COLUMN site VARCHAR(45) NOT NULL AFTER end_date;

-- 취업정보 취업사이트 추가

ALTER TABLE flyingturtle.tb_employment
ADD COLUMN company VARCHAR(100) NULL AFTER site;

-- 출석테이블

CREATE TABLE tb_attendance (
attend_no INT NOT NULL AUTO_INCREMENT COMMENT '출결번호',
code_no INT NOT NULL default 23 COMMENT '결석',
member_no INT NOT NULL COMMENT '회원번호',
attend_reg_date DATETime NOT NULL default CURRENT_TIMESTAMP COMMENT '출석일',
check_in DATETime NULL COMMENT '입실',
check_out DATETime NULL COMMENT '퇴실',
special_note VARCHAR(200) NULL COMMENT '특이사항',
PRIMARY KEY (attend_no)
);

ALTER TABLE tb_attendance
ADD CONSTRAINT FK_tb_attendance_member_no_tb_member_member_no FOREIGN KEY (member_no)
REFERENCES tb_member (member_no) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE tb_attendance
ADD CONSTRAINT FK_tb_attendance_code_no_tb_code_code_no FOREIGN KEY (code_no)
REFERENCES tb_code (code_no) ON DELETE RESTRICT ON UPDATE RESTRICT;

alter table tb_attendance add (category_no int);

-- 메모 과목

CREATE TABLE flyingturtle.tb_memo_subject (
sbj_no INT NOT NULL AUTO_INCREMENT COMMENT '과목번호',
subject_name VARCHAR(100) NOT NULL COMMENT '과목명',
PRIMARY KEY (sub_no))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '과목 - 메모';

-- 메모 테이블

CREATE TABLE flyingturtle.tb_memo (
memo_no INT NOT NULL AUTO_INCREMENT,
content VARCHAR(1000) NOT NULL COMMENT '메모 내용',
save CHAR(1) NOT NULL DEFAULT 'N' COMMENT '저장 여부',
subject_no INT NULL,
reg_date DATETIME NULL COMMENT '등록날짜',
update DATETIME NULL COMMENT '수정날짜',
member_no INT NOT NULL,
PRIMARY KEY (memo_no),
INDEX member_no_idx (member_no ASC),
CONSTRAINT member_no
FOREIGN KEY (member_no)
REFERENCES flyingturtle.tb_member (member_no)
ON DELETE CASCADE
ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- 메모 과목테이블 참조

ALTER TABLE flyingturtle.tb_memo
CHANGE COLUMN subject_no sbj_no INT(11) NULL DEFAULT NULL ,
ADD INDEX sbj_no_idx (sbj_no ASC);
;
ALTER TABLE flyingturtle.tb_memo
ADD CONSTRAINT sbj_no
FOREIGN KEY (sbj_no)
REFERENCES flyingturtle.tb_memo_subject (sbj_no)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- 메모 과목 멤버 번호 추가

ALTER TABLE flyingturtle.tb_memo_subject
ADD COLUMN member_no INT NOT NULL AFTER subject_name,
ADD INDEX member_no_idx (member_no ASC);
;
ALTER TABLE flyingturtle.tb_memo_subject
ADD CONSTRAINT member_no
FOREIGN KEY (member_no)
REFERENCES flyingturtle.tb_member (member_no)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- 메모 수정

ALTER TABLE flyingturtle.tb_memo
CHANGE COLUMN reg_date reg_date DATETIME NOT NULL COMMENT '등록날짜' ,
CHANGE COLUMN update edit_date DATETIME NULL DEFAULT NULL COMMENT '수정날짜' ;

-- 비디오 부모키 참조 삭제

alter table tb_video drop foreign key FK_tb_video_subject_no_tb_subject_subject_no;
alter table tb_video drop foreign key FK_tb_video_subject_no_tb_subject_subject_no;

ALTER TABLE tb_video
ADD CONSTRAINT FK_tb_video_subject_no_tb_subject_subject_no FOREIGN KEY (subject_no)
REFERENCES tb_vid_subject (subject_no) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE tb_video
ADD CONSTRAINT FK_tb_video_member_no_tb_member_member FOREIGN KEY (member_no)
REFERENCES tb_member (member_no) ON DELETE RESTRICT ON UPDATE RESTRICT;