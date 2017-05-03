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

	<div class="searchboard_title margin-bottom-20">
		<div class="searchboard_title-in">
			<h1>My page</h1>
		</div>
	</div>
	<div class="container content profile">

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
						<h2>내가 쓴 쪽지함</h2>
						<div class="pull-right">
						<form id = "buttonform">
							<button class="btn-u btn-block rounded"
								style="background-color: #f7be22; width: 130px;">
								<a href="javascript:delete_re_message()"></i>메세지 삭제</a>
							</button>
							<button class="btn-u btn-block rounded"
								style="background-color: #f7be22; width: 130px;">
								<a href="get_messageList"></i>받은 쪽지함</a>
							</button>							
							<input type = "hidden" id = "deleteList" name = "deleteList">
						</form>	
						</div>
					</div>
					<!--row-->
					<div class="row">
						<div class="col-sm-12">
						<c:if test = "${iwriteList.size()==0}">
							현재까지 쓴 쪽지가 없습니다
						</c:if>
						<c:if test = "${iwriteList.size()>0}">	
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>
												<input type="checkbox" id="checkedAll"/>
  												<label class="admin_label"for="checkedAll"></label>
											</th>
											<th>내용</th>
											<th>받은이</th>
											<th class="hidden-sm">보낸날짜</th>
											<th class="hidden-sm">읽은날짜</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var = "msg" items = "${iwriteList}">							
										<tr>
											<td>
												<input name="subCheck" type="checkbox" id="check${msg.msg_no}" value="${msg.msg_no}">
  												<label class="admin_label" for="check${msg.msg_no}"></label>
											</td>
											<td><div style = "display:inline-block; white-space:nowrap; overflow:hidden; text-overflow:ellipsis; width:500px">
											<a href="javascript:msg_open(${msg.msg_no})" type="button">
											${msg.msg_text}</a></div></td>
											<td>${msg.receiver}</td>
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
							<form action="get_iwirteList" id = "pagingForm" method="get">
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
		
		function msg_open(number) {
			  window.open("message?msg_no="+number+"&mine='yes'", "", 'titlebar=no, scrollbars=yes, toolbar=no, location=no, resizable=no, status=no, menubar=yes, width=350, height=420, left=30%, top=40%');
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
		
		// 여러 게시글 삭제하기
		function delete_re_message(){		
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
				form.action = "delete_re_messages";
				form.method = "post";
				form.submit();
			}
		}
		
		
		
	</script>
		
</body>
</html>