<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="사이드바"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("UTF-8");%>
<%/*
작성자: 김동섭
작성일: 2024-05-31
*/%>
<div class="nk-sidebar nk-sidebar-fixed is-dark" data-content="sidebarMenu">
  <div class="nk-sidebar-element nk-sidebar-head">
    <div class="nk-menu-trigger">
      <a href="#" class="nk-nav-toggle nk-quick-nav-icon d-xl-none" data-target="sidebarMenu">
        <em class="icon ni ni-arrow-left"></em>
      </a>
    </div>
    <div class="nk-sidebar-brand" style="text-align:center; margin:0px auto;">
      <a href="#void" class="logo-link nk-sidebar-logo">
        <img class="logo-light logo-img" src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/images/logo3.png" style="border-radius:12%;" srcset="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/images/logo3.png 2x" alt="logo">
        <img class="logo-dark logo-img" src="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/images/logo3.png" style="border-radius:12%;" srcset="http://192.168.10.214${pageContext.request.contextPath}/mgr_common/images/logo3.png 2x" alt="logo-dark">
      </a>
    </div>
  </div>
  <div class="nk-sidebar-element nk-sidebar-body">
    <div class="nk-sidebar-content">
      <div class="nk-sidebar-menu" data-simplebar="init">
        <div class="simplebar-wrapper" style="margin: -16px 0px -40px;">
          <div class="simplebar-height-auto-observer-wrapper">
            <div class="simplebar-height-auto-observer"></div>
          </div>
          <div class="simplebar-mask">
            <div class="simplebar-offset" style="right: 0px; bottom: 0px;">
              <div class="simplebar-content-wrapper" tabindex="0" role="region" aria-label="scrollable content" style="height: 100%; overflow: hidden scroll;">
                <div class="simplebar-content" style="padding: 16px 0px 40px;">
                  <ul class="nk-menu">
                    <li class="nk-menu-heading">
                      <h6 class="overline-title text-primary-alt my-overline-title">대시보드</h6>
                    </li>
                    <li class="nk-menu-item" id="sidebar-dashboard">
                      <a href="${pageContext.request.contextPath}/mgr/dashboard/mgr_dashboard_frm.do" class="nk-menu-link">
                        <span class="nk-menu-icon">
                          <em class="icon ni ni-dashlite"></em>
                        </span>
                        <span class="nk-menu-text my-menu-text">대시보드</span>
                      </a>
                    </li>
                  	<li class="nk-menu-heading">
                      <h6 class="overline-title text-primary-alt my-overline-title">사용자 관리</h6>
                    </li>
                  	<li class="nk-menu-item" id="sidebar-member">
                      <a href="${pageContext.request.contextPath}/mgr/member/mgr_member_list_frm.do" class="nk-menu-link">
                        <span class="nk-menu-icon">
                          <em class="icon ni ni-text-rich"></em>
                        </span>
                        <span class="nk-menu-text my-menu-text">회원 관리</span>
                      </a>
                    </li>
                    <li class="nk-menu-item">
                      <a href="#void" class="nk-menu-link">
                        <span class="nk-menu-icon">
                          <em class="icon ni ni-bitcoin-cash"></em>
                        </span>
                        <span class="nk-menu-text my-menu-text">신고 관리</span>
                      </a>
                    </li>
                    <li class="nk-menu-item">
                      <a href="#void" class="nk-menu-link">
                        <span class="nk-menu-icon">
                          <em class="icon ni ni-growth"></em>
                        </span>
                        <span class="nk-menu-text my-menu-text">문의 관리</span>
                      </a>
                    </li>
                    <li class="nk-menu-item" id="sidebar-review">
                      <a href="${pageContext.request.contextPath}/mgr/review/mgr_review_list_frm.do" class="nk-menu-link">
                        <span class="nk-menu-icon">
                          <em class="icon ni ni-coins"></em>
                        </span>
                        <span class="nk-menu-text my-menu-text">후기 관리</span>
                      </a>
                    </li>
                    <li class="nk-menu-item">
                      <a href="#void" class="nk-menu-link">
                        <span class="nk-menu-icon">
                          <em class="icon ni ni-text-rich"></em>
                        </span>
                        <span class="nk-menu-text my-menu-text">물품 관리</span>
                      </a>
                    </li>
                    <li class="nk-menu-item">
                      <a href="#void" class="nk-menu-link">
                        <span class="nk-menu-icon">
                          <em class="icon ni ni-text-rich"></em>
                        </span>
                        <span class="nk-menu-text my-menu-text">이벤트 관리</span>
                      </a>
                    </li>
                    <li class="nk-menu-heading">
                      <h6 class="overline-title text-primary-alt my-overline-title">관리자 관리</h6>
                    </li>
                    <li class="nk-menu-item" id="sidebar-manager">
                      <a href="${pageContext.request.contextPath}/mgr/manager/mgr_manager_list_frm.do" class="nk-menu-link">
                        <span class="nk-menu-icon">
                          <em class="icon ni ni-text-rich"></em>
                        </span>
                        <span class="nk-menu-text my-menu-text">관리자 관리</span>
                      </a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <div class="simplebar-placeholder" style="width: auto; height: 2386px;"></div>
        </div>
        <div class="simplebar-track simplebar-horizontal" style="visibility: hidden;">
          <div class="simplebar-scrollbar" style="width: 0px; display: none;"></div>
        </div>
        <div class="simplebar-track simplebar-vertical" style="visibility: visible;">
          <div class="simplebar-scrollbar" style="height: 334px; transform: translate3d(0px, 559px, 0px); display: block;"></div>
        </div>
      </div>
    </div>
  </div>
</div>