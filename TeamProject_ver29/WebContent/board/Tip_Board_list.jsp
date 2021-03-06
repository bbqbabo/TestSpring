<%@page import="java.util.ArrayList"%>
<%@page import="bean.BoardDto_Tip"%>
<%@page import="dao.BoardDao_Tip"%>
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
	<style>
	.carousel-inner {
    position: relative;
    overflow: hidden;
}
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 35%;
      margin: auto;
}
   
</style>

	<script src="assets/js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
	function Write_btn(){
		location.href="tip_board_write.do";
	}
</script>


</head>
<body>
<jsp:include page="../side.jsp">
	<jsp:param value="board_Tip" name="selectMenu"/>
</jsp:include>
 <div class="main-panel">
  <jsp:include page="../top.jsp"></jsp:include>
   <div class="content">
    <div class="col-md-6" style="height: 400px;">
	 <div class="card">
	  <div class="card-header card-chart" data-background-color="orange" style="min-height: 80px; background: linear-gradient(60deg, #f51505, #eee);">
	   <h3>더 많은 정보를 보실 수있습니다</h3>
	  </div>
	  <!-- <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol> -->
<div class="container-fluid col-md-12" style="padding-bottom: 15px;">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
   <!-- Indicators -->
    
    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox" style="   /*  height: 270px; */">
     <div class="item active">
     
       <div class="col-xs-6">
      <img src="board_img/12.jpg" alt="12" style="width:350px; height:300px; border-radius:30px;">
       <div class="carousel-caption">
        <h3>식단</h3>
         <p>실생활에 유용한 식단 정보를 보실 수 있습니다</p>
         </div>
        </div>
        
          <div class="col-xs-6">
        <img src="board_img/8.jpg" alt="Flower" style="width:350px; height:300px; border-radius:30px;">
        <div class="carousel-caption">
          <h3>자기관리</h3>
          <p>작심삼일을 넘어서는 자기관리란 무엇일까요?</p>
        </div>
        </div>
      </div>
      
      <div class="item">
      <div class="col-xs-6">
	      <a href=""><img src="board_img/29.jpg" alt="Chania" style="width:350px; height:300px; border-radius:30px;"></a>
	       <div class="carousel-caption">
	          <h3>운동Item</h3>
	          <p>유용한 Item들을 보실 수있습니다</p>
	        </div>
      </div>
      <div class="col-xs-6">  
        <img src="board_img/25.jpg" alt="Flower" style="width:350px; height:300px; border-radius:30px;"/>
        <div class="carousel-caption">
          <h3>운동</h3>
          <p>가볍게 하실 수 있는 동작들을 확인 해 보실 수 있습니다</p>
        </div>
      </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
<!--     <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> -->
<!--       <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> -->
<!--       <span class="sr-only">Previous</span> -->
<!--     </a> -->
<!--     <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> -->
<!--       <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> -->
<!--       <span class="sr-only">Next</span> -->
<!--     </a> -->
  </div>
</div>
<!--      <div class="card-content"> -->
<!-- 	 <!-- 하얀 네모안에 들어갈 것 --> 
<!--      <div class="col-md-6" style="height:300px; background-color: #60b4fd; border-radius: 5px; margin-bottom: 20px;"></div> -->
<!-- 	 <div class="col-md-3" style="width:23%; height:130px; background-color:yellow;border-radius: 5px; margin: 7px; margin-top: 0px;"></div>						 -->
<!-- 	 <div class="col-md-3" style="width:23%; height:130px; background-color:yellow;border-radius: 5px; margin: 7px; margin-top: 0px;"></div> -->
<!-- 	 <div class="col-md-3" style="width:23%; height:130px; background-color:yellow;border-radius: 5px; margin: 7px; margin-top: 0px;"></div> -->
<!-- 	 <div class="col-md-3" style="width:23%; height:130px; background-color:yellow;border-radius: 5px; margin: 7px; margin-top: 0px;"></div> -->
<!--    </div> -->
  </div>
 </div>
<div class="col-md-6" style="height: 377px; margin-top: 33px; background-image:url(board_img/11.jpg); background-repeat: no-repeat; background-size: 100%; border-radius: 10px;"> 
</div>
 <div class="col-sm-12" style="text-align: center;">
 	<div class="col-md-3"></div>
 	<div class="col-md-6">
				<div>
					<div class="form-group">
					<div class="col-md-2"></div>
					<div class="col-md-2">
						<button class="btn btn-warning" style="background-color: #f51505;" onclick="Write_btn();">글쓰기</button>
					</div>
					<div class="col-md-2">
						<div class="dropdown">
							<a href="#" class="btn dropdown-toggle" data-toggle="dropdown" style="background-color: #f51505;" >
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
						<div class="col-md-4" style="padding-top: 5px; padding-left: 25px; padding-right: 0px;">
				    		<input type="text" value="" placeholder="검색어" class="form-control" style="margin-top: 10px;"/>
				    	</div>
				    	<div class="col-md-2">
							<button class="btn btn-warning" style="background-color: #f51505;">검색</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-3"></div>
			<div class="col-md-12">
			    <div class="card card-plain">
			        <div class="card-header" style="background: linear-gradient(60deg, #f51505, #eee)";>
			            <h4 class="title">운동과 식단에 관한 Tip게시판입니다</h4>
			            <p class="category">집단지성의 힘을 보여주세요^^</p>
			        </div>
			        <div class="card-content table-responsive">
			            <table class="table table-hover">
			                <thead>
			                    <th>Num</th>
			                    <th>Id</th>
			                    <th>Subject</th>
			                    <th>Date</th>
			                    <th>Readcount</th>
			                </thead>
			                <tbody>
			                
			                <c:forEach items="${dto }" var="d"> 
			                    <tr>
			                        <td>${d.num }</td>
			                        <td>${d.id }</td>
			                        <td><a href="tip_board_read.do?num=${d.num }">${d.subject }</a></td>
			                        <td>${d.date }</td>
			                        <td>${d.readcount }</td>
			                    </tr>
			                </c:forEach>
			                </tbody>
			            </table>
			        </div>
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