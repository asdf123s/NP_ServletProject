package com.test.board;

import lombok.Data;

@Data
public class boardDTO {

	String freeBoardSeq;
	String freeBoardTitle;
	String freeBoardTxt;
	String freeBoardDate;
	String freeBoardImage;
	String freeBoardChu;
	String memberSeq;
	
	//댓글
	String comment;
	
	//아이디
	String memberId;
	
	String freeBoardNum;
	
}
