
<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300&family=Gowun+Dodum&family=Hi+Melody&family=Jua&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>Insert title here</title>
<style type="text/css">

*{
font-family: 'Gowun Dodum';
}


div.menu{
width:100%;
height:100px;
line-height:100px;
text-align:center;
position:relative;
z-index:10;
}

span.likes{
font-size: 22px;
}

span.heart{
font-size: 27px;
cursor: pointer;
}
</style>
<script type="text/javascript">
$(function(){
   
   $("a.godetail").click(function(){
   
   var shopnum=$(this).attr("shopnum");
   
   //디테일페이지로 이동
   location.href="index.jsp?main=teashop/shopdetail.jsp?shopnum="+shopnum;
   });
});
</script>

</head>
<body>

<div class="layout menu">
<jsp:include page="layout/menu.jsp"/>
</div>

<%
request.setCharacterEncoding("UTF-8");
String sangpum=request.getParameter("sangpum");
ShopDao dao=new ShopDao();
List<ShopDto>list=dao.getSearchSang(sangpum);
%>


<div style="margin-top: 10px; margin-left: 250px;">
<h2>총 <%=list.size() %>개의 글이 검색되었습니다.</h2>
</div>


 <table style="width: 700px; margin-left: 250px;">
	<tr>

	<% 
	NumberFormat nf=NumberFormat.getNumberInstance();
		int i=1;
		
		for(ShopDto dto:list){
			if(dto.getCategory().equals("티 제품")){
			
			String photo=dto.getPhoto();
			int sale=20;
			
			%>
			<td style="padding-right: 50px; padding-bottom: 20px; padding-top: 40px; text-align: center;">
				<a shopnum=<%=dto.getShopnum()%> style="cursor: pointer;" class="godetail">
					
					
					<img src="images2/<%=photo%>" class="photo" style="width: 450px;">
					<br>
					<span style="color: black; font-size: 23px;"><%=dto.getSangpum() %></span><br></a>
					<%
					int price=(int)(dto.getPrice()+(dto.getPrice()*(sale/100.0)));
					%>	
						
					
					<div style="color: black; font-size: 25px;">
					<b style="color:hotpink; font-size: 25px;"><%=sale %>%</b>&nbsp;
					<b><%=nf.format(dto.getPrice()) %>원</b>&nbsp;
					<strike style="color: darkgray; font-size: 22px;"><%=nf.format(price) %>원</strike> 
					<br>
					&nbsp;<span class="heart glyphicon glyphicon-heart" shopnum=<%=dto.getShopnum()%> style="color: deeppink;"></span>
					<span class="likes"><%=dto.getLikes() %></span>
					</div>
				
				
			</td>
			<%
			if((i+3)%3==0){%>
				</tr><tr>
			<% }
			i++;
			
		 }else{
		 String photo=dto.getPhoto();
		
		 %>
			 	<td style="padding-right: 50px; padding-bottom: 10px; padding-top: 40px; text-align: center;">
				<a shopnum=<%=dto.getShopnum()%> style="cursor: pointer;" class="godetail">
					
					
					<img src="images2/<%=photo%>" class="photo" style="width: 450px;">
					<br>
					<span style="color: black; font-size: 23px;"><%=dto.getSangpum() %></span><br></a>
					
					<span><div style="color: black;">
					<%
					int price=(int)(dto.getPrice());
					%>
						
					</div>
					<div style="color: black; font-size: 25px;"><b><%=nf.format(dto.getPrice()) %>원</b>
					<br>
					&nbsp;<span class="heart glyphicon glyphicon-heart" shopnum=<%=dto.getShopnum()%> style="color: deeppink;"></span>
					<span class="likes"><%=dto.getLikes() %></span>
					</div></span>
				
			</td>
			<%
			if((i+3)%3==0){%>
				</tr><tr>
			<% }
			i++;
			
		 
	}
	%>
    
      
		 <%}
	
	%>
    </tr>
</table>
</body>

</html>