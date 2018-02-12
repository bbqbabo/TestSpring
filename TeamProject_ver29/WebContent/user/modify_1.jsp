<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png" />
	<link rel="icon" type="image/png" href="assets/img/favicon.png" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>22세기 운동혁명</title>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
	<meta name="viewport" content="width=device-width" />
	<!-- Bootstrap core CSS     -->
	<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
	<!--  Material Dashboard CSS    -->
	<link href="assets/css/material-dashboard.css?v=1.2.0" rel="stylesheet" />
	<!--     Fonts and icons     -->
	<link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
	
	<script src="assets/js/jquery-3.2.1.min.js" type="text/javascript"></script>
	<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
	<script src="https://www.amcharts.com/lib/3/serial.js"></script>
	<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
	<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
	<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
	  
  
  
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="assets/jqplot/jquery.jqplot.js"></script>
<script type="text/javascript" src="assets/jqplot/plugins/jqplot.pieRenderer.js"></script>
<link rel="stylesheet" type="text/css" href="assets/jqplot/jquery.jqplot.css" />
  
</head>

<script type="text/javascript">
//myPage.jsp

var real=null;
var myself=null;

function myPage_Jagi_ganli(){
 var x="myPage_Jagi_Ganli.jsp";

 $("#getList3 img").slideUp(1000, function() {
		//img는제거 되고 거기 안에 새로운 카테고리 생성 시킬것..
		$("#getList3").html(getList3('abcde'));
		myPage_JagiGanli('${sessionScope.Id}');
	});

 
}

</script>

<body>
	<jsp:include page="../side.jsp"></jsp:include>
	<div class="main-panel">
		<jsp:include page="../top.jsp"></jsp:include>
		<div class="content">
			<div class="container-fluid">
				<div class="col-lg-3 col-md-12 col-sm-12">
					<div class="card card-profile">
						<div class="card-avatar"
							style="border-radius: 40px; max-width: 380px; max-height: 380px;">
							<img class="img" src="upload/${dto.member_pic }">
						</div>
						<div class="content">
							<img src="images/level/${dto.level }.jpg"
								style="width: 22px; height: 22px;" /> <a
								class="category text-gray">${dto.level }레벨</a><br />
							<div style="margin-top: 20px">
								<font class="card-title" style="font-size: 35px">${dto.nickname }</font>
								<font class="card-title" style="font-size: 20px"> 님 안녕하세요</font>
								<h5 class="card-content">ID, 이름</h5>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-9 col-md-12 col-sm-12">
					<div class="card">
						<ul class="nav nav-pills nav-pills-icons card-header"
							style="width: 100%; margin-left: 0px;" data-background-color="red"
							role="tablist">
							<li class="nav-item" style="width: 11%; margin-left: 0px;"><a
								class="nav-link active" href="#a" role="tab" data-toggle="tab"
								aria-expanded="true"> <i class="material-icons"
									style="font-size: 63px;">border_color</i> 내가 쓴 글
							</a></li>
							<li class="nav-item" style="width: 11%; margin-left: 0px;"><a
								class="nav-link" href="#b" role="tab" data-toggle="tab"
								aria-expanded="false"> <i class="material-icons"
									style="font-size: 63px;">shopping_basket</i> 내 장바구니
							</a></li>
							<li class="nav-item" style="width: 11%; margin-left: 0px;"><a
								class="nav-link" href="#c" role="tab" data-toggle="tab"
								aria-expanded="false"> <i class="material-icons"
									style="font-size: 63px;">access_time</i> 배송상태
							</a></li>
							<!-- - 내 운동계획 jsp include -->
							<li class="nav-item" style="width: 11%; margin-left: 0px;"><a
								class="nav-link" href="#d" role="tab" data-toggle="tab"
								aria-expanded="false" onclick="myPage_Jagi_ganli() "> <i class="material-icons"
									style="font-size: 63px;" >directions_bike</i> 내 운동계획
							</a></li>
							<li class="nav-item" style="width: 11%; margin-left: 0px;"><a
								class="nav-link" href="#e" role="tab" data-toggle="tab"
								aria-expanded="false"> <i class="material-icons"
									style="font-size: 63px;">local_dining</i> 내 식단
							</a></li>
							<li class="nav-item" style="width: 11%; margin-left: 0px;"><a
								class="nav-link" href="#f" role="tab" data-toggle="tab"
								aria-expanded="false"> <i class="material-icons"
									style="font-size: 63px;">person</i> 이벤트 참여현황
							</a></li>
							<li class="nav-item" style="width: 11%; margin-left: 0px;"><a
								class="nav-link" href="#g" role="tab" data-toggle="tab"
								aria-expanded="false"> <i class="material-icons"
									style="font-size: 63px;">person</i> 내 정보 수정
							</a></li>
							<li class="nav-item" style="width: 11%; margin-left: 0px;"><a
								class="nav-link" href="#i" role="tab" data-toggle="tab"
								aria-expanded="false"> <i class="material-icons"
									style="font-size: 63px;">sentiment_very_dissatisfied</i> 회원탈퇴
							</a></li>
						</ul>
						<div class="card-content">
							<div class="tab-content tab-space">
								<div class="tab-pane active" id="a" aria-expanded="true">
									Collaboratively administrate empowered markets via plug-and-play
									networks. Dynamically procrastinate B2C users after installed
									base benefits. <br> <br> Dramatically visualize
									customer directed convergence without revolutionary ROI.
								</div>
								<div class="tab-pane" id="b" aria-expanded="false">
									Collaboratively administrate empowered markets via plug-and-play
									networks. Dynamically procrastinate B2C users after installed
									base benefits. <br> <br> Dramatically visualize
									customer directed convergence without revolutionary ROI.
								</div>
								<div class="tab-pane" id="c" aria-expanded="false">
									Collaboratively administrate empowered markets via plug-and-play
									networks. Dynamically procrastinate B2C users after installed
									base benefits. <br> <br> Dramatically visualize
									customer directed convergence without revolutionary ROI.
								</div>
								<div class="tab-pane" id="d" aria-expanded="false">
								<jsp:include page="../myPage_Jagi_Ganli.jsp"></jsp:include>
								 
								<div id="d_myPage"> </div>
								</div>
								
								<div class="tab-pane" id="e" aria-expanded="false">
									<jsp:include page="/diet/diet_anal.jsp"></jsp:include>
								</div>
								<div class="tab-pane" id="f" aria-expanded="false">
									<jsp:include page="/event/event_mypage.jsp"></jsp:include>
								</div>
								<div class="tab-pane" id="g" aria-expanded="false">
									<jsp:include page="/user/modify_2.jsp"></jsp:include>
								</div>
								<div class="tab-pane" id="i" aria-expanded="false">
									<jsp:include page="/user/modify_4.jsp"></jsp:include>
								</div>
								<div class="tab-pane" id="j" aria-expanded="false">
									Completely synergize resource taxing relationships via premier
									niche markets. Professionally cultivate one-to-one customer
									service with robust ideas. <br> <br>Dynamically
									innovate resource-leveling customer service for state of the art
									customer service.
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>