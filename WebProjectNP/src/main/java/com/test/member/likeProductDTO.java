package com.test.member;

import lombok.Data;

@Data
public class likeProductDTO {

   String likeProductSeq;
   String memberSeq;
   String productSeq;
   
   String productName;
   String productImage;
   String productPrice;
   
}