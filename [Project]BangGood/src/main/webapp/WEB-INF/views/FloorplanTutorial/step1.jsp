<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="modal fade" role="dialog"  id="step1Modal" class="tutorial">
		<div class=" modal-dialog g-pt-10 modal-lg">
			<div class="modal-body row space-xlg-hor equal-height-columns">
				<div style="text-align: center">
					<div class="tutorial col-md-12 col-sm-8" style="height: 600px; background-color: #fff;">
						<br>
						<button type="button" class="close" data-dismiss="modal" style="font-size: 60px;">×</button>
						<img src="assets/img/icons/pencilTab.png" alt="PecilTabImage"/>
						<br>
						<h1>Pecil Tab 입니다.</h1>
						<p>그림을 그리기 위한 펜 기능이 담겨있습니다.</p>
						<br>
						<div style="width:90%;text-align:left; margin:auto">
						<h4><b>선 그리기</b> - 원하는 <span style="color:#d3474c">색상</span>과 <b>굵기</b>를 선택 후 선 그리기 버튼을 눌러주세요.</h4>
						<h4><b>방 그리기</b> - 원하는 내부 색상 선택 후  <i class="fa fa-square"></i>사각형 도형을 그릴 수 있습니다.</h4>
						<h4><b>민감도 조정</b> - 끝선 자동 붙임 기능으로서 <span class="pulse" style="font-weight: bold">민감도</span>를 조정합니다.</h4>
						<h4><b>문·창문 생성</b> - 선을 따라 움직일 수 있는 <img src="assets/img/icons/door.png" width="30" height="20">문과 <i class="fa fa-minus"></i>창문을 생성합니다.<br>
						 크기는 마우스 휠을 이용하여 조절이 가능합니다.</h4>
						 </div>
						<button type="button" class="btn btn-md btn-danger" data-toggle="collapse" data-target="#tip">TIP</button>
						<br><br>
						<div id="tip" class="collapse">
 						 <em style="font-size:15px">** 팁 직선은 Shift키와 함께, 이전 선으로부터 이어 그리기는 Ctrl키와 함께 **</em>
 						 <br>
  						</div>
  						<br>
  						<div class="clearfix"></div>
						<!-- 클릭시 다음 단계 -->
						<a href="#" id="step2Btn" class="tuto_btn tuto_start g-mr-20">다음단계 :) <i class="fa fa-arrow-right"
							style="font-size: 24px"></i></a>
						<!-- 클릭시 이전 단계 -->
						<a href="#" id="step1_backBtn" class="tuto_btn">이전단계:) <i class="fa fa-arrow-left"
							></i></a>

					</div>
				</div>
			</div>
		</div>
	</div>
