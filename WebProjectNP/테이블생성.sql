-- 웹 프로젝트 3조

-- system계정으로 실행하기
/* 
create user np identified by 1234;

grant connect, resource, dba to np;

-- 좌측에 +버튼 눌러서 
-- Name : localhost.np
-- 사용자이름 : np
-- 암호 : 1234
-- test해보고 성공하면 저장
*/


-- 초기화
drop table tblSubscribe;
drop table tblMemberOrder;
drop table tblReview;
drop table tblFreeCommentBoard;
drop table tblQnaComment;
drop table tblQnaBoard;
drop table tblMemberCart;
drop table tblLikeProduct;
drop table tblNutritionalIngredients;
drop table tblFreeBoard;
drop table tblMypage;
drop table tblMember;
drop table tblMemberLv;
drop table tblNotice;
drop table tblNonmemberOrder;
drop table tblNonmemberBasket;
drop table tblProduct;
drop table tblCategory;
drop table tblTip;
drop table tblStore;
drop table tblIngredient;
drop table tblLv;
drop table tblDeliver;
drop table tblQnaCategory;
drop table tblAdmin;


drop sequence adminSeq;
drop sequence memberDeliverySeq;
drop sequence ingredientSeq;
drop sequence tipSeq;
drop sequence productSeq;
drop sequence nonmemberBasketSeq;
drop sequence nonmemberOrderSeq;
drop sequence noticeSeq;
drop sequence memberSeq;
drop sequence mypageSeq;
drop sequence freeBoardSeq;
drop sequence nutritionalIngredientsSeq;
drop sequence likeProductSeq;
drop sequence memberCartSeq;
drop sequence qnaBoardSeq;
drop sequence qnaCommentSeq;
drop sequence freeCommentSeq;
drop sequence reviewSeq;
drop sequence memberOrderSeq;
drop sequence subsSeq;
drop sequence categorySeq;


-- 관리자
create table tblAdmin(
adminSeq number primary key,
adminId VARCHAR2(30) not null,
adminPw VARCHAR2(30) not null
);
create sequence adminSeq;


--QnA카테고리
create table tblQnaCategory (
    qnaCategorySeq number primary key,
    qnaCategoryName varchar2(1000) not null
);


-- 배송현황
create table tblDeliver (
    memberDeliverySeq number primary key,
    deliver varchar2(100) not null
);
create sequence memberDeliverySeq;


-- 등급
create table tblLv(
    lvSeq number primary key,
    lv varchar(30) not null
);


-- 영양제 성분
create table tblIngredient(
    ingredientSeq number primary key,
    ingredientName VARCHAR2(200) not null,
ingredientIntake VARCHAR2(200) not null
);
create sequence ingredientSeq;


-- 스토어 카테고리
create table tblStore(
    storeSeq number primary key,
    storeName VARCHAR2(50) not null
);


-- 꿀팁게시판
create table tblTip(
tipSeq number primary key,
adminSeq number references tblAdmin(adminSeq) not null,
tipSubject VARCHAR2(500) not null,
tipContent VARCHAR2(3000) not null,
tipRegdate DATE not null,
tipImg VARCHAR2(500) null
);
create sequence tipSeq;


-- 상세 카테고리
create table tblCategory(
    categorySeq number primary key,
    categoryName VARCHAR2(50) not null,
    storeSeq number references tblStore(storeSeq) not null
);

create sequence categorySeq;

-- 상품
create table tblProduct (
    productSeq number primary key,
    productName varchar2(200) not null,
    productInventory number not null,
    productPrice number not null,
    productImage varchar2(500) not null,
    productDetailImage varchar2(500) not null,
    categorySeq number not null references tblCategory(categorySeq)
);
create sequence productSeq;


-- 비회원 장바구니
create table tblNonmemberBasket (
    nonmemberBasketSeq number primary key,
    productSeq number not null references tblProduct(productSeq),
    nonmemberOrderCount number not null
);
create sequence nonmemberBasketSeq;


--비회원 주문상세 정보
create table tblNonmemberOrder (
    nonmemberOrderSeq number primary key,
    nonmemberBasketSeq number not null references tblNonmemberBasket(nonmemberBasketSeq),
    memberDeliverySeq  number not null references tblDeliver(memberDeliverySeq),
    nonmemberName varchar2(30) not null,
    nonmemberTel number not null,
    nonmemberDestination varchar2(500) not null,
    nonmemberRequest varchar2(100),
    nonmemberPayment varchar2(30) not null,
    nonmemberBuyDate date default sysdate not null
);
create sequence nonmemberOrderSeq;


