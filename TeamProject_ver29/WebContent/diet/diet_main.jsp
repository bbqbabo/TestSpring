<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8" />
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
<style type="text/css">

		#diet_panel2 {
			margin:15px;
		}

        .list-left li {
            cursor: pointer;
        }
        
        li a:hover {
        	text-decoration: none;
        	cursor:pointer;
        }
        
        .list-arrows {
            padding-top: 150px;
        }

        .menuItem {
        	min-height:300px;
        	margin:10px;
        }
       
        .black {
        	color:black;
        }
        
        .totalCalorie, .totalMenuCalorie {
        	font-weight: bold;
        }
</style>

  <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<!-- Resources -->
<!-- Resources -->
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
<script type="text/javascript">
// 페이지가 다 로드되면
$(document).ready(function() {
	if(location.hash == '#analysis') {
		$("#mainContent").html(sessionStorage.getItem("dietData"));
		$("#diet_panel2").html(sessionStorage.getItem("dietData2"));
		$('#analysis').hide();
	}
	else {
		$('#keyWord').val('');
		getFoodList();
		sessionStorage.setItem("originData",$('#mainContent').html());
		sessionStorage.setItem("originData2",$('#diet_panel2').html());
	}
	
	window.onpopstate=function(event){
		if(location.hash == '#analysis') {
			$("#mainContent").html(sessionStorage.getItem("dietData"));
			$("#diet_panel2").html(sessionStorage.getItem("dietData2"));
			$('#analysis').hide();
		}
		else {
			$("#mainContent").html(sessionStorage.getItem("originData"));
			$("#diet_panel2").html(sessionStorage.getItem("originData2"));
			$('#keyWord').val('');
			getFoodList();
		}
	}
});


// 음식목록 가져오는 함수
function getFoodList() {
			  
	  $.ajax({  
		  type: "Post",
           url: 'dietFoodList.do',
           data: "keyWord="+$('#keyWord').val(),
           contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
           dataType:'html',
           success: function(data)
           {
         	  $("#foodList").empty();
			  $("#foodList").html(data);
           },
           error:function(data){
        	   alert("에러");
           }
      });
	
}

// 총 칼로리
var totalCalorie = 0;
var menu = new Array();
var menuIndex = 0;
var count = new Array();

var breakFast = null;	
var lunch = null;
var dinner = null;
var breakFastCount = null;	
var lunchCount = null;
var dinnerCount = null;
var totalBreakCal = 0;
var totalLunchCal = 0;
var totalDinnerCal = 0;

