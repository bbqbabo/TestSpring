<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
	
	function asd(ck){
		
		if(ck=="o") alert("당첨o");
		else if(ck=="-") alert("진행중");
		else if(ck=="x") alert("당첨x");
		
	}

</script>

<body>

<script type="text/javascript">
</script>
<c:forEach items="${requestScope.eventMypage}" var="list" >
            <div  class="col-md-6">
               <div class="card col-md-6">
                  <div class="col-md-offset-9 col-md-3 ">
                     <div class="card-header" style="background-color: #39cadc; height:50px; margin-bottom: 10px;">
                     <span  id="j"></span>
                     </div>
                  </div>
                  <div class="card-content">
                     <a href='javascript:void(0)' onclick="asd('${list.ck }');">               
                        <img src="upload/${list.img }" class="gray_img" style=" width:100%; height:200px;"/>
                     </a>
                  </div>
               </div>
                
            </div>
           </c:forEach>




</body>