<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<!-- 


 -->

<link rel="stylesheet" href="ex_rkh/ex.css">


<!-- Bootstrap core CSS     -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />

<!-- Animation library for notifications   -->
<link href="assets/css/animate.min.css" rel="stylesheet" />

<!--  Paper Dashboard core CSS    -->
<link href="assets/css/paper-dashboard.css" rel="stylesheet" />

<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="assets/css/demo.css" rel="stylesheet" />

<!--  Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300'
	rel='stylesheet' type='text/css'>
<link href="assets/css/themify-icons.css" rel="stylesheet">



</head>

<body>



	<script type="text/javascript">
		function exercise_board() {

			// 癲ワ옙���뀐옙占쏙옙占쏙옙占썲���뀐옙占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占� 占쏙옙占쏙옙���뀐옙占쏙옙占썲������占쏙옙占쏙옙���뀐옙占쏙옙占쏙옙占� 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占쎈�곗��占쏙옙占쏙옙占쏙옙占쏙옙��占�,占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙������占쏙옙占쎈���繹�占썲������占쏙옙������占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙占쎌�쎌��占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙.
			$
					.ajax({
						type : "POST",
						url : "exercise_board.do",
						contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
						dataType : 'html',
						success : function(data) {

							$(".test").empty();
							$(".test").html(data);

						},
						error : function(data) {
							alert("占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙");
						}
					});
		}

		function ex_post() {

			$.ajax({
				url : "ex_post.do",
				dataType : 'html',
				type : 'post',
				success : function(data) {
					$(".test").empty();
					$(".test").html(data);
				},
				error : function(data) {
					alert("ex_post ���닿�吏����듬����");
				}

			});//end ajax

		}

		/*  
		   
		데이터 값이 넘겨줄때 "num ="+num 이런식으로 
		여러개면 "num="+num &"name="+name ? 콤마 주의 
		 */

		function ex_read(num) {
			$
					.ajax({
						type : "POST",
						url : "ex_read.do",
						data : "num=" + num,
						contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
						dataType : 'html',
						success : function(data) {
							$(".test").empty();
							$(".test").html(data);
						},
						error : function(data) {
							alert("ex_read 오류가...");
						}
					});

		}

		/* function ex_selfcheck(){
		 
		 $.ajax({
		      url:"ex_selfcheck.do",
		      dataType:'html',
		      type:'post',
		      success:function(data){
		         $(".test").empty();
		         $(".test").html(data);
		      },
		      error:function(data){
		         alert("ex_selfcheck 오류 ");
		      }
		      
		   });//end ajax
		 
		 
		} */
	</script>




	<jsp:include page="../side.jsp"></jsp:include>
	<div class="main-panel">
		<jsp:include page="../top.jsp"></jsp:include>
		<div class="content">




	<div class="container-fluid">

		<div class="row info" style="text-align: center;">
			<div class="col-xs-12 alert alert-info">
				The skills meter from <a class="alert-link"
					href="http://bootsnipp.com/snippets/featured/progress-bar-meter">here</a>
				is used in this design. Feel free to remove this div from the
				design.
			</div>
		</div>


		<!--  test  -->
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-offset-1 col-md-10 col-lg-offset-2 col-lg-8">
				<div class="panel panel-default">

					<!--  c:forEach 구문  -->
					<c:forEach items="${ex_selfcheck_list}" var="la">

						<div class="panel-heading resume-heading">
							<div class="row">
								<div class="col-lg-12">
									<div class="col-xs-12 col-sm-4">
										<figure> <!-- 밑에는 forEach 블록이 동작을 안해서 아예 img태그가 안나와요. forEach 잘 동작하면 넣어봐요 -->
										<!--  jsp페이지에서는 /upload/받아온 파일명 --> <!-- upload 앞에는 / 필요없어요 -->
										<img class="img-circle img-responsive" alt=""
											src="upload/${pic}" width="175" height="250" float="left" />

										</figure>

										<div class="row">
											<div class="col-xs-12 social-btns">

												<div class="col-xs-3 col-md-1 col-lg-1 social-btn-holder">
													<a href="#" class="btn btn-social btn-block btn-google">
														<i class="fa fa-google"></i>
													</a>
												</div>

												<div class="col-xs-3 col-md-1 col-lg-1 social-btn-holder">
													<a href="#" class="btn btn-social btn-block btn-facebook">
														<i class="fa fa-facebook"></i>
													</a>
												</div>

												<div class="col-xs-3 col-md-1 col-lg-1 social-btn-holder">
													<a href="#" class="btn btn-social btn-block btn-twitter">
														<i class="fa fa-twitter"></i>
													</a>
												</div>

												<div class="col-xs-3 col-md-1 col-lg-1 social-btn-holder">
													<a href="#" class="btn btn-social btn-block btn-linkedin">
														<i class="fa fa-linkedin"></i>
													</a>
												</div>

												<div class="col-xs-3 col-md-1 col-lg-1 social-btn-holder">
													<a href="#" class="btn btn-social btn-block btn-github">
														<i class="fa fa-github"></i>
													</a>
												</div>

												<div class="col-xs-3 col-md-1 col-lg-1 social-btn-holder">
													<a href="#"
														class="btn btn-social btn-block btn-stackoverflow"> <i
														class="fa fa-stack-overflow"></i>
													</a>
												</div>

											</div>
										</div>

									</div>


									<!--  잘나옴-->

									<div class="col-xs-12 col-sm-8">

										<!-- 밑에는 forEach 블록이 동작을 안해서 아예 img태그가 안나와요. forEach 잘 동작하면 넣어봐요 -->
										<!--  jsp페이지에서는 /upload/받아온 파일명 -->
										<!-- upload 앞에는 / 필요없어요 -->

										<ul class="list-group">
											<li class="list-group-item">${la.userId }</li>
											<li class="list-group-item">${la.excercise_name }</li>
											<li class="list-group-item">${la.calorie }</li>
											<li class="list-group-item">${la.height }</li>
											<li class="list-group-item">${la.weight}</li>
										</ul>


									</div>
						
								</div>
							</div>
						</div>
						
						
						<div class="bs-callout bs-callout-danger">
							<h4>운동 목표</h4>

							<p>${la.exercise_comment}</p>

						</div>

					</c:forEach>
					
					<%--  </c:forEach> --%>

					<div class="bs-callout bs-callout-danger">
						<h4>관심있는 분야</h4>
						<p></p>
					</div>










					<div class="bs-callout bs-callout-danger">
						<h4>운동 경력</h4>
						<ul class="list-group">
							<a class="list-group-item inactive-link" href="#">
								<h4 class="list-group-item-heading">Software Engineer at
									Twitter</h4>
								<p class="list-group-item-text">Lorem ipsum dolor sit amet,
									ea vel prima adhuc, scripta liberavisse ea quo, te vel vidit
									mollis complectitur. Quis verear mel ne. Munere vituperata vis
									cu, te pri duis timeam scaevola, nam postea diceret ne. Cum ex
									quod aliquip mediocritatem, mei habemus persecuti mediocritatem
									ei.</p>
							</a>
							<a class="list-group-item inactive-link" href="#">
								<h4 class="list-group-item-heading">Software Engineer at
									LinkedIn</h4>
								<p class="list-group-item-text">Lorem ipsum dolor sit amet,
									ea vel prima adhuc, scripta liberavisse ea quo, te vel vidit
									mollis complectitur. Quis verear mel ne. Munere vituperata vis
									cu, te pri duis timeam scaevola, nam postea diceret ne. Cum ex
									quod aliquip mediocritatem, mei habemus persecuti mediocritatem
									ei.</p>
								<ul>
									<li>Lorem ipsum dolor sit amet, ea vel prima adhuc,
										scripta liberavisse ea quo, te vel vidit mollis complectitur.
										Quis verear mel ne. Munere vituperata vis cu, te pri duis
										timeam scaevola, nam postea diceret ne. Cum ex quod aliquip
										mediocritatem, mei habemus persecuti mediocritatem ei.</li>
									<li>Lorem ipsum dolor sit amet, ea vel prima adhuc,
										scripta liberavisse ea quo, te vel vidit mollis complectitur.
										Quis verear mel ne. Munere vituperata vis cu, te pri duis
										timeam scaevola, nam postea diceret ne. Cum ex quod aliquip
										mediocritatem, mei habemus persecuti mediocritatem ei.</li>
								</ul>
								<p></p>
							</a>
						</ul>
					</div>



					<div class="bs-callout bs-callout-danger">
						<h4>Language and Platform Skills</h4>
						<ul class="list-group">
							<a class="list-group-item inactive-link" href="#">


								<div class="progress">
									<div data-placement="top" style="width: 80%;"
										aria-valuemax="100" aria-valuemin="0" aria-valuenow="80"
										role="progressbar" class="progress-bar progress-bar-success">
										<span class="sr-only">80%</span> <span class="progress-type">가슴운동
										</span>
									</div>
								</div>
								<div class="progress">
									<div data-placement="top" style="width: 70%;"
										aria-valuemax="100" aria-valuemin="0" aria-valuenow="1"
										role="progressbar" class="progress-bar progress-bar-success">
										<span class="sr-only">70%</span> <span class="progress-type">어깨운동</span>
									</div>
								</div>
								<div class="progress">
									<div data-placement="top" style="width: 70%;"
										aria-valuemax="100" aria-valuemin="0" aria-valuenow="1"
										role="progressbar" class="progress-bar progress-bar-success">
										<span class="sr-only">70%</span> <span class="progress-type">등운동
										</span>
									</div>
								</div>
								<div class="progress">
									<div data-placement="top" style="width: 65%;"
										aria-valuemax="100" aria-valuemin="0" aria-valuenow="1"
										role="progressbar" class="progress-bar progress-bar-warning">
										<span class="sr-only">65%</span> <span class="progress-type">코어운동</span>
									</div>
								</div>
								<div class="progress">
									<div data-placement="top" style="width: 60%;"
										aria-valuemax="100" aria-valuemin="0" aria-valuenow="60"
										role="progressbar" class="progress-bar progress-bar-warning">
										<span class="sr-only">60%</span> <span class="progress-type">허벅지운동</span>
									</div>
								</div>
								<div class="progress">
									<div data-placement="top" style="width: 50%;"
										aria-valuemax="100" aria-valuemin="0" aria-valuenow="50"
										role="progressbar" class="progress-bar progress-bar-warning">
										<span class="sr-only">50%</span> <span class="progress-type">종아리운동</span>
									</div>
								</div>
								<div class="progress">
									<div data-placement="top" style="width: 10%;"
										aria-valuemax="100" aria-valuemin="0" aria-valuenow="50"
										role="progressbar" class="progress-bar progress-bar-danger">
										<span class="sr-only">10%</span> <span class="progress-type">Go</span>
									</div>
								</div>

								<div class="progress-meter">
									<div style="width: 25%;" class="meter meter-left">
										<span class="meter-text">I suck</span>
									</div>
									<div style="width: 25%;" class="meter meter-left">
										<span class="meter-text">I know little</span>
									</div>
									<div style="width: 30%;" class="meter meter-right">
										<span class="meter-text">I'm a guru</span>
									</div>
									<div style="width: 20%;" class="meter meter-right">
										<span class="meter-text">I''m good</span>
									</div>
								</div>

							</a>

						</ul>



					</div>

				

					<div class="bs-callout bs-callout-danger">
       
        <h4>2018년 몸만들기 목표 </h4>
        <table class="table table-striped table-responsive ">
          <thead>
            <tr><th>운동목표</th>
            <th>몇개월안에?</th>
            <th>달성치 </th>
          </tr></thead>
          <tbody>
            <tr>
              <td>Masters in Computer Science and Engineering</td>
              <td>2014</td>
              <td> 3.50 </td>
            </tr>
            <tr>
              <td>BSc. in Computer Science and Engineering</td>
              <td>2011</td>
              <td> 3.25 </td>
            </tr>
          </tbody>
        </table>
        
           <table class="table table-striped">
                                    <thead>
                                       <th>num</th>
                                       <th>subject</th>
                                       <th>content</th>
                                       <th>regdate</th>
                                       
                                       
                                    </thead>
                                
                               <c:forEach items="${exercise_board_list }" var="b">
                                    <tbody>                       
                               
                               <td>${b.num} </td>
                                      <td> <a href="#" onclick="ex_read('${b.num}');"> ${b.subject } </a> </td>
                                            
                                        <td>${b.content } </td>
                                        <td>${b.regdate } </td>
                                        
                                    </tbody>
                               </c:forEach>
                                      
                                      
                                   <!-- <a href="#" onclick="ex_post();"> post </a> -->
                                </table>
                              
            <form action="boardList.action" name="search" method="post">
 
            <select name="keyField" size="1">
                <option value="name"    <c:if test="${'name'==keyField }">    selected</c:if>> 이름 </option>
                <option value="title"   <c:if test="${'title'==keyField }">   selected</c:if>> 제목 </option>
                <option value="content" <c:if test="${'content'==keyField }"> selected</c:if>> 내용 </option>
            </select>
                 <input type="text" size="16" name="keyWord" value="${keyWord }">
                 <input type="button" value="검색" onClick="check()">
                 <input type="hidden" name="page" value="0"></td>
                 <input type="button" value="글작성" onclick="ex_post();">
    
          </form>  
      
         
                
                    
                    
      
 
    
    </div>

  </div>
</div>
    
</div>

</div>
 
 </div>
 </div>



</body>

<!--   Core JS Files   -->
<script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script src="assets/js/bootstrap-checkbox-radio.js"></script>

<!--  Charts Plugin -->
<script src="assets/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="assets/js/bootstrap-notify.js"></script>

<!--  Google Maps Plugin    -->
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js"></script>

<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
<script src="assets/js/paper-dashboard.js"></script>

<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
<script src="assets/js/demo.js"></script>



</html>
