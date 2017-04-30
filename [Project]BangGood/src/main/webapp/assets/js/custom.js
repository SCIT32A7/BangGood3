$(function() {
	
	var checkStatus = 'no';
	var checkMail = 'no';
	
	App.init();

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
	$("#mail_check").click(function() {
		
	});
	$("#back_join").click(function(){
		$("#JoinModal").modal("show");
	});
	$("#mailCheck").click(function(){
		
	});
	
	
	var checkAjaxSetTimeout;
	
	$("#mail_check").on("click", function(){
		var email = $("#joinemail").val();
			$.ajax({
				type : "post",
				url : "emailcheck",
				data : {
					user : email
				},
				success : function(data){
					console.log("메일로 인증번호가 전송되었습니다.");					
					$("#JoinModal").modal("hide");
					$("#mail_check_form").modal({backdrop: "static"});
					},						
					error : function(e)	{
						console.log(e);
					}
			})		
	});
	
	$("#checkbutton").on("click", function(){
		var num = $("#checknum").val();				
		$.ajax({
			type : "post",
			url : "checknum",					
			success : function(data){
				if (num == data){
					alert("인증에 성공하였습니다.");
					checkMail = "yes";
					$("#mail_check_form").modal("hide");
					$("#joinemail").attr("readonly","readonly");
					$("#JoinModal").modal();
					//window.opener.Checknumfunction();
					//window.close();
				}else{
					$("#mailcheck_span").html("인증번호가 틀립니다.")
					.css("color","red");
					checknumflag = false;					
					return false;
				}
			},				
			error : function(e){
				console.log(e);
			}
		})
	})
	
	
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
	


	/*var owl = $('.owl-carousel');
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
*/
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
				if (resp == "exist") {
					$("#checkid_result").html("<i style='color:red;margin-right:5px'>"+ id +"</i> 는 이미 등록된 아이디입니다.");
					$(".joinbox").attr("height","434px");
					checkStatus = 'no';
				} else {
					$("#checkid_result").html("<i style='color:red'>"+ id + "</i>는 사용할 수 있습니다.");
					$(".joinbox").attr("height","434px");
					checkStatus = 'yes';
				}
			},
			error : function(jqXHR, request, error) {
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
		if(checkMail == "no"){
			alert('본인인증을 해주세요.');
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
			success : function(resp) {
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

function loginCheck1(){
	var id = $("#login_id").val();
	var pw = $("#login_pw").val();
	if(id.length == 0){
		alert('아이디를 입력해주세요.');
		return false;
	}
	if(pw.length == 0){
		alert('비밀번호를 입력해주세요.');
		return false;
	}
	
	var form = $("#sendlogin").val();
	var custid = $("#custid").val();
	var password =$("#password").val();
	
	custid.val(id);
	password.val(pw);
	form.submit();
}


//promo
$(function() {
	  $(".fullscreen-static-image1").backstretch(["assets/img/room/2.jpg"],
	  {duration: 10000, fade:1500}),
	  $(".fullscreen-static-image2").backstretch(["assets/img/room/1.jpg"],
	  {duration: 10000, fade:1500});
	});


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

//Full Screen
var handleFullscreen = function() {
	var WindowHeight = $(window).height();
	var HeaderHeight = 0;

	if ($(document.body).hasClass('promo-padding-top')) {
		HeaderHeight = $('.header').height();
	} else {
		HeaderHeight = 0;
	}

	$('.fullheight').height(WindowHeight - HeaderHeight);

	$(window).resize(function() {
		var WindowHeight = $(window).height();
		$('.fullheight').height(WindowHeight - HeaderHeight);
	});
}


// Header
function handleHeader() {
	// jQuery to collapse the navbar on scroll
	if ($('.navbar').offset().top > 150) {
		$('.navbar-fixed-top').addClass('top-nav-collapse');
	}
	$(window).scroll(function() {
		if ($('.navbar').offset().top > 150) {
			$('.navbar-fixed-top').addClass('top-nav-collapse');
		} else {
			$('.navbar-fixed-top').removeClass('top-nav-collapse');
		}
	});

	var $offset = 0;
	if ($('.one-page-nav-scrolling').hasClass('one-page-nav__fixed')) {
		$offset = $(".one-page-nav-scrolling").height()+8;
	}
	// jQuery for page scrolling feature - requires jQuery Easing plugin
	$('.page-scroll a.move').bind('click', function(event) {
		var $position = $($(this).attr('href')).offset().top;
		$('html, body').stop().animate({
			scrollTop: $position - $offset
		}, 600);
		event.preventDefault();
	});


	// Collapse Navbar When It's Clickicked
	$(window).scroll(function() {
		$('.navbar-collapse.in').collapse('hide');
	});
}