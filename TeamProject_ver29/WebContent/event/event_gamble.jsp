<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>

<style type="text/css">

 .error-notice {
  margin: 5px 5px; /* Making sure to keep some distance from all side */
}

.oaerror {
  width: 90%; /* Configure it fit in your design  */
  margin: 0 auto; /* Centering Stuff */
  background-color: #FFFFFF; /* Default background */
  padding: 20px;
  border: 1px solid #eee;
  border-left-width: 5px;
  border-radius: 3px;
  margin: 0 auto;
  font-family: 'Open Sans', sans-serif;
  font-size: 16px;
}

.danger {
  border-left-color: #d9534f; /* Left side border color */
  background-color: rgba(217, 83, 79, 0.1); /* Same color as the left border with reduced alpha to 0.1 */
}

.danger strong {
  color:  #d9534f;
}

.warning {
  border-left-color: #f0ad4e;
  background-color: rgba(240, 173, 78, 0.1);
}

.warning strong {
  color: #f0ad4e;
}

.info {
  border-left-color: #5bc0de;
  background-color: rgba(91, 192, 222, 0.1);
}

.info strong {
  color: #5bc0de;
}

.success {
  border-left-color: #2b542c;
  background-color: rgba(43, 84, 44, 0.1);
}

.success strong {
  color: #2b542c;
}
  
  
.speech-bubble {
	position: relative;
	background: #00aabb;
	border-radius: .4em;
}

.speech-bubble:after {
	content: '';
	position: absolute;
	top: 0;
	left: 50%;
	width: 0;
	height: 0;
	border: 20px solid transparent;
	border-bottom-color: #FAE9D3;
	border-top: 0;
	border-left: 0;
	margin-left: -10px;
	margin-top: -20px;
}

</style>

</head>
<script
  src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
var a;
var i;
var me=3;
var me1 = "";
var resul = "";
var com;
var betPoint;
var getPoint=0;
var shot = 5;
var now = new Date();
day = now.getDate();
year = now.getFullYear();
month = now.getMonth()+1;
today = year +"-"+month+"-"+day;

$(function(){
		 shot=5-parseInt('${ck}');
	
	 $(".shot").html(shot);

	
	  $("#play").click(function(){
	 var regExp = /^[0-9]*$/;
	 betPoint=$("#bet").val()*1;
	 if(shot <= 0){
		 //alert('하루에 5번만 가능합니다');
		 $("#gbbModal_Content").html("<img src='event/daily/c5.png' style='float:left;'  ><span style='text-align:center; font-size:25px; margin-top:10%; display:block;'>하루에 5번만 가능합니다.</span>");
			$("#gbbModal").modal('show');
			
		 
		 
		 $("#bet").val("");	
		 
		 return false;
	 }
	 else{
	if(me==3){
		//alert('묵, 찌, 빠 중에 선택해주세요.');
		$("#gbbModal_Content").html("<img src='event/daily/c5.png' style='float:left;'  ><span style=' font-size:25px; margin-top:10%; display:block;'>묵, 찌, 빠 중에 선택해주세요.</span>");
		$("#gbbModal").modal('show');
		
	}
	else{
	 if($("#bet").val()==""){
	//	 alert('포인트를 넣으세요');
		 $("#gbbModal_Content").html("<img src='event/daily/c5.png' style='float:left;'  ><span style=' font-size:25px; text-align:center; margin:10% 20%; display:block;'>포인트를 넣으세요.</span>");
			$("#gbbModal").modal('show');
			
		 $("#bet").focus();
	 }
	 else{
    if(!regExp.test($("#bet").val())){
        //alert("숫자만 입력하시오(정수 값)");
        $("#gbbModal_Content").html("<img src='event/daily/c5.png' style='float:left;'  ><span style=' font-size:25px; margin-top:10%; display:block;'>숫자만 입력하시오(정수 값)</span>");
		$("#gbbModal").modal('show');
	
        
       // alert($("#bet").val());
        $("#bet").val("");

        $("#bet").focus();
     }
    else{
    	
    	if('${requestScope.point}'*1<betPoint){
    		//alert('보유한 포인트보다 높게 걸 수 없습니다.');
    		 $("#gbbModal_Content").html("<img src='event/daily/c5.png' style='float:left;'  ><span style='line-height:30px; font-size:25px; margin-top:10%; display:block;'>보유한 포인트보다 높게 걸 수 없습니다.</span>");
    			$("#gbbModal").modal('show');
    		
    	}else{
    		if(betPoint>20){
    			//alert('20포인트 이상 불가능');
    			 $("#gbbModal_Content").html("<img src='event/daily/c5.png' style='float:left;'  ><span style=' font-size:25px; margin-top:10%; display:block;'>20포인트 이상 불가능</span>");
     			$("#gbbModal").modal('show');
     	
    		}
    	else{
    		a = Math.floor(Math.random() * 9) + 10;
    		i = 0;
    		com = a%3;
    		play();
    	}
    }
    } 
	  }}}});//end click
	  
});
$(function(){
	  $("#r").click(function(){
		  $(".me").attr('src', './event/gamble/0.gif');
		  me=0;
	  });//end click
});
$(function(){
	  $("#s").click(function(){
		  $(".me").attr('src', './event/gamble/1.gif');
		  me=1;
	  });//end click
});
$(function(){
	  $("#p").click(function(){
		  $(".me").attr('src', './event/gamble/2.gif');
		  me=2;
	  });//end click
});

