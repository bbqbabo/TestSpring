<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" initial-scale=1/>
    
    <%request.setCharacterEncoding("UTF-8"); %>
    
    <!-- Bootstrap core CSS     -->
<link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
<!--  Material Dashboard CSS    -->
<link href="../assets/css/material-dashboard.css?v=1.2.0" rel="stylesheet" />
<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="../assets/css/demo.css" rel="stylesheet" />
<!--     Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons'
	rel='stylesheet' type='text/css'>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/modernizr/modernizr-2.8.3.js"></script>
	
	<!--      Core JS Files   -->
	<script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="../assets	/js/material.min.js" type="text/javascript"></script>
	<!-- 	 Charts Plugin -->
	<script src="../assets/js/chartist.min.js"></script>
	<!-- 	 Dynamic Elements plugin -->
	<script src="../assets/js/arrive.min.js"></script>
	<!-- 	 PerfectScrollbar Library -->
	<script src="../assets/js/perfect-scrollbar.jquery.min.js"></script>
	<!-- 	 Notifications Plugin    -->
	<script src="../assets/js/bootstrap-notify.js"></script>
	<!-- 	Material Dashboard javascript methods -->
	<script src="../assets/js/material-dashboard.js?v=1.2.0"></script>
    
</head>
<body>
	<jsp:include page="../side.jsp"></jsp:include>
	<div class="main-panel">
		<jsp:include page="../top.jsp"></jsp:include>
		<div class="content">
			<div class="card card-plain">
				<div class="card-header" style="background: linear-gradient(60deg, #00bcd4, #eee);";>
 					<h4 class="title">운동과 식단에 관한 정보를 나누어 주세요</h4>
 				</div>
 				<form action="../tip_board_update.do" method="post">
 				<input type="hidden" class="form-control" name="Tip_update_num" id="Tip_update_num" value="${param.read_num }">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<tbody>
 						<tr>
  							<td><input type="text" class="form-control" name="Tip_update_subject" id="Tip_update_subject" maxlength="50" value="${param.read_subject }"></td>
						</tr>
						<tr>
 							<td><textarea class="form-control" name="Tip_update_content" id="Tip_update_content" maxlength="2048" style="height: 350px;">${param.read_content }</textarea></td>
     					</tr>
    				</tbody>
   				</table>
    			<input type="submit" class="btn btn-info pull-right" value="수정완료"/>
    			</form>
 			</div>
		</div>
	</div>
</div>
</body>
</html>