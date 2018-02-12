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
</head>
	
<body>
	<jsp:include page="../side.jsp"></jsp:include>
	<div class="main-panel">
		<jsp:include page="../top.jsp"></jsp:include>
		<div class="content">
			<div class="card card-plain">
				<div class="card-header" style="background: linear-gradient(60deg, #9703b1, #eee);">
 					<h4 class="title">즐거움을 나누어 주세요</h4>
 				</div>
 				<form action="board/Free_Board_update.jsp" method="post">
 				<input type="hidden" value="${dto.num }" id="read_num" name="read_num">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						<tbody>
	 						<tr>
	  							<td><input type="text" class="form-control" name="read_subject" id="read_subject" maxlength="50" value="${dto.subject }" readonly="readonly"></td>
							</tr>
							<tr>
	 							<td><textarea class="form-control" name="read_content" id="read_content" maxlength="2048" style="height: 350px;" readonly="readonly">${dto.content }</textarea></td>
	     					</tr>
	    				</tbody>
	   				</table>
   				   </form>
   				   <input type="submit" class="btn btn-primary" value="글수정">
   				   <input type="submit" class="btn btn-primary" value="글삭제">
    			<a class="btn btn-primary pull-right" href="board.do">글목록</a>
 			</div>
		</div>
	</div>
</div>
</body>
</html>