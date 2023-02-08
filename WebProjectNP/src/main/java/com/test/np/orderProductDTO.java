package com.test.np;

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
   
   String addr;
   String comment;
   String name;
   String date;
   
   //누적 금액
   String addMoney;

}