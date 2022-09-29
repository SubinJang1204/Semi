<%@page import="data.dto.ShopDto"%>
<%@page import="data.dao.ShopDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
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
<Resources allowLinking="true" />
<%

String uploadPath=getServletContext().getRealPath("/sangpumimg");
System.out.println(uploadPath);

int uploadSize=1024*1024*4; //2mb

MultipartRequest multi=null;

try{
multi=new MultipartRequest(request,uploadPath,uploadSize,"utf-8",new DefaultFileRenamePolicy());

//주의:request가 아닌 multi로 모든 폼데이터 읽는다
String category=multi.getParameter("category");
int price=Integer.parseInt(multi.getParameter("price"));
String sangpum=multi.getParameter("sangpum");
String ipgoday=multi.getParameter("ipgoday");

String photo=multi.getFilesystemName("photo");

//dao
ShopDao dao=new ShopDao();
//dto에 저장
ShopDto dto=new ShopDto();
dto.setCategory(category);
dto.setIpgoday(ipgoday);
dto.setPhoto(photo);
dto.setPrice(price);
dto.setSangpum(sangpum);

dao.insertShop(dto);

//방명록 목록 이동
response.sendRedirect("../index.jsp?main=sangpum/sangpumlist.jsp");

}catch(Exception e){
	
}



%>

</body>
</html>