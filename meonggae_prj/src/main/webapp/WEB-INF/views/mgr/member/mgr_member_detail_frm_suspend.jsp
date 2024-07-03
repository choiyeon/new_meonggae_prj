<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="관리자 - 회원 관리 - 회원 상세 조회"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
/*
작성자: 김동섭
작성일: 2024-06-02
*/
%>

<%@ include file="mgr_member_detail_frm_upper.jsp"%>
<!-- 탭8. 회원 정지 시작 -->
<div class="tab-pane active show" id="tabItem8" role="tabpanel">
	<div class="col-xxl-6">
		<div class="card">
			<div class="card-inner">
				<div class="row gy-4">
					<c:choose>
					<c:when test="${requestScope.memberPersonalDomain.memStatus eq 'N'}">
					<form id="frm" name="frm" method="post" action="${pageContext.request.contextPath}/mgr/member/mgr_member_suspend_process.do">
					</c:when>
					<c:when test="${requestScope.memberPersonalDomain.memStatus eq 'S'}">
					<form id="frm" name="frm" method="post" action="${pageContext.request.contextPath}/mgr/member/mgr_member_un_suspend_process.do">
					</c:when>
					</c:choose>
						<input type="hidden" id="t" name="t" value="7"/>
						<input type="hidden" id="memNum" name="memNum" value="${param.memNum}"/>
						<div class="col-12">
							<div class="g-4 align-center flex-wrap">
								<div class="g" style="min-width: 200px;">
									<div class="custom-control custom-radio checked">
										<input type="radio" class="custom-control-input"
											name="radioSuspendPeriod" id="suspendPeriodDefault"
											checked='checked' value="1" disabled="disabled"> <label
											class="custom-control-label" for="suspendPeriodDefault">정지일
											선택</label>
									</div>
								</div>
								<div class="g">
									<div class="form-group">
										<div class="form-control-wrap">
											<div class="input-group">
												<div class="input-group-prepend" style="width: 200px;">
													<select class="form-select" id="suspendPeriod"
														name="suspendPeriod" disabled="disabled">
														<option value="1">1일</option>
														<option value="3">3일</option>
														<option value="7">7일</option>
														<option value="15">15일</option>
														<option value="30">30일</option>
														<option value="60">60일</option>
														<option value="90">90일</option>
													</select>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-12">
							<div class="g-4 align-center flex-wrap">
								<div class="g" style="min-width: 200px;">
									<div class="custom-control custom-radio">
										<input type="radio" class="custom-control-input"
											name="radioSuspendPeriod" id="suspendPeriodDetail" value="2" disabled="disabled">
										<label class="custom-control-label" for="suspendPeriodDetail">정지
											기간 상세 설정</label>
									</div>
								</div>
								<div class="g">
									<label class="form-label" for="fv-full-name">정지 시작일</label>
									<div class="form-control-wrap">
										<c:set var="now" value="<%=new java.util.Date()%>" />
										<input type="text" class="form-control invalid"
											value="<fmt:formatDate value='${now }' pattern='yyyy-MM-dd'/>"
											disabled="disabled" style="height: 36px;">
									</div>
								</div>
								<div class="g">
									<label class="form-label" for="fv-full-name">정지 마지막일</label>
									<div class="form-control-wrap">
										<div class="form-icon form-icon-left">
											<em class="icon ni ni-calendar"></em>
										</div>
										<input type="text" class="form-control datepickerOver invalid"
											id="unsuspendDate" name="unsuspendDate" readonly="readonly"
											data-date-format="yyyy-mm-dd" maxlength="10" disabled="disabled">
									</div>
								</div>
							</div>
						</div>
						<div class="col-12">
							<div class="col-1" style="margin: 0px auto; margin-top:20px;">
								<c:choose>
									<c:when test="${requestScope.memberPersonalDomain.memStatus eq 'N'}">
										<input type="button" class="btn btn-danger" value="회원 정지" id="btnSuspend"/>
									</c:when>
									<c:when test="${requestScope.memberPersonalDomain.memStatus eq 'S'}">
										<input type="button" class="btn btn-primary" value="정지 해제" id="btnUnSuspend"/>
									</c:when>
								</c:choose>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 탭8. 회원 정지 끝 -->
<%@ include file="mgr_member_detail_frm_lower.jsp"%>
<c:if test="${requestScope.flagSuspend ne null}">
	<script type="text/javascript">
		$(function() {
			if(${requestScope.flagSuspend }) {
				alert('회원 정지에 성공하였습니다');
			} else {
				alert('회원 정지에 실패하였습니다');
			} // else
		}); // $(document).ready(function() { })
	</script>
</c:if>
<c:if test="${requestScope.flagUnSuspend ne null}">
	<script type="text/javascript">
		$(function() {
			if(${requestScope.flagUnSuspend }) {
				alert('회원 정지 해제에 성공하였습니다');
			} else {
				alert('회원 정지 해제에 실패하였습니다');
			} // else
		}); // $(document).ready(function() { })
	</script>
</c:if>
		
<script type="text/javascript">
	$(function() {
		
		// 라디오 버튼에 따라 select, input 활/비활성화
		$("#suspendPeriodDefault").click(function() {
			$("#suspendPeriod").removeAttr("disabled");
			$("#unsuspendDate").prop("disabled", "disabled");
		}); // click
		$("#suspendPeriodDetail").click(function() {
			$("#suspendPeriod").prop("disabled", "disabled");
			$("#unsuspendDate").removeAttr("disabled");
		}); // click
		
		// 회원 정지 버튼
		$("#btnSuspend").click(function() {
			chkNull();
		}); // click
		
		// 회원 정지 해제 버튼
		$("#btnUnSuspend").click(function() {
			if(confirm('회원의 정지를 해제하시겠습니까?')) {
				$("#frm").submit();
			} // end if
		}); // click
		
		<c:if test="${requestScope.memberPersonalDomain.memStatus eq 'N'}">
			$("#suspendPeriod").removeAttr("disabled");
// 			$("#unsuspendDate").removeAttr("disabled");
			$("#suspendPeriodDetail").removeAttr("disabled");
			$("#suspendPeriodDefault").removeAttr("disabled");
		</c:if>
	}); // $(document).ready(function() { })

	function chkNull() {
		let chkArr = $("[name='radioSuspendPeriod']:checked");

		if ($(chkArr[0]).val() == 2 && ($("#unsuspendDate").val() == null
				|| $("#unsuspendDate").val().trim() == '')) {
			alert('정지 기간을 설정해주시기 바랍니다');
			return;
		} // end if

		if (!confirm('회원을 정지하시겠습니까?')) {
			return;
		} // end if

		if ($(chkArr[0]).val() == 1) {
			$("#unsuspendDate").prop("disabled", "disabled");
		} else {
			$("#suspendPeriod").prop("disabled", "disabled");
		} // end else
		$("#frm").submit();
	}; // chkNull
</script>