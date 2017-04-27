 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
   <meta charset="UTF-8">
   <meta content="width=device-width, initial-scale=1.0" name="viewport">
   <title>가계약 | 니가사는 그집</title>      
	<style>
		/* table tbody tr td {
			width=30%;
		} */
		.label {
			width = 400px;
		}
	</style>
</head>

<body id="page-top">
   <h1>방(전세/월세) 가계약</h1>
   <form action="" method="post" id="" >
   <input type="hidden" id="property_no" name="propertyNo" value="">
   <c:if test="">
   		<input type="hidden" id="contractNo" name="contractNo" value="">
   </c:if>
   
   <h3>부동산의 표시</h3>
   <table border="1">
      <tr>
         <th class="label">소재지<br /> (주소)</th>
         <th colspan="7">${property.address}&nbsp;${property.address_detail}</th>
      </tr>
   </table>
   
	<h3>거래 정보</h3>
	 <table border="1">
	    <tr>
	        <th class="label">보증금/${property.rent_type}</th>
	        <th><input type="text" class="" value='￦${property.deposit}/￦${property.month_fee}' placeholder="￦/￦" readonly></th>
	     	<th class="label">관리비</th>
	        <th><input type="text" class="" value='￦${property.maintence_fee}' placeholder="￦" readonly></th>
	    	<th class="label">방 종류</th>
	        <th><input type="text" class="" value='${property.property_type}' placeholder="원룸/투룸" readonly></th>	
	        <th class="label">방 면적</th>
	        <th><input type="text" class="" value='${property.roomsize}평' placeholder="평"readonly></th>
	    </tr>
	    <tr >
	        <th class="label">관리비 포함 항목</th>
	        <th colspan="7"><input type="text" class="" value="${maintence.internet } ${maintence.tvfee } ${maintence.cleaning } 
	        ${maintence.waterfee } ${maintence.gasfee } ${maintence.electronic }" readonly></th>
	    </tr>
	    <tr>
	        <th class="label">포함 옵션</th>
	        <th colspan="7"><input type="text" class="" value="${roomoption.pet } ${roomoption.car } ${roomoption.elevator } 
	        ${roomoption.air_conditioner } ${roomoption.fridge } ${roomoption.washing_machine } ${roomoption.gas_stove } 
	        ${roomoption.electric_stove } ${roomoption.microwave } ${roomoption.desk } ${roomoption.rack } ${roomoption.bed } 
	        ${roomoption.closet } ${roomoption.shoecabinet } ${roomoption.doorlock } ${roomoption.wifi } ${roomoption.total }" readonly>
	        </th>
	    </tr>
	    <tr>    
	        <th class="label">계약예정일</th>
	        <th>
	        <c:if test="">
	        <input type="date" class="" id="con_date" name="con_date" value="" required></c:if>
	        </th>
	      </tr>
   </table>
   
   <br />
   <h3>거래 약정 내용</h3>
   <label>위 부동산 소유자(임대인)와 매수(임차)약정자가 양방 협의 하에 다음과 같이 가계약을 체결한다.</label>
   <table border="1" style="padding: 5px; width: 1100px;">
      <tr>
         <th><p align="center">계약금</p></th>
         <th><label>일금</label></th>
         <th><input type="text" class="buyer" id="price_kor" name="price_kor" placeholder="삼천만원" value="${ran.price_kor }" required></th>
         <th style="width: 70px">￦</th>
         <th><input type="text" value="" id="contractPrice" placeholder="300,000" readonly ></th>
      </tr>
      <tr>
         <th><p align="center">가 계약금</p></th>
         <th><label>일금</label></th>
         <th><input type="text" class="buyer" placeholder="삼천만원" id="con_price" name="con_price" value="${ran.con_price }" required></th>
         <th style="width: 70px">￦</th>
         <th><input type="text" value="" placeholder="300,000" id="preContractPrice" readonly ></th>
      </tr>
      <tr>   
         <th><input type="text" placeholder="oooo년 o월 oo일 (입금 날짜로 자동 변경)" id="money_date" name="money_date" value="" readonly ></th>
         <th>에 영수함</th>
	  </tr>

   </table>
   <h3>약 정</h3>
   <h4>
      <span>&nbsp;&nbsp;&nbsp;1. 본 계약은 {날짜}시 까지 정식 계약을 체결하기 위하여 작성한 가계약서이다. 따라서 계약 당사자는 정식계약 체결 시점까지 계약의 체결을 거절할<br /> 
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수 있으며, 당사자 일방이 아무런 통보없이 기한까지 계약을 체결하지 않거나, 당사자가 미리 거절의 통지를 상대방에게 한 때에는 본 계약은 즉시  <br />
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;무효로 한다.</span><br />
      <span>&nbsp;&nbsp;&nbsp;2. 전항에 의거 무효가 된 때에는 가계약금은 즉시 전액 몰수하기로 한다. 다만, 당사자 간의 합의로 반환하기로 한 때에는 반환하여야 한다.</span><br />
      
      <span>&nbsp;&nbsp;&nbsp;3. 가계약금을 반환할 의무가 있는 자가 상대방이 기한을 정하여 가계약금의 반환을 요청하였음에도 불구하고 기한까지 반환하지 않은 때에는 지급할 <br /> 
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;때까지 1일에 1할의 징벌적 지연 이자를 지급하기로 한다.</span><br />
      <span>&nbsp;&nbsp;&nbsp;4. 당사자 일방의 책임 있는 사유로 정식 계약이 체결되지 않아 가계약이 무효가 된 때에는 매도자는 상대방에 대하여 교부받은 금액의 배액을 상환하<br /> 
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;여야야 하고, 매수자는 상대방에게 교부한 계약음은 매도인에게 전부 귀속된다.</span><br />
      <span>&nbsp;&nbsp;&nbsp;5. 가계약금은 매도인(임대인)에게 보관하기로 하며, 정식 계약을 체결 시에는 계약금에 충당하기로 한다.</span>
   </h4>

   <h3>부가 조건</h3>

   <textarea rows="5" cols="55" class="buyer"
      style="margin-left: 50px; border: none; font-size: xx-large;" id="extra_condi" name="extra_condi" ><c:if test="${empty ran.extra_condi}">1.
