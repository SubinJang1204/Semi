<%@page import="java.io.File"%>
<%@page import="data.dao.ShopDao"%>
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

<%



String shopnum=request.getParameter("shopnum");


ShopDao dao=new ShopDao();


dao.deleteShop(shopnum);

String photo=dao.getData(shopnum).getPhoto();
//프로젝트실제경로
String realPath=getServletContext().getRealPath("/image2");
//파일객체 생성
File file=new File(realPath+"\\"+photo);
//파일삭제
file.delete();



%>
</body>
</html>