$(function() {
	
	var checkStatus = 'no';
	
	App.init();
	ContactForm.initContactForm();

	/* join */
	$("#joinBtn1").click(function() {
		$("#agreement").modal();
	});

	$("#joinBtn2").click(function() {
		var clickbox1 = $("#checkbox1").is(':checked');
		var clickbox2 = $("#checkbox2").is(':checked');
		if (clickbox1 == false) {
			alert("이용약관에 동의해 주세요.");
			return false;
		}
		if (clickbox2 == false) {
			alert("개인정보수집 및 이용에 동의해 주세요.");
			return false;
		}
		$("#agreement").modal("hide");
		$("#JoinModal").modal();
	});
	
	$("#idCheck").click(function() {		
		idCheck();
	});

	$("#joinBtn3").click(function() {
		insert_customer();
	});

	$("#loginBtn").click(function() {
		$("#loginModal").modal();
	});
	
	/*$("#login_ok").click(function() {
		var login_id = $("#login_id").val();
		var login_pw = $("#login_pw").val();
		if(login_id.length == 0){
			alert('아이디를 입력해주세요.');
			return false;
		}
		if(login_pw.length == 0){
			alert('비밀번호를 입력해주세요.');
			return false;
		}
		$.ajax({
			method : "POST",
			url : "login",
			data : {
				"custid" : login_id,
				"password" : login_pw
			},
			success : function(resp){
				if (resp == 'success') {
					alert('로그인되었습니다');
				} else {
					alert('아이디 및 비밀번호를 다시 입력해주세요');
					return false;
				}
			}			
		});
		
	});*/
	


	var owl = $('.owl-carousel');
	owl.owlCarousel({
		items : 3,
		loop : true,
		nav : true,
		margin : 10,
		responsive : {
			0 : {
				items : 1
			},
			1200 : {
				items : 3
			}
		},
		center : true,
		slideSpeed : 500,
		paginationSpeed : 800,
		singleItem : true,
		autoplay : true,
		autoplayTimeout : 1000,
		autoplayHoverPause : true
	});

	/*
	 * $(".e_img2").hover(function(){ $.backstretch([
	 * "http://dl.dropbox.com/u/515046/www/outside.jpg" ,
	 * "http://dl.dropbox.com/u/515046/www/garfield-interior.jpg" ,
	 * "http://dl.dropbox.com/u/515046/www/cheers.jpg" ], {duration: 1000, fade:
	 * 200}); });
	 */

	function idCheck(){
		var id = $("#joinid").val();
		if (id.length == 0) {
			alert('아이디를 입력해주세요');
			return false;
		}
		$.ajax({
			method : "POST",
			url : "checkid",
			data : {
				"custid" : id
			},
			success : function(resp) {
				alert("success");
				if (resp == "exist") {
					$("#checkid_result").html(id + "는 이미 등록된 아이디입니다.");
					checkStatus = 'no';
				} else {
					$("#checkid_result").html(id + "는 사용할 수 있습니다.");
					checkStatus = 'yes';
				}
			},
			error : function(jqXHR, request, error) {
				alert("에러");
				return false;
			}
		});
	}
	
	function insert_customer(){
		var id = $("#joinid").val();
		var pw1 = $("#joinpw1").val();
		var pw2 = $("#joinpw2").val();
		var email = $("#joinemail").val();
		var phone = $("#joinphone").val();
		if (id.length == 0) {
			alert('아이디를 입력해주세요');
			return false;
		}
		if (pw1.length == 0) {
			alert('비밀번호를 입력해주세요.');
			return false;
		}
		if (pw2.length == 0) {
			alert('비밀번호를 재입력해주세요.');
			return false;
		}
		if (pw1 != pw2) {
			alert('비밀번호를 다시 확인해주세요.');
			return false;
		}
		if (email.length == 0) {
			alert('이메일을 입력해주세요.');
			return false;
		}
		if (phone.length == 0) {
			alert('휴대폰 번호를 입력해주세요.');
			return false;
		}		
		if(checkStatus == "no"){
			alert('아이디 중복 확인을 해주세요.');
			return false;
		}

		$.ajax({
			method : "post",
			url : "join",
			data : {
				"custid" : id,
				"password" : pw1,
				"email" : email,
				"phone" : phone
			},
			success : function(resp) { // 결과창이 안뜸, 저장은 됨;
				$("#JoinModal").modal("hide");
				$("#Joinfinish").modal("show");
			},
			error : function(jqXHR) {
				alert(jqXHR.status);
				alert(jqXHR.statusText);
				alert(jqXHR.responseText);
				alert(jqXHR.readyState);
				return false;				
			}
		});
	}
	
});


function loginCheck(){
	var id = document.getElementById("login_id");
	var pw = document.getElementById("login_pw");
	if(id.value.length == 0){
		alert('아이디를 입력해주세요.');
		return false;
	}
	if(pw.value.length == 0){
		alert('비밀번호를 입력해주세요.');
		return false;
	}
	
	var form = document.getElementById("sendlogin");
	var custid = document.getElementById("custid");
	var password = document.getElementById("password");
	
	custid.value = id.value;
	password.value = pw.value;
	form.submit();
}


function senddate() {
	var form = document.getElementById("join")
	alert(form);
	var custid = document.getElementById("joinid");
	var password = document.getElementById("joinpw1");
	var email = document.getElementById("joinemail");
	var phone = document.getElementById("joinphone");
	form.action = "join";
	form.method = "post";
	form.submit();
}
