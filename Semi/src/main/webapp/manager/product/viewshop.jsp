<%@page import="data.dao.ReviewDao"%>
<%@page import="data.dto.ReviewDto"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ShopDao"%>
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
</head>
<body>
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
	 ReviewDao rdao=new ReviewDao();

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
		totalCount=rdao.getTotalCount(shopnum);

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
	List<ReviewDto> list=rdao.getList(start, perPage, shopnum);

	//각 글 앞에 붙일 시작번호
	//총글이 만약에 20... 1페이지는 20부터 2페이지는 15부터
	//출력해서 1씩 감소하면서 출력
	no=totalCount-(currentPage-1)*perPage;

NumberFormat nf = NumberFormat.getCurrencyInstance();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH시");
%>
<div style="margin-top:100px;">
<table class="table table-bordered" style="margin:0 auto;width:600px">
<div style="float:left">
<tr width="350">
<th width="30">이미지명: <%=dto.getPhoto()%></th>
	<td><img src="images2/
					<%=dto.getPhoto()%>" width="200"
		height="200" class="img-thumbnail;float:left"></td>
	</tr>
	</div>
	
</tr>

<tr>
<th>카테고리</th>
	<td width="50"><%=dto.getCategory()%></td>
	</tr>

<tr>
<th>상품명</th>
	<td width="50"><%=dto.getSangpum()%></td>
	</tr>

<tr>
<th>가격</th>
	<td><%=nf.format(dto.getPrice())%></td>
</tr>	

<tr>
<th>날짜</th>
	<td width="50"><%=dto.getIpgoday()%></td>
	</tr>
	
	<div style="float:left">
<tr width="350">
<th width="30">상세 이미지명: <%=dto.getSangsae()%></th>
	<td><img src="images2/
					<%=dto.getSangsae()%>" width="200"
		height="200" class="img-thumbnail;float:left"></td>
	</tr>
	</div>
</div>

<tr>
<td colspan="2">
<a href="index.jsp?main=manager/product/updateform.jsp?
shopnum=<%=dto.getShopnum()%>"><button class="btn btn-info sm">수정</button></a>
&nbsp;
<a href="index.jsp?main=manager/product/deleteshop.jsp?
shopnum=<%=dto.getShopnum()%>"><button class="btn btn-danger sm" style="background-color:#FF7BAC;border:none;">삭제</button></a>&nbsp;
<a href="index.jsp?main=manager/product/product.jsp"><button class="btn btn-default sm">목록</button></a>
</td>
</tr>
</table>
</div>
</body>
</html>