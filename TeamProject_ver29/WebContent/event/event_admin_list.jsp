<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta
   content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
   name='viewport' />
<meta name="viewport" content="width=device-width" />
<!-- Bootstrap core CSS     -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<!--  Material Dashboard CSS    -->
<link href="assets/css/material-dashboard.css?v=1.2.0" rel="stylesheet" />
<!--     Fonts and icons     -->
<link
   href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
   rel="stylesheet">
<link
   href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons'
   rel='stylesheet' type='text/css'>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<script type="text/javascript">


	var sub = '${subject}';

	function a(){
		
		
		$.ajax({
			
			type : "POST",
			url : "event_main_choiceCheck.do",
			data : {subject : sub},
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			dataType : 'html',
			success : function(data) { 
				if(data=="0"){
					choice();
				}else{
					$('#alertContent').html("이미 추첨하였습니다.");
					$('#myModal10').modal('show');
				}
			},
			error : function(data) {
				alert("에러");			
			
		}
		});
		
		
	}
// 		window.location.reload(true);
		function choice(){
			$.ajax({
				
				type : "POST",
				url : "event_main_choice.do",
				data : {subject : sub},
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				dataType : 'html',
				success : function() { 
					window.location.reload(true);
				},
				error : function(data) {
					alert("에러");			
				
			}
			});
		}
	


</script>

<body>
   <div class="card">
      <div class="card-header" align="center" style="background: currentColor;">
         <h1><font color="white">${subject }</font></h1>
      </div>
      <div class="card-content">
	<input type="button" value="추첨" onclick="a()">
      </div>
      
      <div class="card-content" >
            <c:if test="${fn:length(adminJoin) == 0 }">
		참여한 유저가 없음

		</c:if>
      <c:if test="${fn:length(adminJoin) != 0 }">
         <table class=" table table-striped">
            <tr>
               <th>참여 ID</th>
               <th>참여일시</th>
               <th>당첨여부</th>
            </tr>
            <c:forEach items="${adminJoin}" var="list">
            <tr>
              	<td>${list.id }</td>
				<td>${list.dateEnter }</td>
               <th><i class="material-icons"><span id="${list.id }a"></span></i></th>
            </tr>
            <script type="text/javascript">
            
            var id = '${list.id}';
            
            if('${list.ck}'=="o"){
            	$('#'+id+'a').html("check");
            }else if('${list.ck}'=="x"){
            	$('#'+id+'a').html("clear");
            }else $('#'+id+'a').html("remove");
            
            
            </script>
            
            </c:forEach>
         </table> 
         </c:if>  
      </div>
      <div class="card-footer">
      
      </div>
   
   </div>
</body>

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
</html>