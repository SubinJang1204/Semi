<%@page import="java.util.List"%>
<%@page import="data.dto.MemberDto"%>
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
<style type="text/css">
body{
background-color:#f8f9fa;
}
p.menuhover:hover{
cursor:pointer;
color:#FF7BAC;
}
a{
color:black;
text-decoration:none;
border:none;
}
a:hover{
color:#FF7BAC;
cursor:pointer;
}
</style>
</head>
<body>
<%

String loginok=(String)session.getAttribute("loginok");
String myid=(String)session.getAttribute("myid");
MemberDao dao=new MemberDao();
String num=dao.getNum(myid);
String name=dao.getName(myid);

%>
<div style="position:absolute;top:-50px;z-index:-10;width:1920px;height:100px;background-color:white;"></div>
<center>
<div class="wrap" style="margin-top:100px;width:1200px;height:700px;display:block;background-color:#ffffff;border-radius:45px;box-shadow: 5px 5px 5px 5px rgba(233, 236, 239, 0.2)">

<div class="photo" style="width:200px;height:200px;float:left;margin-left:20px;margin-top:20px;display:block;">
<img src="images/person3.png" style="border:4px solid #FF7BAC;border-radius:45px;width:180px;height:180px;margin-bottom:40px;"><br>
<span style="font-size:20px;"><b style="color:#FF7BAC;"><%=name%></b>님 안녕하세요!</span><br><br>
<hr>
</div>

<div class="side_menu" style="width:130px;height:auto;margin-left:30px;margin-top:140px;float:left;text-align:left;display:block;clear:both;">

<p style="font-size:20px;color:#FF7BAC;margin-top:-25px;"><b>구매 관리</b></p><br>
<p style="font-size:17px;margin-top:-10px;" class="menuhover">장바구니 내역</p><br>
<p style="font-size:17px;margin-top:-20px;" class="menuhover">리뷰 관리</p>
<hr>
<p style="font-size:20px;color:#FF7BAC;"><b>회원 관리</b></p><br>
<p style="font-size:17px;margin-top:-10px;" class="menuhover"><a href="index.jsp?main=mypage/
	updateform.jsp?num=<%=num%>" style="text-decoration:none;">회원 정보 수정</a></p><br>
<p style="font-size:17px;margin-top:-20px;" class="menuhover"><a href="mypage/
	memberdelete.jsp?num=<%=num%>" style="text-decoration:none;">회원 탈퇴</a></p>
</div>

</div>
</center>
</body>
</html>