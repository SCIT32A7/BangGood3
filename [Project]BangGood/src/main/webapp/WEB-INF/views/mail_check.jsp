<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--join Block-->
<div class="modal fade" id="mail_check_form">
	<div class=" modal-dialog g-pt-100">
		<div class="modal-body row space-xlg-hor equal-height-columns">

			<div class="form-block col-md-12 col-sm-8" style="height: 150px;background-color:#fff ">
				<div class="form-block-header g-mb-20 g-mt-20">
					<h1 class="margin-bottom-10 text-center">  메일인증
					<button type="button" id="back_join" class="close" data-dismiss="modal" style="font-size: 40px;">x</button>
					</h1>
				</div>
				 
				<div class="input-group margin-bottom-5">
					<span class="input-group-addon rounded-left"><i class="fa fa-lock color-yellow"></i></span>
					<input type="text" name = "custid" id = "joinid" class="form-control rounded-right" placeholder="인증번호를 입력해주세요." style="width:270px; margin-right:10px">
					<button id="mailCheck"  class="btn-u btn-block rounded" style="width:80px">
							확인
					</button>					
				</div>
				<span id = "mailcheck_span"></span>
		</div>
	</div>
	</div>
	</div>
<!-- join Model --> 