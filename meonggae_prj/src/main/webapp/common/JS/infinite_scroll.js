$(function() {
	// Intersection Observer 옵션 설정
    const options = {
        root: null,
        rootMargin: "-100px 0px 0px 0px",
        threshold: 0
    };

    const observerIntersection = (callback) => {
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if(entry.isIntersecting) {
                    callback();
                }
            });
        }, options);

        return observer;
    }

    let page = 1;
    let size = 10;
    const itemContainer = $('.single-products');

    const callNextPage = () => {
        console.log("페이지: " + page);
        addList();
    };

    const observer = observerIntersection(callNextPage);

    function addList() {
        console.log("추가 리스트 불러오기");
        $.ajax({
            url: 'infiniteScroll.do',
            data: { page: page, size: size },
            method: 'GET',
            dataType: 'json',
            success: function(result) {
                console.log("성공: " + result);
                if(result.length === 0 || result == '') {
                    $("#listEnd").hide();
                    console.log("리스트 없음");
                } else {
                    $.each(result, function(index, pd) {
                        var newItem = `
                            <div class="single-product prevent-overflow">
                                <div class="product-block">
                                    <a href="main_page/products_detail.do?goodsNum=${pd.goodsNum}">
                                        <img src="http://localhost/meonggae_prj/products-img/${pd.imgName}" alt="" class="thumbnail">
                                        <div class="product-description">
                                            <p class="title">${pd.goodsName}</p>
                                            <div style="overflow: hidden;">
                                                <p class="price" style="float: left;">${pd.priceFm}원</p>
                                                <p class="location" style="float: left;"><i class="fa fa-map-marker" aria-hidden="true"></i>${pd.locationStr}</p>
                                                <p class="time-ago" style="float: right;">${pd.timeAgo}</p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>`;
                        
                        itemContainer.append(newItem);
                    });

                    $("#listEnd").remove();
                    var newItem2 = `<div id="listEnd"></div>`;
                    itemContainer.append(newItem2);
                    page++;

                    // Re-observe the new #listEnd
                    observer.observe(document.querySelector("#listEnd"));
                }
            },
            error: function(xhr) {
                console.log('추가 리스트 불러오기 실패', xhr.status);
            }
        });
    }

    observer.observe(document.querySelector("#listEnd"));
});
