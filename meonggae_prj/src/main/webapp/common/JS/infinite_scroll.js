$(function() {
	const listEnd = document.querySelector("#listEnd");
	const options = {
		root: null,//뷰포트를 기준으로 타겟의 가시성 검사
		rootMargin: "0px, 0px, 0px, 0px",//확장&축소 
		threshold: 0,//타겟의 가시성 0%일 때 옵저버 실행
	};
	
	const io = new IntersectionObserver((entries, observer) => {
		entries.forEach(entry => {
			if(!entry.isIntersecting) return;
			//entry가 intersecting 중이 아니라면 함수를 실행하지 않는다.
			if(page._scrollchk) return;
			//현재 page가 불러오는 중임을 나타내는 flag를 통해 불러오는 중이면 
		});
	});
});//ready