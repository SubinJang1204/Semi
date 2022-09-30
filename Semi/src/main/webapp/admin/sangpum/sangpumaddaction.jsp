<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="data.dao.ShopDao"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
String uploadPath=getServletContext().getRealPath("image2");
System.out.println(uploadPath);
int uploadSize=1024*1024*4;
MultipartRequest multi=null;
try{
	multi=new MultipartRequest(request,uploadPath,uploadSize,"utf-8",new DefaultFileRenamePolicy());
	
	String category=multi.getParameter("category");
	int price=Integer.parseInt(multi.getParameter("price"));
	String sangpum=multi.getParameter("sangpum");
	String ipgoday=multi.getParameter("ipgoday");
	
	String photo=multi.getFilesystemName("photo");
	
	ShopDao dao=new ShopDao();
	ShopDto dto=new ShopDto();
	
	dto.setCategory(category);
	dto.setSangpum(sangpum);
	dto.setPhoto(photo);
	dto.setPrice(price);
	dto.setIpgoday(ipgoday);
	
	
	dao.insertShop(dto);
	
	response.sendRedirect("../index.jsp?main=sangpum/sangpumlist.jsp");
	
}catch(Exception e){
	
}
%>

</body>
</html>