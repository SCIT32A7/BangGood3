<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--join Block-->
<div class="modal fade" role="dialog" id="JoinModal">
	<div class=" modal-dialog g-pt-80">
		<div class="modal-body row space-xlg-hor equal-height-columns">
			<div class="form-block reg-block col-md-12 col-sm-8 joinbox" style="background-color:#fff">
					
				<div class="form-block-header g-mb-20 g-mt-20">
					<h1 class="margin-bottom-10 text-center">  회원가입
					<button type="button" class="close" data-dismiss="modal" style="font-size: 40px;">×</button>
					</h1>
				</div>

				<div class="input-group margin-bottom-20">
					<span class="input-group-addon rounded-left"><i class="fa fa-user color-yellow"></i></span>
					<input type="text" name = "custid" id = "joinid" class="form-control rounded-right" placeholder="아이디를 입력해 주세요." style="width:270px; margin-right:10px">
					<button id="idCheck"  class="btn-u btn-block rounded" style="width:80px">
							중복확인
					</button>					
				</div>
				<span id = "checkid_result"></span>
				
				
				<div class="input-group margin-bottom-20">
					<span class="input-group-addon rounded-left"><i class="fa fa-user color-yellow"></i></span>
					<input type="text" name = "" id = "" class="form-control rounded-right" placeholder="이름을 입력해주세요.">
				</div>
				
				<div class="input-group margin-bottom-20">
					<span class="input-group-addon rounded-left"><i class="fa fa-lock color-yellow"></i></span>
					<input type="password" name = "password" id = "joinpw1" class="form-control rounded-right" placeholder="비밀번호를 입력해 주세요.">
				</div>

				<div class="input-group margin-bottom-20">
					<span class="input-group-addon rounded-left"><i class="fa fa-lock color-yellow"></i></span>
					<input type="password" id = "joinpw2" class="form-control rounded-right" placeholder="비밀번호를 한 번 더 입력해 주세요.">
				</div>
				
				<div class="input-group margin-bottom-20">
					<span class="input-group-addon rounded-left"><i class="fa fa-envelope-o color-yellow" style="font-size:10px"></i></span>
					<input type="mail" name = "email" id = "joinemail" class="form-control rounded-right" placeholder="이메일 주소를 입력해 주세요." style="width:270px; margin-right:10px">
					<button id="mail_check"  class="btn-u btn-block rounded" style="width:80px">
							메일인증
					</button>
				</div>
				<div class="input-group margin-bottom-20">
					<span class="input-group-addon rounded-left"><i class="fa fa-phone color-yellow"></i></span>
					<input type="text" name = "phone" id = "joinphone" class="form-control rounded-right" placeholder="핸드폰 번호를 입력해 주세요.">
				</div>
				<div class="row margin-bottom-30">
					<div class="col-md-12">
						<button id="joinBtn3" class="btn-u btn-block rounded" style="background-color:#f7be22">
							가입하기
						</button>
						<button data-dismiss="modal" class="btn-u btn-block rounded" style="background-color:#ccc">
							돌아가기
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- join Model -->