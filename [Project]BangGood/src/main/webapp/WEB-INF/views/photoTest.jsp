<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="assets/plugins/jquery.easing.min.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function proFileShow(num) {
		var upload = document.getElementsByName('uploadFile' + num)[0];
		var holder = document.getElementById('holder' + num);

		upload.onchange = function(e) {
			e.preventDefault();
			var file = upload.files[0];
			var reader = new FileReader();
			reader.onload = function(event) {
				var img = new Image();
				img.src = event.target.result;
				img.width = 200;
				img.height = 150;
				holder.innerHTML = '';
				holder.appendChild(img);
			};
			reader.readAsDataURL(file);
			return false;
		};
	}

 	function photoRemove() {
		for (var i = 1; i < 13; i++) {
			var holder = document.getElementById('holder' + i);
			var reset = "<article>";
			reset += "<input type='file' name='uploadFile"+i+"'";
			reset += " accept='.gif, .jpg, .png' multiple";
			reset += " onclick='proFileShow("+i+")';>";
			reset += "</article>";
			holder.innerHTML = reset;			
		}
	}
</script>
<body>
	<form action="savephoto" method="post" enctype="multipart/form-data">
	<div class="form-group row">
		<table>
			<tr>
				<td><div class="">
						<label for="">메인</label>
						<div id='holder1'>
							<article> <input type="file" name="uploadFile1" id="uploadFile1"
								accept=".gif, .jpg, .png" multiple onclick="proFileShow(1);"
								value="메인"> </article>
						</div>
					</div></td>
				<td><div class="">
						<label for="">평면도</label>
						<div id='holder2'>
							<article> <input type="file" name="uploadFile2" id="uploadFile2"
								accept=".gif, .jpg, .png" multiple onclick="proFileShow(2);"
								value="평면도"> </article>
						</div>
					</div></td>
				<td><div class="">
						<label for="">화장실</label>
						<div id='holder3'>
							<article> <input type="file" name="uploadFile3" id="uploadFile3"
								accept=".gif, .jpg, .png" multiple onclick="proFileShow(3);"
								value="화장실"> </article>
						</div>
					</div></td>
			</tr>
			<tr>
				<td>
					<div class="">
						<label for="">부엌</label>
						<div id='holder4'>
							<article> <input type="file" name="uploadFile4" id="uploadFile4"
								accept=".gif, .jpg, .png" multiple onclick="proFileShow(4);"
								value="부엌"> </article>
						</div>
					</div>
				</td>
				<td>
					<div class="">
						<label for="">현관</label>
						<div id='holder5'>
							<article> <input type="file" name="uploadFile5" id="uploadFile5"
								accept=".gif, .jpg, .png" multiple onclick="proFileShow(5);"
								value="부엌"> </article>
						</div>
					</div>
				</td>
				<td>
					<div class="">
						<label for="">복도</label>
						<div id='holder6'>
							<article> <input type="file" name="uploadFile6" id="uploadFile6"
								accept=".gif, .jpg, .png" multiple onclick="proFileShow(6);"
								value="부엌"> </article>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="">
						<label for="">사진</label>
						<div id='holder7'>
							<article> <input type="file" name="uploadFile7" id="uploadFile7"
								accept=".gif, .jpg, .png" multiple onclick="proFileShow(7);"
								value="부엌"> </article>
						</div>
					</div>
				</td>
				<td>
					<div class="">
						<label for="">사진</label>
						<div id='holder8'>
							<article> <input type="file" name="uploadFile8" id="uploadFile8"
								accept=".gif, .jpg, .png" multiple onclick="proFileShow(8);"
								value="부엌"> </article>
						</div>
					</div>
				</td>
				<td>
					<div class="">
						<label for="">사진</label>
						<div id='holder9'>
							<article> <input type="file" name="uploadFile9" id="uploadFile9"
								accept=".gif, .jpg, .png" multiple onclick="proFileShow(9);"
								value="부엌"> </article>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="">
						<label for="">사진</label>
						<div id='holder10'>
							<article> <input type="file" name="uploadFile10" id="uploadFile10"
								accept=".gif, .jpg, .png" multiple onclick="proFileShow(10);"
								value="부엌"> </article>
						</div>
					</div>
				</td>
				<td>
					<div class="">
						<label for="">사진</label>
						<div id='holder11'>
							<article> <input type="file" name="uploadFile11" id="uploadFile11"
								accept=".gif, .jpg, .png" multiple onclick="proFileShow(11);"
								value="부엌"> </article>
						</div>
					</div>
				</td>
				<td>
					<div class="">
						<label for="">사진</label>
						<div id='holder12'>
							<article> <input type="file" name="uploadFile12" id="uploadFile12"
								accept=".gif, .jpg, .png" multiple onclick="proFileShow(12);"
								value="부엌"> </article>
						</div>
					</div>
				</td>
			</tr>
		</table>
		<input type="submit" value="사진 저장">
		<input type="button" value="전체 취소" onclick="photoRemove()">
	</div>
	</form>

</body>
</html>