-- 공지사항
create table tblNotice(
noticeSeq number primary key,
adminSeq number references tblAdmin(adminSeq) not null,
noticeSubject VARCHAR2(500) not null,
noticeContent VARCHAR2(3000) not null,
noticeRegdate DATE not null,
noticeImg  VARCHAR2(500) null
);
create sequence noticeSeq;


-- 회원-등급
create table tblMemberLv(
    memberLvSeq number primary key,
    lvSeq number not null references tblLv(lvSeq)
);


-- 회원정보 테이블
create table tblMember (
    memberSeq number primary key,
    name varchar2(30) not null,
    id varchar2(30) not null,
    pw varchar2(30) not null,
    email varchar2(100) not null,
    jumin varchar2(14) not null,
    gender varchar2(10) not null,
    address varchar2(500) not null,
    tel varchar2(15) not null,
    memberLvSeq number references tblMemberLv(memberLvSeq)
);
create sequence memberSeq;


-- 마이페이지
create table tblMypage(
    mypageSeq number primary key,
    mypagePoint number not null,
    mypageRank varchar(100) not null,
    memberSeq number not null references tblMember(memberSeq)
);
create sequence mypageSeq;


--자유게시판
create table tblFreeBoard (
    freeBoardSeq number primary key,
    freeBoardTitle varchar2(500) not null,
    freeBoardTxt varchar2(3000) not null,
    freeBoardDate date default sysdate not null,
    freeBoardImg varchar2(500),
    freeBoardChu number,
    memberSeq number references tblMember(memberSeq) not null
);
create sequence freeBoardSeq;



-- 영양제-영양제 성분   
create table tblNutritionalIngredients(
    nutritionalIngredientsSeq number primary key,
    ingredientSeq number references tblIngredient(ingredientSeq) not null,
    productSeq number references tblProduct(productSeq) not null,
    nutritionalIntake varchar2(200) not null
);
create sequence nutritionalIngredientsSeq;


-- 관심상품
create table tblLikeProduct(
likeProductSeq number primary key,
memberSeq number references tblMember(memberSeq) not null,
productSeq number references tblProduct(productSeq) not null
);
create sequence likeProductSeq;


-- 회원 장바구니
create table tblMemberCart(
    memberCartSeq number Primary key,
    productSeq number not null references tblProduct(productSeq),
    memberSeq number not null references tblMember(memberSeq),
    memberOrderCount number not null
);
create sequence memberCartSeq;


--QnA게시판
create table tblQnaBoard (
    qnaBoardSeq number primary key,
    memberSeq number references tblMember(memberSeq) not null,
    qnaCategorySeq number references tblQnaCategory(qnaCategorySeq) not null,
    qnaBoardTitle varchar2(500) not null,
    qnaBoardTxt varchar2(3000) not null,
    qnaBoardDate date default sysdate not null,
    qnaBoardImg varchar2(500),
    qnaBoardChu number
);
create sequence qnaBoardSeq;


--Qna댓글
create table tblQnaComment (
    qnaCommentSeq number primary key,
    qnaBoardSeq number references tblQnaBoard(qnaBoardSeq) not null,
    memberSeq number references tblMember(memberSeq) not null,
    qnacommentTxt varchar2(1000) not null
);
create sequence qnaCommentSeq;


--자유게시판댓글
create table tblFreeCommentBoard (
    freeCommentSeq number primary key,
    freeBoardSeq number references tblFreeBoard(freeBoardSeq) not null,
    commentContent varchar2(1000) not null,
    memberSeq number references tblMember(memberSeq) not null
);
create sequence freeCommentSeq;


-- 후기
create table tblReview (
    reviewSeq number primary key,
    memberSeq number not null references tblMember(memberSeq),
    productSeq number not null references tblProduct(productSeq),
    reviewScore number not null,
    reviewContent varchar2(1000) not null
);
create sequence reviewSeq;


-- 회원 주문상세 정보
create table tblMemberOrder (
    memberOrderSeq number primary key,
    memberSeq number not null references tblMember(memberSeq),
    memberCartSeq number not null references tblMemberCart(memberCartSeq),
    memberDeliverySeq  number not null references tblDeliver(memberDeliverySeq),
    memberDestination varchar2(500) not null,
    memberRequest varchar2(1000),
    recipient varchar2(30) not null,
    memberPayment varchar2(30) not null,
    memberBuyDate date default sysdate not null
);
create sequence memberOrderSeq;


-- 구독
create table tblSubscribe (
    subsSeq number primary key,
    productSeq number not null references tblProduct(productSeq),
    memberSeq number not null references tblMember(memberSeq),
    memberOrderSeq number not null references tblMemberOrder(memberOrderSeq),
    subsDate date default sysdate not null
);
create sequence subsSeq;
