<%@page import="java.util.ArrayList"%>
<%@page import="bean.BoardDto_Free"%>
<%@page import="dao.BoardDao_Free"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <script type="text/javascript">
	function Write_btn(){
		location.href="free_board_write.do";
	}
</script>
</head>
<body>

<jsp:include page="../side.jsp">
	<jsp:param value="board_Free" name="selectMenu"/>
</jsp:include>
<div class="main-panel">
	<jsp:include page="../top.jsp"></jsp:include>
		<div class="content">
			<div class="col-md-3" style="height:200px"></div>
			<div class="col-md-6" align="center">
				<img src="board_img/free3.jpg" style="width:500px; height:500px; border-radius:10px"/>
				
			</div>
			<div class="col-md-2" style="height:500px"></div>
			
			<div class="col-md-2" style="height:80px"></div>
			<div class="col-md-8" style="height:80px;">
				<div class="col-md-2" style="padding-left: 50px;">
					<button class="btn btn-danger" style="background-color: #3650f4;">글쓰기</button>
				</div>
				<div class="col-md-2">
					<div class="dropdown">
						<a href="#" class="btn dropdown-toggle" data-toggle="dropdown" style="background-color: #3650f4;" >
					    	선택
					    	<b class="caret"></b>
						</a>
						<ul class="dropdown-menu">
							<li><a>제목</a></li>
							<li><a>작성자</a></li>
	<!-- 								<li class="divider"></li> -->
						</ul>
					</div>
				</div>
				<div class="col-md-6" style="padding-top: 5px; padding-left: 25px; padding-right: 0px;">
		    		<input type="text" value="" placeholder="검색어" class="form-control" style="margin-top: -12px;"/>
		    	</div>
		    	<div class="col-md-2">
					<button class="btn btn-warning" style="background-color: #3650f4;">검색</button>
				</div>
						
			
			</div>
<!-- 			<div class="col-md-2" style="height:150px"></div> -->
			<div class="container-fluid text-center bg-grey">
  				<div class="col-md-12">
   					<div class="card">
						<div class="card-header" style="background: linear-gradient(60deg, #1f05f5, #1dfff8);">
							<h4 class="title">자유게시판</h4>
							<p class="category">즐거움을 나누어 주세요!</p>
						</div>
	
						<div class="card-content table-responsive table-full-width">
							<div class="mail-box">
                  <aside class="lg-side">
                      <div class="inbox-body">
                         <div class="mail-option">
                             

                            <table class="table table-inbox table-hover">
                                
                             <thead>
                              <tr class="unread">
                               
                                  <td class="view-message dont-show">Num</td>
                                  <td class="view-message" colspan="3">Id</td>
                              
                                    <td> 
                                        <span>Subject
<!--                                             <div> -->
<!--                                                 <span class="label label-success pull-left"> </span>  -->
<!--                                                 <span class="label label-info pull-left"> </span> -->
<!--                                                 <span class="label label-warning pull-left"> </span> -->
<!--                                                 <span class="label label-danger pull-left"> </span> -->
<!--                                             </div> -->
                                        </span>
                                    </td>
                                  <td class="view-message  text-left">Date</td>
                                  <td class="view-message  text-left">Readcount</td>
                              </tr>
                              </thead>
                              
                              <tbody>
                              <c:forEach items="${dto}" var="d">
                              <tr>
                                  <td class="view-message  dont-show">${d.num }</td>
                                  <td colspan="3" class="view-message">${d.id }</td>
<!--                                   <td><span class="label label-success">Yo</span></td> -->
                                  <td><a href="free_board_read.do?num=${d.num }">${d.subject }</a></td>
                                  <td class="view-message  text-left">${d.date }</td>
                                  <td class="view-message  text-left">${d.readcount }</td>
                                  
                              </tr>
                              </c:forEach>
                              
                              
                          </tbody>
                         </table>
                          
                      </div>
                  </aside>
              </div>
						</div>
   						<div class="col-md-12" style="text-align: center;">
							<ul class="pagination pagination-info">
								<li><a href="javascript:void(0);">prev</a></li>
								<li><a href="javascript:void(0);">1</a></li>
								<li><a href="javascript:void(0);">2</a></li>
								<li><a href="javascript:void(0);">3</a></li>
								<li><a href="javascript:void(0);">4</a></li>
								<li><a href="javascript:void(0);">5</a></li>
								<li><a href="javascript:void(0);">next ></a></li>
                 			</ul>	
						</div>
           			</div>
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
	<!--  PerfectScrollbar Library -->
	<script src="assets/js/perfect-scrollbar.jquery.min.js"></script>
	<!--  Notifications Plugin    -->
	<script src="assets/js/bootstrap-notify.js"></script>
	<!-- Material Dashboard javascript methods -->
	<script src="assets/js/material-dashboard.js?v=1.2.0"></script>
</body>
</html>