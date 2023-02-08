package com.test.store;

import lombok.Data;

@Data
public class reviewDTO {

   String reviewSeq;
   String memberSeq;
   String productSeq;
   String reviewScore;
   String reviewContent;
   private String reviewRegdate;
   
   String memberName;
   String lvName;
   
   private String reviewImage; //첨부파일
   
   private String name; //회원이름
   
   private int reviewCnt; //후기개수
   
   private int reviewAvg; //상품 후기 평균
   
}