$(function () {

	// 검색창 입력
	$("#keyWord").keyup(function(){
	
	 getFoodList();
	  
	});
	
	// 선택한 목록 리셋
	$("#reset").click(function(){
	 reset();
	});
	// 검색결과 선택
    $('body').on('click', '#foodList li', function (e) {
    	
    	if(!$(e.target).hasClass('disabled')) {
    		
    			$(e.target).toggleClass('active');
    			return;
        }
    	
    });
    // 검색 리스트에서 추가
    $('.list-arrows button').click(function () {
        var $button = $(this), actives = '';
         if ($button.hasClass('move-right')) {
            actives = $('.list-left ul li.active');
            actives.removeClass('active');
    
            for(var i = 0; i < actives.length; i++) {
    			totalCalorie += parseInt(actives.eq(i).val() * 0.2);
            
	            var clone = actives.eq(i).clone();
	            clone.appendTo('.list-right ul');
	            clone.append("&nbsp; &nbsp; * &nbsp; &nbsp; <input type='number' min='0.2' max='5.0' step='0.2' value='0.2'>  <span>인분</span>"
	            			+"<a class='close'><i class='material-icons black'>close</i></a>");
	            
	            menu[menuIndex] = actives.eq(i).text();
	            count[menuIndex] = 0.2;
	           	menuIndex++;
            }
            actives.addClass('disabled');
            
            $('.totalCalorie').html("총 "+totalCalorie+" Kcal");
        }
    });

	// 갯수 변경
	$('body').on('click',".list-right ul li input[type='number']",function(){
		calorieCalculate();
    });  
    
	// 삭제
    $('body').on('click','.list-right ul li a',function(){
    	
    	var item = $(this).parent();
    	var index = item.index();
    	
		for(var i = 0; i < $('.list-left ul li').length; i++) {

			var text1 = $('.list-left ul li').eq(i).text();
			var text2 = menu[index];

			if(text1 == text2) {

				 $('.list-left ul li').eq(i).removeClass('disabled');
				 break;
			}
		}
   
	  menu[index] = "";
	  var temp = new Array();
	  var temp2 = new Array();
	  var tempIndex = 0;
	  for(var i = 0; i < menu.length; i++) {
		  if(i != index) {
		  	temp[tempIndex] = menu[i];
		  	temp2[tempIndex] = count[i];
		  	tempIndex++;
		  }
	  }
	  menu = temp;
	  count = temp2;
	  menuIndex = tempIndex;
	  
	  item.remove();
	  
	  calorieCalculate();
    });
		
	// 내 메뉴로 전달
	$('#insertMyMenu').click(function(){
		
		if(menuIndex == 0) {
			alert("저장할 메뉴가 없습니다.");
			return;
		}
		
		var mealtime = $("input[type='checkbox']");
		if(!(mealtime[0].checked || mealtime[1].checked || mealtime[2].checked)) {
			alert("아침, 점심, 저녁을 선택하세요.");
			return;
		}
		
		if(mealtime[0].checked) {
			if($('#breakPanel').children().length != 0) {
				var answer = confirm("이미 아침 식단이 있습니다. '확인'을 누르시면 새로운 식단으로 변경됩니다.");
				if(answer == false) {
					return;
				}
				$('#breakPanel').children().remove();
			}
			var content = "<div class='list-group-item menuItem'><b>아침</b><a class='close'><i class='material-icons black'>close</i></a><br><br>"
						+ "<div id='breakMenuItem'></div><br><b> 총 " + totalCalorie + " Kcal" + "</b></div>";
			$('#breakPanel').append(content);
			
			var menus = $('.list-right ul li').clone();
			menus.children().remove();
			for(var i = 0; i < menus.length; i++) {
				menus[i].append(count[i] + "  인분");
			}
			menus.appendTo('#breakMenuItem');
			breakFast = menu;
			breakFastCount = count;
			totalBreakCal = totalCalorie;
		}
		if(mealtime[1].checked) {
			if($('#lunchPanel').children().length != 0) {
				var answer = confirm("이미 점심 식단이 있습니다. '확인'을 누르시면 새로운 식단으로 변경됩니다.");
				if(answer == false) {
					return;
				}
				$('#lunchPanel').children().remove();
			}
			var content = "<div class='list-group-item menuItem'><b>점심</b><a class='close'><i class='material-icons black'>close</i></a><br><br>"
						+ "<div id='lunchMenuItem'></div><br><b> 총 " + totalCalorie + " Kcal" + "</b></div>";
			$('#lunchPanel').append(content);
			
			var menus = $('.list-right ul li').clone();
			menus.children().remove();
			for(var i = 0; i < menus.length; i++) {
				menus[i].append(count[i] + "  인분");
			}
			menus.appendTo('#lunchMenuItem');
			lunch = menu;
			lunchCount = count;
			totalLunchCal = totalCalorie;
		}
		if(mealtime[2].checked) {
			if($('#dinnerPanel').children().length != 0) {
				var answer = confirm("이미 저녁 식단이 있습니다. '확인'을 누르시면 새로운 식단으로 변경됩니다.");
				if(answer == false) {
					return;
				}
				$('#dinnerPanel').children().remove();
			}
			var content = "<div class='list-group-item menuItem'><b>저녁</b><a class='close'><i class='material-icons black'>close</i></a><br><br>"
						+ "<div id='dinnerMenuItem'></div><br><b> 총 " + totalCalorie + " Kcal" + "</b></div>";
			$('#dinnerPanel').append(content);
		
			var menus = $('.list-right ul li').clone();
			menus.children().remove();
			for(var i = 0; i < menus.length; i++) {
				menus[i].append(count[i] + "  인분");
			}
			menus.appendTo('#dinnerMenuItem');
			dinner = menu;
			dinnerCount = count;
			totalDinnerCal = totalCalorie;
		}
		
		reset();
		$('.totalMenuCalorie').html("하루 " + (totalBreakCal + totalLunchCal + totalDinnerCal) + " Kcal");
	});
	
	// 내 메뉴에서 식단 삭제
	$('body').on('click','.menuItem a',function(){
		if($(this).parent().parent().attr('id') == 'breakPanel') {
			breakFast = null;
			breakFastCount = null;
			totalBreakCal = 0;
		}
		if($(this).parent().parent().attr('id') == 'lunchPanel') {
			lunch = null;
			lunchCount = null;
			totalLunchCal = 0;
		}
		if($(this).parent().parent().attr('id') == 'dinnerPanel') {
			dinner = null;
			dinnerCount = null;
			totalDinnerCal = 0;
		}
		$(this).parent().remove();
		$('.totalMenuCalorie').html("하루 " + (totalBreakCal + totalLunchCal + totalDinnerCal) + " Kcal");
	});
		
	// 분석하기
	$('#analysis').on('click',function(){
		if(breakFast == null || lunch == null || dinner == null) {
			alert("아침, 점심, 저녁 메뉴를 모두 추가하세요.");
			return;
		}
		
		var answer = confirm("분석을 시작합니까?");
		
		if(answer == true) {
			
			$.ajaxSettings.traditional = true;//배열 형태로 서버쪽 전송을 위한 설정
			
			$.ajax({
	           url:"dietAnalysis.do",
	           data: {
	        	 breakFast : breakFast,
	        	 breakFastCount : breakFastCount,
	        	 totalBreakCal: totalBreakCal,
	        	 lunch : lunch,
	        	 lunchCount : lunchCount,
	        	 totalLunchCal : totalLunchCal,
	        	 dinner : dinner,
	        	 dinnerCount : dinnerCount,
	        	 totalDinnerCal : totalDinnerCal
	           },
	           dataType:'html',
	           type:'post',
	           success:function(data){
	        	  $("#analysis").hide();
	        	  $("#menu_panel a").hide();
	        	  
	        	  $("#mainContent").empty();
	              $("#mainContent").html(data);
	              history.pushState(null, null, window.location.href + "#analysis");
	              sessionStorage.setItem("dietData", $('#mainContent').html());
	              sessionStorage.setItem("dietData2", $('#diet_panel2').html());
	           },
	           error:function(data){
	              alert("에러");
	           }
	           
	        });//end ajax
		}
	});
});

