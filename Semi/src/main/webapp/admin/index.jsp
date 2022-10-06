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
/* div.menu{
width: 100%;
height: 80px;
line-height: 80px;
font-size: 18pt;
text-align: center;
top: 120px;
} */

div.info{
width: 170px;
height: 100%;
line-height: 10px;
font-size: 15pt;
border-radius: 30px;
top: 100px;

}
div.main{
width: 800px;
height: 500px;
font-size: 12pt;
left: 230px;
top: 100px;
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