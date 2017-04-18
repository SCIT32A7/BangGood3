<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="assets/plugins/jquery.easing.min.js"></script>
<title>Insert title here</title>
</head>
<style>
img {
	width: 300px;
	height: 240px;
}
</style>
<script type="text/javascript">
	
</script>
<body>
	<c:forEach var="pic" items="${picList}">
		<img src="download?pic_name=${pic.pic_name}&pic_savename=${pic.pic_savename}">
	</c:forEach>
</body>
</body>
</html>