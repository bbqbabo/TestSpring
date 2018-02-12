<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8"); %>
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
<!--  <link rel="stylesheet" href="event/jquery.countdown.css" /> -->
</head>
<style>
   .gray_img {
/*    filter: gray;  */
/*    -webkit-filter: grayscale(1); */
/*    -webkit-box-shadow: 0px 2px 6px 2px rgba(0,0,0,0.75); */
/*    -moz-box-shadow: 0px 2px 6px 2px rgba(0,0,0,0.75); */
   box-shadow: 0px 2px 6px 2px rgba(0,0,0,0.75);
   opacity:1;
   transition:1s;
   }

   .gray_img:hover {
   filter: none;
   opacity:1; 
   -webkit-filter: grayscale(0); 
   }
   
   .right_img {
   -webkit-box-shadow: 0px 2px 6px 2px rgba(0,0,0,0.75);
   -moz-box-shadow: 0px 2px 6px 2px rgba(0,0,0,0.75);
   box-shadow: 0px 2px 6px 2px rgba(0,0,0,0.75);
   transition:1s;
   margin-bottom:20px;
   width:100%;
   height:700px;
   }
   
   .bulto{
      opacity:0.5;
   }
</style>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">

var arry = '${eventDate}';
var arry1 = '${eventSubject}';
var arry2 = '${eventCate}';
var su1 = arry1.substring(1, arry1.length-1);
var sub1 = su1.split(",");
var dat = arry.substring(1, arry.length-1);
var dat1 = dat.split(",");
var ca = arry2.substring(1, arry2.length-1);
var ca1 = ca.split(",");

var joinSub;
var eventDate;
var ck = "-";

function asd(date1, cate1, con1, tot1,imgCon,sub,lev,discount){
	
	var to = new Date();
	var to1 = new Date(date1);
	var imgContent = imgCon;
	var subject = sub;
	joinSub = sub;
	
	var id = '${sessionScope.Id}';
	
	var dyear = to.getFullYear();
	var dmon = to.getMonth()+1;
	var dday = to.getDate();
	eventDate = dyear+"-"+dmon+"-"+dday;
	
	
	if(cate1=="추첨"){
		
		if(to >=to1){
			$('#alertContent').html("이벤트가 종료되었습니다.");
			$('#myModal10').modal('show');

			return;
		}
		if(parseInt('${sessionScope.Level}')<parseInt(lev)){
			$('#alertContent').html(lev+"레벨이상 참여 가능합니다.");
			$('#myModal10').modal('show');
			
			return;
		}
		$('#subject').html(subject);
		$('#cont12').attr('src','upload/'+imgContent);
		$('#join').prop('type','button');
		ck = "-";
	}
	
	else if(cate1=="선착순"){
		if(con1==tot1){
			$('#alertContent').html("이벤트가 종료되었습니다.");
			$('#myModal10').modal('show');
			

			return;
		}
		if(parseInt('${sessionScope.Level}')<parseInt(lev)){
			$('#alertContent').html(lev+"레벨이상 참여 가능합니다.");
			$('#myModal10').modal('show');
			
			return;
		}
		$('#subject').html(subject);
		$('#cont12').attr('src','upload/'+imgContent);
		$('#join').prop('type','button');
		ck = "o";
	}
	
	else if(cate1=="쿠폰"){
			if(to >=to1){
				$('#alertContent').html("이벤트가 종료되었습니다.");
				$('#myModal10').modal('show');
				
				return;
		}
		if(parseInt('${sessionScope.Level}')<parseInt(lev)){
			$('#alertContent').html(lev+"레벨이상 참여 가능합니다.");
			$('#myModal10').modal('show');
			return;
		}
		ck = "-";
		$.ajax({
			  url:"event_coupon_check.do",
			  dataType:'text',
			  type:'post',
			  data:{
				id:id,
				coupon :subject
			  },
			  success:function(date){	
				  if(date!='0'){
						$('#alertContent').html("이미 발급받은 쿠폰입니다.");
						$('#myModal10').modal('show');
						
					  return;
				  }
				  else couponGet(id, sub, discount, date);
				  
			  },
			  error:function(data){
				  alert("에러");
			  }
			  }); 
		
	}
	
}
	
	function delete1(sub){
		
		$.ajax({
			url:"event_main_delete.do",
			type:'post',
			data:{subject : sub},
			success:function(){
				$('#alertContent').html("삭제 완료.");
				$('#myModal10').modal('show');
				
				$('#myModal10').on('hide.bs.modal', function () { 
					window.location.reload(true);
				});
			},
			error:function(data){
				alert("에러");
			}
			
		
		});	
	
	}
	function update1(sub){
		
		
		location.href='event_main_update.do?subject='+sub;
		
	}
	

