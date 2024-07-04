<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="Insert info here"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("UTF-8");%>
<%/*
작성자: 김동섭
작성일: 2024-06-01
*/%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://211.63.89.136${pageContext.request.contextPath}/mgr_common/images/favicon.png"/>
<!--bootstrap 시작-->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script> -->
<!--bootstrap 끝-->

<!-- dashlite 시작-->
<link rel="stylesheet" href="http://211.63.89.136${pageContext.request.contextPath}/mgr_common/assets/css/dashlite.css?ver=3.2.3">
<link id="skin-default" rel="stylesheet" href="http://211.63.89.136${pageContext.request.contextPath}/mgr_common/assets/css/theme.css?ver=3.2.3">
<!--dashlite 시작-->

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->


<style type="text/css">
	
	
	
</style>

<script type="text/javascript">

	$(function() {

	}); // $(document).ready(function() { })

</script>
<!-- <script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script> -->
<!-- <script type="text/javascript" async="" src="https://www.googletagmanager.com/gtag/js?id=G-D1QW99F3EN&amp;l=dataLayer&amp;cx=c"></script> -->
<!-- <script async="" src="https://www.googletagmanager.com/gtag/js?id=UA-91615293-4"></script> -->
<script>
	window.dataLayer = window.dataLayer || [];function gtag() {dataLayer.push(arguments);}gtag('js', new Date());gtag('config', 'UA-91615293-4');
</script>
</head>
<body>

<div style="width:600px; height:300px; padding-top:20px; padding-left:30px;">
	<div class="form-group">
	  <label class="form-label">Select2 Default</label>
	  <div class="form-control-wrap">
	    <select class="form-select js-select2">
	    	<option value="name">이름</option>
	    	<option value="id">아이디</option>
	    	<option value="nick">닉네임</option>
	    	<option value="dname">부서명</option>
	    </select>
	    <input type="text" class="form-control" id="default-01" placeholder="검색 키워드를 입력해주세요">
	  </div>
	  <div class="form-control-wrap">
	  </div>
	</div>
</div>

<div>


<div class="form-control-wrap">
  <div class="input-group">
    <div class="input-group-prepend">
   	    <select class="form-select js-select2">
	    	<option value="name">이름</option>
	    	<option value="id">아이디</option>
	    	<option value="nick">닉네임</option>
	    	<option value="dname">부서명</option>
	    </select>
    </div>
    <input type="text" class="form-control" aria-label="Text input with dropdown button">
  </div>
</div>



</div>


<div class="col-sm-6">
  <div class="form-group">
    <label class="form-label">Select2 Default</label>
    <div class="form-control-wrap">
      <select class="form-select js-select2 select2-hidden-accessible" data-select2-id="3" tabindex="-1" aria-hidden="true">
        <option value="default_option" data-select2-id="5">Default Option</option>
        <option value="option_select_name" data-select2-id="27">Option select name</option>
        <option value="option_select_name" data-select2-id="28">Option select name</option>
      </select>
    </div>
  </div>
</div>

<div style="padding-top:20px;"></div>

<div class="form-group">
  <label class="form-label">Datepicker Range</label>
  <div class="form-control-wrap">
    <div class="input-daterange date-picker-range input-group">
      <input type="text" class="form-control" />
      <div class="input-group-addon">TO</div>
      <input type="text" class="form-control" />
    </div>
  </div>
</div>

<div class="col-md-6 col-xxl-3">
  <div class="card card-bordered h-100">
    <div class="card-inner">
      <div class="card-title-group">
        <div class="card-title card-title-sm">
          <h6 class="title">Traffic Channel</h6>
        </div>
        <div class="card-tools">
          <div class="drodown">
            <a href="#" class="dropdown-toggle dropdown-indicator btn btn-sm btn-outline-light btn-white" data-bs-toggle="dropdown">30 Days</a>
            <div class="dropdown-menu dropdown-menu-end dropdown-menu-xs">
              <ul class="link-list-opt no-bdr">
                <li>
                  <a href="#">
                    <span>7 Days</span>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <span>15 Days</span>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <span>30 Days</span>
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="traffic-channel">
        <div class="traffic-channel-doughnut-ck">
          <canvas class="analytics-doughnut" id="TrafficChannelDoughnutData" style="display: block; box-sizing: border-box; height: 160px; width: 436px;" width="872" height="320"></canvas>
        </div>
        <div class="traffic-channel-group g-2">
          <div class="traffic-channel-data">
            <div class="title">
              <span class="dot dot-lg sq" data-bg="#9cabff" style="background: rgb(156, 171, 255);"></span>
              <span>Organic Search</span>
            </div>
            <div class="amount">4,305 <small>58.63%</small>
            </div>
          </div>
          <div class="traffic-channel-data">
            <div class="title">
              <span class="dot dot-lg sq" data-bg="#b8acff" style="background: rgb(184, 172, 255);"></span>
              <span>Social Media</span>
            </div>
            <div class="amount">859 <small>23.94%</small>
            </div>
          </div>
          <div class="traffic-channel-data">
            <div class="title">
              <span class="dot dot-lg sq" data-bg="#ffa9ce" style="background: rgb(255, 169, 206);"></span>
              <span>Referrals</span>
            </div>
            <div class="amount">482 <small>12.94%</small>
            </div>
          </div>
          <div class="traffic-channel-data">
            <div class="title">
              <span class="dot dot-lg sq" data-bg="#f9db7b" style="background: rgb(249, 219, 123);"></span>
              <span>Others</span>
            </div>
            <div class="amount">138 <small>4.49%</small>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="http://211.63.89.136${pageContext.request.contextPath}/mgr_common/assets/js/bundle.js?ver=3.2.3"></script>
<script src="http://211.63.89.136${pageContext.request.contextPath}/mgr_common/assets/js/scripts.js?ver=3.2.3"></script>
<!-- <script src="http://211.63.89.136${pageContext.request.contextPath}/mgr_common/assets/js/demo-settings.js?ver=3.2.3"></script> -->
<script src="http://211.63.89.136${pageContext.request.contextPath}/mgr_common/assets/js/charts/gd-analytics.js?ver=3.2.3"></script>
<script src="http://211.63.89.136${pageContext.request.contextPath}/mgr_common/assets/js/libs/jqvmap.js?ver=3.2.3"></script>
<div class="ui-timepicker-container ui-timepicker-hidden ui-helper-hidden" style="display: none;"><div class="ui-timepicker ui-widget ui-widget-content ui-menu ui-corner-all"><ul class="ui-timepicker-viewport"></ul></div></div>
</body>
</html>