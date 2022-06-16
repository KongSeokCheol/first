
/* Drop Tables */

DROP TABLE AR_VR_board CASCADE CONSTRAINTS;
DROP TABLE Mobile_board CASCADE CONSTRAINTS;
DROP TABLE PC_board CASCADE CONSTRAINTS;
DROP TABLE PS_board CASCADE CONSTRAINTS;
DROP TABLE Switch_board CASCADE CONSTRAINTS;
DROP TABLE Xbox_board CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;




/* Create Tables */

-- board6
CREATE TABLE AR_VR_board
(
	-- bidx
	bidx number NOT NULL,
	-- originbidx
	originbidx number NOT NULL,
	-- depth
	depth number NOT NULL,
	-- level_
	level_ number,
	-- subject
	subject varchar2(100) NOT NULL,
	-- content
	content varchar2(1000) NOT NULL,
	-- writer : 닉네임으로 작성
	writer varchar2(20) NOT NULL,
	-- writeday
	writeday date DEFAULT SYSDATE,
	-- ip
	ip varchar2(20),
	-- midx
	midx number NOT NULL,
	PRIMARY KEY (bidx)
);


-- member1
CREATE TABLE member
(
	-- midx
	midx number NOT NULL,
	-- membernick
	membernick varchar2(20) NOT NULL,
	-- memberid
	memberid varchar2(20) NOT NULL,
	-- memberpwd
	memberpwd varchar2(20) NOT NULL,
	-- membername
	membername varchar2(20),
	-- memberbirth
	memberbirth varchar2(20),
	-- membergender
	membergender char(1),
	-- memberphone
	memberphone varchar2(20) NOT NULL,
	-- memberemail
	memberemail varchar2(20) NOT NULL,
	-- writeday
	writeday date DEFAULT SYSDATE,
	-- memberip
	memberip varchar2(20),
	-- delyn
	delyn char(1) DEFAULT 'N',
	PRIMARY KEY (midx)
);


-- board2
CREATE TABLE Mobile_board
(
	-- bidx
	bidx number NOT NULL,
	-- originbidx
	originbidx number NOT NULL,
	-- depth
	depth number NOT NULL,
	-- level_
	level_ number,
	-- subject
	subject varchar2(100) NOT NULL,
	-- content
	content varchar2(1000) NOT NULL,
	-- writer : 닉네임으로 작성
	writer varchar2(20) NOT NULL,
	-- writeday
	writeday date DEFAULT SYSDATE,
	-- ip
	ip varchar2(20),
	-- midx
	midx number NOT NULL,
	PRIMARY KEY (bidx)
);


-- board1
CREATE TABLE PC_board
(
	-- bidx
	bidx number NOT NULL,
	-- originbidx
	originbidx number NOT NULL,
	-- depth
	depth number NOT NULL,
	-- level_
	level_ number,
	-- subject
	subject varchar2(100) NOT NULL,
	-- content
	content varchar2(1000) NOT NULL,
	-- writer : 닉네임으로 작성
	writer varchar2(20) NOT NULL,
	-- writeday
	writeday date DEFAULT SYSDATE,
	-- ip
	ip varchar2(20),
	-- midx
	midx number NOT NULL,
	PRIMARY KEY (bidx)
);


-- board3
CREATE TABLE PS_board
(
	-- bidx
	bidx number NOT NULL,
	-- originbidx
	originbidx number NOT NULL,
	-- depth
	depth number NOT NULL,
	-- level_
	level_ number,
	-- subject
	subject varchar2(100) NOT NULL,
	-- content
	content varchar2(1000) NOT NULL,
	-- writer : 닉네임으로 작성
	writer varchar2(20) NOT NULL,
	-- writeday
	writeday date DEFAULT SYSDATE,
	-- ip
	ip varchar2(20),
	-- midx
	midx number NOT NULL,
	PRIMARY KEY (bidx)
);


