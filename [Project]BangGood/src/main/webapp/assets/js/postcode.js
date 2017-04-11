function sample5_execDaumPostcode() {
	
	var mapCoverImg = document.getElementById('coverimg');//지도표시되기전 img
	 var mapContainer = document.getElementById('map'), // 지도를 표시할 div
mapOption = {
	center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
	level : 7
// 지도의 확대 레벨
};

// 지도를 미리 생성
var map = new daum.maps.Map(mapContainer, mapOption);
// 주소-좌표 변환 객체를 생성
var geocoder = new daum.maps.services.Geocoder();
// 마커를 미리 생성
var marker = new daum.maps.Marker({
	position : new daum.maps.LatLng(37.537187, 127.005476),
	map : map
});



new daum.Postcode({
   oncomplete: function(data) {
       // 각 주소의 노출 규칙에 따라 주소를 조합한다.
       // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
       var fullAddr = data.address; // 최종 주소 변수
       var extraAddr = ''; // 조합형 주소 변수
       var extraRoadAddr = ''; // 도로명 조합형 주소 변수
       var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
       
       //추가
       // 법정동명이 있을 경우 추가한다. (법정리는 제외)
       // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
       if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
           extraRoadAddr += data.bname;
       }
       // 건물명이 있고, 공동주택일 경우 추가한다.
       if(data.buildingName !== '' && data.apartment === 'Y'){
          extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
       }
       // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
       if(extraRoadAddr !== ''){
           extraRoadAddr = ' (' + extraRoadAddr + ')';
       }
       // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
       if(fullRoadAddr !== ''){
           fullRoadAddr += extraRoadAddr;
       }
       //end
       
       // 기본 주소가 도로명 타입일때 조합한다.
       if(data.addressType === 'R'){
           //법정동명이 있을 경우 추가한다.
           if(data.bname !== ''){
               extraAddr += data.bname;
           }
           // 건물명이 있을 경우 추가한다.
           if(data.buildingName !== ''){
               extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
           fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
       }
       // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
       if(fullRoadAddr !== ''){
           fullRoadAddr += extraRoadAddr;
       }
       // 주소 정보를 해당 필드에 넣는다.
       
       document.getElementById('sample5_roadAddress').value = '도로명 : '+fullRoadAddr; //도로명 주소 변수
       document.getElementById('sample5_jibunAddress').value ='지번 : '+ data.jibunAddress; //지번주소
       

       
       // 주소로 좌표를 검색
       geocoder.addr2coord(data.address, function(status, result) {
           // 정상적으로 검색이 완료됐으면
           if (status === daum.maps.services.Status.OK) {
               // 해당 주소에 대한 좌표를 받아서
               var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
               // 지도를 보여준다.
               mapCoverImg.style.display = "none";
               mapContainer.style.display = "block";
               map.relayout();
               // 지도 중심을 변경한다.
               map.setCenter(coords);
               // 마커를 결과값으로 받은 위치로 옮긴다.
               marker.setPosition(coords)
           }
       });
       
   }
}).open();
}