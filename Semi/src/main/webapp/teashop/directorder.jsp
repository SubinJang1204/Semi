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
<center>
<form name="frm" id="frm" style="margin-top:200px;">
<table class="table table-bordered" style="width:600px;">
<input type="hidden" name="shopnum" value="<%=shopnum%>">
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="photo" value="<%=photo%>">
<input type="hidden" name="sangpum" value="<%=sangpum%>">
<input type="hidden" name="price" value="<%=price%>">
<tr>
<td>
받는 분 <input type="text" name="receiver">
</td>
</tr>

<tr>
<td>
주소 <input type="text" name="addr">
</td>
</tr>

<tr>
<td>
전화번호<input type="text" name="hp">
</td>
</tr>

<tr>
<td>
<select id="bank" name="bank" class="form-control">
<option value="-">은행</option>
<option value="농협">농협</option>
<option value="국민">국민</option>
<option value="하나">하나</option>
<option value="신한">신한</option>
</select>
</td>
</tr>

<tr>
<td>
카드번호<input type="text" name="cardnum">
</td>
</tr>

<tr>
<td>
카드 비밀번호<input type="text" name="cardpass">
 </td>
 </tr>
 </table>
 <button type="button" class="btn" style="width: 100px; height: 70px; border: 1px solid black; font-size: 12pt; color: white;
 background-color: black;" id="btnorder">결제하기</button>
</form>
</center>

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