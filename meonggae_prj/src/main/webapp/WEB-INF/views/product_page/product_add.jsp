<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멍게장터</title>
<link rel="icon" href="../common/tamcatIcon.ico" />

<!-- jQuery CDN -->
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
    integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
    crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
    integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
    crossorigin="anonymous"></script>
<!-- Google Font -->
<link
    href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700|Raleway:400,300,500,700,600'
    rel='stylesheet' type='text/css'>

<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css"
    type="text/css">
<!-- Theme Stylesheet -->
<!-- <script src="../common/JS/script.js"></script> -->
<jsp:include page="../main_page/script.jsp" />
<script src="../common/JS/product_add.js"></script>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
    
});

$(function () {
    $('.tabnav a').click(function(e) {
        e.preventDefault();
        var tabId = $(this).attr('href');
        if (tabId === '#tab01') {
            url = '${pageContext.request.contextPath}/product_page/tab01.do';
        } else {
            url = '${pageContext.request.contextPath}/product_page/tab02.do';
        }
        console.log(url);
        loadTabContent(tabId, url);
    });

    // 초기 로드 시 첫 번째 탭 내용 로드
    loadTabContent('#tab01', '${pageContext.request.contextPath}/product_page/tab01.do');
});

function previewImage(event) {
    const reader = new FileReader();
    reader.onload = function() {
        const output = document.getElementById('image-preview');
        output.src = reader.result;
    }
    reader.readAsDataURL(event.target.files[0]);
    alert(reader.readAsDataURL(event.target.files[0]));
}

function loadTabContent(tabId, url) {
    $.ajax({
        url: url,
        success: function(data) {
            $('.tabcontent').html(data).show();
        },
        error: function() {
            alert('탭 내용을 불러오는 데 실패했습니다.');
        }
    });
}

$(document).on('click', '#add', function() {
    var ext = $("#img").val();

    if (ext == ""){
        alert("파일을 선택해주세요.")
        return;
    }

    if (ext.substring(ext.lastIndexOf(".")+1).toUpperCase() == "JSP"){
        alert("업로드 불가능한 파일입니다.");
        return;
    }
//     NAME, DETAIL, PRICE, TRADE_METHOD_CODE, QUALITY_CODE
    var name = $("#name").val();
    var categoryNum = $("#category_num").val();
    var price = $("#price").val();
    var qualityCode = $("input[name='quality_code']:checked").val();
    var detail = $("#detail").val();
    var tradeMethodCode = $("input[name='trade_method_code']:checked").val();
	if(name == ""){
		alert("상품명은 필수 입력입니다.");
	}else if(categoryNum == 0){
		alert("상품 카테고리를 선택해주세요");
	}else if(price == ""){
		alert("가격은 필수 입력입니다.");
	}else if (isNaN(price) || parseFloat(price) <= 0) {
        alert("가격은 0보다 큰 숫자여야 합니다.");
        $("#price").val('');
    }else if(qualityCode == null){
		alert("물품 상태를 선택해주세요.");
	}else if(detail == ""){
		alert("상품설명은 필수 입력입니다.");
	}else if(tradeMethodCode == null){
		alert("거래방식을 선택해주세요.");
	}else{
    	$("#newProduct").submit();
	}
});
</script>
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/common/CSS/style.css">
<!-- <link rel="stylesheet" -->
<!--     href="${pageContext.request.contextPath}/common/CSS/style.css?v=1.0"> -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/common/CSS/responsive.css">
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/common/CSS/tab.css?v=1.0">
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/common/CSS/product_add.css?v=1.0">
</head>
<c:choose>
	<c:when test="${ not empty uploadFlag && uploadFlag == true }">
		<script>
			alert("상품이 등록되었습니다.");
		</script>
	</c:when>
	<c:when test="${ not empty uploadFlag && uploadFlag == false }">
		<script>
			alert("상품 등록에 실패했습니다. 잠시후 다시 시도해주세요.");
			location.href="${pageContext.request.contextPath}/index.do";
		</script>
	</c:when>
</c:choose>
<body>
    <!-- header 시작 -->
    <jsp:include page="../header/header.jsp" />
    <!-- header 끝 -->
    <div class="container" style="height: 100%">
        <div class="tab">
            <ul class="tabnav">
                <li><a href="#tab01">상품등록</a></li>
                <li><a href="#tab02">판매상태</a></li>
            </ul>
            <div class="tabcontent">
               <!--  <div id="tab01"></div>
                <div id="tab02"></div> -->
            </div>
        </div>
        <!--tab-->
    </div>
    <!-- footer 시작 -->
    <jsp:include page="../footer/footer.jsp" />
    <!-- footer 끝 -->
</body>
</html>