-- board4
CREATE TABLE Switch_board
(
	-- bidx
	bidx number NOT NULL,
	-- originbidx
	originbidx number NOT NULL,
	-- depth
	depth number NOT NULL,
	-- level_
	level_ number,
	-- subject
	subject varchar2(100) NOT NULL,
	-- content
	content varchar2(1000) NOT NULL,
	-- writer : 닉네임으로 작성
	writer varchar2(20) NOT NULL,
	-- writeday
	writeday date DEFAULT SYSDATE,
	-- ip
	ip varchar2(20),
	-- midx
	midx number NOT NULL,
	PRIMARY KEY (bidx)
);


-- board5
CREATE TABLE Xbox_board
(
	-- bidx
	bidx number NOT NULL,
	-- originbidx
	originbidx number NOT NULL,
	-- depth
	depth number NOT NULL,
	-- level_
	level_ number,
	-- subject
	subject varchar2(100) NOT NULL,
	-- content
	content varchar2(1000) NOT NULL,
	-- writer : 닉네임으로 작성
	writer varchar2(20) NOT NULL,
	-- writeday
	writeday date DEFAULT SYSDATE,
	-- ip
	ip varchar2(20),
	-- midx
	midx number NOT NULL,
	PRIMARY KEY (bidx)
);



/* Create Foreign Keys */

ALTER TABLE AR_VR_board
	ADD FOREIGN KEY (midx)
	REFERENCES member (midx)
;


ALTER TABLE Mobile_board
	ADD FOREIGN KEY (midx)
	REFERENCES member (midx)
;


ALTER TABLE PC_board
	ADD FOREIGN KEY (midx)
	REFERENCES member (midx)
;


ALTER TABLE PS_board
	ADD FOREIGN KEY (midx)
	REFERENCES member (midx)
;


ALTER TABLE Switch_board
	ADD FOREIGN KEY (midx)
	REFERENCES member (midx)
;


ALTER TABLE Xbox_board
	ADD FOREIGN KEY (midx)
	REFERENCES member (midx)
;



/* Comments */

