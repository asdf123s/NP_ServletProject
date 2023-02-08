package com.test.store;

import lombok.Data;

@Data
public class productDTO {

	String productSeq;
	String productName;
	String productInventory;
	String productPrice;
	String productImage;
	String productDetailImage;
	String storeSeq;
	String categorySeq;
	
	double reviewScore;
	int reviewCount;
	
	//카테고리명
	String categoryName;
	
	String SubsDate;
	String SubsSeq;
	
	String memberOrderCount;
	String storeName;
	
	String total;
	String sale;
	
	
}
