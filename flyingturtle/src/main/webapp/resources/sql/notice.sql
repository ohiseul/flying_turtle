--테이블 조회
select * from tb_notice;



------------------------리뷰테이블생성

CREATE TABLE tb_notice
(
    `board_no`   INT              PRIMARY KEY    AUTO_INCREMENT COMMENT '글번호', 
    `member_no`  INT,          foreign key(member_no) references tb_member(member_no)on delete cascade on update cascade,
    `title`      VARCHAR(200)     NOT NULL    COMMENT '제목', 
    `content`    VARCHAR(5000)    NOT NULL    COMMENT '내용', 
    `reg_date`   DATETIME            default CURRENT_TIMESTAMP    COMMENT '작성일', 
    `view_cnt`   INT             default 0    COMMENT '조회수'
    `file_group_no` INT          NULL         COMMENT '파일그룹번호'
); 



--테이블 삭제
drop table tb_notice;

