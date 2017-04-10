<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<style>
  .ui-autocomplete {
    max-height: 100px;
    overflow-y: auto;
    /* prevent horizontal scrollbar */
    overflow-x: hidden;
  }
  /* IE 6 doesn't support max-height
   * we use height instead, but this forces the menu to always be this tall
   */
  * html .ui-autocomplete {
    height: 100px;
  }
</style>
<script src="assets/plugins/jquery/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
 	$(function() {
		var text = $("#addresstext");
		var array;
		$("#addresstext").keyup(function() {
				$.ajax({
					method : "get",
					url : "search_point",
					data : {
						"searchText" : text.val()
					},
					success : function(resp) {
						array = resp;
						$("#addresstext").autocomplete({
							source : resp
						})
					}
				});				
		});			
		
	})

</script>

</head>
<body>
	<div id="textarea">
		<input id="addresstext" name="searchText">
	</div>
</body>
</html>