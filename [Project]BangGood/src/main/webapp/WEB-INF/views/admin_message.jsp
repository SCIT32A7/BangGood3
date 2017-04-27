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

<body id="body" data-spy="scroll" data-target=".one-page-header"
	class="demo-lightbox-gallery font-main promo-padding-top">
	<main class="wrapper"> <!-- header --> <%@ include
		file="header.jsp"%> <!-- end header --> <!-- menu -->
	<%@ include file="join.jsp"%> <%@ include
		file="join2.jsp"%> <%@ include
		file="join3.jsp"%> <%@ include
		file="login.jsp"%> <!-- end menu --> <!--=== Profile ===-->

	<div class="searchboard_title g-mb-20">
		<div class="searchboard_title-in">
			<h1> Customer Q&A </h1>
		</div>
	</div>
	<div class="container content profile" style="height:500px;">
			<div class="headline">
				<h2>고객 요청</h2>
				<div class="pull-right">
					<button class="btn-u btn-block rounded"
						style="background-color: #f7be22; width: 130px;">
						<a href="admin_writeList"></i>답변 내역 보기</a>
					</button>
					<button class="btn-u btn-block rounded"
						style="background-color: #f7be22; width: 130px;">
						<a href="javascript:msg_write()"></i>답변하기</a>
					</button>
				</div>
			</div>
			<!--row-->
			<div class="row">
				<div class="col-sm-12">
				<c:if test = "${messageList.size()==0}">
						고객요청함이 비어있습니다.
				</c:if>
				<c:if test = "${messageList.size()>0}">	
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>내용</th>
									<th>보낸이</th>
									<th class="hidden-sm">받은날짜</th>
									<th class="hidden-sm">읽은날짜</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var = "msg" items = "${messageList}">							
								<tr>
									<td><div style = "display:inline-block; white-space:nowrap; overflow:hidden; text-overflow:ellipsis; width:500px">
									<a href="javascript:msg_open(${msg.msg_no})" type="button">
									${msg.msg_text}</a></div></td>
									<td>${msg.sender}</td>
									<td class="hidden-sm">${msg.sentDate}</td>
									<td class="hidden-sm">
										<c:if test = "${msg.isChecked == 'false'}">
											읽지않음
										</c:if>
										<c:if test = "${msg.isChecked == 'true'}">
											${msg.readDate}
										</c:if>
									</td>
								</tr>
							</c:forEach>	
							</tbody>
						</table>							
					</div>
					<form action="get_messageList" id = "pagingForm" method="get">
						<div class="text-center">
						<ul class="pagination pagination">
							<li><a href="javascript:pagingForSubmit(${navi.currentPage - navi.pagePerGroup})">◁◁</a></li>
							<li><a href="javascript:pagingForSubmit(${navi.currentPage - 1})">◀</a></li>
							<c:forEach var = "page" begin = "${navi.startPageGroup}" end="${navi.endPageGroup}">
								<li><a href="javascript:pagingForSubmit(${page})">${page}</a></li>
							</c:forEach>		
							<li><a href="javascript:pagingForSubmit(${navi.currentPage + 1})">▶</a></li>
							<li><a href="javascript:pagingForSubmit(${navi.currentPage + navi.pagePerGroup})">▷▷</a></li>
							<input type = "hidden" name = "page" id = "page">
						</ul>
						</div>								
					</form>
					</c:if>								
				</div>
			</div>
			
		</div>
		<!-- footer -->
			<%@ include file="footer.jsp"%> 
			<!-- end footer -->
		</main>

		<!--=== End Profile ===-->
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
		function msg_open(number) {
			  window.open("message?msg_no="+number, "", 'titlebar=no, scrollbars=yes, toolbar=no, location=no, resizable=no, status=no, menubar=yes, width=350, height=420, left=30%, top=40%');
		};
		
		function msg_write() {
			  window.open("message_write", "", 'titlebar=no, scrollbars=yes, toolbar=no, location=no, resizable=no, status=no, menubar=yes, width=350, height=400, left=30%, top=40%');
		};
		
		function pagingForSubmit(currentPage){
			var form = document.getElementById("pagingForm")
			var page = document.getElementById("page");
			page.value = currentPage;
			form.submit();
		}
		</script>
		
</body>
</html>