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
	<div class="container content" style="height:700px;">
		<div class="headline">
			<h2>문의게시판</h2>	
			
			<form id = "pagingForm" method="get" class="g-dp-inline pull-right">
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
			<c:if test = "${loginId == 'admin'}">
				<button class="btn-u btn-block rounded" id = "stop_showing"
				style=" width:80px;display:inline-block; background: #333">
					<a href="javascript:delete_board()">삭제</a>
				</button>
			</c:if>
			<input type = "hidden" name = "page" id = "page">
			<input type = "hidden" name = "deleteList" id = "deleteList">
			</form>
		</div>
		<!-- Tab pannel 4 -->

		<div class="table-responsive">
			<table class="table">
				
				<thead>
					<tr>
						<c:if test = "${loginId == 'admin'}">
							<th>
								<input type="checkbox" id="checkedAll"/>
  								<label class="admin_label"for="checkedAll"></label>
							</th>
						</c:if>
						<th>제목</th>
						<th>작성자</th>						
						<th class="hidden-sm">등록일</th>
						<th class="hidden-sm">조회</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="board" items="${list}">
					
					<tr>
						<c:if test = "${loginId == 'admin'}">
							<td>
								<input name="subCheck" type="checkbox" id="check${board.searchBoard_no}" value="${board.searchBoard_no}">
  								<label class="admin_label" for="check${board.searchBoard_no}"></label>
							</td>
						</c:if>
						<td><a href="read_searchboard?searchBoard_no=${board.searchBoard_no}">
						${board.searchBoard_title} (${board.searchBoard_reply})</a></td>
						<td>${board.custid}</td>
						<td>${board.searchBoard_inputdate}</td>
						<td>${board.searchBoard_hits}</td>
					</tr>
					
				</c:forEach>
				</tbody>
			</table>
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
	var form = document.getElementById("pagingForm")
	var page = document.getElementById("page");
	page.value = currentPage;
	form.action = "searchboard";
	form.submit();
}

// 여러 게시글 삭제하기
function delete_board(){		
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
		alert('삭제할 게시글을 선택해주세요.');
		return false;
	}
	if(confirm('해당 게시글을 정말 삭제하겠습니까?')){
		var form = document.getElementById("pagingForm");
		var deleteList = document.getElementById("deleteList");
		deleteList.value = checkList;
		form.action = "delete_searchboards";
		form.submit();
	}
}
 
//전체 클릭
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