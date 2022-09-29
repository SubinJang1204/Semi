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
<style type="text/css">
body *{font-family: serif;}

div.layout{
border: 0px solid gray;
position: absolute;

}
div.title{
width: 100%;
height: 80px;
line-height:  80px;
font-size: 30px;
text-align: center;
}
div.menu{
width: 100%;
height: 80px;
line-height: 80px;
font-size: 18pt;
text-align: center;
top: 120px;
}

div.info{
width: 170px;
height: 200px;
line-height: 10px;
font-size: 15pt;
left: 30px;
top: 300px;
padding: 20px 10px;
border: 5px groove gray;
border-radius: 30px;

}
div.main{
width: 800px;
height: 700px;
font-size: 12pt;
left: 230px;
top: 250px;
}
a,a:hover{
color: black;
text-decoration: none;
}
</style>

<title>Insert title here</title>
</head>
<%

String mainPage="layout/main.jsp";

//url을 통해서 main값을 읽어서 메인페이지에 출력한다
if(request.getParameter("main")!=null){
	mainPage=request.getParameter("main");
}
	
%>
<body>

<div class="layout title">
	<jsp:include page="layout/title.jsp"/>
</div>
<div class="layout menu">
	<jsp:include page="layout/menu.jsp"/>
</div>
<div class="layout info">
	<jsp:include page="layout/info.jsp"/>
</div>
<div class="layout main">
	<jsp:include page="<%=mainPage %>"/>
</div>

</body>
</html>