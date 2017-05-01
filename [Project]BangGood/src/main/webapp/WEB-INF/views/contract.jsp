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
		<link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
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
	margin: 20px auto;
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
	<div class="container">

   <h1>굿방 매물 가계약서 양식</h1>
  
    <div class="content">
   <h3>부동산의 내역</h3>  
   <table class="table">
      <tr>
         <th> 소재지 (주소) </th>
         <th colspan="7">
         	<input type="text" style="width:60%" name = "address" id= "address" value="${property.address} ${property.address_detail}" readonly>
         </th>
      </tr>
   </table>
   </div>
    <div class="content">
	<h3>거래 정보</h3>
	<table class="table">
	 	<tr>
	    	<th > 방 종류 </th>
	        <th><input type="text" name = "property_type" id= "property_type" value="${property.property_type}" readonly></th>	
	        <th> 방 면적 </th>
	        <th><input type="text" name = "roomsize" id= "roomsize" value="${property.roomsize}제곱미터" readonly></th>
	    </tr>
	    <tr>
	        <th> 보증금/월세 </th>
	        <th><input type="text" name = "deposit" id= "deposit" value="${property.deposit}원 / ${property.month_fee}원" readonly></th>
	     	<th> 관리비 </th>
	        <th><input type="text" name = "maintence_fee" id= "maintence_fee" value="${property.maintence_fee}원" readonly></th>
	    </tr>
	    <tr>    
	        <th> 계약예정일 </th>
	        <th>
	        <input type="date" id="con_date" name="con_date" required>
	        <input type="button" id = "data_commit" value ="확인">
	        </th>
	    </tr>
   </table>
   </div>
    <div class="content">
   <h3> 거래 약정 내용 </h3>
   <p style="text-align:left">위 부동산 소유자(임대인)와 매수(임차)약정자가 양방 협의 하에 다음과 같이 가계약을 체결합니다.</p>
   <table class="table" style="padding: 5px;">
      <tr>
         <th>
         <input type="text" id="contractPrice" name = "contractPrice">원을 
         <span id="contract_date"></span>까지 지불합니다.
         </th>
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
	
	<div class="content">
   <h3 style="padding-top:40px;"> 부가 조건 </h3>
   <textarea rows="10" cols="50" class="buyer" style="width:100%; margin-left:0px; font-size:18px;" id="extra_condi" name="extra_condi">
   </textarea>
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
   <table style="margin-bottom:30px; width:80%" class="table">
   	<colgroup>
   		<col width="39%">
   		<col width="30%">
   		<col width="40%">
   	</colgroup>
      <tr>
         <th rowspan="3"> 매도인 (임대인) </th>
         <th>성명 </th>
         <th><input type="text" class="seller" id="seller_name" name="seller_name"></th>
      </tr>
      <tr>         
         <th> 주민등록번호 </th>
         <th><input type="text" class="seller" id="seller_jumin" name="seller_jumin"></th>
      </tr>
      <tr> 
         <th> 전화 </th>
         <th><input type="text" class="seller" id="seller_phone" name="seller_phone"></th>
      </tr>
      <tr>
         <th rowspan="3"> 매수인 (임차인) </th>
         <th> 성명 </th>
         <th><input type="text" id="buyer_name" name="buyer_name" class="buyer" required></th>
      </tr>
      <tr>
         <th> 주민등록번호 </th>
         <th><input type="text" id="buyer_jumin" name="buyer_jumin" class="buyer"></th>
      </tr>
      <tr>
         <th> 전화 </th>
         <th><input type="text" id="buyer_phone" name="buyer_phone" class="buyer"></th>       
      </tr>
   </table>
   </div>
   
 	</div>
	
	</div>
	 <div class="button">
   <input type="submit" value ="가계약서 작성완료">
   <input type="reset" value ="다시 작성하기">
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
	
	<script type="text/javascript">
	$("#data_commit").on("click", function(){
		alert($("#con_date").val());
		var date = $("#con_date").val();
		
		$("#contract_date").html(date);
	});
	</script>
</body>


</html>