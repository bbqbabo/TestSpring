<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  <script type="text/javascript">

  $(document).ready(function(){
	  readChatRequest();	
	  
	  $('.insertPanel').hide();
  });
  
  function readChatRequest() {
	  $.ajax({  
		  type: "Post",
           url: 'chatReqRead.do',
           contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
           dataType:'html',
           success: function(data)
           {
				$('.chatRequestPanel').empty();
				$('.chatRequestPanel').html(data);
           },
           error:function(data){
        	   alert("에러");
           }
      });
  }
  
  var webSocket = null;
  function selectChatRequest(idx, req_id) {
	  $('#message').val('');
	  $('.room').css('background','white');
	  var nowRoom = $('#status'+idx).parents('.room');
	  nowRoom.css('background','#eeeeee');
	  nowRoom.find('.badge').hide();
	  
	  if(webSocket != null) onClose();
	  
		$.ajax({  
			  type: "Post",
	           url: 'chatReqStatus.do',
	           async: false,
	           data: {
	        	   idx : idx
	           },
	           contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
	           dataType:'html',
	           success: function(data)
	           {
	        	   var status = data*1;
	        	   var resp_level = 1;
	        	   
	        	   if($('#resp_id'+idx).val() == 'admin') {
	        			  resp_level = 6;
	        			  status = 1;
	        			  $('.chatRoomPanel').show();
	        			  $('.insertPanel').hide();
	        	   }
	        	   else if('${sessionScope.Level}' >= 4) {
	        			  
	        			  if(status == 2) {
	        				  if(!confirm("상담을 시작하시겠습니까?")) return;  
	        				  
	        				  $('#status'+idx).text("상담 중");
	        				  $('#status'+idx).removeClass('label-danger');
	        				  $('#status'+idx).addClass('label-success');
	        				  $('#status'+idx).after(" - <img src='images/level/" + '${sessionScope.Level }.jpg' + "' style='width:22px; height:22px;'><b><span id='resp${list.idx}'>" + '${sessionScope.Id}' + "</span></b>");
	        				  $('.chatRoomPanel').show();
	        				  $('.insertPanel').show();
	        			  }
	        			  else if(status == 1) {
	        				  if($('#resp_id'+idx).val() != '${sessionScope.Id}') {
		        				  $('#alertContent').html('이미 상담 중입니다.');
		        				  $('#myModal10').modal('show');
	        					  $('.chatRoomPanel').hide();
	        					  $('.insertPanel').hide();
	        					  nowRoom.css('background','white');
	        					  return;
	        				  }
	        				  $('.insertPanel').show();
	        			  }
	        			  else if(status == 0) {
	        				  $('#alertContent').html('상담이 종료되었습니다.');
	        				  $('#myModal10').modal('show');
	        				  $('.chatRoomPanel').hide();
	        				  $('.insertPanel').hide();
	        				  nowRoom.css('background','white');
	        				  return;
	        			  }
	        			  
	        			  $('#resp_id'+idx).val('${sessionScope.Id }');
	        			  resp_level = '${sessionScope.Level}';
	        		  }
	        		  else {
	        			  if($('#status'+idx).text() == "상담요청") {
	        				  $('#alertContent').html('상담요청 상태입니다.');
	        				  $('#myModal10').modal('show');
	        				  $('.chatRoomPanel').hide();
	        				  $('.insertPanel').hide();
	        				  nowRoom.css('background','white');
	        				  return;
	        			  }
	        			  else if(status == 0) {
	        				  $('.chatRoomPanel').show();
								$('.insertPanel').hide();
	        			  }
	        			  else {
	        				  $('.chatRoomPanel').show();
	        				  $('.insertPanel').show();
	        			}
	        		  }
	        	   
	        		  $.ajax({ 
	        			  type: "Post",
	        	           url: 'chatRead.do',
	        	           data: {
	        	        	   idx : idx,
	        	        	   req_id : req_id,
	        	        	   resp_id : $('#resp_id'+idx).val(),
	        	        	   resp_level : resp_level,
	        	        	   status : status
	        	           },
	        	           contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
	        	           dataType:'html',
	        	           success: function(data)
	        	           {
	        	        	   if(status != 0) startChat();
	        					$('.chatRoomPanel').empty();
	        					$('.chatRoomPanel').html(data);
	        					$("#chatroom").scrollTop($("#chatroom")[0].scrollHeight);
	        	           },
	        	           error:function(data){
	        	        	   alert("에러");
	        	           }
	        	      });
	           },
	           error:function(data){
	        	   alert("에러");
	           }
	      });
  }
  
  function quit(idx) {
	  event.stopPropagation();
	  $.ajax({  
		  type: "Post",
           url: 'chatQuit.do',
           data: {
        	   idx : idx
           },
           contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
           dataType:'html',
           success: function(data)
           {
				$('.chatRequestPanel').empty();
				$('.chatRequestPanel').html(data);
           },
           error:function(data){
        	   alert("에러");
           }
      });
  }
  
  function deleteReq(idx) {
	  event.stopPropagation();
	  $.ajax({  
		  type: "Post",
           url: 'chatDelete.do',
           data: {
        	   idx : idx
           },
           contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
           dataType:'html',
           success: function(data)
           {
				$('.chatRequestPanel').empty();
				$('.chatRequestPanel').html(data);
				$('.chatRoomPanel').empty();
           },
           error:function(data){
        	   alert("에러");
           }
      });
  }
  $(function(){
		$('#req_btn').click(function(){
			if('${sessionScope.Point }' < 100) {
				$('#alertContent').html('포인트가 부족합니다.');
				$('#myModal10').modal('show');
			 	return;
			}
			
			if($('#req_subject').val().length == 0) {
				$('#alertContent').html('상담 주제를 입력하세요.');
				$('#myModal10').modal('show');
				return;
			}
			
			if(!confirm("상담을 신청하시겠습니까?")) return;
			
			  $.ajax({  
				  type: "Post",
		           url: 'chatReqInsert.do',
		           data: {
		        	   req_subject : $('#req_subject').val()
		           },
		           contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		           dataType:'html',
		           success: function(data)
		           {
						$('.chatRequestPanel').empty();
						$('.chatRequestPanel').html(data);
						$(".chatRequestPanel").scrollTop($(".chatRequestPanel")[0].scrollHeight);
						$('#req_subject').val('');
		           },
		           error:function(data){
		        	   alert("에러");
		           }
		      });	
		});
  });
  </script>
