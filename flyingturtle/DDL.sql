CREATE TABLE `tb_group_code` (
  `group_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '그룹번호',
  `group_name` varchar(30) NOT NULL COMMENT '그룹이름',
  PRIMARY KEY (`group_no`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


CREATE TABLE `tb_code` (
  `code_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '분류번호',
  `code_name` varchar(30) NOT NULL COMMENT '분류명',
  `group_no` int(11) NOT NULL COMMENT '그룹번호',
  PRIMARY KEY (`code_no`),
  KEY `FK_tb_code_group_no_tb_group_code_group_no` (`group_no`),
  CONSTRAINT `FK_tb_code_group_no_tb_group_code_group_no` FOREIGN KEY (`group_no`) REFERENCES `tb_group_code` (`group_no`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='분류이름값';


CREATE TABLE `tb_file` (
  `file_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '파일번호',
  `ori_name` varchar(450) NOT NULL COMMENT '원본이름',
  `sys_name` varchar(450) NOT NULL COMMENT '시스템이름',
  `path` varchar(450) NOT NULL COMMENT '파일경로',
  `size` int(11) NOT NULL COMMENT '파일사이즈',
  `file_group_no` int(11) NOT NULL COMMENT '글 등록시 파일그룹번호 먼저 생성',
  PRIMARY KEY (`file_no`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;


-- 회원

CREATE TABLE `tb_member` (
  `member_no` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL,
  `pass` varchar(200) NOT NULL,
  `email` varchar(45) NOT NULL,
  `name` varchar(20) NOT NULL,
  `profile` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `goal` varchar(500) DEFAULT NULL,
  `major` varchar(100) DEFAULT NULL,
  `member_code` char(2) NOT NULL DEFAULT '50',
  `pattern_pass` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`member_no`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COMMENT='회원';


-- 출석

CREATE TABLE `tb_attendance` (
  `attend_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '출결번호',
  `code_no` int(11) NOT NULL DEFAULT '23' COMMENT '결석',
  `member_no` int(11) NOT NULL COMMENT '회원번호',
  `attend_reg_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '출석일',
  `check_in` time DEFAULT NULL COMMENT '입실',
  `check_out` time DEFAULT NULL COMMENT '퇴실',
  `special_note` varchar(200) DEFAULT NULL COMMENT '특이사항',
  `category_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`attend_no`),
  KEY `FK_tb_attendance_member_no_tb_member_member_no` (`member_no`),
  KEY `FK_tb_attendance_code_no_tb_code_code_no` (`code_no`),
  CONSTRAINT `FK_tb_attendance_code_no_tb_code_code_no` FOREIGN KEY (`code_no`) REFERENCES `tb_code` (`code_no`),
  CONSTRAINT `FK_tb_attendance_member_no_tb_member_member_no` FOREIGN KEY (`member_no`) REFERENCES `tb_member` (`member_no`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8;


-- 공지
CREATE TABLE `tb_notice` (
  `board_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '글번호',
  `member_no` int(11) DEFAULT NULL,
  `title` varchar(200) NOT NULL COMMENT '제목',
  `content` varchar(5000) NOT NULL COMMENT '내용',
  `reg_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '작성일',
  `view_cnt` int(11) DEFAULT '0' COMMENT '조회수',
  `file_group_no` int(11) DEFAULT NULL COMMENT '파일그룹번호',
  PRIMARY KEY (`board_no`),
  KEY `member_no` (`member_no`),
  CONSTRAINT `tb_notice_ibfk_1` FOREIGN KEY (`member_no`) REFERENCES `tb_member` (`member_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;


-- 취업정보

CREATE TABLE `tb_employment` (
  `emp_no` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `url` varchar(400) NOT NULL,
  `reg_date` date DEFAULT NULL COMMENT '등록일',
  `end_date` date NOT NULL,
  `site` varchar(45) NOT NULL,
  `company` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`emp_no`),
  UNIQUE KEY `url_UNIQUE` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=1108 DEFAULT CHARSET=utf8 COMMENT='취업정보';



-- 메모

CREATE TABLE `tb_memo_subject` (
  `sbj_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '과목번호',
  `subject_name` varchar(100) NOT NULL COMMENT '과목명',
  `member_no` int(11) NOT NULL,
  PRIMARY KEY (`sbj_no`),
  KEY `member_no_idx` (`member_no`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COMMENT='과목 - 메모';

CREATE TABLE `tb_memo` (
  `memo_no` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) NOT NULL COMMENT '메모 내용',
  `save` char(1) NOT NULL DEFAULT 'N' COMMENT '저장 여부',
  `sbj_no` int(11) DEFAULT NULL,
  `reg_date` datetime NOT NULL COMMENT '등록날짜',
  `edit_date` datetime DEFAULT NULL COMMENT '수정날짜',
  `member_no` int(11) NOT NULL,
  PRIMARY KEY (`memo_no`),
  KEY `member_no_idx` (`member_no`),
  KEY `sbj_no_idx` (`sbj_no`),
  CONSTRAINT `member_no` FOREIGN KEY (`member_no`) REFERENCES `tb_member` (`member_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sbj_no` FOREIGN KEY (`sbj_no`) REFERENCES `tb_memo_subject` (`sbj_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8;


-- 용어사전 

CREATE TABLE `tb_dic_subject` (
  `sbj_no` int(11) NOT NULL AUTO_INCREMENT,
  `sbj_name` varchar(100) NOT NULL,
  PRIMARY KEY (`sbj_no`)
) ENGINE=InnoDB AUTO_INCREMENT=280 DEFAULT CHARSET=utf8;

CREATE TABLE `tb_smallsub` (
  `ssbj_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '소과목번호',
  `sbj_no` int(11) NOT NULL COMMENT '과목번호',
  `ssbj_name` varchar(100) NOT NULL COMMENT '소과목명',
  PRIMARY KEY (`ssbj_no`),
  KEY `FK_tb_smallSub_sbj_no_tb_dic_subject_sbj_no` (`sbj_no`),
  CONSTRAINT `FK_tb_smallSub_sbj_no_tb_dic_subject_sbj_no` FOREIGN KEY (`sbj_no`) REFERENCES `tb_dic_subject` (`sbj_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=339 DEFAULT CHARSET=utf8 COMMENT='용어사전 소과목';

CREATE TABLE `tb_dictionary` (
  `dic_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '용어번호',
  `content` varchar(2000) DEFAULT NULL COMMENT '내용',
  `ssbj_no` int(11) NOT NULL COMMENT '과목번호',
  PRIMARY KEY (`dic_no`),
  KEY `FK_tb_dictionary_sbj_no_tb_smallSub_sbj_no` (`ssbj_no`),
  CONSTRAINT `FK_tb_dictionary_sbj_no_tb_smallSub_sbj_no` FOREIGN KEY (`ssbj_no`) REFERENCES `tb_smallsub` (`ssbj_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=utf8;


-- todo

CREATE TABLE `tb_project` (
  `pj_no` int(11) NOT NULL AUTO_INCREMENT COMMENT 'sequence',
  `title` varchar(100) NOT NULL COMMENT '프로젝트명',
  `member_no` int(11) NOT NULL COMMENT '회원번호',
  PRIMARY KEY (`pj_no`),
  KEY `member_no` (`member_no`),
  CONSTRAINT `tb_project_ibfk_1` FOREIGN KEY (`member_no`) REFERENCES `tb_member` (`member_no`)
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=utf8 COMMENT='프로젝트';

CREATE TABLE `tb_todo` (
  `todo_no` int(11) NOT NULL AUTO_INCREMENT COMMENT 'sequence',
  `pj_no` int(11) NOT NULL COMMENT '프로젝트번호',
  `content` varchar(200) NOT NULL COMMENT '할일',
  `endday` datetime DEFAULT NULL COMMENT '투두마감일',
  `deadline` date DEFAULT NULL COMMENT '마감기한',
  `code_no` int(11) DEFAULT '31',
  `member_no` int(11) NOT NULL,
  PRIMARY KEY (`todo_no`),
  KEY `code_no` (`code_no`),
  KEY `pj_no` (`pj_no`),
  CONSTRAINT `tb_todo_ibfk_1` FOREIGN KEY (`code_no`) REFERENCES `tb_code` (`code_no`),
  CONSTRAINT `tb_todo_ibfk_2` FOREIGN KEY (`pj_no`) REFERENCES `tb_project` (`pj_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=873 DEFAULT CHARSET=utf8 COMMENT='투두리스트';


-- 묻답

CREATE TABLE `tb_question` (
  `qna_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '글번호',
  `code_no` int(11) NOT NULL COMMENT '분류',
  `member_no` int(11) NOT NULL COMMENT '작성자',
  `reg_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일',
  `title` varchar(200) NOT NULL COMMENT '글제목',
  `view_cnt` int(11) DEFAULT '0' COMMENT '조회수',
  `type` varchar(45) NOT NULL COMMENT '글타입',
  `content` varchar(1000) NOT NULL COMMENT '글내용',
  `file_group_no` int(11) NOT NULL COMMENT '참조키X, 번호만 넘겨줘서 select로 가져오기.',
  PRIMARY KEY (`qna_no`),
  KEY `FK_tb_question_code_no_tb_code_code_no` (`code_no`),
  KEY `FK_tb_question_member_no_tb_member_member_no` (`member_no`),
  CONSTRAINT `FK_tb_question_code_no_tb_code_code_no` FOREIGN KEY (`code_no`) REFERENCES `tb_code` (`code_no`),
  CONSTRAINT `FK_tb_question_member_no_tb_member_member_no` FOREIGN KEY (`member_no`) REFERENCES `tb_member` (`member_no`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8 COMMENT='묻답게시판';

CREATE TABLE `tb_qna_com` (
  `com_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '댓글번호',
  `qna_no` int(11) NOT NULL COMMENT '글번호',
  `type` varchar(45) NOT NULL COMMENT '글번호',
  `member_no` int(11) NOT NULL COMMENT '댓글작성자',
  `reg_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `com_content` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`com_no`),
  KEY `FK_tb_qna_com_member_no_tb_member_member_no` (`member_no`),
  KEY `qna_no` (`qna_no`),
  CONSTRAINT `FK_tb_qna_com_member_no_tb_member_member_no` FOREIGN KEY (`member_no`) REFERENCES `tb_member` (`member_no`),
  CONSTRAINT `tb_qna_com_ibfk_1` FOREIGN KEY (`qna_no`) REFERENCES `tb_question` (`qna_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8 COMMENT='묻답댓글';

CREATE TABLE `tb_answer` (
  `asw_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '답변번호',
  `qna_no` int(11) NOT NULL COMMENT '글번호',
  `title` varchar(200) NOT NULL COMMENT '답변제목',
  `content` varchar(2000) NOT NULL COMMENT '답변내용',
  `member_no` varchar(45) NOT NULL COMMENT '회원번호',
  `reg_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일',
  `type` varchar(45) NOT NULL COMMENT '글타입',
  PRIMARY KEY (`asw_no`),
  KEY `qna_no` (`qna_no`),
  CONSTRAINT `tb_answer_ibfk_1` FOREIGN KEY (`qna_no`) REFERENCES `tb_question` (`qna_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;


-- 그림판 

CREATE TABLE `tb_can_subject` (
  `sbj_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '과목번호',
  `sbj_name` varchar(100) NOT NULL COMMENT '과목명',
  PRIMARY KEY (`sbj_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE `tb_can_ssubject` (
  `ssbj_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '소과목번호',
  `sbj_no` int(11) NOT NULL COMMENT '과목번호',
  `ssbj_name` varchar(100) NOT NULL COMMENT '소과목명',
  PRIMARY KEY (`ssbj_no`),
  KEY `FK_tb_can_ssubject_sbj_no_tb_can_subject_sbj_no` (`sbj_no`),
  CONSTRAINT `FK_tb_can_ssubject_sbj_no_tb_can_subject_sbj_no` FOREIGN KEY (`sbj_no`) REFERENCES `tb_can_subject` (`sbj_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;


-- 비디오 

CREATE TABLE `tb_vid_subject` (
  `subject_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '과목번호',
  `subject_name` varchar(450) NOT NULL COMMENT '과목이름',
  PRIMARY KEY (`subject_no`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8;

CREATE TABLE `tb_video` (
  `video_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '동영상 번호',
  `member_no` int(11) NOT NULL COMMENT '회원번호',
  `subject_no` int(11) NOT NULL COMMENT '과목번호',
  `title` varchar(450) NOT NULL COMMENT '제목',
  `content` varchar(500) DEFAULT NULL COMMENT '내용',
  `reg_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '등록일',
  `view_cnt` int(11) DEFAULT '0' COMMENT '조회수',
  `like_cnt` int(11) DEFAULT '0' COMMENT '좋아요',
  `video_addr` varchar(4500) NOT NULL COMMENT '동영상 주소',
  `code_no` int(11) NOT NULL DEFAULT '6',
  PRIMARY KEY (`video_no`),
  KEY `FK_tb_video_subject_no_tb_subject_subject_no` (`subject_no`),
  KEY `FK_tb_video_member_no_tb_member_member` (`member_no`),
  CONSTRAINT `FK_tb_video_member_no_tb_member_member` FOREIGN KEY (`member_no`) REFERENCES `tb_member` (`member_no`),
  CONSTRAINT `FK_tb_video_member_no_tb_member_member_no` FOREIGN KEY (`member_no`) REFERENCES `tb_member` (`member_no`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

CREATE TABLE `tb_video_com` (
  `com_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '댓글번호',
  `video_no` int(11) NOT NULL COMMENT '비디오 번호',
  `member_no` int(11) NOT NULL COMMENT '회원번호',
  `com_content` varchar(500) DEFAULT NULL,
  `reg_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '등록일',
  PRIMARY KEY (`com_no`),
  KEY `video_no` (`video_no`),
  CONSTRAINT `tb_video_com_ibfk_1` FOREIGN KEY (`video_no`) REFERENCES `tb_video` (`video_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8;


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