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


<!-- Meta -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">

		<!-- Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Ek+Mukta:400,600,700' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css">
	
		<link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="assets/css/app.css">
		<link rel="stylesheet" href="assets/css/one.style.css">

		<!-- CSS Implementing Plugins -->
		<link rel="stylesheet" href="assets/plugins/hover-effects/css/custom-hover-effects.css">
		<link rel="stylesheet" href="assets/plugins/pace/pace-flash.css">
		<link rel="stylesheet" href="assets/css/construction.style.css">
		<link rel="stylesheet" href="assets/css/global.css">
		<!-- CSS Customization -->
		<link rel="stylesheet" href="assets/css/custom.css">

		
<style>
.searchboard_title {
	text-align: center;
	position: relative;
	background: url(assets/img/bg/1.jpg) no-repeat ;
}
label{
    font-size: 14px;
    line-height: 0.5;
    cursor: pointer;
    display: inline-block;
    padding: 18px 0px 0px 26px;
    position: relative;
    whitespace: no-wrap;
    overflow: hidden;
    text-overflow: ellipsis;
    -webkit-transition: all .15s ease;
    transition: all .15s ease;
    top: 5px;
    left: 8px;
    font-weight: normal;
}
label:before{
content: "";
    position: absolute;
    left: 1rem;
    top: 2px;
    width: 16px;
    height: 16px;
    border-radius: 50%;
    border: .2rem solid #ccc
}
.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
	vertical-align: middle;
}
</style>	

</head>

