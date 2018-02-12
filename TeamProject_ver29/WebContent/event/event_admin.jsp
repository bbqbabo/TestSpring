<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<body>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">

function joinUser(sub){
	
	$.ajax({
		type:'post',
		url : "event_adminList.do",
		data : {subject : sub},
		success:function(data){
		$('#cont12').html(data);			
		},
		error : function(error) {
			alert(error + ", " + error.status);
		}
	});
	
	
	
	
}

$(function(){
		
		
	  $("#write").click(function(){
		
		  
		  location.href='event_main_write.do';
	  });//end click
	  
	  
	  
	  
});
$(function() {
	$("input[id=change]").change(function() {
		var form = $("#form");
		var formData = new FormData(form);
		formData.append('file', this.files[0]);
		$.ajax({
			type : 'post',
			url : 'fileUploadAction.do',
			data : formData,
			processData : false,
			contentType : false,
			success : function(savefile) { // 업로드 성공하면 파일명을 받아온다.
				$('#change1').val(savefile);
			},
			error : function(error) { // 실패할 경우 에러메세지 출력
				console.log(error);
				console.log(error.status);
				alert(error + ", " + error.status);
			}
		});
	});
});

function mainChange(){
	if($('#change1').val()==""){
		$('#alertContent').html("변경할 이미지를 선택해주세요.");
		$('#myModal10').modal('show');
		return;
		
	}
	
	$.ajax({
		type : 'post',
		url : 'event_main_change.do',
		data : {img : $('#change1').val()},
		success : function() { 
			$('#alertContent').html("변경완료.");
			$('#myModal10').modal('show');
		},
		error : function(error) { 
			alert('에러');
		}
	});
	
}
</script>
<jsp:include page="../side.jsp">
	<jsp:param value="event_admin" name="selectMenu"/>
	</jsp:include>
<div class="main-panel">
<jsp:include page="../top.jsp"></jsp:include>
<div class="content">
<div class="container-fluid">
	<div>
	이벤트 관리자 페이지
	
	이벤트 눌러서 해당이벤트 참여자 볼수있고
	참여형 경우 버튼눌렀을때 랜덤으로 추첨

	추첨해서 바로 문자로 당첨메세지 보내기
	
	이벤트 당첨된 사람들은 evententer check 컬럼을 o로 update하고
	where subject and check != 로 추첨안된사람 당첨x로 update
		
		
		사진 규격 : 
		<input type="button" value="글쓰기" id="write"><br>
		메인이벤트 페이지 우측 그림 바꾸기<br>
		현재 메인 우측 이미지 : ${mainRight }
		<input type="file" id="change"> <input type="button" id="change2" value="변경" onclick="mainChange()">
		<input type="hidden" id="change1" value="">
		</div>
		
		<div>

		
		
		</div>
<div style="border: 1px solid red; float: left; width: 35%;">
		<c:if test="${fn:length(eventMain) != 0 }">
		<c:forEach items="${eventMain }" var="list">
	
			<div>
			<a href="javascript:void(0)" onclick="joinUser('${list.subject}')"><img src="upload/${list.imgMain }"></a>
			
			
			</div>
		
		
		</c:forEach>
		</c:if>
</div>
<div style="border: 1px solid red; float: left; width: 10%;"> </div>
	<div id="cont12" style=" background-repeat:no-repeat; border: 1px solid red; float: left; width: 55%; background-size:100%; height:850px;" >
	<h1><span id="subject"></span></h1>
	
	</div>
</div>

</div>
</div>
</body>
</html>