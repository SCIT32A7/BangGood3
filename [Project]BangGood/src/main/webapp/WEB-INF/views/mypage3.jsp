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
		file="login.jsp"%> <!-- end menu --> <!--=== Profile ===-->

	<div class="searchboard_title margin-bottom-20">
		<div class="searchboard_title-in">
			<h1>My page</h1>
		</div>
	</div>
	<div class="container content profile" style="height:700px;">

		<div class="row">
			<!--Left Sidebar-->
			<div class="col-md-3 md-margin-bottom-40">

				<h4>
					<span>${loginId}</span> 님 마이페이지 입니다.
				</h4>
				<hr>

				<div class="margin-bottom-50"></div>
				<ul class="list-group sidebar-nav-v1 margin-bottom-40"
					id="sidebar-nav-1">
					<li class="list-group-item">
					<a href="mypage"><i class="fa fa-cubes" style="width:15px; height:10px;"></i> 등록매물</a>
					</li>
					<li class="list-group-item">
					<a href="mypage2"><i class="fa fa-cubes" style="width:15px; height:10px;"></i> 관심매물</a>
					</li>
					<li class="list-group-item active">
					<a href="get_messageList"><i class="fa fa-comments" style="width:15px; height:10px;"></i> 메세지</a>
					</li>
					<li class="list-group-item ">
					<a href="mypage4"><i class="fa fa-user" style="width:15px; height:10px;"></i> 개인정보 수정</a>
					</li>
				</ul>

				<!--Datepicker-->
				<form action="#" id="sky-form2" class="sky-form">
					<div id="inline-start"></div>
				</form>
				<!--End Datepicker-->
			</div>
			<!--End Left Sidebar-->

			<!-- Profile Content -->
			<div class="col-md-9">
				<div class="g-pd-20">
					<div class="headline">
						<h2>메세지</h2>
						<div class="pull-right">
						<form id = "buttonform">
							<button class="btn-u btn-block rounded"
								style="background-color: #f7be22; width: 130px;">
								<a href="get_iwriteList"></i>보낸 쪽지함</a>
							</button>
							<button class="btn-u btn-block rounded"
								style="background-color: #f7be22; width: 130px;">
								<a href="javascript:delete_message()"></i>메세지 삭제</a>
							</button>
							<button class="btn-u btn-block rounded"
								style="background-color: #f7be22; width: 130px;">
								<a href="javascript:msg_write()"></i>메세지 작성</a>
							</button>
							<input type = "hidden" id = "deleteList" name = "deleteList">
						</form>	
						</div>
					</div>
					<!--row-->
					<div class="row">
						<div class="col-sm-12">
						<c:if test = "${messageList.size()==0}">
								쪽지함이 비어있습니다.
						</c:if>
						<c:if test = "${messageList.size()>0}">	
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>
												<input type="checkbox" id="checkedAll"/>
  												<label class="admin_label"for="checkedAll"></label>
											</th>
											<th>내용</th>
											<th>보낸이</th>
											<th class="hidden-sm">받은날짜</th>
											<th class="hidden-sm">읽은날짜</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var = "msg" items = "${messageList}">							
										<tr>
											<td>
												<input name="subCheck" type="checkbox" id="check${msg.msg_no}" value="${msg.msg_no}">
  												<label class="admin_label" for="check${msg.msg_no}"></label>
											</td>
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
					<hr>
					<!--  end row -->

				
				</div>
				<!-- End Profile Content -->
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
		<script src="assets/plugins/pace/pace.min.js"></script>
		<script src="assets/plugins/modernizr.js"></script>
		<script src="assets/plugins/backstretch/jquery.backstretch.min.js"></script>
		<!-- JS Page Level-->
		<script src="assets/js/one.app.js"></script>
		<!-- custom -->
		<script src="assets/js/custom.js"></script>
		<script type="text/javascript">
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
		
		// 메시지 읽기
		function msg_open(number) {
			  window.open("message?msg_no="+number, "", 'titlebar=no, scrollbars=yes, toolbar=no, location=no, resizable=no, status=no, menubar=yes, width=350, height=420, left=30%, top=40%');
		};
		
		// 메시지 쓰기
		function msg_write() {
			  window.open("message_write", "", 'titlebar=no, scrollbars=yes, toolbar=no, location=no, resizable=no, status=no, menubar=yes, width=350, height=400, left=30%, top=40%');
		};
		
		// 페이징 처리
		function pagingForSubmit(currentPage){
			var form = document.getElementById("pagingForm")
			var page = document.getElementById("page");
			page.value = currentPage;
			form.submit();
		}
		
		// 여러 게시글 삭제하기
		function delete_message(){		
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
				alert('삭제할 쪽지를 선택해주세요.');
				return false;
			}
			if(confirm('해당 쪽지를 정말 삭제하겠습니까?')){
				var form = document.getElementById("buttonform");
				var deleteList = document.getElementById("deleteList");
				deleteList.value = checkList;
				form.method = "post";
				form.action = "delete_messages";
				form.submit();
			}
		}
		
		</script>		
</body>
</html>