2.
3.</c:if>${ran.extra_condi }</textarea>
   <h4 align="center">
      <span>본 계약에 대하여 매도인(임대인)과 매수인(임차인)은 이의 없음을 확인하고 각자 서명․ 날인 후 <br />
      <br />매도인(임대인), 매수인(임차인) 각 1통씩 보관한다.
      </span>
   </h4>
   <br/>
   <br/>
   <h2 align="center" id="money_date2" >oooo년 o월 oo일 (입금일로 자동 변경)</h2>

   <br />
   <br />

   <table style="width: 1000px">
      <tr>
         <th rowspan="2">매도인<br /> (임대인)
         </th>
         <th>주소</th>
         <th colspan="3"><input type="text" class="seller" id="s_addr" name="s_addr" value="${ran.s_addr }"></th>
         <th>ID</th>
         <th><input type="text" class="seller" value="${ptotal.sellerId }" id="s_id" name="s_id" readonly></th>
      </tr>
      <tr>
         <th>주민등록번호</th>
         <th><input type="text" class="seller" id="s_jumin" name="s_jumin" / value="${ran.s_jumin }"></th>
         <th>전화</th>
         <th><input type="text" class="seller" id="s_phone" name="s_phone" value="${ran.s_phone }"></th>
         <th>성명</th>
         <th><input type="text" class="seller" id="s_name" name="s_name" value="${ran.s_name }"/></th>
      </tr>
      <tr>
         <th rowspan="2">매수인<br /> (임차인)
         </th>
         <th>주소</th>
         <th colspan="3"><input type="text" id="b_addr" name="b_addr" class="buyer" value="${ran.b_addr }" required></th>
         <th>ID</th>
         <th><input type="text" id="b_id" name="b_id" class="buyer" value="${ran.b_id }" required></th>
      </tr>
      <tr>
         <th>주민등록번호</th>
         <th><input type="text" id="b_jumin" name="b_jumin" class="buyer" value="${ran.b_jumin }" required/></th>
         <th>전화</th>
         <th><input type="text" id="b_phone" name="b_phone" class="buyer" value="${ran.b_phone }" required/></th>
         <th>성명</th>
         <th><input type="text" id="b_name" name="b_name" class="buyer" value="${ran.b_name}" required/></th>
      </tr>
   </table>

</body>
</html>