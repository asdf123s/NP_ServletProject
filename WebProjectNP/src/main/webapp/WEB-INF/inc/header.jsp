<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <div class="py-1 bg-primary">
       <div class="container">
          <div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
             <div class="col-lg-12 d-block">
                <div class="row d-flex">
                   <div class="col-md pr-4 d-flex topper align-items-center">
                      <div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-phone2"></span></div>
                      <span class="text">02-1234-1234</span>
                   </div>
                   <div class="col-md pr-4 d-flex topper align-items-center">
                      <div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-paper-plane"></span></div>
                      <span class="text">nutrientpit@naver.com</span>
                   </div>
                   <div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
                      <span class="text"><i class="icon-heart color-danger" aria-hidden="true"></i>건강한 삶을위한 뉴핏<i class="icon-heart color-danger" aria-hidden="true"></i>
                      <c:if test="${empty id }"> 
                      <a href="/np/login.do" style="margin-left:50px; color:white; margin-right:-20px; font-weight:bold">로그인</a>
                      </c:if>
                      <c:if test="${not empty id }">
                       <a href="/np/logout.do" style="margin-left:50px; color:white; margin-right:-20px; font-weight:bold">로그아웃</a>
                      </c:if>
                      </span>
                   </div>
                </div>
             </div>
          </div>
        </div>
    </div>
    <c:if test="${id.substring(0,5) eq 'admin' }">
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
       <div class="container">
         <a class="navbar-brand" href="/np/admin/adminIndex.do" style="font-size: 40px;">np</a>
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
           <span class="oi oi-menu"></span> Menu
         </button>

         <div class="collapse navbar-collapse" id="ftco-nav">
           <ul class="navbar-nav ml-auto">
             <!-- <li class="nav-item active"><a href="index.html" class="nav-link">Home</a></li> -->
             <!-- <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Shop</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
                 <a class="dropdown-item" href="shop.html">Shop</a>
                 <a class="dropdown-item" href="wishlist.html">Wishlist</a>
                <a class="dropdown-item" href="product-single.html">Single Product</a>
                <a class="dropdown-item" href="cart.html">Cart</a>
                <a class="dropdown-item" href="checkout.html">Checkout</a>
              </div> -->
            
              <c:if test="${not empty id }">
              <li class="nav-item"><a href="/np/mypage/" class="nav-link">${id }</a></li>
              </c:if>

           </ul>
         </div>
       </div>
     </nav>
    </c:if>
    
    
    
    <c:if test="${id.substring(0,5) != 'admin' }">
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
       <div class="container">
         <a class="navbar-brand" href="/np/index.do" style="font-size: 40px;">np</a>
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
           <span class="oi oi-menu"></span> Menu
         </button>

         <div class="collapse navbar-collapse" id="ftco-nav">
           <ul class="navbar-nav ml-auto">
             <!-- <li class="nav-item active"><a href="index.html" class="nav-link">Home</a></li> -->
             <!-- <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Shop</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
                 <a class="dropdown-item" href="shop.html">Shop</a>
                 <a class="dropdown-item" href="wishlist.html">Wishlist</a>
                <a class="dropdown-item" href="product-single.html">Single Product</a>
                <a class="dropdown-item" href="cart.html">Cart</a>
                <a class="dropdown-item" href="checkout.html">Checkout</a>
              </div> -->
            </li>
             <li class="nav-item"><a href="/np/mainCategory.do" class="nav-link">스토어</a></li>
             <li class="nav-item"><a href="/np/tipList.do" class="nav-link">꿀팁</a></li>
             <li class="nav-item"><a href="/np/community.do" class="nav-link">커뮤니티</a></li>
              <li class="nav-item"><a href="/np/notice/noticeList.do" class="nav-link">공지사항</a></li>
              <li class="nav-item"><a href="/np/recommend/recommendAdd.do" class="nav-link">분석/추천</a></li>
             <li class="nav-item cta cta-colored"><a href="/np/memCart.do" class="nav-link">
                <span class="icon-shopping_cart"></span></a>
              </li>
              <c:if test="${not empty id }">
              <li class="nav-item"><a href="/np/mypage.do?seq=${memberSeq }" class="nav-link">${id }</a></li>
              </c:if>

           </ul>
         </div>
       </div>
     </nav>
     </c:if>
    <!-- END nav -->

  
