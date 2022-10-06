<%@page import="data.dto.ShopDto"%>
<%@page import="data.dao.ShopDao"%>
<%@page import="data.dao.SmartAnswerDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.SmartDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.SmartDao"%>
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
<script type="text/javascript">
$(function(){
	
	$(".alldelcheck").click(function(){
		
		//전체선택에 의한 체크 속성값(체크값) 얻기, 일괄 체크 시에 prop이라는 메소드를 많이 씀
		var chk=$(this).is(":checked");
		
		
		//전체 체크값을 글 앞의 체크에 일괄 전달
		$(".alldel").prop("checked",chk);
	});
	
	//삭제 버튼 클릭 시 삭제
	$("#btndel").click(function(){
		
		//몇 개가 체크 되었는 지(체크된 길이) 구하기
		var len=$(".alldel:checked").length;
		
		if(len==0){
			alert("최소 1개 이상의 글을 선택해주세요");
		}else{
			
			var a=confirm(len+"개의 글을 삭제하려면 확인을 클릭해주세요");
			
			//(체크된 곳)삭제하려는 글의 value값(num)을 알아야함
			var n="";
			//각각의 값이 필요하므로 each
			$(".alldel:checked").each(function(idx){
				
				n+=$(this).val()+",";
						
			});
			n=n.substring(0,n.length-1);
			//n=n.slice(0,-1); slice도 가능!!! 간단하다
			//alert(n);
			
			//삭제파일로 전송, nums로 보내기
			location.href="manager/event/alldelete.jsp?nums="+n;
			location.reload();
		}
		
	});
});

</script>
<style type="text/css">

</style>

</head>
<%
//로그인 상태 확인 후 입력폼 나타내기
String root = request.getParameter("root");
SmartDao dao = new SmartDao();
//페이징에 필요한 변수
int totalCount;
int totalPage; //총 페이지 수
int startPage; //각 블럭의 시작페이지
int endPage; //각 블럭의 끝 페이지
int start; //각 페이지의 시작번호
int perPage = 3; //한 페이지에 보여질 글의 갯수
int perBlock = 5; //한 블럭당 보여지는 페이지 갯수
int currentPage; //현재 페이지
int no;

//총 갯수:
totalCount = dao.getTotalCount();

//현재 페이지 번호 읽기(null일 경우는 1페이지로 설정)
if (request.getParameter("currentPage") == null)
	currentPage = 1;
else {
	currentPage = Integer.parseInt(request.getParameter("currentPage"));
}

//총 페이지 갯수 구하기
totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

//각 블럭의 시작페이지 ex(현재페이지 3이면 시작:1 끝:5)
//ex(현재페이지 6이면 시작:6 끝:10) 보여지는 건 5개까지로 했으니까!!!
startPage = (currentPage - 1) / perBlock * perBlock + 1;
endPage = startPage + perBlock - 1;

//총 페이지 수가 8이면, 두 번째 블럭은 startPage가 6이 되고 endPage는 10이 됨. 이 경우엔 endPage를 8로
//수정해야함!!
if (endPage > totalPage)
	endPage = totalPage;

//각  페이지에서 불러올 시작번호
//현재 페이지가 1일 경우 start는 1임, 현재 페이지가 2면 start는 6
start = (currentPage - 1) * perPage;

//각 페이지에서 필요한 게시글 불러오기
List<SmartDto> list = dao.getList(start, perPage);

//각 글 앞에 붙일 시작번호
//총 글이 만약 20개면 1페이지는 20부터, 2페이지는 15부터
//출력해서 1씩 감소하며 출력
no = totalCount - (currentPage - 1) * perPage;

//get AnswerCount (댓글 갯수 받아오기), 이 페이지에서 dao는 그냥 스마트 dao이기때문에 adao로 받아옴
SmartAnswerDao adao=new SmartAnswerDao();
for(SmartDto dto:list){
	int acount=adao.getAnswerList(dto.getNum()).size();
	//엔서 카운트에 넘버의 길이값에 해당하는 엔서 리스트를 넣은 acount를 넣기
	dto.setAnswercount(acount);
}

