<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ReviewDao"%>
<%@page import="data.dto.ReviewDto"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="data.dao.ShopDao"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap" rel="stylesheet">
<style type="text/css">

body{
font-family: 'Gowun Batang';
}

div.container{
margin-top: 1000px;
}

#detail{
position: absolute;
left: 500px;
margin-top: 100px;
}

#content{
width: 400px;
height: 50px;
margin-top: 30px
}

</style>

</head>
<%
String shopnum=request.getParameter("shopnum");

//로그인상태
String loginok=(String)session.getAttribute("loginok");
//로그인한 아이디
String myid=(String)session.getAttribute("myid");

//아이디에 해당하는 멤버테이블의 시퀀스 번호
MemberDao mdao=new MemberDao();
String num=mdao.getNum(myid);

//해당상품에 대한 데이타 가져오기
ShopDao sdao=new ShopDao();
ShopDto dto=sdao.getData(shopnum);

//db선언
 ReviewDao dao=new ReviewDao();

//list가져오기

//페이징에 필요한 변수
int totalCount;
int totalPage; //총 페이지 수
int startPage; //각 블럭의 시작페이지
int endPage; //각블럭의 끝 페이지
int start; //각페이지의 싲가번호
int perPage=3; //한페이지에 보여질 글의 갯수
int perBlock=5; //한 블럭당 보여지는 페이지 갯수
int currentPage; //현재페이지
int no; // 실제 페이지 넘버

//총갯수:
	totalCount=dao.getTotalCount(shopnum);

//현재 페이지 번호 읽기(null일 경우는 1페이지로 설정)
if(request.getParameter("currentPage")==null)
	currentPage=1;
else
	currentPage=Integer.parseInt(request.getParameter("currentPage"));

//총페이지갯수 구하기
totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

//각 블럭의 시작페이지 (현재페이지 3: 시작 1 끝 5)
//각 블럭의 시작페이지 (현재페이지 6: 시작 6 끝 10)
startPage=(currentPage-1)/perBlock*perBlock+1;
endPage=startPage+perBlock-1;

//총페이지수가 8 ... 2번째 블럭은 startpage=6 endpage=10 ... endpage 8로 수정
if(endPage>totalPage)
	endPage=totalPage;

//각페이지에서 블러올 시작번호
//현재페이지가 1일경우 start 1,2 일경우 6
start=(currentPage-1)*perPage;

//각페이지에서 필요한 게시글 불러오기
List<ReviewDto> list=dao.getList(start, perPage, shopnum);

//각 글 앞에 붙일 시작번호
//총글이 만약에 20... 1페이지는 20부터 2페이지는 15부터
//출력해서 1씩 감소하면서 출력
no=totalCount-(currentPage-1)*perPage;

%>
<body>




<form name="frm" id="frm">
<div class="w3-container">
   <!-- hidden으로 장바구니db에 넣어야할것  -->
<input type="hidden" name="shopnum" value="<%=shopnum%>">
<input type="hidden" name="num" value="<%=num%>">

