<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>    
<meta charset="utf-8" />
    <link rel="icon" type="image/png" href="assets/img/favicon.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>22세기 운동혁명</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport'/>
    <meta name="viewport" content="width=device-width" />
    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <!--  Material Dashboard CSS    -->
    <link href="assets/css/material-dashboard.css?v=1.2.0" rel="stylesheet" />
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="grid.css">
	<link href="board/board.css" type="text/css" rel="stylesheet">
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
  <style type="text/css">
  
  </style>
	<script src="assets/js/jquery-3.2.1.min.js" type="text/javascript"></script>
</head>
<body>

<jsp:include page="../side.jsp">
	<jsp:param value="board_Qna" name="selectMenu"/>
</jsp:include>
<div class="main-panel">
	<jsp:include page="../top.jsp"></jsp:include>
		<div class="content">
  <div class="col-md-3"></div>
			<div class="col-md-12">
			    <div class="card card-plain">
			        <div class="card-header" style="background: linear-gradient(60deg, #f7049a, #9527b0);">
			            <h4 class="title">Q&A게시판</h4>
			            <p class="category">공지사항을 확인 하신 후 글을 남겨주세요</p>
			        </div>
			        <div class="card-content table-responsive">
			            <table class="table table-hover">
			                <thead>
				                <tr>
				                    <th>Num</th>
				                    <th>Id</th>
				                    <th>Subject</th>
				                    <th>Date</th>
				                    <th>Readcount</th>
				                </tr>
			                </thead>
			                <tbody>
				                <c:forEach> 
				                    <tr>
				                        <td>1</td>
				                        <td>관리자</td>
				                        <td><a>안녕하세요!</a></td>
				                        <td>2018-01-30</td>
				                        <td>90</td>
				                    </tr>
				                </c:forEach>
			                </tbody>
			            </table>
			        </div>
			    </div>
			</div>
		  </div>
		  <div class="col-md-4">
	       <div class="card">
		    <div class="card-header card-chart" data-background-color="purple">
			 <div class="ct-chart" id="dailySalesChart"></div>
		  </div>
		  <div class="card-content">
		   <h4 class="title"><a>운동</a></h4>
			<p class="category"><span class="">운동경험을 나누어주세요</span></p>
		</div>
		<div class="card-footer">
			
		   </div>
	      </div>
         </div>
         <div class="col-md-4">
	       <div class="card">
		    <div class="card-header card-chart" data-background-color="purple">
			 <div class="ct-chart" id="dailySalesChart"></div>
		  </div>
		  <div class="card-content">
		   <h4 class="title"><a>식단</a></h4>
			<p class="category"><span class="">효과좋은 식단구성을 알고 계신가요?</span></p>
		 </div>
		  <div class="card-footer">
			
		</div>
	</div>
</div>
<div class="col-md-4">
	       <div class="card">
		    <div class="card-header card-chart" data-background-color="purple">
			 <div class="ct-chart" id="dailySalesChart"></div>
		  </div>
		  <div class="card-content">
		   <h4 class="title"><a>그 외</a></h4>
			<p class="category"><span class="text-success"></span>그 외에 궁금한 사항은 여기로!</p>
		 </div>
		  <div class="card-footer">
			
		</div>
	</div>
</div>
</div>
		<!--   Core JS Files   -->
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="assets/js/material.min.js" type="text/javascript"></script>
	<!--  Charts Plugin -->
	<script src="assets/js/chartist.min.js"></script>
	<!--  Dynamic Elements plugin -->
	<script src="assets/js/arrive.min.js"></script>
	<!--  Notifications Plugin    -->
	<script src="assets/js/bootstrap-notify.js"></script>
	<!-- Material Dashboard javascript methods -->
	<script src="assets/js/material-dashboard.js?v=1.2.0"></script>
</body>
</html>