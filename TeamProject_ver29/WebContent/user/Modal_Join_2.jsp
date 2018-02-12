<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	<script type="text/javascript">
	
	function Login_Return(){
		var url="user/Modal_Join_2.jsp";
	  	$('.modal-content').empty();
	    $('.modal-content').load(url,function(result){
	 	$('#myModal').modal({show:true});
	 	});
	}
	
	function Login_Direct(){
		location.href="loginAction.do?Id="+Join_Id+", Password = "+Join_Pw;
	}
			
	
	</script>
</head>
<body>
	<div class="modal-header">
         <div align="center" style="
               margin-top: -50px; 
               padding-left: 5px; 
               margin-left: 5px; 
               background: linear-gradient(60deg, #fff600, #983a3a); 
               border-radius:5px; 
               box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 3px 1px -2px rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12);
               height:90px;">
           <h4 id="myModalLabel" style="padding-top:20px; font-size: 30px; font-weight: bold;"><font color="white">Welcome!!</font></h4>
        </div>
	</div>
	<div class="modal-body" style="height: 550px; padding-bottom: 3px">
		<div class="container">
			<div class="col-md-12" style="margin-left: 70px; margin-bottom: 20px;">
				<img src="user/logo.png">
			</div>
			<div class="col-md-12" style="margin-left: 27px;">
				<button class="btn btn-info btn-lg" style="background:#f44336;" onclick="Login_Return();">로그인 창으로 돌아가기</button>
				<button class="btn btn-info btn-lg" style="background:#4caf50;" onclick="Login_Direct();">가입한 정보로 로그인</button>
			</div>
		</div>
	</div>	
	<div class="modal-footer" style="margin-top: -15px;">
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	</div>
</body>
</html>