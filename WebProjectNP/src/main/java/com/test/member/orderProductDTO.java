package com.test.member;

import lombok.Data;

@Data
public class orderProductDTO {
	
	String memberSeq;
	String memberBuyDate;
	String memberDestination;
	String productSeq;
	String productName;
	String productPrice;
	String productImage;
	
	//누적 금액
	String addMoney;

}
