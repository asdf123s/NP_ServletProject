package com.test.member;

import lombok.Data;

@Data
public class memberOrderDTO {

   String memberOrderSeq;
   String memberSeq;
   String memberCartSeq;
   String memberDeliverySeq;
   String memberDestination;
   String memberRequest;
   String recipient;
   String memberPayment;
   
   String memberBuyDate;
   
}