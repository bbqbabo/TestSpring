<%@page import="java.util.ArrayList"%>
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
    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="grid.css">
	<link href="board/board.css" type="text/css" rel="stylesheet">
	<style>

   
</style>

<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>

<script type="text/javascript">
	
</script>
</head>
<body>
<jsp:include page="../side.jsp" ></jsp:include>
 <div class="main-panel">
  <jsp:include page="../top.jsp"></jsp:include>
   <div class="content">
    <div class="col-md-3"></div>
     <div class="col-md-12">
	  <div class="card card-plain">
	   <div class="card-header" style="background: ";>
	    <h4 class="title">운동Q&A</h4>
		 <p class="category">무엇이든 물어보세요</p>
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
<!-- 			                <tbody> -->
			                
<%-- 			                <c:forEach items="" var="">  --%>
<!-- 			                    <tr> -->
<!-- 			                        <td></td> -->
<!-- 			                        <td></td> -->
<!-- 			                        <td><a href=""></a></td> -->
<!-- 			                        <td></td> -->
<!-- 			                        <td></td> -->
<!-- 			                    </tr> -->
<%-- 			                </c:forEach> --%>
<!-- 			               </tbody> -->
			            </table>
			        </div>
			    </div>
			</div>
         </div>
    </div>
</body>
</html>