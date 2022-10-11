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
<link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300&family=Hi+Melody&family=Jua&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>Insert title here</title>

<style type="text/css">
*{
font-family: 'Gowun Dodum';
}

span.likes{
font-size: 22px;
}

span.heart{
font-size: 27px;
cursor: pointer;
}
</style>

<%
ShopDao dao=new ShopDao();
List<ShopDto>list=dao.getbest();


%>

<script type="text/javascript">
$(function(){
	$(document).on("click",".heart",function(){
		var shopnum=$(this).attr("shopnum");
		var tag=$(this);
		//alert(shopnum);
		
		$.ajax({
			type:"get",
			dataType:"json",
			url:"teashop/ajaxlikes.jsp",
			data:{"shopnum":shopnum},
			success:function(res){
				//alert(res.likes);
				tag.next().text(res.likes);
				tag.animate({"font-size":"34px"},500,function(){
					//애니메이션이 끝난 후 다시 0px로 변경
					$(this).css("font-size","24px");
				});
			}
		});
		
	});
})

</script>

</head>
<body>
<center>
<div class="container" style="width:1200px;display:inline-block;margin-top:180px;">
 
    
	
<%
	NumberFormat nf=NumberFormat.getNumberInstance();		
		
		for(ShopDto dto:list){			
			String photo=dto.getPhoto();
			int sale=20;
			%>
		<div style="width: 300px;display:inline-block;margin-left:70px;margin-bottom:70px;">
				<a shopnum=<%=dto.getShopnum()%> style="cursor: pointer;" class="godetail">
									
					<img src="images2/<%=photo%>" class="photo" style="width: 300px;" onclick="location.href='index.jsp?main=teashop/shopdetail.jsp?shopnum=<%=dto.getShopnum()%>'">
					<br>
					<span style="color: black; font-size: 18px;float:left;margin-bottom:5px;"><%=dto.getSangpum() %></span></a><br>
					
					<%
					int price=(int)(dto.getPrice()+(dto.getPrice()*(sale/100.0)));
					%>	
										
					<div style="">
					<b style="color:#FF7BAC;font-size: 24px;float:left;clear:both;"><%=sale %>%</b>&nbsp;
					<strike style="color: darkgray; font-size: 22px;float:left;position:relative;top:-14px;left:10px;"><%=nf.format(price) %>원</strike> 
					<b style="font-size:24px;float:left;clear:both"><%=nf.format(dto.getPrice()) %>원</b>
					
					<span class="heart glyphicon glyphicon-heart" shopnum=<%=dto.getShopnum()%> style="color:#FF7BAC;font-size:45px;float:right;position:relative;top:-35px;"></span>
					<span class="likes" style="font-size:14px;float:right;left:30px;position:relative;top:11px;"><%=dto.getLikes() %></span>
					</div>					
			
	
 </div>
 
   <%}
	%>
        
 
</div>

</center>
</body>
</html>