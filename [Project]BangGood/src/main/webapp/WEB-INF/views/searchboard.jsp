<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
<title>banngg</title>

<script type="text/javascript">

function pagingForSubmit(currentPage){
	var form = document.getElementById("pagingForm")
	var page = document.getElementById("page");
	page.value = currentPage;
	form.submit();
}

</script>

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
		file="login.jsp"%> <!-- end menu --> <!--=== Breadcrumbs v2 ===-->
	<div class="searchboard_title g-mb-20">
		<div class="searchboard_title-in">
			<h1>게시판</h1>
		</div>
	</div>
	<!--=== End Breadcrumbs v2 ===--> <!--=== Content Part ===-->
	<div class="container content">
		<div class="headline">
			<h2>문의게시판</h2>	
			
			<form action="searchboard" id = "pagingForm" method="get" style="display:inline-block">
			<div class="pull-right">
				<select name="searchTitle">
					<option value="title" ${title == 'title' ? 'selected':''}>제목</option>
					<option value="title-text" ${title == 'title-text' ? 'selected':''}>제목+내용</option>
					<option value="custid" ${title == 'custid' ? 'selected':''}>작성자</option>
				</select> 
				<input type="text" name="searchText" id="searchText" value = "${text}" style="width:300px; class="rounded form-control">
				<button class="btn-u btn-block rounded" style="background-color: #f7be22; width: 80px;">
					<a href="javascript:pagingForSubmit(1)"><i class="fa fa-search"></i>검색</a>
				</button>
		
			<button class="btn-u btn-block rounded" style="background-color:#f7be22; width:80px;display:inline-block">
						<a href="writeboard">글쓰기</a>	
			</button>
			<input type = "hidden" name = "page" id = "page">
			</div>
			</form>
		</div>
		<!-- Tab pannel 4 -->

		<div class="table-responsive">
			<table class="table">
				<colgroup>
					<col width="300px">
					<col width="100px">
					<col width="100px">
					<col width="100px">
				</colgroup>
				<thead>
					<tr>
						<th>제목</th>
						<th>작성자</th>						
						<th class="hidden-sm">등록일</th>
						<th class="hidden-sm">조회</th>
					</tr>
				</thead>
				
				<c:forEach var="board" items="${list}">
					<tbody>
					<tr>
						<td><a href="read_searchboard?searchBoard_no=${board.searchBoard_no}">
						${board.searchBoard_title} (${board.searchBoard_reply})</a></td>
						<td>${board.custid}</td>
						<td>${board.searchBoard_inputdate}</td>
						<td>${board.searchBoard_hits}</td>
					</tr>
					</tbody>
				</c:forEach>
				
			</table>
		</div>

		<div class="text-center">
		<a href="javascript:pagingForSubmit(${navi.currentPage - navi.pagePerGroup})">◁◁</a>&nbsp;			
		<a href="javascript:pagingForSubmit(${navi.currentPage - 1})">◀</a>&nbsp;
				<ul class="pagination pagination">
					<c:forEach var = "page" begin = "${navi.startPageGroup}" end="${navi.endPageGroup}">
						<li><a href="javascript:pagingForSubmit(${page})">${page}</a></li>
					</c:forEach>		
				</ul>	
		<a href="javascript:pagingForSubmit(${navi.currentPage + 1})">▶</a>&nbsp;			
		<a href="javascript:pagingForSubmit(${navi.currentPage + navi.pagePerGroup})">▷▷</a>		
		</div>
		<!-- End Tab pannel 4 -->
	</div>
	<div class="clearfix margin-bottom-20"></div>
	<!--=== End Content Part ===--> 
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

</body>
</html>