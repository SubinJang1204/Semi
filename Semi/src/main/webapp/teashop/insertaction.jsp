<%@page import="data.dao.ReviewDao"%>
<%@page import="data.dto.ReviewDto"%>
<%@page import="data.dao.GuestDao"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="data.dao.MemberDao"%>
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
String myid=(String)session.getAttribute("myid");

String realPath=getServletContext().getRealPath("/save");
System.out.println(realPath);

int uploadSize=1024*1024*2; //2MB

MultipartRequest multi=null;

try{
multi=new MultipartRequest(request,realPath,uploadSize,"UTF-8",
		new DefaultFileRenamePolicy());

//실제 업로드된 파일명
String shopnum=multi.getParameter("shopnum");
String photo=multi.getFilesystemName("photo");
String writer=multi.getParameter("writer");
String content=multi.getParameter("content");
int taste=Integer.parseInt(multi.getParameter("taste"));
int delivery=Integer.parseInt(multi.getParameter("delivery"));
int smell=Integer.parseInt(multi.getParameter("smell"));

//dto에 저장
ReviewDto dto=new ReviewDto();
dto.setShopnum(shopnum);
dto.setPhoto(photo);
dto.setWriter(writer);
dto.setContent(content);
dto.setTaste(taste);
dto.setDelivery(delivery);
dto.setSmell(smell);

//dao
ReviewDao dao=new ReviewDao();
dao.insertSmart(dto);

//방명록 목록 이동
response.sendRedirect("../index.jsp?main=teashop/shopdetail.jsp?shopnum="+shopnum);

}catch(Exception e){
	System.out.println("업로드 오류: "+e.getMessage());
}
%>


</body>
</html>