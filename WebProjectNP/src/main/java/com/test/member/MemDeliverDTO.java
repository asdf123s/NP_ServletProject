package com.test.member;

import lombok.Data;

@Data
public class MemDeliverDTO {
	
	String memberOrderSeq;
	String memberSeq;
	String memberCartSeq;
	String memberDeliverySeq;
	String memberDestination;
	String memberRequest;
	String recipient;
	String memberPayment;
	String memberBuyDate;
	String deliver;
	String productSeq;
	String productName;
	String productPrice; 
	String productImage;
	
	// 배송 일괄 정보 0 > 2 > 0 > 0
	String stat1;
	String stat2;
	String stat3;
	String stat4;
	

}