COMMENT ON TABLE AR_VR_board IS 'board6';
COMMENT ON COLUMN AR_VR_board.bidx IS 'bidx';
COMMENT ON COLUMN AR_VR_board.originbidx IS 'originbidx';
COMMENT ON COLUMN AR_VR_board.depth IS 'depth';
COMMENT ON COLUMN AR_VR_board.level_ IS 'level_';
COMMENT ON COLUMN AR_VR_board.subject IS 'subject';
COMMENT ON COLUMN AR_VR_board.content IS 'content';
COMMENT ON COLUMN AR_VR_board.writer IS 'writer : 닉네임으로 작성';
COMMENT ON COLUMN AR_VR_board.writeday IS 'writeday';
COMMENT ON COLUMN AR_VR_board.ip IS 'ip';
COMMENT ON COLUMN AR_VR_board.midx IS 'midx';
COMMENT ON TABLE member IS 'member1';
COMMENT ON COLUMN member.midx IS 'midx';
COMMENT ON COLUMN member.membernick IS 'membernick';
COMMENT ON COLUMN member.memberid IS 'memberid';
COMMENT ON COLUMN member.memberpwd IS 'memberpwd';
COMMENT ON COLUMN member.membername IS 'membername';
COMMENT ON COLUMN member.memberbirth IS 'memberbirth';
COMMENT ON COLUMN member.membergender IS 'membergender';
COMMENT ON COLUMN member.memberphone IS 'memberphone';
COMMENT ON COLUMN member.memberemail IS 'memberemail';
COMMENT ON COLUMN member.writeday IS 'writeday';
COMMENT ON COLUMN member.memberip IS 'memberip';
COMMENT ON COLUMN member.delyn IS 'delyn';
COMMENT ON TABLE Mobile_board IS 'board2';
COMMENT ON COLUMN Mobile_board.bidx IS 'bidx';
COMMENT ON COLUMN Mobile_board.originbidx IS 'originbidx';
COMMENT ON COLUMN Mobile_board.depth IS 'depth';
COMMENT ON COLUMN Mobile_board.level_ IS 'level_';
COMMENT ON COLUMN Mobile_board.subject IS 'subject';
COMMENT ON COLUMN Mobile_board.content IS 'content';
COMMENT ON COLUMN Mobile_board.writer IS 'writer : 닉네임으로 작성';
COMMENT ON COLUMN Mobile_board.writeday IS 'writeday';
COMMENT ON COLUMN Mobile_board.ip IS 'ip';
COMMENT ON COLUMN Mobile_board.midx IS 'midx';
COMMENT ON TABLE PC_board IS 'board1';
COMMENT ON COLUMN PC_board.bidx IS 'bidx';
COMMENT ON COLUMN PC_board.originbidx IS 'originbidx';
COMMENT ON COLUMN PC_board.depth IS 'depth';
COMMENT ON COLUMN PC_board.level_ IS 'level_';
COMMENT ON COLUMN PC_board.subject IS 'subject';
COMMENT ON COLUMN PC_board.content IS 'content';
COMMENT ON COLUMN PC_board.writer IS 'writer : 닉네임으로 작성';
COMMENT ON COLUMN PC_board.writeday IS 'writeday';
COMMENT ON COLUMN PC_board.ip IS 'ip';
COMMENT ON COLUMN PC_board.midx IS 'midx';
COMMENT ON TABLE PS_board IS 'board3';
COMMENT ON COLUMN PS_board.bidx IS 'bidx';
COMMENT ON COLUMN PS_board.originbidx IS 'originbidx';
COMMENT ON COLUMN PS_board.depth IS 'depth';
COMMENT ON COLUMN PS_board.level_ IS 'level_';
COMMENT ON COLUMN PS_board.subject IS 'subject';
COMMENT ON COLUMN PS_board.content IS 'content';
COMMENT ON COLUMN PS_board.writer IS 'writer : 닉네임으로 작성';
COMMENT ON COLUMN PS_board.writeday IS 'writeday';
COMMENT ON COLUMN PS_board.ip IS 'ip';
COMMENT ON COLUMN PS_board.midx IS 'midx';
COMMENT ON TABLE Switch_board IS 'board4';
COMMENT ON COLUMN Switch_board.bidx IS 'bidx';
COMMENT ON COLUMN Switch_board.originbidx IS 'originbidx';
COMMENT ON COLUMN Switch_board.depth IS 'depth';
COMMENT ON COLUMN Switch_board.level_ IS 'level_';
COMMENT ON COLUMN Switch_board.subject IS 'subject';
COMMENT ON COLUMN Switch_board.content IS 'content';
COMMENT ON COLUMN Switch_board.writer IS 'writer : 닉네임으로 작성';
COMMENT ON COLUMN Switch_board.writeday IS 'writeday';
COMMENT ON COLUMN Switch_board.ip IS 'ip';
COMMENT ON COLUMN Switch_board.midx IS 'midx';
COMMENT ON TABLE Xbox_board IS 'board5';
COMMENT ON COLUMN Xbox_board.bidx IS 'bidx';
COMMENT ON COLUMN Xbox_board.originbidx IS 'originbidx';
COMMENT ON COLUMN Xbox_board.depth IS 'depth';
COMMENT ON COLUMN Xbox_board.level_ IS 'level_';
COMMENT ON COLUMN Xbox_board.subject IS 'subject';
COMMENT ON COLUMN Xbox_board.content IS 'content';
COMMENT ON COLUMN Xbox_board.writer IS 'writer : 닉네임으로 작성';
COMMENT ON COLUMN Xbox_board.writeday IS 'writeday';
COMMENT ON COLUMN Xbox_board.ip IS 'ip';
COMMENT ON COLUMN Xbox_board.midx IS 'midx';



