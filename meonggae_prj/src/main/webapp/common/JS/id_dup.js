// var reg = /^[A-z0-9]{5,12}$/; //id : 5~12자 이내의 영대소문/숫자
// var ko_reg = /^[ㄱ-ㅎ가-힣a-zA-Z0-9]{5,12}$/; //id: 한글가능할 때

//추가로 검색할 경우
function idChk() { 
	var obj = document.board;
	var id= obj.id.value;
	var reg = /^[A-z0-9]{5,12}$/;//영문/숫자 5~12자 이내인지 확인
	if( id == "" ){
		alert("아이디를 영문, 숫자를 사용하여 5~12자 이내로 입력해주세요.");
		obj.id.value="";
		obj.id.focus();
		return;
	} else if( !reg.test(id) ){
		alert("아이디를 영문, 숫자를 사용하여 5~12자 이내로 입력해주세요.");
		obj.id.value="";
		obj.id.focus();
		return;
	} else{
		obj.submit();
	}
};

function goSave() {
	$(opener.document).find("#id").val($("#id").val());
	$(opener.document).find("#id").attr("readonly","readonly");

	$(opener.document).find("#loginChecked").val( $('#loginChecked').val() );
	window.close();
};