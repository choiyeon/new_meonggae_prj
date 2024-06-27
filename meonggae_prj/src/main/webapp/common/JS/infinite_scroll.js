$(function() {
	const listEnd = document.querySelector("#listEnd");
	const options = {
		root: null,//뷰포트를 기준으로 타겟의 가시성 검사
		rootMargin: "0px, 0px, 0px, 0px",//확장&축소 
		threshold: 0,//타겟의 가시성 0%일 때 옵저버 실행
	};
});//ready