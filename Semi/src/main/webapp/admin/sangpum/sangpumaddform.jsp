<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>Insert title here</title>
</head>
<body>

<div>
	<form action="sangpum/sangpumaddaction1.jsp" method="post" enctype="multipart/form-data">
		<table class="table table-bordered" style="width: 600px;">
			<caption><b>상품등록</b></caption>
			<tr>
				<td style="width: 150px; background-color: beige"><b>카테고리</b></td>
				<td>
					<select style="width: 200px;" name="category" class="form-control" required="required">
						<option value="티 세트" selected="selected">티 세트</option>
						<option value="티 제품">티 제품</option>
						<option value="다기&다도구">다기&다도구</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td style="width: 150px; background-color: beige"><b>상품명</b></td>
				<td>
					<input type="text" name="sangpum" class="form-control" style="width: 200px;"
					required="required">
					
				</td>
			</tr>
			
			<tr>
				<td style="width: 150px; background-color: beige"><b>상품사진</b></td>
				<td>
					<input type="file" name="photo" class="form-control" style="width: 300px;"
					required="required">
					
				</td>
			</tr>
			
			<tr>
				<td style="width: 150px; background-color: beige"><b>상품가격</b></td>
				<td>
					<input type="text" name="price" class="form-control" style="width: 300px;"
					required="required">
					
				</td>
			</tr>
			
			<tr>
				<td style="width: 150px; background-color: beige"><b>입고일</b></td>
				<td>
					<input type="date" name="ipgoday" required="required">
					
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-info" style="width: 100px;">상품저장</button>
					<button type="button" class="btn btn-info" style="width: 100px;"
					onclick="location.href='index.jsp?main=sangpum/sangpumlist.jsp'">상품목록</button>
				</td>
			</tr>
			
		</table>
	</form>

</div>

</body>
</html>