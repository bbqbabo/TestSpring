<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
var IMP = window.IMP; // 생략가능
var price=opener.document.getElementById("price").value;
IMP.init('iamport');
IMP.request_pay({
    pg : 'inicis', // version 1.1.0부터 지원.
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '주문명:결제테스트',
    amount : price,
    buyer_email : 'iamport@siot.do',
    buyer_name : '구매자이름',
    buyer_tel : '010-1234-5678',
    buyer_addr : '서울특별시 강남구 삼성동',
    buyer_postcode : '123-456',
    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
    }
    alert(msg);
    
        
});


</script>
<script type="text/javascript">
var name=opener.document.getElementById("name").value;
$("#btn").click(function(){/*구매했다치기 */
 	var t=confirm("구매했다 칩니까?");
 	
 	if( t){
 		
		
		 
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
 	}else{
 		
 	}
 
 
 	
	  
});
</script>
</head>
<body>
	<input type="button" id="btn" value="결재했다고 치기">
	

</body>
</html>