 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->

<head>
		<!-- Meta -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		  
<style>
.container {
	padding-top: 40px;
	padding-bottom: 10px;
	text-align: center;
	margin: 40px auto;
	border: 1px solid #333;
	width: 80%;
}

.content {
	margin: auto;
	width: 80%;
}

.button {
	text-align: center;
	padding-bottom: 20px;
}

.button input {
	padding: 5px;
}
h3{
	text-align:left;
}
.table tr:NTH-CHILD(1)>th{
	border-top:none;
	width:150px;
}
th{
	font-size: 18px;
}
</style>

</head>

<body id="page-top">
<form action = "make_contract" method = "post">   
	<div class="container" id="container">
	<div class = "page" style='page-break-before:always'>
	
   <h1 style="text-align:center; margin-top:50px">굿방 매물 가계약서</h1>
  
    <div class="content">
   <h3>부동산의 내역</h3>  
   <table class="table">
      <tr>
         <th class="label"> 소재지 (주소) </th>
         <td>
         	${contract.address}
         </td>
      </tr>
   </table>
   </div>
    <div class="content">
	<h3>거래 정보</h3>
	<table class="table">
	 	<tr>
	    	<th class="label"> 방 종류 </th>
	        <td>${contract.property_type}</td>	
	        <th class="label"> 방 면적 </th>
	        <td>${contract.roomsize}</td>
	    </tr>
	    <tr>
	        <th class="label"> 보증금/월세 </th>
	        <td>${contract.deposit}</td>
	     	<th class="label"> 관리비 </th>
	        <td>${contract.maintence_fee}</td>
	    </tr>
	    <tr>    
	        <th class="label"> 계약예정일 </th>
	        <td>${contract.con_date}</td>
	    </tr>
   </table>
   </div>
    <div class="content">
   <h3> 거래 약정 내용 </h3>
   <p style="text-align:left">위 부동산 소유자(임대인)와 매수(임차)약정자가 양방 협의 하에 다음과 같이 가계약을 체결합니다.</p>
   <table class="table" style="padding: 5px;">
      <tr>
         <td>
         ${contract.buyer_name}는 ${contract.contractPrice}원을 ${contract.seller_name}에게 ${contract.con_date}까지 지불합니다.
         </td>
	  </tr>
   </table>
   </div>
   <h3 style="text-align:center; margin-top:30px"> 약 정 </h3>
   <div class="content">
   <h4 style="text-align:left">
      <span>1. 본 계약은  정식 계약을 체결하기 위하여 작성한 가계약서입니다. 따라서 계약 당사자는 정식계약 체결 시점까지 계약의 체결을 거절할 수 있으며, 당사자 일방이 아무런 통보없이 기한까지 계약을 체결하지 않거나, 당사자가 미리 거절의 통지를 상대방에게 한 때에는 본 계약은 즉시 무효가 됩니다.</span>
      <br><br>
      <span>2. 전항에 의거 무효가 된 때에는 가계약금은 즉시 전액 몰수합니다. 다만, 당사자 간의 합의로 반환하기로 한 때에는 반환하여야 합니다.</span>
       <br><br>
      <span>3. 가계약금을 반환할 의무가 있는 자가 상대방이 기한을 정하여 가계약금의 반환을 요청하였음에도 불구하고 기한까지 반환하지 않은 때에는 지급할 때까지 1일에 1할의 징벌적 지연 이자를 지급하여야 합니다.</span>
       <br><br>
      <span>4. 당사자 일방의 책임 있는 사유로 정식 계약이 체결되지 않아 가계약이 무효가 된 때에는 매도자는 상대방에 대하여 교부받은 금액의 배액을 상환하여야야 하고, 매수자는 상대방에게 교부한 계약음은 매도인에게 전부 귀속됩니다.</span>
       <br><br>
      <span>5. 가계약금은 매도인(임대인)에게 보관하기로 하며, 정식 계약을 체결 시에는 계약금에 충당하여야 합니다.</span>
   </h4>
	</div>
	</div>
<div class = "page" style='page-break-before:always'>
	<div class="content">
   <h2 style="padding-top:60px;"> 부가 조건 </h2>
   <p style = "white-space: pre-wrap; text-align: left">${contract.extra_condi}</p>
   </div>
   <div class="content">
   <h4 align="center">
      <span>본 계약에 대하여 매도인(임대인)과 매수인(임차인)은 이의 없음을 확인하고 각자 서명․ 날인 후 <br />
      <br />매도인(임대인), 매수인(임차인) 각 1통씩 보관하여야 합니다.
      </span>
   </h4>
   <br/>
   <br/>
   <div class="content">
   <table class="table" style="margin-bottom:30px; width:100%; text-align: left">
      <tr>
         <th rowspan="3"> 매도인 (임대인) </th>
         <th> 성명 </th>
         <td>${contract.seller_name}&nbsp&nbsp&nbsp&nbsp 서명</td>
      </tr>
      <tr>         
         <th> 주민등록번호 </th>
         <td>${contract.seller_jumin}</td>
      </tr>
      <tr> 
         <th> 전화 </th>
         <td>${contract.seller_phone}</td>
      </tr>
      <tr>
         <th rowspan="3"> 매수인 (임차인) </th>
         <th> 성명 </th>
         <td>${contract.buyer_name}&nbsp&nbsp&nbsp&nbsp 서명</td>
      </tr>
      <tr>
         <th> 주민등록번호 </th>
         <td>${contract.buyer_jumin}</td>
      </tr>
      <tr>
         <th> 전화 </th>
         <td>${contract.buyer_phone}</td>       
      </tr>
   </table>
 	</div>
   </div>
</div>
	
	</div>
	 <div class="button">
  		 <input type="button" id="printBt" value ="가계약서  출력">
	</div>
	</form>
	<script src="assets/plugins/jquery/jquery.min.js"></script>
	<script src="assets/plugins/jquery/jquery-migrate.min.js"></script>
	<script src="assets/plugins/bootstrap/js/bootstrap.js"></script>
	<!-- JS Implementing Plugins -->
	<script src="assets/plugins/pace/pace.min.js"></script>
	<script src="assets/plugins/modernizr.js"></script>
	<script src="assets/plugins/backstretch/jquery.backstretch.min.js"></script>
	<!-- JS Page Level-->
	<script src="assets/js/one.app.js"></script>
	<script>
	
	$(function(){
		
		var win = null;
		var printDiv = null;
		var printBt = null;
		printDiv = $('#container')[0].innerHTML;
		
		$('#printBt').on("click",function(){
			printFunc(printDiv);
		})
		
		
		function printFunc(container){
			win = window.open();
			self.focus();
			win.document.open();
			win.document.write('<'+'html'+'><'+'head'+'><'+'style'+'>');
			win.document.write('body,td{font-family:Verdana;font-size:10pt}');
			win.document.write('<'+'/'+'style'+'><'+'/'+'head'+'><'+'body'+'>');
			win.document.write(container);
			win.document.write('<'+'/'+'body'+'><'+'/'+'html'+'>');
			win.document.close();
			win.print();
			win.close();
		}
	});
	
	</script>

</body>


</html>