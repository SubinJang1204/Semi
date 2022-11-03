<%@page import="data.dto.ShopDto"%>
<%@page import="data.dao.ShopDao"%>
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
<script type="text/javascript">
	
</script>
</head>
<body>
<%
String shopnum=request.getParameter("shopnum");

request.setCharacterEncoding("utf-8");

//dao선언
ShopDao dao=new ShopDao();
//num에 해당하는 dto 받기
ShopDto dto =dao.getData(shopnum);
%>
<center>
	<div style="margin:0 auto">
		<form action="manager/product/updateaction.jsp?shopnum=<%=shopnum %>" method="post" enctype="multipart/form-data" style="margin-top: 150px;" >
			<table class="table table-bordered" style="width: 600px;">
				<caption>
					<h3><b>상품 수정</b></h3>
				</caption>
				<br>
				<input type="hidden" value="<%=shopnum%>" name="shopnum">
				<tr>
					<td style="width:150px;"><b>카테고리</b></td>
					<td>
					<select style="width:200px" name="category" class="form-control" required="required" value="<%=dto.getCategory()%>">
					<option value="티 세트" selected="selected">티 세트</option>
					<option value="티 단품">티 단품</option>
					<option value="다기 & 다도구">다기 & 다도구</option>
					</select>
					</td>
				</tr>
				
				<tr>
					<th width="100">상품명</th>
					<td><input type="text" name="sangpum" required="required"
						class="form-control" value="<%=dto.getSangpum()%>"></td>
				</tr>

				<tr>
				<td style="width:200px;"><b>상품 이미지</b>
				</td>
				<td>
				<input type="file" required="required" name="photo" class="form-control" style="width:300px" value="<%=dto.getPhoto()%>">
				</td>
				</tr>
				
				<tr>
				<th width="100">가격</th>
				<td>
				<input type="text" name="price" required="required" class="form-control"
				pattern="[0-9]{3,}" value="<%=dto.getPrice()%>"><!-- 0부터 9까지만 입력가능, 3글자 이상 입력하라. 보통 비번 입력 창에서 쓰임 -->
				</td>
				</tr>
				
				<tr>
				<th width="100" >입고일</th>
				<td>
				<input type="date" name="ipgoday" value="2022-10-13" class="form-control" value="<%=dto.getIpgoday()%>">
				</td>
				</tr>
				
				<tr>
				<td style="width:150px;"><b>상세이미지</b>
				</td>
				<td>
				<input type="file" required="required" name="sangsae" class="form-control" style="width:300px" value="<%=dto.getSangsae()%>"> 
				</td>
				</tr>
				
				<tr>
				<td colspan="2" align="center">
				<button type="submit" class="btn btn-success" style="background-color:#FF7BAC;color:white;border:1px solid #FF7BAC;">상품 저장</button>
				<button class="btn btn-default" onclick="location.href='index.jsp?main=manager/product/product.jsp?shopnum=<%=shopnum%>'">상품 목록</button>
				
				</td>
				</tr>
			</table>
		</form>
	</div>
	</center>
</body>
</html>