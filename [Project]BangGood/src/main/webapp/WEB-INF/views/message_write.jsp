<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test = "${not empty result}">
	<c:if test = "${result == 'success'}">
		<script>
			alert('쪽지를 전송했습니다.')
			this.close();
		</script>
	</c:if>
	<c:if test = "${result == 'fali'}">
		<script>
			alert('없는 아이디 입니다.')
		</script>
	</c:if>
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="assets/css/custom.css">
<link rel="stylesheet" href="assets/css/reset.css">
<link href='https://fonts.googleapis.com/css?family=Ek+Mukta:400,600,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="assets/css/construction.style.css">
<link rel="stylesheet"
	href="assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/app.css">
<link rel="stylesheet" href="assets/css/global.css">
<title>message</title>

<script type="text/javascript">
	function msg_send(){
		//그냥 보내기라 꺼짐
		var receiver_c = document.getElementById("receiver_c");
		var msg_text_c = document.getElementById("msg_text_c");
		
		var form = document.getElementById("send_form");
		var receiver = document.getElementById("receiver");
		var msg_text = document.getElementById("msg_text");
		
		receiver.value = receiver_c.value;
		msg_text.value = msg_text_c.value;
		form.action = "send_message";
		form.method = "post";
		form.submit();
	}
	
	function msg_close(){
		this.close();
	}
</script>
</head>
<body>

	<!--join Block-->
		<div class="message_bg">
			<span style="white-space: pre-line">▶ 쪽지보내기</span>
		</div>
		<div class="" style="padding:10px;">
			<h4 style="font-size:15px; float:left;margin-right:5px;">받는이</h4>
			<input type="text" id = "receiver_c" name = "receiver_c" 
			class="form-control rounded" style="width:100px; float:left">
			<textarea type="text" id ="msg_text_c" name = "msg_text_c" 
			class="pull-width" style="width: 100%; height: 205px"></textarea>
			<div class="g-mt-20" style="float:right">
				<a href="javascript:msg_send()" class="btn-u btn-block rounded g-ml-10" style="background-color: #f7be22; width: 120px;" >쪽지 쓰기</a> 
				<a href="" onclick="msg_close()" class="btn-u btn-block rounded" style="background-color: #f7be22; width: 50px;">닫기</a>
			</div>		
		</div>
		
		<form id = "send_form">
		<input type = "hidden" id = "receiver" name = "receiver">
		<input type = "hidden" id = "msg_text" name = "msg_text">
		</form>
	
			
		
</body>
</html>