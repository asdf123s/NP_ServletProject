package com.test.admin;

import lombok.Data;

@Data
public class SubscribeDTO {

	String subsSeq;
	String productSeq;
	String memberSeq;
	String memberOrderSeq;
	String subsDate;
	
	String name;
	String productName;
	
	String memberPayment;
	
}
