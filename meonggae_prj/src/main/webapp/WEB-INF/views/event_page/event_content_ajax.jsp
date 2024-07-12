<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(function() {
	$('input[name="event-type"]').click(function(e) {
		var eventType = $(this).val();
		$.ajax({
			url: 'event_handler.do',
			type: 'GET',
			data: {
				'event-type': eventType
			},
			 dataType: 'html',
			success: function(data) {
				$('.article').html(data);
			},
			error: function(xhr, status, error) {
				console.error('AJAX 요청 실패: ', status, error);
			}//error
		});//ajax
	});//click
	
	$("#btnSearch").click(function(){
		chkNull();
	});//click
		
	$("#btnAllSearch").click(function(){
		location.href="${pageContext.request.contextPath}/event_page/event_main.do?currentPage=1";
	});//click
		
	$("#keyword").keydown(function( evt ){
		if(evt.which == 13){
			chkNull();
		}//end if
	});//keydown
});//ready

function chkNull(){
	if($("#keyword").val().trim() != ""){
		var field = $("#field").val();
		var keyword = $("#keyword").val();
		var currentPage = $("#currentPage").val();
		var eventType = $("#eventType").val();
		if(currentPage == "" || currentPage == 0){
		 currentPage = 1;
		}
		location.href="${pageContext.request.contextPath}/event_page/event_main.do?currentPage="+currentPage+"&event-type="+eventType+"&field="+field+"&keyword="+keyword;
		
		
	}//end if
}//chkNull

</script>