%>
<body>
<%-- <h5 class="alert alert-info">
			총
			<%=totalCount%>개의 게시글이 있습니다
		</h5> --%>
		
	<div style="margin: 150px auto; width: 800px;height:auto;">
		
			<%
			if (totalCount == 0) {
			%>
					<h5>
						<b>등록된 게시글이 존재하지 않습니다</b>
				    </h5>					
			<%
			} else {

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd  HH:mm");
			for (SmartDto dto : list) {
			%>
			
				<div style="width:800px;height:420px;">
				<img src="save/<%=dto.getMainphoto()%>" width="800px" height="300px" border="1" onclick="location.href='index.jsp?main=manager/event/contentview.jsp?num=<%=dto.getNum() %>&currentPage=<%=currentPage %>'" style="cursor:pointer"><br><br>
				<span style="margin-left:10px"><input type="checkbox" class="alldel" value="<%=dto.getNum() %>">&nbsp;&nbsp;<%=no--  %></span><span class="glyphicon glyphicon-eye-open" style="float:right;right:10px;"><%=dto.getReadcount()%></span>
				
				<%				
				if(dto.getAnswercount()>0){
					%>
					&nbsp;&nbsp;<a href="index.jsp?main=manager/event/contentview.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage %>#alist" style="color:#FF7BAC;text-decoration:none;"><span class="glyphicon glyphicon-menu-down"></span>&nbsp;<b><%=dto.getAnswercount() %></b></a>
					<%
				}
							
				%>
				<span style="margin-left:15px;font-size:22px;font-weight:500"><%=dto.getWriter()%></span><br><br>
			    <span style="margin-left:10px;"><%=sdf.format(dto.getWriteday())%></span><br><br>
				<br><br><br>
		</div>
		
			<%
			}
			}
			%>	
			
			
			<input type="checkbox" class="alldelcheck">전체선택
			<span style="float:right"> 
			<button type="button" class="btn btn-danger" id="btndel" style="background-color:#FF7BAC;border:1px solid #FF7BAC;">삭제&nbsp;<span class="glyphicon glyphicon-trash"></span></button>
			<button type="button" class="btn btn-default" onclick="location.href='index.jsp?main=manager/event/event.jsp'">글쓰기&nbsp;<span class="glyphicon glyphicon-pencil"></span></button>
			</span>
			
	</div>
	

	<!-- 페이징 처리 -->
	<div style="width: 800px; text-align: center;" class="container">
		<ul class="pagination">
			<%
			//이전
			if (startPage > 1) {
			%>
			<li><a href="index.jsp?main=manager/event/smartlist.jsp?currentPage=<%=startPage - 1%>">이전</a>
			</li>
			<%
			}

			for (int pp = startPage; pp <= endPage; pp++) {
			if (pp == currentPage) {
			%>
			<li class="active"><a href="index.jsp?main=manager/event/smartlist.jsp?currentPage=<%=pp%>" style="background-color:#FF7BAC;border:1px solid #FF7BAC;color:#ffffff;cursor:pointer;"><%=pp%></a>
			</li>
			<%
			} else {
			%>
			<li class="active"><a href="index.jsp?main=manager/event/smartlist.jsp?currentPage=<%=pp%>" style="background-color:#FFffff;border:1px solid #FF7BAC;color:#FF7BAC;cursor:pointer;"><%=pp%></a>
			</li>
			<%
			}
			}

			//다음
			if (endPage < totalPage) {
			%>
			<li><a href="index.jsp?main=manager/event/smartlist.jsp?currentPage=<%=endPage+1%>">다음</a></li>
			<%
             }
            %>
		</ul>
	</div>
 
</body>
</html>