function couponGet(id, sub, discount, date){
	
	var to12 = new Date();
	var dyear = to12.getFullYear();
	var dmon = to12.getMonth()+1;
	var dday = to12.getDate();
	var dmon1 = dmon+1;
	
	if(dmon1==12){
		dyear = dyear+1;
		dmon1 = 1;
	}
	if(dday==29||dday==30||dday==31){
		dmon1 = dmon1+1;
		dday = 1;
	}
	ddate = dyear+'-'+dmon1+'-'+dday;
	$.ajax({
		  url:"event_coupon_get.do",
		  dataType:'text',
		  type:'post',
		  data:{
			id:id,
			coupon :sub,
			discount : discount,
			date : ddate,
		  },
		  success:function(){			  

				$('#alertContent').html("쿠폰발급 완료.(사용기한 :"+ddate+"까지)");
				$('#myModal10').modal('show');
				
				$('#myModal10').on('hide.bs.modal', function () { 
					window.location.reload(true);
				});
		  },
		  error:function(data){
			  alert("에러");
		  }
		  }); 
	
}



$(function(){
		countdown();
		
	});
		function countdown(){
for(var i=0; i < sub1.length; i++){
	
	var id = sub1[i].trim();
	var dd = dat1[i].trim();
	var now = new Date();
	var aa = new Date(dd);
	var ca2 = ca1[i].trim();;
	
	if (ca2=="선착순")
	{$('#선착순').hide();
	continue;
	}
	if(now>=aa){
		$('#'+id+'b').html('0');
		$('#'+id+'b').html('0');
		$('#'+id+'c').html('0');
		$('#'+id+'d').html('0');
		$('#'+id+'e').html('0');
		$('#'+id+'f').html('0');
		$('#'+id+'g').html('0');
		$('#'+id+'h').html('0');
		$('#'+id+'i').html('0'); 
		continue;
	}
	
	
	var date = parseInt((aa-now)/1000);
	var day = parseInt(date/(60*60*24));
	var hour = parseInt((date%(60*60*24))/(60*60));
	var min = parseInt(date%(60*60)/60);
	var sec = parseInt(date%60);
	
	if(day>=10)
		$('#'+id+'b').html(Math.floor(day/10));
	else
		$('#'+id+'b').html('0');
	$('#'+id+'c').html(day-Math.floor(day/10)*10);
	
	if(hour>=10)
		$('#'+id+'d').html(Math.floor(hour/10));
	else
		$('#'+id+'d').html('0');
	$('#'+id+'e').html(hour-Math.floor(hour/10)*10);

	if(min>=10)
		$('#'+id+'f').html(Math.floor(min/10));
	else
		$('#'+id+'f').html('0');
	$('#'+id+'g').html(min-Math.floor(min/10)*10);
	
	if(sec>=10)
		$('#'+id+'h').html(Math.floor(sec/10));
	else
		$('#'+id+'h').html('0');
	$('#'+id+'i').html(sec-Math.floor(sec/10)*10); 
	
	
}
setInterval("countdown()", 1000);
		}
	

