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

<%
ShopDao dao=new ShopDao();
List<ShopDto>list=dao.getAllSangpums();
List<ShopDto>dlist=dao.getpriceDescSangpums();
List<ShopDto>alist=dao.getpriceAscSangpums();

%>

</head>
<body>



<div class="container" style="margin-top: 70px; float: left; margin-left: 240px;">
 
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home" style="color:darkgray;">최신순</a></li>
    <li><a data-toggle="tab" href="#menu1" style="color: darkgray;">가격 낮은 순</a></li>
    <li><a data-toggle="tab" href="#menu2" style="color: darkgray;">가격 높은 순</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <p>
      <table style="width: 650px;">
   <tr>
<%
   NumberFormat nf=NumberFormat.getNumberInstance();
      int i=1;
      for(ShopDto dto:list){
      
         
         String photo=dto.getPhoto();
         
         
         %>
         <td style="padding-right: 50px; padding-bottom: 10px;">
            <a shopnum=<%=dto.getShopnum()%> style="cursor: pointer;" class="godetail">
               
               
               <img src="images2/<%=photo%>" class="photo" style="width: 450px;">
               <br>
               <span style="color: black; font-size: 23px;"><%=dto.getSangpum() %></span><br>
               
               <span><div style="color: black;">
               <%
               int price=(int)(dto.getPrice());
               %>
                  
               </div>
               <div style="color: black; font-size: 25px;"><b><%=nf.format(dto.getPrice()) %>원</b></div></span>
            </a>
         </td>
         <%
         if((i+3)%3==0){%>
            </tr><tr>
         <% }
         i++;
         
       
   }
   %>
    </tr>
</table>
      
      </p>
    </div>
    <div id="menu1" class="tab-pane fade">
      <p>
        <table style="width: 650px;">
   <tr>
<%
       i=1;
      for(ShopDto dto:alist){
      
         
         String photo=dto.getPhoto();
         
         
         %>
         <td style="padding-right: 50px; padding-bottom: 10px;">
            <a shopnum=<%=dto.getShopnum()%> style="cursor: pointer;" class="godetail">
               
               
               <img src="images2/<%=photo%>" class="photo" style="width: 450px;">
               <br>
               <span style="color: black; font-size: 23px;"><%=dto.getSangpum() %></span><br>
               
               <span><div style="color: black;">
               <%
               int price=(int)(dto.getPrice());
               %>
                  
               </div>
               <div style="color: black; font-size: 25px;"><b><%=nf.format(dto.getPrice()) %>원</b></div></span>
            </a>
         </td>
         <%
         if((i+3)%3==0){%>
            </tr><tr>
         <% }
         i++;
         
       
   }
   %>
    </tr>
</table>
      
      </p>
    </div>
    <div id="menu2" class="tab-pane fade">
      
      <p>
        <table style="width: 650px;">
   <tr>
<%
       i=1;
      for(ShopDto dto:dlist){
      
         
         String photo=dto.getPhoto();
         
         
         %>
         <td style="padding-right: 50px; padding-bottom: 10px;">
            <a shopnum=<%=dto.getShopnum()%> style="cursor: pointer;" class="godetail">
               
               
               <img src="images2/<%=photo%>" class="photo" style="width: 450px;">
               <br>
               <span style="color: black; font-size: 23px;"><%=dto.getSangpum() %></span><br>
               
               <span><div style="color: black;">
               <%
               int price=(int)(dto.getPrice());
               %>
                  
               </div>
               <div style="color: black; font-size: 25px;"><b><%=nf.format(dto.getPrice()) %>원</b></div></span>
            </a>
         </td>
         <%
         if((i+3)%3==0){%>
            </tr><tr>
         <% }
         i++;
         
       
   }
   %>
    </tr>
</table>
      
      </p>
    </div>
    
  </div>
</div>


</body>
</html>