// 내 목록 칼로리 계산
function calorieCalculate(){
 	var list = $('.list-right ul li');
 	
 	var result = 0;

 	for(var i = 0; i < list.length; i++) {
 		result += list.eq(i).val() * list.eq(i).children("input[type='number']").val();
 		count[i] = list.eq(i).children("input[type='number']").val();
 	}
	totalCalorie = parseInt(result);
	$('.totalCalorie').html("총 "+totalCalorie+" Kcal");
}

// 내 목록 리셋
function reset() {
	$('.list-left ul li.disabled').removeClass('disabled');
	  
	
	  $('.list-right ul li').remove();
	  totalCalorie = 0;
	  $('.totalCalorie').html("총 "+totalCalorie+" Kcal");
	  
	  menu = new Array();
	  menuIndex = 0;
	  count = new Array();
	  
	  var mealtime = $("input[type='checkbox']");
	  mealtime.prop("checked", false);
}
  </script>
</head>
<body>
	<jsp:include page="../side.jsp">
	<jsp:param value="diet" name="selectMenu"/>
	</jsp:include>
	<div class="main-panel">
		<jsp:include page="../top.jsp"></jsp:include>
		<div class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-3 col-md-12">
						<div class="card">
			                <div class="card-header" data-background-color="red">
			                    <h4 class="title">내 정보</h4>
			                    <p class="category"></p>
			                </div>
			                <div class="card-content">
			                    <div id="typography">
				                    <br>
			                    	<p>
										 현재체중 : <b>${sessionScope.Weight}Kg</b> , 표준체중 : <b>${sessionScope.sWeight}Kg</b><br>
										<div>표준체중에 따른 하루 필요칼로리<br>
										<b> - 운동 강도 <font color="blue">보통</font> : <fmt:formatNumber value="${sessionScope.sWeight * 30}" pattern="#"/>Kcal ~ <fmt:formatNumber value="${sessionScope.sWeight * 35}" pattern="#"/>Kcal<br>
										 - 운동 강도 <font color="red">격함</font> : <fmt:formatNumber value="${sessionScope.sWeight * 35}" pattern="#"/>Kcal ~ <fmt:formatNumber value="${sessionScope.sWeight * 40}" pattern="#"/>Kcal</b></div>
									</p>
									<hr>
									<h5><b>표준체중과 필요칼로리</b></h5>
									<p>
										<b>표준체중(Kg)(남자)</b> = 키(m) * 키(m) * 22<br>
										<b>표준체중(Kg)(여자)</b> = 키(m) * 키(m) * 21<br>
										<b>필요칼로리(운동 보통)(Kcal)</b> = 표준체중 * (25 ~ 30)<br>
										<b>필요칼로리(운동 격함)(Kcal)</b> = 표준체중 * (35 ~ 40)<br><br>
									</p>
									<h5><b>한국인 3대 영양소 하루 섭취 권장량</b></h5>
									<p>
										<b>탄수화물(g)</b> = 총칼로리 * 0.6 / 4<br>
										<b>단백질(g)</b> = 55 ~ 65g #<br>
										<b>지방(g)</b> = 총칼로리 * 0.2 / 9<br>
									</p>
								</div>
							</div>
							<div class="card-footer">
								<div class="stats"># 20~30대 남녀의 기준. 단백질은 성별, 연령에 따라 다름 </div>
							</div>
						</div>
					</div>
					<div class="col-lg-9 col-md-12">
						<div id="mainContent">
							<div class="card">
				                <div class="card-header" data-background-color="red">
				                	<h4 class="title">식단 선택</h4>
				                	<p class="category">음식을 검색하여 하루 필요 열량(Kcal)에 맞춰 식단을 만들어 보세요.</p>
				                </div>
				               	<div class="card-content">
					                <div id="diet_panel">
										<div class="row">
						                    <div class="col-md-5">
												<div class="input-group">
													<span class="input-group-addon">
						                            	<i class="material-icons">search</i>
						                            </span>
						                            <div class="form-group">
						                            	<input type="text" id="keyWord" class="form-control" placeholder="음식명이나 칼로리 검색" />
													</div>
												</div>
						                    </div>
						                    
						                    <div class="col-md-offset-2 col-md-5">
												<div class="input-group">
													<span class="input-group-addon">
						                            	<i class="material-icons">receipt</i>
						                            </span>
						                            <div class="form-group">
						                            	<h4>선택한 식단</h4>
					                            	</div>
												</div>
						                    </div>
						                </div>
						                <div class="row">
									        <div class="dual-list list-left col-md-5" >
									            <div class="well">
									                <div id="foodList">
									                </div>
									            </div>
									        </div>
								
									        <div class="list-arrows col-md-2 text-center" style=" height:270px;">
										        <button class="btn btn-danger move-right">
										            <i class="material-icons">forward</i>
										        </button>
									     	</div>
										    <div class="dual-list list-right col-md-5">
										        <div class="well">
										            <ul class="list-group" style="overflow-y:scroll; height:200px;"></ul>
									                <table width=100%>
										                <tr>
											                <td></td>                                                            
												            <td id="selectMenu" align=right>
													            <div class="checkbox">
													            	<label for="break">
													            		<input type="checkbox" name="mealtime" id="break" value="아침"><font color="black">아침</font>
													            	</label>
													            	<label for="lunch">
													            		<input type="checkbox" name="mealtime" id="lunch" value="점심"><font color="black">점심</font>
													            	</label>
													            	<label for="dinner">
													            		<input type="checkbox" name="mealtime" id="dinner" value="저녁"><font color="black">저녁</font>
													            	</label>
												            	</div>
															</td>
														</tr>
														<tr>
															<td>
																<h4 class="totalCalorie">총 0 Kcal</h4>
															</td>
															<td align=right>
													            <span class="input-group-btn">
													                <button class="btn btn-danger" id="insertMyMenu">식단 추가</button>
													                <button class="btn btn-default" id="reset">목록 비우기</button>
																</span>
															</td>
														</tr>
													</table>          
									            </div>
									        </div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="card">
			                <div class="card-header" data-background-color="red">
			                	<h4 class="title" style="display: inline;">하루 식단표</h4>&nbsp;&nbsp;
			                	<button class="btn btn-danger" id="analysis"><i class="material-icons">assessment</i>식단 분석</button>
			                	<p class="category">식단 분석을 하면 식단이 저장되고 [마이페이지]에서 다시 확인할 수 있습니다.</p>
			                </div>
			               	<div class="card-content">
				               	<div id="diet_panel2">
									<div class="row">
										<div class="well col-md-12" >
											<div class="row" id="menu_panel" style="min-height: 300px;">
												<div id="breakPanel" class="col-md-4"></div>
												<div id="lunchPanel" class="col-md-4"></div>
												<div id="dinnerPanel" class="col-md-4"></div>
											</div>
											<h4 class="totalMenuCalorie">하루 0 Kcal</h4>
										</div>
									</div>
								</div>
			                </div>
			            </div>
		            </div>
	            </div>
	        </div>
        </div>
	</div>
		<!--   Core JS Files   -->
	<script src="assets/js/jquery-3.2.1.min.js" type="text/javascript"></script>
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