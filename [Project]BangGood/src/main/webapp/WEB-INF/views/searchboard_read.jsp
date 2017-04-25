<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
<title>banngg</title>

<!-- Meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Web Fonts -->
<link
	href='https://fonts.googleapis.com/css?family=Ek+Mukta:400,600,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/app.css">
<link rel="stylesheet" href="assets/css/one.style.css">

<!-- CSS Implementing Plugins -->
<link rel="stylesheet"
	href="assets/plugins/owl-carousel2/assets/owl.carousel.css">
<link rel="stylesheet"
	href="assets/plugins/owl-carousel/owl-carousel/owl.theme.css">
<link rel="stylesheet"
	href="assets/plugins/hover-effects/css/custom-hover-effects.css">
<link rel="stylesheet" href="assets/plugins/pace/pace-flash.css">
<!-- CSS Theme -->
<link rel="stylesheet" href="assets/css/construction.style.css">
<!-- 메인 -->
<link rel="stylesheet" href="assets/css/global.css">
<!-- 메인 글씨 -->
<!-- CSS Customization -->
<link rel="stylesheet" href="assets/css/custom.css">
<link rel="stylesheet"
	href="assets/plugins/font-awesome/css/font-awesome.min.css">
</head>

<body id="body" data-spy="scroll" data-target="one-page-header"
	class="demo-lightbox-gallery font-main promo-padding-top">
	<main class="wrapper"> <!-- header --> <%@ include
		file="header.jsp"%> <!-- end header --> <!-- menu -->
	<%@ include file="join.jsp"%> 
	<%@ include	file="join2.jsp"%>
    <%@ include	file="join3.jsp"%>
    <%@ include	file="login.jsp"%> <!-- end menu -->

	<div class="searchboard_title margin-bottom-20">
		<div class="searchboard_title-in">
			<h1>${searchBoard.searchBoard_title}</h1>
		</div>
	</div>
	<div class="container content">
		<div class="row">
			<div class="pull-left">
				<a href="searchboard" class="btn-u btn-block rounded g-mb-30"
					style="width: 80px;">돌아가기</a>
				<c:if test = "${loginId == searchBoard.custid }">
				<a href="javascript:deleteCheck()" class="btn-u btn-block rounded g-mb-30"
					style="width: 80px;">삭제하기</a>
				<a href="javascript:updateCheck()" class="btn-u btn-block rounded g-mb-30"
					style="width: 80px;">변경하기</a>
				</c:if>
			</div>
			<div classs="col-md-8">
			<table class="table">
				<div class="form-group">
					<tbody>
						<tr>
							<th style="width: 100px">제목</th>
							<td><span>${searchBoard.searchBoard_title}</span></td>
						</tr>
						<tr>
							<th style="width: 100px">작성자</th>
							<td><span>${searchBoard.custid}</span></td>
						</tr>
						<tr>
							<th style="width: 100px">작성일</th>
							<td><span>${searchBoard.searchBoard_inputdate}</span></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><span style = "white-space: pre-line">${searchBoard.searchBoard_text}</span></td>
						</tr>
					</tbody>
				</div>
				<!--// form-->
			</table>
			</div>
		</div>
		<!-- end row -->
		<div class="row">
				<!-- 댓글 쓰는곳 -->
			<div class="col-md-12">
					<input type ="hidden" name = "boardnum" id = "boardnum" value = "${searchBoard.searchBoard_no}">
					<input type ="hidden" name = "loginId" id = "loginId" value = "${loginId}">
					<input type ="text" name ="searchreply_text" id ="searchreply_text" class="form-control rounded pull-left" style="width:500px; height:45px">
					<input type ="button" id = "searchreply_insert" value="댓글 등록" class="btn-u btn-block rounded pull-left" style="width:100px; height:45px;">
					<br>
						      	
			</div>
		</div>
		<div class="clearfix margin-bottom-20"></div>
		<span id = "replyArea"></span>	
	</div>
	<!-- content -->
	

	</main>
	<!-- JS Global Compulsory -->
	<script src="assets/plugins/jquery/jquery.min.js"></script>
	<script src="assets/plugins/jquery/jquery-migrate.min.js"></script>
	<script src="assets/plugins/bootstrap/js/bootstrap.js"></script>

	<!-- JS Implementing Plugins -->
	<script src="assets/plugins/smoothScroll.js"></script>
	<!-- 스크럴 -->
	<script src="assets/plugins/jquery.easing.min.js"></script>
	<!-- 애니메이션 -->
	<script src="assets/plugins/pace/pace.min.js"></script>
	<script src="assets/plugins/owl-carousel2/owl.carousel.min.js"></script>
	<script
		src="assets/plugins/sky-forms-pro/skyforms/js/jquery.form.min.js"></script>
	<script
		src="assets/plugins/sky-forms-pro/skyforms/js/jquery.validate.min.js"></script>
	<script
		src="assets/plugins/cube-portfolio/cubeportfolio/js/jquery.cubeportfolio.min.js"></script>
	<script src="assets/plugins/modernizr.js"></script>
	<!-- 브라우저 호환성 -->
	<script src="assets/plugins/backstretch/jquery.backstretch.min.js"></script>

	<!-- JS Page Level-->
	<script src="assets/js/one.app.js"></script>
	<script src="assets/js/cube-portfolio.js"></script>
	<script src="assets/js/contact.js"></script>
	<script src="assets/js/promo.js"></script>

	<!-- custom -->
	<script src="assets/js/custom.js"></script>
