<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


<!-- 
table 燁살�곤옙占�.

create table exercise_board(
num int primary key auto_increment,
subject varchar(30) not null,
category varchar(30) not null,
name varchar(30) not null,
regedate timestamp



); -->

<link rel="stylesheet" href="grid.css">

<!-- Downloaded chart.css -->
<!-- https://theus.github.io/chart.css/ 占쏙옙占쎌�곤옙怨�占쏙옙 筌〓㈇占�
 -->
 


</head>

 
<body>

<script src="https://code.jquery.com/jquery-3.2.1.js">
 
 </script>

<script type="text/javascript">




      
    function ex_board(){ //호박사진 클릭시 board.jsp로 넘어가는것 default 초기화면이 될것
 		
    	location.href="exercise_board.do";
    	
 	  /*  $.ajax({
            url:"exercise_board.do",
            dataType:'html',
            type:'post',
            success:function(data){
            	sessionStorage.setItem("data", data);
               $(".test").empty();
               $(".test").html(data);
            },
            error:function(data){
               alert("exercise_board 占쎈��占쏙옙占썬�쏙옙占�");
            }
            
         });//end ajax
 	    */
 	   
    }
  
    function ex_dashboard(){
  	   
  	   $.ajax({
             url:"ex_dashboard.do",
             dataType:'html',
             type:'post',
             success:function(data){
            	 sessionStorage.setItem("data", data);
                $(".test").empty();
                $(".test").html(data);
             },
             error:function(data){
                alert("ex_dashboard 占쎈��占쏙옙占썬�쏙옙占�");
             }
             
          });//end ajax
  	   
  	   
     }
 
    
    


</script>



<jsp:include page="../side.jsp" ></jsp:include>
 <div class="main-panel">
            <jsp:include page="../top.jsp"></jsp:include>
            <div class="content">
<div class="row">
<div class="test">
<div class="support-grid"></div>

  <div class="band">
    <div class="item-1">
          <a href="javascript:void(0);" id="ex_board" onclick="ex_board();" class="card">
          
            <div class="thumb" style="background-image: url(images/exercise/cala.jpg);">
            </div>	
            <article>
              <h3>International Artist Feature: Malaysia</h3>
              <span>Mary Winkler</span>
            </article>
          </a>
    </div>
    <div class="item-2">
          <a href="javascript:void(0);" id="ex_dashboard" onclick="ex_dashboard();" class="card">
            <div class="thumb" style="background-image: url(images/exercise/hanny.jpg);"></div>
            <article>
              <h3>How to Conduct Remote Usability Testing</h3>
              <span>Harry Brignull</span>
            </article>
          </a>
    </div>
    <div class="item-3">
      <a href="site3.jsp" class="card">
        <div class="thumb" style="background-image: url(images/exercise/bottle.jpg);"></div>
        <article>
          <h3>Created by You, July Edition</h3>
          <p>Welcome to our monthly feature of fantastic tutorial results created by you, the Envato Tuts+ community! </p>
          <span>Melody Nieves</span>
        </article>
      </a>
    </div>
    <div class="item-4">
          <a href="site4.jsp" class="card">
            <div class="thumb" style="background-image: url(images/exercise/begi.jpg);"></div>
            <article>
              <h3>How to Code a Scrolling 占쏙옙Alien Lander占쏙옙 Website</h3>
              <p>We占쏙옙ll be putting things together so that as you scroll down from the top of the page you占쏙옙ll see an 占쏙옙Alien Lander占쏙옙 making its way to touch down.</p>
              <span>Kezz Bracey</span>
            </article>
          </a>
    </div>
    <div class="item-5">
          <a href="site5.jsp"class="card">
            <div class="thumb" style="background-image: url(images/exercise/food3.jpg);");"></div>
            <article>
              <h3>How to Create a 占쏙옙Stranger Things占쏙옙 Text Effect in Adobe Photoshop</h3>
              <span>Rose</span>
            </article>
          </a>
    </div>
    <div class="item-6">
      <a href="site6.jsp" class="card">
        <div class="thumb" style="background-image: url(images/exercise/exercise.jpg);"></div>
        <article>
          <h3>5 Inspirational Business Portraits and How to Make Your Own</h3>
          
          <span>Marie Gardiner</span>
        </article>
      </a>
    </div>
    <div class="item-7">
      <a href="site7.jsp" class="card">
        <div class="thumb" style="background-image: url(images/exercise/exercise1.jpg);")></div>
        <article>
          <h3>Notes From Behind the Firewall: The State of Web Design in China</h3>
          <span>Kendra Schaefer</span>
        </article>
      </a>
    </div>
  </div>
</div>
</div>
</div>
</div>

	<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
	

</body>
</html>







