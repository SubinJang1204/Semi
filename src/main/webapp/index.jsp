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
div.layout{
position:absolute;
}

div.menu{
width:100%;
height:100px;
line-height:100px;
text-align:center;
position:relative;
z-index:10;
}

div.main{
width:1920px;
height:600px;
font-size:12pt;
margin-top:-70px;
text-align:center;
z-index:-1;
}

a{
color:black;
text-decoration:none;
}
</style>
</head>
<%

String mainPage="layout/main.jsp";

//url을 통해 main값을 읽어서 메인페이지에 출력한다
if(request.getParameter("main")!=null){
	mainPage=request.getParameter("main");
}
%>
<body>

<div class="layout menu">
<jsp:include page="layout/menu.jsp"/>
</div>


<div class="layout main">
<jsp:include page="<%=mainPage%>"/>
</div>


</body>
</html>