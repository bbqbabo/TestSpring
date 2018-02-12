<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"><title>Insert title here</title>

    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="../assets/css/themify-icons.css" rel="stylesheet">
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style type="text/css">
.main-text
{
    position: absolute;
    top: 50px;
    width: 96.66666666666666%;
    color: #FFF;
}
.btn-min-block
{
    min-width: 170px;
    line-height: 26px;
}
.btn-clear
{
    color: #FFF;
    background-color: transparent;
    border-color: #FFF;
    margin-right: 15px;
}
.btn-clear:hover
{
    color: #000;
    background-color: #FFF;
}


</style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   <script src="../assets/js/bootstrap.min.js"></script>
   
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="http://placehold.it/1200x500/3498db/2980b9" alt="First slide">
                        <div class="carousel-caption">
                            <h3>
                                First slide</h3>
                            <p>
                                Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="http://placehold.it/1200x500/9b59b6/8e44ad" alt="Second slide">
                        <div class="carousel-caption">
                            <h3>
                                Second slide</h3>
                            <p>
                                Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="http://placehold.it/1200x500/34495e/2c3e50" alt="Third slide">
                        <div class="carousel-caption">
                            <h3>
                                Third slide</h3>
                            <p>
                                Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
                        </div>
                    </div>
                </div>
                <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                    <!-- <span class="glyphicon glyphicon-chevron-left"></span>
                     --></a><a class="right carousel-control"
                        href="#carousel-example-generic" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right">
                        </span>
                        
                        </a>
            </div>
            <div class="main-text hidden-xs">
                <div class="col-md-12 text-center">
                    <h1>
                        Static Headline And Content</h1>
                    <h3>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    </h3>
                    <div class="">
                        <a class="btn btn-clear btn-sm btn-min-block" href="http://www.jquery2dotnet.com/">Login</a><a class="btn btn-clear btn-sm btn-min-block"
                            href="http://www.jquery2dotnet.com/">Registration</a></div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="push">
</div>

</body>
</html>