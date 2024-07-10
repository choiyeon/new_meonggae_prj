<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<a href="${pageContext.request.contextPath}/My/mypage/main/myPageMain_frm.do" id="${ pageName == 'mypage'?'selected':'unSelected' }">마이페이지</a> | 
<a href="${pageContext.request.contextPath}/My/mypage/dibs/dibsGoods_frm.do" id="${ pageName == 'dibsGoods'?'selected':'unSelected' }">찜 목록</a> | 
<a href="${pageContext.request.contextPath}/My/mypage/sales_list/salesDetails_frm.do" id="${ pageName == 'salesDetails'?'selected':'unSelected' }">거래내역</a> | 
<a href="${pageContext.request.contextPath}/My/mypage/personal/passwordChk_frm.do" id="${ pageName == 'personal'?'selected':'unSelected' }">개인정보</a> | 
<a href="${pageContext.request.contextPath}/My/mypage/inquiry/inquiry_frm.do" id="${ pageName == 'inquiry'?'selected':'unSelected' }">1:1문의</a> | 
<a href="${pageContext.request.contextPath}/My/mypage/review/review_frm.do" id="${ pageName == 'review'?'selected':'unSelected' }">나의 후기</a>