function join(){
	
	var user = '${sessionScope.Id}';
	
	$.ajax({
	
		type:'post',
		url:'event_main_joinCheck.do',
		data:{id:user, subject:joinSub},
		success:function(data){
			if(data=="0"){
				join1(user, joinSub, ck);
			}else{
				$('#alertContent').html("이미 참여한 이벤트입니다.");
				$('#myModal10').modal('show');
			}
			
			
		},error:function(data){
			  alert("에러");
		  }
		
		
	});
}
function join1(user, joinSub, ck){
	
	$.ajax({
		
		type:'post',
		url:'event_main_join.do',
		data:{id:user, subject:joinSub, dateEnter:eventDate, ck:ck},
		success:function(){
			$('#alertContent').html("이벤트 참여완료.");
			$('#myModal10').modal('show');
			$('#myModal10').on('hide.bs.modal', function () { 
				
			window.location.reload(true);
				});
			
			
		},error:function(){
			  alert("에러");
		  }
		
	});
	
}


</script>

<body>
   <jsp:include page="../side.jsp">
   <jsp:param value="event_main" name="selectMenu"/>
   </jsp:include>
   
   <div class="main-panel">
   <jsp:include page="../top.jsp"/>
      <div class="content">
         <div class="col-md-7">
         
         
         <c:forEach items="${requestScope.eventSelect}" var="list" varStatus="i" >
            <div  class="col-md-6">
               <div class="card col-md-6">
                  <div class="col-md-offset-9 col-md-3 ">
                     <div class="card-header" style="background-color: #39cadc; height:50px; margin-bottom: 10px;">
                     <span  id="${list.subject }j"></span>
                     </div>
                  </div>
                  <div class="card-content">
                     <a href='javascript:void(0)' onclick="asd('${list.date}','${list.cate }','${list.count }','${list.total }','${list.imgContent }','${list.subject }','${list.level }','${list.discount }');">               
                        <img src="upload/${list.imgMain }" id="${list.subject }a" class="gray_img" style=" width:100%; height:200px;"/>
                     </a>
                  </div>
                  <div class="card-footer">
                     <div id="${list.cate}">
						<span id="${list.subject }b"></span><span id="${list.subject }c"></span>
						<span id="timeDay">일</span>
						<span id="${list.subject }d"></span><span id="${list.subject }e"></span>
						<span id="timeHour">시간</span>
						<span id="${list.subject }f"></span><span id="${list.subject }g"></span>
						<span id="timeMin">분</span>
						<span id="${list.subject }h"></span><span id="${list.subject }i"></span>
						<span id="timeSec">초</span>	
					</div>                  
                  </div>
                  <c:if test="${sessionScope.Level eq 6 }">
                  <div class="card-footer" align="right">
                     <input type="button" class="btn btn-warning" value="수정" onclick="update1('${list.subject}')">
                     <input type="button" class="btn btn-danger" value="삭제" onclick="delete1('${list.subject}')">
                  </div>
                 </c:if>
               </div>
                
            </div>
           	<script type="text/javascript">
				var sub = '${list.subject}';
				var cate = '${list.cate}';
	
				if(cate=="선착순"){
					$('#'+sub+'j').html('${list.count}'+'/'+'${list.total}');
				}else if(cate=="추첨"){
					$('#'+sub+'j').html('${list.count}'+"명 참여");
				}
			</script>
           </c:forEach>
            
            
         </div>
         <div class="col-md-5">
            <div class="col-md-12">
               <div class="card" >
                  <div class="card-content" style="height:800px">
                     <div style="position:absolute; margin-top:700px; margin-left:200px;">
                        <input type="hidden" onclick="join()" id="join" value="참여하기"class="btn bulto" style="background:red;">
                     </div>
                     <img id="cont12" src="upload/${mainRight }" class="right_img" style=" height: 100%;"/>
                     
                  </div>
               </div>
            </div>
            
         </div>
      </div>
      
</div>
</body>
</html>