<table style="width: 1100px; height: 700px;" id="detail" >
   <tr>
      <td>
         <div id="photo" style="margin-right: 100px;">
            <img alt="" src="images2/<%=dto.getPhoto()%>"
            class="large img-thumbnail">
         </div>
         <h3 style="float: left; font-size: 25pt; margin-top: 50px;">리뷰 평점</h3>
         <h3 style="float: right; font-size: 25pt; margin-top: 50px; margin-right: 150px;">
       <%switch(dao.getReviewAvg(shopnum)){
         case 1 :%>
         <span class="glyphicon glyphicon-star" style="color: red;"><span class="glyphicon glyphicon-star" style="color: gray;"><span class="glyphicon glyphicon-star" style="color: gray;">         <%
             break;
         case 2 : 
            %>
             <span class="glyphicon glyphicon-star" style="color: red;"></span><span class="glyphicon glyphicon-star" style="color: red;"><span class="glyphicon glyphicon-star" style="color: gray;">
             
          <% 
             break;  
         case 3 : 
            %>
            <span class="glyphicon glyphicon-star" style="color: red;"><span class="glyphicon glyphicon-star" style="color: red;"><span class="glyphicon glyphicon-star" style="color: red;">          <%
             break; 
         default :
            %>
            <span class="glyphicon glyphicon-star" style="color: gray;"><span class="glyphicon glyphicon-star" style="color: gray;"><span class="glyphicon glyphicon-star" style="color: gray;">          <%
              }%>
         </h3>
      </td>

      <td style="width: 300px;">
         <div>
         <h3  style="font-size: 12pt; left: 0px; text-align: left;">카테고리> <%=dto.getCategory() %></h3>
         <h3  style="font-size: 30pt; text-align: left;"><%=dto.getSangpum() %></h3>
         <%NumberFormat nf=NumberFormat.getCurrencyInstance(); %>
         
         </div>
         <div class="icon" style="float: left; text-align: left;">
         <span onclick="clip(); return false;" style="cursor: pointer;" class="glyphicon glyphicon-paperclip"></span>&nbsp;&nbsp;
         <span onclick="document.getElementById('id01').style.display='block'"
            style="cursor: pointer;" class="w3-button glyphicon glyphicon-share"></span>&nbsp;&nbsp;
         <span class="like" style="margin-left: 20px; cursor: pointer;" shopnum="<%=dto.getShopnum()%>">추천</span>       
         <span class="likes"><%=dto.getLikes()%></span>
        <span class="glyphicon glyphicon-heart" style="color: red; font-size: 0px;"></span>&nbsp;&nbsp;<br>
         <h3 style="float: right;">가격: <%=nf.format(dto.getPrice()) %></h3><br><br>
         <hr>
         
        <h3 style="float: left;">구매수량</h3>
         <div style="float: right;">
         <input type="number" id="cnt" name="cnt" min="1" placeholder="1" onchange="count()" style="display:inline; width:100px; font-size: 23pt;">
         </div>

         <br><br><br>
         <select onchange="count('re')" style="width: 400px; height: 50px;" name="pojang" id="pojang">
           <option value="0">포장가능</option>
           <option value="0" >포장안함 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +0원</option>
           <option value="2000">포장함  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +2000원</option>

         </select>
         </div>
         <div style="float: right; margin-top: 10px;">
   
            <button type="button" class="btn"
            style="width: 100px; height: 70px; border: 1px solid black; font-size: 12pt; color: white; background-color: black;" id="btncart">장바구니</button>
      
            <button type="button" class="btn"
            style="width: 150px; height: 70px; border: 1px solid black; font-size: 12pt;  background-color: #FF7BAC;" 
            onclick="location.href='index.jsp?main=teashop/directorder.jsp?shopnum=<%=shopnum%>&num=<%=num%>&photo=<%=dto.getPhoto()%>&sangpum=<%=dto.getSangpum()%>&price=<%=dto.getPrice()%>'">바로구매</button>
         
         </div>
      </td>
   </tr>
</table>

<div class="container">
  <ul class="nav nav-pills nav-justified">
    <li class="active"><a href="#detail">상품구매</a></li>
    <li><a href="#menu1">상품상세</a></li>
    <li><a href="#menu2">상품리뷰</a></li>
    <li><a href="#menu3">상품고시정보</a></li>
  </ul>
</div>

<center>
  <!-- 제품상세 -->

<div class="tab-content" style="margin-top: 200px;">

  <div id="menu1">
  <h3>상품상세</h3>
  <img alt=""  src="images2/<%=dto.getSangsae() %>">


  </div>
  <hr>
  <!-- 고객리뷰 -->
  <div id="menu2" style="margin-top: 100px;">
    <h3>고객리뷰</h3>
    <p>상품을 직접 구매하여 경험하신 분들의 솔직담백한 후기들을 확인해보세요</p>
   
   <div class="alert" style="width: 1300px; margin-top: 50px; text-align: left;">
   	<h3>시크릿 티 스토리</h3>
	<b style="color: gray;">총 <%=totalCount %>개의 고객후기가 있습니다</b>
	</div>
	
	
  
