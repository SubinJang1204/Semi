<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.ShopDao"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="csstransforms no-csstransforms3d csstransitions">
<head>
<%
String root=request.getContextPath();

//세션로그인 상태
String loginok=(String)session.getAttribute("loginok");

//세션에 저장된 아이디
String myid=(String)session.getAttribute("myid");

MemberDao dao=new MemberDao();

String name=dao.getName(myid);

ShopDao sdao=new ShopDao();
int cartSize=sdao.getCartList(myid).size();

%>
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style type="text/css">
  ul li{
  font-size:18px;
  }
  #hov:hover{
   color: #FF7BAC;
   transition:0.3s;
  }
  #hov{
  color:#4e4e4e;
  }
  #hov:visited{
  background-color:#eee;
  }
 button.btnsearch{
  background-color:#FF7BAC;
  border:none;
  font-weight:300;
  border-radius:5px;
  }
  button.btnsearch:hover{
  border:1px solid #FF7BAC;
  color:#FF7BAC;
  }
  </style>
</head>
<body>
<nav class="navbar navbar-inverse" style="background-color:#fff;border:#fff;margin-top:20px;">
  <div class="container-fluid">
    <div class="navbar-header">
    
      <a class="navbar-brand" href="index.jsp"><img src="images/logo2.png" style="margin-top:-11px;margin-left:150px;margin-right:20px;width:40px;height:40px"></a>
    </div>
    <ul class="nav navbar-nav">
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="" id="hov" style="margin-right:5px;">Category<span class="caret"></span></a>
        <ul class="dropdown-menu">
        <li><a href="index.jsp?main=teashop/all.jsp">전체상품</a></li>
          <li><a href="index.jsp?main=teashop/teaset.jsp">티 세트</a></li>
          <li><a href="index.jsp?main=teashop/tea.jsp">티 단품</a></li>
          <li><a href="index.jsp?main=teashop/dagi.jsp">다기 & 다도구</a></li>
        </ul>
      </li>
      
      <li><a href="index.jsp?main=teashop/best.jsp" id="hov" style="margin-right:5px;">Best</a></li>
      <li><a href="index.jsp?main=event/smartlist.jsp" id="hov">Event</a></li>
   <%
if(loginok==null){
	%> 
	
    <li  style="margin-left:883px;"><a href="index.jsp?main=login/loginform.jsp"><span class="glyphicon glyphicon-log-in" id="hov" style="font-size:16pt;top:-1px"></span></a></li>
    <li style="margin-top:-35px;">
     
    <form class="navbar-form navbar-left" method="post" action="search.jsp" accept-charset="utf-8">
         <input type="text" name="sangpum" class="form-control" placeholder="Enter your keyword" style="width:200px;border-radius:5px;" required="required">
      <button type="submit" class="btn btn-default btn-sm btnsearch" style="" >Search</button>
      	
    </form> 
    </li>
    <%
	//로그인 중이면
}else{ 
	%>
	
	<%
					//admin 계정만 볼 수 있음
					if(loginok!=null && myid.equals("admin")){
						
						%>
						<li style="position:relative;left:780px;"><a href="index.jsp?main=manager/manager_index.jsp"><span class="glyphicon glyphicon-cog" id="hov" style="font-size:16pt;top:-1px"></span></a></li>
						<%
					}
						%>
	
	<li style="margin-left:780px;"><a href="index.jsp?main=mypage/mypage.jsp"><span class="glyphicon glyphicon-user" id="hov" style="font-size:16pt;top:-1px"></span></a></li>
  
    <li><a href="index.jsp?main=teashop/mycart.jsp?myid=<%=myid%>"><span class="	glyphicon glyphicon-lock" id="hov" style="font-size:16pt;top:-1px"><div style="color:white;background-color:#FF7BAC;
   width:20px;height:20px;border-radius:100%;position:relative;top:-23px;left:15px;font-size:15px;line-height:20px;"><%=cartSize %></div></span></a></li>
   
   <li><a href="login/logoutaction.jsp"><span class="glyphicon glyphicon-log-in" id="hov" style="font-size:16pt;top:-1px"></span></a></li>
   
    <li style="margin-top:-35px;">
     
     <form class="navbar-form navbar-left" action="index.jsp?main=teashop/tea.jsp" method="post" accept-charset="utf-8">
     
        <input type="text" name="sangpum" class="form-control" placeholder="Enter your keyword" style="width:200px;border-radius:5px;"  required="required">
 
      <button type="submit" class="btn btn-default btn-sm btnsearch" style="">Search</button>
    </form>
    
    </li>
	<%
}
%> 
    </ul>
  </div>
</nav>


</body></html>