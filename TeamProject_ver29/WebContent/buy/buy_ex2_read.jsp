<%@page import="bean.buyDto"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Aperitif - Custom Template</title>

	<link rel="stylesheet" href="assets/css/style.min.css">
	<link rel="stylesheet" href="assets/css/modules.css">

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
	</script>
	<script type="text/javascript">
	 $("#del").click(function(){/*삭제하기  */
		 	var t=confirm("삭제할래용?");
		 	
		 	if( t){
		 		var name = '${bdto.name}';
				
				
				  $.ajax({
					  url:"buy_ex2_del.do",
					  dataType:'html',
					  data:{
						  name:name
					  },
					  type:'post',
					  success:function(data){
						   $(".test").empty();
						  $(".test").html(data);
					  },
					  error:function(data){
						  alert("에러");
					  }
					  
				  });
		 	}else{
		 		
		 	}
		 
		 
		 	
			  
	  });
	
	 $("#buy").click(function(){/*삭제하기  */
		 	var t=confirm("구매페이지로 이동합니다.");
		 	
		 	if( t){
		 		window.name="parentForm";
		 		window.open("buy/buy_ex2_buy.jsp","childForm","width=800,height=600,resizeable=no,scrollbars=no");
		 		
		 	}else{
		 		var name = '${bdto.name}';
				
				
				  $.ajax({
					  url:"buy_ex2_buy.do",
					  dataType:'html',
					  data:{
						  name:name
					  },
					  type:'post',
					  success:function(data){
						   $(".test").empty();
						  $(".test").html(data);
					  },
					  error:function(data){
						  alert("에러");
					  }
					  
				  });
		 	}
		 
		 
		 	
			  
	  });
	 
	 
	 $("#baguni").click(function(){/*삭제하기  */
		 	var t=confirm("장바구니에 담을까요?.");
		 	
		 	if( t){
		 		<%
		 		Vector<buyDto> v=new Vector<buyDto>();
		 		buyDto bdto2=new buyDto();
		 		if(session.getAttribute("baguni")==null){
		 			
		 		}else{
		 			v=(Vector<buyDto>)session.getAttribute("baguni");
		 			
		 		}
		 		
		 		v.add(bdto2=((buyDto)request.getAttribute("bdto")));
		 		session.setAttribute("baguni", v);
		 		System.out.println("장바구니에"+bdto2.getName()+"이추가되었음");
		 		%>		 		
		 	}else{
		 		
		 	}
		 
		 
		 	
			  
	  });
 

	
	</script>
	
</head>
<body>
<center>
<section class="MOD_BOXMESSAGE1" style="background-image:url(https://unsplash.it/1400/?random)"><!-- 제품이미지 넣을거양 -->


  <div class="MOD_BOXMESSAGE1_Message" data-theme="_bo1">
    <h2>Hard hitting, important message</h2>
    <p>with additional sentance and call to action button</p>
    <a href="#" class="btn">${bdto.name }d</a>
    <input type="hidden" id="price" value="${bdto.price }">
    <input type="hidden" id="name" value="${bdto.name }">
    <a href="#" class="btn">Read more</a>
    
    <a href="#" class="btn" id=del>del</a>
    <a href="#" class="btn" id=buy>buy</a>
    <a href="#" class="btn" id=baguni>장바구니 담기</a>
    <a href="buy/buy_ex2_baguni.jsp" class="btn" id=bagunibogi>바구니보기</a>
  </div>


</section>
<!--
END MODULE AREA 4: Box Message 1
-->

<script src="assets/js/index.js"></script>

</center>
</body>
</html>