<br>
<center>
<table class="table" style="width: 1300px; " id="tag1">

		<tr style="backgrouond: #ffdd33; font-size: 20pt;">
		    <th width="100px" style="text-align: center;">이미지</th>		
			<th width="100px" style="text-align: center;">작성자</th>		
			<th width="400px" style="text-align: center;">내용</th>
			<th width="100px" style="text-align: center;">작성일</th>
			<th width="100px" style="text-align: center;">별점</th>			
		</tr>

		<%
		//날짜형식
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		
		for(int i=0; i<list.size();i++)
		{
			ReviewDto rdto=list.get(i);
			int tot= (rdto.getDelivery()+rdto.getSmell()+rdto.getTaste())/3;
			
			
			%>
			
			<tr style="height: 200px; cursor: pointer;" onclick="document.getElementById('id02').style.display='block'" id="idx">

			    <td align="center" style="line-height: 200px;"><img src="save/<%=rdto.getPhoto() %>" style="width:100px;"></td>
				<td align="center" style="line-height: 200px;"><%=rdto.getWriter() %></td>
				<td align="center" style="line-height: 200px;"><%=rdto.getContent() %>
				<td align="center" style="line-height: 200px;"><%=sdf.format(rdto.getWriteday()) %></td>
				<td class="hidden" id="hidden1"><%=rdto.getDelivery() %></td>
            <td class="hidden" id="hidden2"><%=rdto.getSmell() %></td>
            <td class="hidden" id="hidden3"><%=rdto.getTaste() %></td>
<td align="center" style="line-height: 200px;" ><%switch(tot){
         case 1 :%>
         <span class="glyphicon glyphicon-star" style="color: red;"><span class="glyphicon glyphicon-star" style="color: gray;"><span class="glyphicon glyphicon-star" style="color: gray;">         <%
             break;
         case 2 : 
            %>
             <span class="glyphicon glyphicon-star" style="color: red;"></span><span class="glyphicon glyphicon-star" style="color: red;"><span class="glyphicon glyphicon-star" style="color: gray;">
             
          <% 
             break;  
         case 3 : 
            %>
            <span class="glyphicon glyphicon-star" style="color: red;"><span class="glyphicon glyphicon-star" style="color: red;"><span class="glyphicon glyphicon-star" style="color: red;">          <%
             break; 
         default :
            %>
            <span class="glyphicon glyphicon-star" style="color: gray;"><span class="glyphicon glyphicon-star" style="color: gray;"><span class="glyphicon glyphicon-star" style="color: gray;">          <%
              }%></td>
              
         </tr>
      <%}
      %>
</table>
</center>


<!-- 페이징처리 -->

<div style="width: 800px; text-align: center; margin-top: 30px;" class="container">
	<ul class="pagination">
		<%
		
		//이전
		if(startPage>1)
		{%>
			<li>
				<a href="index.jsp?main=teashop/shopdetail.jsp?shopnum=<%=dto.getShopnum() %>&currentPage=<%=startPage-1%>#tag1">이전</a>
			</li>
		<%}
		
		for(int pp=startPage;pp<=endPage;pp++)
		{
			if(pp==currentPage)
			{%>
				<li class="active">
					<a href="index.jsp?main=teashop/shopdetail.jsp?shopnum=<%=dto.getShopnum() %>&currentPage=<%=pp%>#tag1"><%=pp %></a>
				</li>	
			<%}else{%>
				<li>
					<a href="index.jsp?main=teashop/shopdetail.jsp?shopnum=<%=dto.getShopnum() %>&currentPage=<%=pp%>#tag1"><%=pp %></a>
				</li>
			<%}
		}
		
		//다음페이지
				if(endPage<totalPage)
				{%>
					<li>
						<a href="index.jsp?main=teashop/shopdetail.jsp?shopnum=<%=dto.getShopnum() %>&currentPage=<%=endPage+1%>#tag1">다음</a>
					</li>
				<%}
		
		%>
	</ul>
	</div>
   
  		</div>
  <hr>
  <div id="menu3" style="margin-top: 100px;">
    <h3>상품의 자세한 사항을 확인해보세요.</h3>
    <p>상품에 대한 디테일한 사항을 하단에서 확인해보세요.
상품정보제공 고시부터 상품청약 조회안내까지 모든 사항을 확인하실 수 있습니다.</p>
  <img alt="" src="images2/런던셀렉션 0.jpg" style="margin-top: 100px;">

  </div>
</div>
</form>

<div id="id01" class="w3-modal" >
    <div class="w3-modal-content w3-card-4" style="max-width: 500px; margin-top: 200px;">
      <header class="w3-container w3-teal"> 
        <span onclick="document.getElementById('id01').style.display='none'" 
        class="w3-button w3-display-topright">&times;</span>
        <h2>공유하기</h2>
      </header>
      <div class="w3-container">
        <a id="btnTwitter" class="link-icon twitter" href="javascript:shareTwitter();">트위터</a><br>
      <a id="btnFacebook" class="link-icon facebook" href="javascript:shareFacebook();">페이스북</a>   
      </div>
    </div>
  </div>
  