function play(){
	if(i==a) stop();
	else{
		
		i++;
		setTimeout("play()", 200);	
		$(".com").attr('src', './event/gamble/'+i%3+'.gif');
		
	}
}
function stop(){

	
	 if(me==0){
		if(com==0){
			 $("#gbbModal_Content").html("<img src='event/daily/c5.png' style='float:left;'  ><span style='text-align:center; font-size:25px; margin:10% 20%; display:block;'>무승부 입니다.</span>");
				$("#gbbModal").modal('show');
			resul = "무";
			//alert('무승부 입니다');
			getpoint=0;
			
		}
		else if(com==1){
			 $("#gbbModal_Content").html("<img src='event/daily/c5.png' style='float:left;'  ><span style='text-align:center; font-size:25px; margin:10% 20%; display:block;'>이겼습니다.</span>");
				$("#gbbModal").modal('show');
			
				resul = "승";
			//alert('이겼습니다');
			getPoint=betPoint;
		} 
		else if(com==2){
			 $("#gbbModal_Content").html("<img src='event/daily/c5.png' style='float:left;'  ><span style='text-align:center; font-size:25px; margin:10% 20%; display:block;'>졌습니다.</span>");
				$("#gbbModal").modal('show');
				resul = "패";
			//alert('졌습니다');
			getPoint= -betPoint;
		}
	}
	else if(me==1){
		if(com==1){
			 $("#gbbModal_Content").html("<img src='event/daily/c5.png' style='float:left;'  ><span style='text-align:center; font-size:25px; margin:10% 20%; display:block;'>무승부 입니다.</span>");
				$("#gbbModal").modal('show');
				resul = "무";
			//alert('무승부 입니다');
			getpoint=0;			
			
		}
		else if(com==2){
			 $("#gbbModal_Content").html("<img src='event/daily/c5.png' style='float:left;'  ><span style='text-align:center; font-size:25px; margin:10% 20%; display:block;'>이겼습니다.</span>");
				$("#gbbModal").modal('show');
				resul = "승";
			//alert('이겼습니다');
			getPoint=betPoint;
		}
		else if(com==0){
			 $("#gbbModal_Content").html("<img src='event/daily/c5.png' style='float:left;'  ><span style='text-align:center; font-size:25px; margin:10% 20%; display:block;'>졌습니다.</span>");
				$("#gbbModal").modal('show');
				resul = "패";
			//alert('졌습니다');
			getPoint= -betPoint;
		}
	}
	else if(me==2){
		if(com==2){
			 $("#gbbModal_Content").html("<img src='event/daily/c5.png' style='float:left;'  ><span style='text-align:center; font-size:25px; margin:10% 20%; display:block;'>무승부 입니다.</span>");
				$("#gbbModal").modal('show');
				resul = "무";
			//alert('무승부 입니다');
			getpoint=0;
		}
		else if(com==0){
			 $("#gbbModal_Content").html("<img src='event/daily/c5.png' style='float:left;'  ><span style='text-align:center; font-size:25px; margin:10% 20%; display:block;'>이겼습니다.</span>");
				$("#gbbModal").modal('show');
				resul = "승";
			//alert('이겼습니다');
			getPoint=betPoint;
		}
		else if(com==1){
			 $("#gbbModal_Content").html("<img src='event/daily/c5.png' style='float:left;'  ><span style='text-align:center; font-size:25px; margin:10% 20%; display:block;'>졌습니다.</span>");
				$("#gbbModal").modal('show');
				resul = "패";
			//alert('졌습니다');
			getPoint=-betPoint;
		}
	}
	 
	 $('#gbbModal').on('hide.bs.modal', function () { 
			$(".me").attr('src', './event/gamble/4.png');
			$(".com").attr('src', './event/gamble/4.png');
		});

	
	 $("#bet").val("");
	 if (me==0) me1 = "묵";
	 else if(me==1) me1="찌";
	 else if(me==2) me1="빠";
		  $.ajax({
			  url:"event_gambleAction.do",
			  dataType:'text',
			  type:'post',
			  data:{
				getPoint:getPoint,
				subject :'gamble',
				today : today,
				result : resul,
				me : me1
			  },
			  success:function(data){			  
				 var dd=new Array();
				dd=data.toString().split('|');
				//dd[0] 개인 스탯 dd[1] point  dd[2] ck ㄱ
				var re=JSON.parse(dd[0]);
				 
				
				var newPoint=dd[1];
				var newCk=dd[2];
				$(".havePoint").empty();
				$(".havePoint").html(newPoint);
					$(".shot").html(5-newCk);
					shot=5-newCk;
					var per= parseFloat(re[0].win/re[0].count).toFixed(2);
					if(parseInt(re[0].count)==0)per=0;
					
					//나머지는 유저 현재 상황 스탯 을뿌리기
					// 0:아이디 , 1:승리횟수 , 2:승률 , 3:묵으로 승리 , 4:찌로승리 ,5:빠로 승리 , 6:총 횟수 , 7:총 승리
					
					$(".gam_stat").eq(0).html('${sessionScope.Id}');
					$(".gam_stat").eq(1).html(re[0].win);
					$(".gam_stat").eq(2).html(per*100);
					$(".gam_stat").eq(3).html(re[0].winbymook);
					$(".gam_stat").eq(4).html(re[0].winbyjji);
					$(".gam_stat").eq(5).html(re[0].winbybba);
					$(".gam_stat").eq(6).html(re[0].allc);
					$(".gam_stat").eq(7).html(re[0].allw);
					
					
			  },
			  error:function(data){
				  alert("에러");
			  }
			  });
		  
		  resul = "";
		  me=3;
		  me1 = "";
}
			  
		  
	  
  
	