<body id="body" data-spy="scroll" data-target=".one-page-header"
	class="demo-lightbox-gallery font-main promo-padding-top">
	<main class="wrapper"> 
	<!-- header --> 
	<%@ include file="header.jsp"%> 
	<!-- end header --> 
	<!-- menu -->
	<%@ include file="join.jsp"%> 
	<%@ include file="join2.jsp"%> 
	<%@ include file="join3.jsp"%> 
	<%@ include file="login.jsp"%> 
	<!-- end menu --> 
	<!--=== Breadcrumbs v2 ===-->
	<div class="searchboard_title g-mb-20">
		<div class="searchboard_title-in">
			<h1></h1>
		</div>
	</div>
	<!--=== End Breadcrumbs v2 ===--> <!--=== Content Part ===-->
	<div class="container content" style="height:700px;">
		<div class="headline">
			<h2>대기 중 매물</h2>	
			<form id = "pagingForm" method="get" class="g-dp-inline pull-right" style="vertical-align: middle;">

				<input type="text" name="searchid" id="searchid" style="width:170px;" value = "${searchid}"
				class="g-mr-10" placeholder="아이디를 입력해주세요.">
				<button class="btn-u btn-block rounded" style=" width: 80px;">
					<a href="javascript:pagingForSubmit(1)"><i class="fa fa-search"></i>검색</a>
				</button>
				<button class="btn-u btn-block rounded" style=" width:80px;display:inline-block; background: #333">
						<a href="admin_property">전체매물</a>	
				</button>

			<button class="btn-u btn-block rounded" style=" width:80px; display:inline-block; background: #333">
						<a href="javascript:restart_showing()">광고 허가</a>	
			</button>
			<input type = "hidden" name = "page" id = "page">
			<input type = "hidden" name = "restartList" id = "restartList">
			</form>
		</div>
		<!-- Tab pannel 4 -->

		<div class="table-responsive">
		<c:if test = "${list.size() == 0}">
			<p> 현재 등록된 매물이 없습니다.</p>
		</c:if>
		<c:if test = "${list.size() > 0}">
			<table class="table text-center">
				<colgroup>
					<col width="20px">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="20%">
					<col width="10%">
					<col width="*">
				</colgroup>
				<thead>
					<tr class="text-center">
						<th>
							 <input type="checkbox" id="checkedAll"/>
  							<label class="admin_label"for="checkedAll"></label>
						</th>
						<th class="text-center">매물번호</th>
						<th class="text-center">아이디</th>						
						<th class="text-center">거래타입</th>
						<th class="text-center">보증금/월세</th>
						<th class="text-center">등록일</th>
						<th class="text-center">제목</th>
					</tr>
				</thead>
					<tbody>
					<c:forEach var = "pro" items ="${list}">
						<tr>
							<td>
								<input name="subCheck" type="checkbox" id="check${pro.property_no}" value="${pro.property_no}">
  								<label class="admin_label" for="check${pro.property_no}"></label>
							</td>
							<td>${pro.property_no}</td>
							<td>${pro.custid}</td>
							<td>${pro.rent_type}</td>
							<td>${pro.deposit}/${pro.month_fee}</td>
							<td>${pro.property_inputdate}</td>
							<td><a href="read_property?property_no=${pro.property_no}">${pro.property_title}</a></td>
						</tr>
					</c:forEach>	
					</tbody>			
			</table>
		</c:if>
		</div>

		<div class="text-center">
				<ul class="pagination pagination">
					<li><a href="javascript:pagingForSubmit(${navi.currentPage - navi.pagePerGroup})">◁◁</a></li>
					<li><a href="javascript:pagingForSubmit(${navi.currentPage - 1})">◀</a></li>
					<c:forEach var = "page" begin = "${navi.startPageGroup}" end="${navi.endPageGroup}">
						<li><a href="javascript:pagingForSubmit(${page})">${page}</a></li>
					</c:forEach>		
					<li><a href="javascript:pagingForSubmit(${navi.currentPage + 1})">▶</a></li>
					<li><a href="javascript:pagingForSubmit(${navi.currentPage + navi.pagePerGroup})">▷▷</a></li>
				</ul>	
		</div>
		<!-- End Tab pannel 4 -->
	</div>
	<div class="clearfix margin-bottom-20"></div>
	<!--=== End Content Part ===--> 
	<!-- footer -->
			<%@ include file="footer.jsp"%> 
			<!-- end footer -->
	</main>
		<!-- JS Global Compulsory -->
				<script src="assets/plugins/jquery/jquery.min.js"></script>
		<script src="assets/plugins/jquery/jquery-migrate.min.js"></script>
		<script src="assets/plugins/bootstrap/js/bootstrap.js"></script>
		<!-- JS Implementing Plugins -->
		<script src="assets/plugins/pace/pace.min.js"></script>
		<script src="assets/plugins/modernizr.js"></script>
		<script src="assets/plugins/backstretch/jquery.backstretch.min.js"></script>
		<!-- JS Page Level-->
		<script src="assets/js/one.app.js"></script>
		<!-- custom -->
		<script src="assets/js/custom.js"></script>
<script type="text/javascript">
	
	
	function pagingForSubmit(currentPage){
		var form = document.getElementById("pagingForm");
		var page = document.getElementById("page");
		page.value = currentPage;
		form.action = "admin_property";
		form.submit();
	}
	// 여러 매물 다시 게시하기
	function restart_showing(){		
		var checkList = Array();
		var i=0;
		var list = document.getElementsByName("subCheck");
		for(a=0;a<list.length;a++){
			if (list[a].checked){
				checkList[i] = list[a].value;
				i++;		        
	 		}
		}
		if(i == 0){
			alert('광고를 시작할 매물을 선택해주세요.');
			return false;
		}
		if(confirm('해당 매물의 광고를 허가하시겠습니까?')){
			var form = document.getElementById("pagingForm");
			var restartList = document.getElementById("restartList");
			restartList.value = checkList;
			form.action = "restart_showing_propertys";
			form.submit();
		}
	}
	
	$(function(){
	
		$("#checkedAll").click(function(){
			if($('#checkedAll').prop('checked')){
				$('input[name=subCheck]:checkbox').each(function(){
					$(this).prop('checked',true);
				});
			} else{
				$('input[name=subCheck]:checkbox').each(function(){
					$(this).prop('checked',false);
				});
			}
		});
		
	});
	</script>
</body>
</html>