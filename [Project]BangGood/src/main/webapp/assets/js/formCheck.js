//insert_property1 formcheck
function insert_property1_check(){
	var address = document.getElementById('sample5_jibunAddress');
	var property_type = document.getElementsByName('property_type');
	var rent_type = document.getElementsByName('rent_type');
	var deposit = document.getElementById('deposit');
	var month_fee = document.getElementById('month_fee');
	var roomsize = document.getElementById('roomsize');
	var built_year = document.getElementById('built_year');
	var maintence_fee = document.getElementById('maintence_fee');
	var car = document.getElementsByName('car');
	var elevator = document.getElementsByName('elevator');
	var pet = document.getElementsByName('pet');
	var property_title = document.getElementById('property_title');
	var property_text = document.getElementById('property_text');
	
	if(address.value.length == 0){
		alert('등록하실 매물의 주소를 검색해주세요.');
		return false;
	}	
	if(property_type[0].checked == false && property_type[1].checked == false){
		alert('원룸, 투룸 중 선택해주세요.')
		return false;
	}	
	if(rent_type[0].checked == false && rent_type[1].checked == false){
		alert('전세, 월세 중 선택해주세요.')
		return false;
	}
	if(deposit.value.length == 0){
		alert('등록하실 매물의 보증금를 검색해주세요.');
		return false;
	}
	if(month_fee.value.length == 0){
		alert('등록하실 매물의 월세를 검색해주세요.전세일 경우 0으로 입력해주세요.');
		return false;
	}
	if(roomsize.value.length == 0){
		alert('등록하실 매물의 방면적을 검색해주세요.');
		return false;
	}
	if(built_year.value.length == 0){
		alert('등록하실 매물의 중축연도를 검색해주세요.');
		return false;
	}
	if(maintence_fee.value.length == 0){
		alert('등록하실 매물의 관리비를 검색해주세요.');
		return false;
	}
	if(car[0].checked == false && car[1].checked == false){
		alert('주차 가능여부를 선택해주세요.')
		return false;
	}
	if(elevator[0].checked == false && elevator[1].checked == false){
		alert('승강기 유무를 선택해주세요.')
		return false;
	}
	if(pet[0].checked == false && pet[1].checked == false){
		alert('반려동물 허가여부를 선택해주세요.')
		return false;
	}
	if(property_title.value.length == 0){
		alert('게시글의 제목을 입력해주세요.');
		return false;
	}
	if(property_title.value.length == 0){
		alert('매물에 대한 상세내용을 입력해주세요.');
		return false;
	}
	return true;	
}

//update_property1 formcheck
function update_property1_check(){

	var deposit = document.getElementById('deposit');
	var month_fee = document.getElementById('month_fee');
	var roomsize = document.getElementById('roomsize');
	var built_year = document.getElementById('built_year');
	var maintence_fee = document.getElementById('maintence_fee');
	var property_title = document.getElementById('property_title');
	var property_text = document.getElementById('property_text');

	if(deposit.value.length == 0){
		alert('등록하실 매물의 보증금를 검색해주세요.');
		return false;
	}
	if(month_fee.value.length == 0){
		alert('등록하실 매물의 월세를 검색해주세요.전세일 경우 0으로 입력해주세요.');
		return false;
	}
	if(roomsize.value.length == 0){
		alert('등록하실 매물의 방면적을 검색해주세요.');
		return false;
	}
	if(built_year.value.length == 0){
		alert('등록하실 매물의 중축연도를 검색해주세요.');
		return false;
	}
	if(maintence_fee.value.length == 0){
		alert('등록하실 매물의 관리비를 검색해주세요.');
		return false;
	}
	if(property_title.value.length == 0){
		alert('게시글의 제목을 입력해주세요.');
		return false;
	}
	if(property_title.value.length == 0){
		alert('매물에 대한 상세내용을 입력해주세요.');
		return false;
	}
	return true;	
}

//insert_property3_formcheck()
function insert_property3_check(){
	var uploadFile1 = document.getElementById('uploadFile1');
	var uploadFile2 = document.getElementById('uploadFile2');
	var uploadFile3 = document.getElementById('uploadFile3');
	var uploadFile4 = document.getElementById('uploadFile4');
	var uploadFile5 = document.getElementById('uploadFile5');
	var uploadFile6 = document.getElementById('uploadFile6');
	
	
	if(uploadFile1.value == ''){
		alert('메인으로 올릴 사진을 업로드해주세요.')
		return false;
	}
	if(uploadFile2.value == ''){
		alert('평면도 사진을 업로드해주세요.')
		return false;
	}
	if(uploadFile3.value == ''){
		alert('현관 사진을 업로드해주세요.')
		return false;
	}
	if(uploadFile4.value == ''){
		alert('방 사진을 업로드해주세요.')
		return false;
	}
	if(uploadFile5.value == ''){
		alert('부엌 사진을 업로드해주세요.')
		return false;
	}
	if(uploadFile6.value == ''){
		alert('화장실 사진을 업로드해주세요.')
		return false;
	}
	return ture;	
}