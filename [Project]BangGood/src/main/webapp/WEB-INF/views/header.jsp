<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Header -->
<nav class="header one-page-header navbar navbar-default navbar-fixed-top construction-header one-page-nav-scrolling one-page-nav__fixed"
   data-role="navigation">
   <div class="container">
      <div class="menu-container page-scroll">
         <button type="button" class="navbar-toggle" data-toggle="collapse"
            data-target=".navbar-ex1-collapse">
            <span class="sr-only">Toggle navigation</span> <span
               class="icon-bar"></span> <span class="icon-bar"></span> <span
               class="icon-bar"></span>
         </button>

         <a class="navbar-brand" href="./" style="padding: 16px 3px;"> <img
            class="img-responsive" src="assets/img/title/17.gif" alt="Logo" width="113">
         </a>
      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div
         class="collapse navbar-collapse navbar-ex1-collapse g-pt-25 g-sm-pt-0">
         <div class="menu-container">
                    
            <c:if test ="${not empty loginId}">
               <span>${loginId} 님 어서오세요.</span>
            </c:if> 
         
            <ul class="nav navbar-nav">            
            <c:if test ="${empty loginId}">
               <li class="page-scroll move"><a href="search">방 검색</a></li>              
               <li class="page-scroll"><a href="searchboard">게시판</a></li>
               <li class="page-scroll"><a href="#" id="joinBtn1">회원가입</a></li>
               <li class="page-scroll"><a href="#" id="loginBtn">로그인</a></li>
            </c:if>                  
            <c:if test ="${not empty loginId}">   
              <c:if test="${!loginId.equals(\"admin\")}">       
               <li class="page-scroll move"><a href="search">방 검색</a></li>
               <li class="page-scroll"><a href="insert_property">방 등록</a></li>               
               <li class="page-scroll"><a href="searchboard">게시판</a></li>     
               <li class="page-scroll"><a href="mypage">마이 페이지</a></li>
               <li class="page-scroll"><a href="mypage2">관심목록</a></li> 
               <li class="page-scroll"><a href="logout">로그아웃</a></li>
              </c:if>
              <c:if test="${loginId.equals(\"admin\")}">
                <li class="page-scroll move"><a href="search">지도 현황</a></li>
                <li class="page-scroll"><a href="">매물관리</a></li>
                <li class="page-scroll"><a href="searchboard">게시글 관리</a></li>
                <li class="page-scroll"><a href="logout">로그아웃</a></li>  
          	  </c:if>                           
            </c:if>
  
            </ul>
         </div>
      </div>
      <!-- /.navbar-collapse -->
   </div>
   <!-- /.container -->
</nav>
<!-- End Header -->