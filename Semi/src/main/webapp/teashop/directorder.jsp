<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
body{
font-family: 'Gowun Dodum', sans-serif;
background-color:#ebebeb;
}
div.wrap > input{
border:none;
}
</style>
</head>
<body>
<%
String shopnum=request.getParameter("shopnum");
String num=request.getParameter("num");
String photo=request.getParameter("photo");
String sangpum=request.getParameter("sangpum");
String price=request.getParameter("price");
//로그인상태
String loginok=(String)session.getAttribute("loginok");
//로그인한 아이디
String myid=(String)session.getAttribute("myid");
%>
<div style="position:absolute;top:-50px;z-index:-10;width:1920px;height:100px;background-color:white;"></div>

<div class="wrap" style="width:600px;height:760px;margin:150px auto;padding-top:70px;padding-left:50px;background-color:white;">
<caption><h2>Order</h2></caption><br><br>
<form name="frm" id="frm" style="float:left">

<input type="hidden" name="shopnum" value="<%=shopnum%>">
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="photo" value="<%=photo%>">
<input type="hidden" name="sangpum" value="<%=sangpum%>">
<input type="hidden" name="price" value="<%=price%>">

<input type="text" name="receiver" placeholder="받는 분" class="form-control" required="required"><br><br>

<input type="text" name="addr" placeholder="주소" class="form-control" required="required"> <br><br>

<input type="text" name="hp" placeholder="전화번호" class="form-control" required="required"><br><br>

<select id="bank" name="bank" class="form-control" required="required">
<option value="-">은행을 선택해주세요</option>
<option value="농협">농협</option>
<option value="국민">국민은행</option>
<option value="하나">하나은행</option>
<option value="신한">신한은행</option>
</select><br><br>

<input type="text" name="cardnum" placeholder="카드번호" class="form-control" required="required"><br><br>

<input type="text" name="cardpass" placeholder="카드 비밀번호" class="form-control" required="required"><br><br>



 <button type="button" class="btn btn-default sm" style="border: 1px solid black; font-size: 12pt; color: white;background-color: black;" id="btnorder">결제하기</button>
</form>
</div>
<br>


<script type="text/javascript">
$("#btnorder").click(function(){
			//form태그의 모든 값 가져오기
			var formdata=$("#frm").serialize();
			
			//alert(formdata);
			//alert(num);
			
			$.ajax({
				
				type:"post",
				dataType:"html",
				url:"teashop/orderdetailproc.jsp",
				data:formdata,
				success:function(){
					//alert("success");
					
					var a=confirm("결제하시겠습니까?")
					if(a){
						alert("결제에 성공했습니다!")
						location.href="index.jsp?main=layout/main.jsp";
					}
				}
			});
		});
</script>
</body>
</html>