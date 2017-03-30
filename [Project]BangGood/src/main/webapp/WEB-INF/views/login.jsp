<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- login Model --> 
<div class="modal fade" role="login" id="loginModal">
	<div class=" modal-dialog g-pt-130">
		<div class="modal-body row space-xlg-hor equal-height-columns">

			<div class="form-block reg-block col-md-12 col-sm-8" style="height: 262px; background-color:#fff">
				<div class="form-block-header g-mb-20 g-mt-20">
					<h1 class="margin-bottom-10 text-center">  로그인
					<button type="button" class="close" data-dismiss="modal" style="font-size: 40px;">×</button>
					</h1>
				</div>

			<form action="login" method ="post" id = "sendlogin">
				<input type ="hidden" name = "custid" id ="custid">
				<input type ="hidden" name = "password" id ="password">
			</form>
				<div class="input-group margin-bottom-20">
					<span class="input-group-addon rounded-left"><i class="fa fa-user color-yellow"></i></span>
					<input type="text" name ="custid" id = "login_id" class="form-control rounded-right" placeholder="아이디를 입력해 주세요.">
				</div>

				<div class="input-group margin-bottom-20">
					<span class="input-group-addon rounded-left"><i class="fa fa-lock color-yellow"></i></span>
					<input type="password" name = "password" id = "login_pw" class="form-control rounded-right" placeholder="비밀번호를 입력해 주세요.">
				</div>

				<div class="row margin-bottom-30">
					<div class="col-md-12">
						<button onclick = "return loginCheck()" data-dismiss="modal" id="login_ok" class="btn-u btn-block rounded" style="background-color:#F7B70B">
							로그인
						</button>
						<button data-dismiss="modal" class="btn-u btn-block rounded" style="background-color:white; color:#333">
							메인으로돌아가기
						</button>
					</div>
				</div>
			
			
			</div>
		</div>
	</div>
</div>
<!-- end login Model --> 