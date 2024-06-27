jQuery(document).ready(function($) {
	
	//회원의 찜 여부에 따른 css변경
	checkMemSteam();
	
	//찜 클릭 버튼
	$("#wishlist-btn").click(function() {
		if(checkLogin()){//로그인여부 확인
			//찜 여부 확인
			var checkMemSteam = $('input[name="checkMemSteam"]').val();
			if(checkMemSteam == 'true'){
				//찜한 회원 -> 찜 삭제
				updateSteamToN();
			
			}else if(checkMemSteam == 'false'){
				//찜 안한 회원 -> 찜 등록
				insertSteam();
			}//end if
		}//end if
	});//click
	
	//신고하기 모달창 보이기
	$(".open-report-modal").click(function(){
		if(checkLogin()){//로그인여부 확인
			$("#reportModal").modal("show");
		}
	});
	//X를 클릭하면 내용 리셋
	$("#reportModal").on('hidden.bs.modal',function(e){
		$(this).find('form')[0].reset();
	});
	//신고등록 전 유효성검사
	$("#btn-report").click(function(){
	var iCategory = $('#report-category').val();
	var iTitle = $('input[name="iTitle"]').val().trim();
	var iContents = $('textarea[name="iContents"]').val().trim();
		if( iCategory != '0' && iTitle != '' && iContents != '' ){
			if(confirm("신고 내용은 멍게장터 이용약관 및 정책에 의해서 처리되며,\n허위신고 시 멍게장터 이용이 제한될 수 있습니다.")){
				$("#reportFrm").submit();
				alert("신고가 정상적으로 접수되었습니다.");
			}//end if
		}else{
			alert("모든 입력사항을 기입해주세요.");
		}//end else
	});
	
	//멍게톡 클릭 버튼
	$("#meonggaeTalk-btn").click(function(){
		if(checkLogin()){//로그인여부 확인
			
		}
	});
	
	//판매자 프로필 클릭
	$(".store-btn").click(function(){
		var sellerNick = $(this).text().trim();
		location.href='http://localhost/meonggae_prj/My/store/store_frm.do?nick='+sellerNick;
	});//store-btn.click
	
	//리뷰작성자 프로필 클릭
	$(".buyer-btn").click(function(){
		var buyerNick = $(this).text().trim();
		location.href='http://localhost/meonggae_prj/My/store/store_frm.do?nick='+buyerNick;
	});//buyer-btn.click
});//ready

//select 카테고리로 검색 - 부모
function selectedParent(){
	//선택된 부모 카테고리 가져오기
	var selParent = $("#proCate-parent").val();
	location.href="http://localhost/meonggae_prj/main_page/search_contents.do?cn="+selParent+"&isP=T"
}//selectedParent

//select 카테고리로 검색 - 자식
function selectedSub(){
	//선택된 자식 카테고리 가져오기
	var selSub = $("#proCate-child").val();
	location.href="http://localhost/meonggae_prj/main_page/search_contents.do?cn="+selSub+"&isP=F"
}//selectedSub

//로그인했는지 확인
function checkLogin(){
	var user_memNum = $('input[name="user_memNum"]').val();
	if ( user_memNum == null || user_memNum == ""){
		alert("로그인이 필요한 서비스입니다.");
		return false; // 로그인하지 않은 경우 false 반환
    }//end if
    return true;// 로그인한 경우 true 반환
}//checkLogin

//회원의 찜 여부에 따른 기본 css 설정
function checkMemSteam(){
	var checkMemSteam = $('input[name="checkMemSteam"]').val();

	//찜했으면 true
	if(checkMemSteam == 'true'){
		$("#wishlist-btn").addClass("wished");
		$("#wishlist-btn").html('<i class="fa fa-heart"></i> 찜 1');
	}else{
		$("#wishlist-btn").removeClass("wished");
		$("#wishlist-btn").html('<i class="fa fa-heart-o"></i> 찜 0');
	}//end else;
}//checkMemSteam

//찜 등록
function insertSteam(){
	var memNum = $('input[name="user_memNum"]').val();
	var goodsNum = $('input[name="goodsNum"]').val();
	$.ajax({
		type:'GET',
		url:'http://localhost/meonggae_prj/insertSteam.do',
		dataType:"text",
		data:{goodsNum:goodsNum, memNum:memNum},
		error: function(xhr){
		 console.log('찜 등록 실패', xhr.status);
		},
		success: function(data){
			if(data == '1'){
				location.reload(true);
			}//end if
		}//success
	});//ajax
}//updateSteamToN

//찜 삭제
function updateSteamToN(){
	var memNum = $('input[name="user_memNum"]').val();
	var goodsNum = $('input[name="goodsNum"]').val();
	$.ajax({
		type:'GET',
		url:'http://localhost/meonggae_prj/updateSteam.do',
		dataType:"text",
		data:{goodsNum:goodsNum, memNum:memNum},
		error: function(xhr){
		 console.log('찜 삭제 실패', xhr.status);
		},
		success: function(data){
			if(data == '1'){
				location.reload(true);
			}//end if
		}//success
	});//ajax
}//updateSteamToN