</script>
<body>
	<jsp:include page="../side.jsp">
	<jsp:param value="event_gamble" name="selectMenu"/>
	</jsp:include>
	<div class="main-panel">
	<jsp:include page="../top.jsp"></jsp:include>
	
	<div class="content">
	
	<div class="container-fluid">
	<div class="row ">
	<div class='col-md-12'>
	<div class="alert alert-info">
	가위바위보 이벤트
	</div>
	
	
	<div class="col-md-4 col-sm-6" style="min-width:400px;" >
	<div class="card">
	<div class="card-header" data-background-color="orange">
	가위바위보
	</div>
	<div class="card-content">
	<!--  가위바위보 프레임 만듬 -->
	<div class="row">
	<div class="col-md-4 alert-warning alert" style="max-height: 200px; text-align: center; " >
	<img alt="" src="./event/gamble/4.png" width="100%" class="me">
	<span style="font-size:0.8em; ">User</span>
	</div>
	<div class="col-md-4" style="max-height: 200px;">
	<img alt="" src="./event/gamble/versus.png" width="100%">
	
	</div>
	<div class="col-md-4 alert-warning alert" style="max-height: 200px; text-align: center;">
	<img alt="" src="./event/gamble/4.png" width=100%;  class="com" >
	<span style="font-size:0.8em;">Com</span>
	
	</div>
	
	</div>
	
	
	<div class="row">
	<div class="col-md-4 alert alert-info" style="max-height: 200px; text-align: center;">
	<a id="r"><img id="1" src="./event/gamble/0.gif" alt=""  id="r" width="100%"/></a>
	</div>
	<div class="col-md-4 alert alert-success" style="max-height: 200px; text-align: center;">
	<a id="s"><img id="2" src="./event/gamble/1.gif" alt=""  id="r" width="100%"/></a>
	</div>
	<div class="col-md-4 alert " style="max-height: 200px; text-align: center;background-color: #F2AFFF;">
	<a id="p"><img id="3" src="./event/gamble/2.gif" alt=""  id="r" width="100%"/></a>
	</div>
	
	</div>
	
	<div class="row">
	
	<div class="error-notice" >
          <div class="oaerror danger" style=" height:40px;">
            <div style="margin-top:-2%; font-size:0.8vw;" >
            <strong> <i class="material-icons" style="vertical-align:middle; font-size: 1vw;">content_copy</i></strong>
            보유 포인트 ▶ <span class="havePoint">${requestScope.point }</span>Point</div>
          </div>
          <div class="oaerror warning" style="height:40px;">
            <div style="margin-top:-2%; font-size:0.8vw;  width: 90%;" >
            <strong> <i class="material-icons" style="font-size: 1vw;">perm_identity</i></strong> 
             <input type="text" id="bet" class="" placeholder="배팅 포인트" style="vertical-align:middle; background-color:#FFDBAD; border:1px solid #89CEFA; display: inline;"  />
                             
             </div>
          </div>
          <div class="oaerror info" style="height:40px;">
            <div style="margin-top:-2%; font-size:0.8vw;">
            <strong  id="play"><i class="material-icons" style=" vertical-align:middle; font-size: 1vw; cursor:pointer; " title="도전하기!"  >label</i></strong>
          도전 횟수 ▶ <span class="shot" style=""></span></div>
          </div>
          
         <div class="speech-bubble" style="width:100px; margin-left:5%; text-align:center; background-color:#FAE9D3; color:53ADE0; font-weight: bold;">도전하기</div>
        </div>
	
	
	
              
	</div>
	
	
	
	</div>
	</div> 
	</div><!--  가위바위보 이벤트끝 -->
	
	<div class="col-md-4" style="min-width:400px;">
	<div class="card">
	<div class="card-header" data-background-color="orange">
	<strong>추천 전략</strong>
	</div>
	<div class="card-content">
	
	
	<div class="row" id="rule_explain">
	<div class="col-md-1">
	<i class="material-icons" style="font-size: 1vw;">pan_tool</i>
	</div>
	<div class="col-md-11"  style="font-size: 0.7vw;">
	 상대가 이겼을 경우에는 둘 다 내지 않았던 것을 내고, 상대가 졌을 경우 상대가 내서 졌던 것을 낸다!
	</div>
	</div>
	
	<div class="row" id="rule_explain">
	<div class="col-md-1">
	<i class="material-icons" style="font-size: 1vw;">pets</i>
	</div>
	<div class="col-md-11" style="font-size: 0.7vw;">
	「남자는 주먹」 혹은 「나는 무엇을 낼거야」, 「(시작하기도 전에 셋 중 하나를 내밀고)이걸로 간다」라는 발언을 한다.!
	</div>
	</div>
	
	<div class="row" id="rule_explain">
	<div class="col-md-1">
	<i class="material-icons" style="font-size: 1vw;" >rowing</i>
	</div>
	<div class="col-md-11" style="font-size: 0.7vw;">
	상대의 얼을 빼놓은 사이 슬쩍 '안 내면 진다 가위바위보'를 외쳐 부전승을 거둔다!
	</div>
	</div>
	<div class="row alert-info alert">유저 현재 상황</div>
	
	
	<div class="row">
	
	
	
	<c:forEach items="${requestScope.result }" var="list">
	
	<div class="error-notice" >
          <div class="oaerror danger" style=" height:40px;">
            <div style="margin-top:-2%; font-size:0.8vw;">
            <strong> <i class="material-icons" style="vertical-align:middle; font-size: 1vw;">content_copy</i></strong>
           	 아이디 ▷<span class="gam_stat">${sessionScope.Id }</span> </div>
          </div>
          <div class="oaerror warning" style="height:40px;">
            <div style="margin-top:-2%; font-size:0.8vw;  width: 90%;" >
            <strong> <i class="material-icons" style="vertical-align:middle; font-size: 1vw;">perm_identity</i></strong> 
			승리 횟수 ▷<span class="gam_stat"> ${list.win }</span> 회                         
             </div>
          </div>
          <div class="oaerror info" style="height:40px;">
            <div style="margin-top:-2%; font-size:0.8vw;">
            <strong  id="play"><i class="material-icons" style="vertical-align:middle; font-size: 1vw cursor:pointer; "   >label</i></strong>
         	 승률 ▷<span class="gam_stat"><c:if test="${list.count eq 0 }">0</c:if>
         	 <c:if test="${list.count ne 0 }">${fn:substring((list.win/list.count)*100,0,4) }</c:if>
         	 </span> %</div>
          </div>
           <div class="oaerror danger" style="height:40px;">
            <div style="margin-top:-2%; font-size:0.8vw;">
            <strong  id="play"><i class="material-icons" style="vertical-align:middle; font-size: 1vw cursor:pointer; "   >grade</i></strong>
         	 묵으로 승리 ▷<span class="gam_stat"> ${list.winbymook }</span>회</div>
          </div>
           <div class="oaerror warning" style="height:40px;">
            <div style="margin-top:-2%; font-size:0.8vw;">
            <strong  id="play"><i class="material-icons" style="vertical-align:middle; font-size: 1vw cursor:pointer; "   >group_work</i></strong>
         	 찌로 승리 ▷<span class="gam_stat"> ${list.winbyjji }</span>회</div>
          </div>
           <div class="oaerror info" style="height:40px;">
            <div style="margin-top:-2%; font-size:0.8vw;">
            <strong  id="play"><i class="material-icons" style="vertical-align:middle; font-size: 1vw cursor:pointer; "   >loyalty</i></strong>
         	 빠로 승리 ▷<span class="gam_stat"> ${list.winbybba }</span>회</div>
          </div>
           <div class="oaerror danger" style="height:40px;">
            <div style="margin-top:-2%; font-size:0.8vw;">
            <strong  id="play"><i class="material-icons" style="vertical-align:middle; font-size: 1vw cursor:pointer; "   >pets</i></strong>
         	 총 횟수  ▷<span class="gam_stat">${list.allc }</span>회</div>
          </div>
           <div class="oaerror warning" style="height:40px;">
            <div style="margin-top:-2%; font-size:0.8vw;">
            <strong  id="play"><i class="material-icons" style="vertical-align:middle; font-size: 1vw cursor:pointer; "   >label</i></strong>
         	 총 승리수 ▷<span class="gam_stat"> ${list.allw }</span>회</div>
          </div>
           
         
        </div>
	
	</c:forEach>
	
	
	
	     
	</div>
	
	</div>
	
	
	
	
	
	</div>
	
	
	
	</div>
		<div class="col-md-4" style="min-width:300px;">
	<div class="card">
	<div class="card-header" data-background-color="orange">
	<Strong>가위바위보의 개요</Strong>
	</div>
	<div class="card-content">
	<div class="col-md-10 col-md-offset-1">
	<img alt="" src="./event/gamble/gbb.gif" style="max-height:300px">
	</div>
	<div class="col-md-12">
	<div class="alert alert-info">게임 룰 설명</div>
	</div>
	
	<div class="col-md-10 col-md-offset-1" style="line-height:30px; background-color:#FAE9D3; margin-bottom:20px;">
	${sessionScope.Id  }님 께서는 하루에 총 5번 가위바위보를 하실 수 있습니다.<br/>
	배팅 포인트는 20이상 하실 수 없습니다.<br/>
	가위바위보를 시작하기전에 추천 전략을 보시면 더 좋은 결과를 나올 겁니다.<br/>
	${sessionScope.Id  }님의 가위바위 기록을 보시고 현명한 판단을 
	하는데 도움이 될 겁니다.<br/>
	그럼 ${sessionScope.Id  }님에게 좋은 결과를 있기를 기대합니다.
	</div>
	</div>
	
	</div><!--  승률 현황 -->
	
	
	</div>
	
	
	
	
	
	</div><!--  룰 설명끝 -->
	
	
	

	
	</div>
	
	
	
	
		 
				 
				 
				 <div class="modal fade" id="gbbModal" role="dialog" aria-labelledby="myLargeModalLabel">
    			<div class="modal-dialog ">
    
      				<!-- Modal content-->
         		<div class="modal-content "  style="height:300px;" >
                <div class="modal-header alert alert-info"">
                            <h4>가위바위보 이벤트</h4>
                                
                         </div>
                         
              	<div class="modal-body" id="gbbModal_Content">
              
              	</div>
                     
                     
                     
                     
                     
                         </div>
			 	
     			 </div>
    		</div>
    
	
	
	
	
	</div>
	</div>
		
	</div>
	
	
	
	
	
	
	
	

</body>
</html>