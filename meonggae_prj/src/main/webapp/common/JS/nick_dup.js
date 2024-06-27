// var reg = /^[A-z0-9]{5,12}$/; //nick : 5~12자 이내의 영대소문/숫자
// var ko_reg = /^[ㄱ-ㅎ가-힣a-zA-Z0-9]{5,12}$/; //nick: 한글가능할 때

//추가로 검색할 경우
function nickChk() { 
	var obj = document.board;
	var nick= obj.nick.value;
	var ko_reg = /^[ㄱ-ㅎ가-힣a-zA-Z0-9]{1,12}$/; //nick: 한글가능할 때
	if( nick == "" ){
		alert("닉네임을 한글, 영문, 숫자를 사용하여 1~12자 이내로 입력해주세요.");
		obj.nick.value="";
		obj.nick.focus();
		return;
	} else if( !ko_reg.test(nick) ){
		alert("닉네임을 한글, 영문, 숫자를 사용하여 1~12자 이내로 입력해주세요.");
		obj.nick.value="";
		obj.nick.focus();
		return;
	} else{
		obj.submit();
	}
};

function goSave() {
	$(opener.document).find("#nick").val($("#nick").val());
	$(opener.document).find("#nick").attr("readonly","readonly");

	$(opener.document).find("#loginChecked").val( $('#loginChecked').val() );
	window.close();
};