<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>Aperitif - Custom Template</title>

   <link rel="stylesheet" href="buy/assets/css/style.min.css">
   <link rel="stylesheet" href="buy/assets/css/modules.css">

   <!-- Canonical URL usage -->
   <link rel="canonical" href="https://aperitif.io/">

   <!-- Facebook Open Graph -->
   <meta property="og:url"                content="https://aperitif.io/" />
   <meta property="og:title"              content="Aperitif | The web template generator" />
   <meta property="og:description"        content="Aperitif is a rapid web template generation tool." />
   <meta property="og:image"              content="https://aperitif.io/img/aperitif-facebook.png" />
   <meta property="og:image:width"        content="1200" />
   <meta property="og:image:height"       content="630" />

   <!-- Twitter Cards -->
   <meta name="twitter:card" content="summary_large_image">
   <meta name="twitter:site" content="@Aperitif">
   <meta name="twitter:creator" content="@Aperitif">
   <meta name="twitter:title" content="Aperitif - The web template generator">
   <meta name="twitter:description" content="Aperitif is a rapid web template generation tool.">
   <meta name="twitter:image" content="https://aperitif.io/img/aperitif-card.png">

   <!-- Google Structured Data -->
   <script type="application/ld+json">
   {
   "@context" : "http://schema.org",
   "@type" : "SoftwareApplication",
   "name" : "Aperitif",
   "image" : "https://aperitif.io/img/aperitif-logo.svg",
   "url" : "https://aperitif.io/",
   "author" : {
     "@type" : "Person",
     "name" : "Octavector"
   },
   "datePublished" : "2017-MM-DD",
   "applicationCategory" : "HTML"
   }
   </script><!--기본틀  -->
     <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
   <script type="text/javascript">
     
   
     
     function read(a){
               
//                   var a = $(this).attr('id');
             /*  alert(a); */
                 
                 $.ajax({
                    url:"buy_ex2_read.do",
                     dataType:'html',
                     data:{
                       name:a
                       
                     },
                     type:'post',
                     success:function(data){
                         $(".test").empty();
                        $(".test").html(data);
                     },
                     error:function(data){
                        alert("에러");
                     }
                    
          
                 
               });//end click
               }


   </script>
   
   
</head>

<body>
<jsp:include page="../side.jsp">
<jsp:param value="buy_ex2" name="selectMenu"/>
</jsp:include>
 <div class="main-panel">
            <jsp:include page="../top.jsp"></jsp:include>
            <div class="content">
<br>
<section class="MOD_FEATURE">
<c:forEach var="v" items="${name}" varStatus="status">
<c:if test="${status.index %4 eq 0}">

  <div data-layout="_r">
</c:if>
   
   
    <div data-layout="ch8 ec4">
      <a href="javascript:void(0);" onclick="read('${v.name }');" class="MOD_FEATURE_Container">
        <img class="MOD_FEATURE_Picture" src="https://unsplash.it/400/300/?random" alt="">
        <div class="MOD_FEATURE_TextContainer">
          <p class="MOD_FEATURE_Title" data-theme="_ts2">${v.name }</p>
          <p class="MOD_FEATURE_Description">${v.sexpl }</p>
        </div>
      </a>
    </div>
    
<c:if test="${status.index %4 eq 3 ||status.index eq status.end }">
  </div>

</c:if>
</c:forEach>
 </section>
이름:${name[0].name }
<!-- 쇼핑몰 품목 -->
<table border="1px">
<tr><td></td></tr>
</table>
</div>
</div>
</body>
</html>