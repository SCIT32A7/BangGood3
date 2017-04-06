<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="assets/css/custom.css">
<link rel="stylesheet" href="assets/css/reset.css">
<link href='https://fonts.googleapis.com/css?family=Ek+Mukta:400,600,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="assets/css/construction.style.css">
<link rel="stylesheet" href="assets/css/app.css">
<title>message</title>

</head>
<body>

	<!--join Block-->
		<div class="message_bg">
			<span style="white-space: pre-line">▶ 쪽지 읽기</span>
		</div>
		<div class="" style="padding:10px;">
			<h4 style="font-size:15px;">보낸이 <span class="g-ml-5" style="margin-left:5px;">${msg.sender}</span><br>
			<span style="color:#bbb">보낸시간 <span class="g-ml-5">${msg.sentDate}</span></span></h4>
			<textarea type="text" class="pull-width" style="width: 100%; height: 205px" readonly="readonly">${msg.msg_text}</textarea>
			<div class="g-mt-20" style="float:right">
				<c:if test = "${mine == 'no'}">
				<a href="" onclick="msg_send()" class="btn-u btn-block rounded g-ml-10" style="background-color: #f7be22; width: 50px;" >답장</a> 
				</c:if>
				<a href="" onclick="msg_close()"class="btn-u btn-block rounded" style="background-color: #f7be22; width: 50px;">닫기</a>
			</div>
	</div>
	
			
		
</body>
<script type="text/javascript">
	function msg_send() {
		  window.open("message_send?sender="+${msg.sender}, "", 'titlebar=no, scrollbars=yes, toolbar=no, location=no, resizable=no, status=no, menubar=yes, width=350, height=400, left=30%, top=40%');
			this.close();
	};
	function msg_close(){
		this.close();
	}
</script>
</html>