<script type="text/javascript">

//게시글 삭제
function deleteCheck(){
	if(confirm('게시물을 삭제하시겠습니까?')){
		location.href="delete_searchboard?searchBoard_no=${searchBoard.searchBoard_no}"
	}
	return;
}

//게시글 수정
function updateCheck(){
	if(confirm('게시물을 수정하시겠습니까?')){
		location.href="update_searchboardform?searchBoard_no=${searchBoard.searchBoard_no}"
	}
	return;
}

var id = $("#loginId").val();
var num = $("#boardnum").val();
// 처음에 댓글 리스트 불러오기
$(function (){
	$("#searchreply_insert").on('click', regist);	
	init();
});

// 댓글 리스트 호출 함수
function init() {
	$.ajax({
		method : "post",
		url : "get_searchreply",
		dataType : "json",
		data : {			
			"searchBoard_no" : num
		},
		success : output
	});
}

// 댓글 리스트 출력 함수
function output(resp) {
	var data = '<table>';
	$.each(resp, function(index, item){
		data += '<tr class="reviewtr">';
		data += '	<td class="name" style="padding-right:30px; color:#ccc">' + item.custid + '</td>';
		data += '	<td class="text" style="width:50%">' + item.searchReply_text + '</td>';
		data += '	<td class="regdate">' + item.searchReply_inputdate + '</td>';
		data += '	<td><input type="button" class="delbtn btn-u btn-block rounded g-mb-5" style="background-color:#f7be22";" reply_id="'+item.custid+'" data-sno="'+item.searchReply_no+'"value="삭제" /></td>';
		data += '</tr>';
	});
	data += '</table>';	
	$("#replyArea").html(data);
	$(".delbtn").on('click', replyDel);
}

// 댓글 입력함수
function regist(){
	
	var searchreply = $("#searchreply_text").val();
	
	if(searchreply.length ==0) {
		alert("데이터를 입력해 주세요");
		return;
	}

	$.ajax({
		method : "post",
		url : "insert_searchreply",
		data : {			
			"searchreply" : searchreply,
			"searchBoard_no" : num
		},
		async : false,
		success : function(resp) {
			if(resp == 1){ 
				$("#searchreply_text").val("");
				$("#replyFile").val(""); 
				init();
			}
			else alert('댓글 등록 실패');
		}
	});
}


//댓글 삭제 함수
function replyDel(){
	var reply_id = $(this).attr("reply_id");
	if(id != reply_id){
		alert('작성자만 삭제 가능합니다.')
		return false;
	}	
	var replynum = $(this).attr("data-sno");
	$.ajax({
		method : "post",
		url : "delete_searchreply",
		data : {
			"searchReply_no" : replynum,
			"searchBoard_no" : num
		},
		async : false,
		success : init
	});
}



</script>
</body>
</html>