<style type="text/css">
.insertPanel, .insertPanel2 {
	margin-top:10px;
	margin-bottom:20px;
}
.width6{
	padding:0px;
}
</style>
</head>

<body>
<%
   //치환 변수 선언
    pageContext.setAttribute("cn", "\n"); //Enter
    pageContext.setAttribute("br", "<br/>"); //br 태그
%> 
	<div class="card">
        <div class="card-header" data-background-color="purple">
            <h4 class="title">1:1 상담</h4>
            <p class="category">Lv1~3회원이 Lv4~5회원에게 상담을 신청하고 1:1 상담을 진행합니다.</p>
        </div>
        <div class="card-content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-6 width6">
						<div class="chatRequestPanel" style="overflow-y:scroll; height:420px;">
						</div>
						<div class="insertPanel2" style="height:50px;">
							<c:if test="${sessionScope.Level < 4}">
								<table width=100%>
									<tr>
										<td><textarea class="form-control" id="req_subject" cols="60" placeholder="상담주제를 입력하세요."></textarea></td>
										<td><button class="btn btn-primary" id="req_btn">신청</button></td>
									</tr>
								</table>
							</c:if>	
						</div>
					</div>
					<div class="col-md-6 width6">
						<div class="chatRoomPanel" style="height:420px;">
						</div>
						<div class="insertPanel" style="height:50px;">
							<table width=100%>
								<tr>
									<td>	
										<textarea onkeyUp="chkEnter();" class="form-control" id="message" cols="60" placeholder="메세지를 입력하세요."></textarea>
									</td>
									<td>
										<button class="btn btn-primary" onclick="send();">보내기</button>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
  	
function startChat() {
	webSocket = new WebSocket('ws://' + '${pageContext.request.serverName}' + ':8080' + '${pageContext.request.contextPath}' + '/broadcasting');
	
	webSocket.onerror = function(event) {
		onError(event)
	};
	
	webSocket.onopen = function(event) {
		onOpen(event)
	};
	
	webSocket.onmessage = function(event) {
		onMessage(event)
	};
	
	webSocket.onclose = function(event) {
		onClose(event)
	};
}	
function onMessage(event) {
	$("#chatroom").append(event.data);
	$("#chatroom").scrollTop($("#chatroom")[0].scrollHeight);
}

function onOpen(event) {
//  	$("#chatroom").append("<div class='chatNotice'>상담방에 입장했습니다.</div><br>");
	$("#chatroom").scrollTop($("#chatroom")[0].scrollHeight);
}

function onError(event) {
	alert(event.data);
}

function onClose(event) {
	if(webSocket != null && webSocket.bufferedAmount == 0) {
		webSocket.close();
	}
// 	$("#chatroom").append("<span>연결 종료</span><br>");
// 	$("#chatroom").scrollTop($("#chatroom")[0].scrollHeight);
}

function send() {
	var date = new Date(); 
	var hour = date.getHours();
	var h = "";
	if(hour == 12) {
		h = "오후";
	}
	else if(hour > 12) {
		hour = date.getHours() - 12;
		h = "오후";
	}
	else if(hour < 12) {
		hour = date.getHours();
		h = "오전";
	}
	var now = date.getFullYear() + ". " + (date.getMonth()+1) + ". " + date.getDate() + " " + h + " " + hour + ":" + date.getMinutes() + ":" + date.getSeconds();
	$("#chatroom").append("<div class='sendMessage'><p>" + $('#message').val().replace(/\n/gi,'<br>') + "</p><span>" + now + "</span></div><div style='clear:both'></div>");
	$("#chatroom").scrollTop($("#chatroom")[0].scrollHeight);
	webSocket.send($('#message').val());
	$('#message').val('');
}

function chkEnter() {
    if (event.which || event.keyCode) {
        if ((event.which == 13) || (event.keyCode == 13)) {
            send();
            return false;
        }
    }
    else {       
        return true;
    }
}


</script>
</body>
</html>