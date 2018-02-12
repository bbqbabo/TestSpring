<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8" />
    <link rel="icon" type="image/png" href="assets/img/favicon.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>22세기 운동혁명</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" initial-scale=1/>
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
</head>
<body>
 <div class="col-md-12">
 <div class="card card-plain">
  <div class="card-header" style="background: linear-gradient(60deg, #00bcd4, #eee);";>
   <h4 class="title">운동과 식단에 관한 정보를 나누어 주세요</h4>
   </div>
  <form method="post" action="">
   <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
    <tbody>
     <tr>
      <td><input type="text" class="form-control" placeholder="글제목" name="" maxlength="50"></td>
       </tr>
     <tr>
      <td><textarea class="form-control" placeholder="글내용" name="" maxlength="2048" style="height: 350px;"></textarea></td>
     </tr>
    </tbody>
   </table>
    <input type="submit" class="btn btn-info pull-right" value="삭제완료"/>
  </form>
 </div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>