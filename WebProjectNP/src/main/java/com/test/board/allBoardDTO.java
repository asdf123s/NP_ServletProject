package com.test.board;

import lombok.Data;

@Data
public class allBoardDTO {

	//순서는 날짜, 제목순
	//구분 어떻게?
	String rnum;
	String type;
	String seq;
	String title;
	String txt;
	String regdate;
	String comment;
	
}
