package com.test.store;

import lombok.Data;

@Data
public class reviewChartDTO {
	
	private String productSeq; 
	private String reviewScore; 
	private String reviewSeq; 
	
	private String memberSeq;
	private	String reviewImage;
	private	String reviewContent;
	private	String reviewRegdate;
	
	int cnt; //각별점의 개수
}