</div>
<div id="id02" class="w3-modal" >
    <div class="w3-modal-content w3-card-4" style="width: 1000px; height: 650px;">
      <header class="w3-container w3-teal"> 
        <span onclick="document.getElementById('id02').style.display='none'" 
        class="w3-button w3-display-topright">&times;</span>
        <h2>상세보기</h2>
      </header>
      <div class="w3-container">
    <%
      //날짜형식
   
         
         %>
           <table class="table table-bordered" style="width: 900px; height:300px; ; margin-left: 35px; margin-top: 10px;">
         <caption><b style="font-size: 20pt;">상세리뷰</b></caption>
            <tr>
               <td style="width: 120px; height:40px; line-height:40x; background-color: beige"><b>작 성 자</b></td>
               <td>
                  <span id="bookId" style="float: left;"></span>
                  <span id="bookId2" style="float: right;"></span>
               </td>
            </tr>   
            <tr>
               <td style="width: 120px; height: 200px; line-height:200px; background-color: beige;"><b>내 용</b></td>
               <td>
                  <span style="float: left;" id="bookId1"></div>
               </td>
            </tr>
               </table>
               
         <table style="width: 900px; margin-left: 35px; margin-top: 0px;">
            <tr align="center">
               <td style="width: 150px; background-color: beige; border: 0px;"><b>맛</b><br>
                  <img alt="" src="images2/taste.png" style="width: 100px; height: 100px;"><br>
                  <span id="bookId3"></span>
               </td>
               <td style="width: 150px; background-color: beige; border: 0px;"><b>향</b><br>
                  <img alt="" src="images2/smell.png" style="width: 100px; height: 100px;"><br>
                  <span id="bookId4"></span>
               </td>
               <td style="width: 150px; background-color: beige; border: 0px;"><b>배달</b><br>
                  <img alt="" src="images2/delivery.png" style="width: 100px; height: 100px;"><br>
                  <span id="bookId5"></span>
               </td>
            </tr>
      </table>
           
      </div>
    </div>
  </div>

</center>


<script type="text/javascript">
$(document).on("click", "#idx", function () {
    
    $("#bookId").text($(this).find("td:eq(1)").text());
    $("#bookId1").text($(this).find("td:eq(2)").text());
    $("#bookId2").text($(this).find("td:eq(3)").text()); 
    $("#bookId3").text($(this).find("td:eq(4)").text()); 
    $("#bookId4").text($(this).find("td:eq(5)").text()); 
    $("#bookId5").text($(this).find("td:eq(6)").text()); 
    
    // As pointed out in comments, 
    // it is superfluous to have to manually call the modal.
    // $('#addBookDialog').modal('show');
});

//좋아요
$("span.like").click(function(){
   
   var shopnum=$(this).attr("shopnum");
   var tag=$(this);
   console.log(shopnum);
   
   $.ajax({
      type:"get",
      dataType:"json",
      url:"teashop/ajaxlikes.jsp",
      data:{"shopnum":shopnum},
      success:function(res){
         //alert(res.chu);
         tag.next().text(res.likes);
         tag.next().next().animate({"font-size":"15px"},500,function(){
            //애니메이션이 끝난후 다시 글골크기는 0px로 변경
            $(this).css("font-size","0px");
         });
      }
   });
});

$("#btncart").click(function(){
   //form태그의 모든 값 가져오기
   var formdata=$("#frm").serialize();
   
   //alert(formdata);
   //alert(num);
   
   $.ajax({
      
      type:"post",
      dataType:"html",
      url:"teashop/detailproc.jsp",
      data:formdata,
      success:function(){
         //alert("success");
         
         var a=confirm("장바구니에 저장할까요?")
         if(a){
            location.href="index.jsp?main=teashop/mycart.jsp";
         }
      }
   });

});
$("#btnorder").click(function(){
	   //form태그의 모든 값 가져오기
	   var formdata=$("#frm").serialize();
	   
	   //alert(formdata);
	   //alert(num);
	   
	   $.ajax({
	      
	      type:"post",
	      dataType:"html",
	      url:"teashop/detailorder.jsp",
	      data:formdata,
	      success:function(){
	         //alert("success");
	         
	      
	       
	            location.href="index.jsp?main=teashop/detailorder.jsp";
	        
	      }
	   });

	});  
   
//url 복사 
function clip(){

   var url = '';
   var textarea = document.createElement("textarea");
   document.body.appendChild(textarea);
   url = window.document.location.href;
   textarea.value = url;
   textarea.select();
   document.execCommand("copy");
   document.body.removeChild(textarea);
   alert("URL이 복사되었습니다.")
}
//트위터 공유
function shareTwitter() {
    var sendText = "오설록"; // 전달할 텍스트
    var sendUrl = window.document.location.href; // 전달할 URL
    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
}
//페이스북 공유
function shareFacebook() {
    var sendUrl = "devpad.tistory.com/"; // 전달할 URL
    window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
}

</script>


</body>
</html>