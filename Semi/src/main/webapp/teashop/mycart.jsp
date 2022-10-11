<%@page import="data.dao.MemberDao"%>
<%@page import="data.dao.DirectOrderDao"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.HashMap"%>
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
<script type="text/javascript">
	$(function() {
		$("div.sangpum")
				.click(
						function() {
							var shopnum = $(this).attr("shopnum");
							//alert(sangpum);
							location.href = "index.jsp?main=teashop/shopdetail.jsp?shopnum="
									+ shopnum;
						});

		//전체체크하면 체크박스 선택, 해제
		$("#allcheck").click(function() {

			//체크값을 얻는다
			var chk = $(this).is(":checked");
			console.log(chk);

			//전체체크값을 글 앞의 체크에 일괄로 전달
			$(".idx").prop("checked", chk);
		});

		//선택한 상품 삭제버튼 이벤트
		$("#btncartdel").click(function() {

			var cnt = $(".idx:checked").length;
			//alert(cnt);
			if (cnt == 0) {
				alert("먼저 선택할 상품을 선택해주세요");
				return;
			}
			$(".idx:checked").each(function(i, ele) {
				var idx = $(this).attr("idx");

				//선택한 장바구니 모두 삭제
				
				del(idx);
				location.reload();
			});
		});

		//각각의 상품 뒤에 삭제 아이콘 클릭 시 삭제
		$(document).on("click", "span.del", function() {
			var idx = $(this).attr("idx");
			//alert(idx);
			var a = confirm("삭제하시겠습니까?");
			if (a) {
				//idx값 넣어줘야함
				del(idx);
				location.reload();
			}
		});
	});
	function del(idx) {
		$.ajax({

			type : "get",
			url : "teashop/cartdelete.jsp",
			dataType : "html",
			data : {
				"idx" : idx
			},
			success : function() {

			}
		});
	}
</script>
<style>
img.photo {
	width: 250px;
	height: 250px;
	
}

div.sangpum {
	cursor: pointer;
}

span.del {
	cursor: pointer;
}
</style>
</head>
<%
String id = (String) session.getAttribute("myid");
ShopDao dao = new ShopDao();
List<HashMap<String, String>> list = dao.getCartList(id);

MemberDao mdao=new MemberDao();
String num=mdao.getNum(id);

%>
<body>
<center>
	<h4 class="alert alert-default" style="width: 1000px;margin-top:100px;text-align:left;">
		<b style="color:#FF7BAC;"><%=id%></b>님의 장바구니
	</h4>
	<table class="table table-striped" style="width: 1000px">
		<tr>
			<th style="width: 10px"><input type="checkbox" id="allcheck"></th>
			<th style="width: 200px">전체 선택</th>
			<th style="width: 100px;"></th>
		</tr>
		<%
		int allmoney = 0;
		NumberFormat nf = NumberFormat.getCurrencyInstance();
		for (int i = 0; i < list.size(); i++) {
			HashMap<String, String> map = list.get(i);
			int cnt = Integer.parseInt(map.get("cnt"));
		%>
		<tr>
			<td><input type="checkbox" name="idx" class="idx"
				idx="<%=map.get("idx")%>"></td>
			<td>
				<div shopnum="<%=map.get("shopnum")%>" class="sangpum">
					<img src="images2/<%=map.get("photo")%>" class="photo"
						align="left" hspace="20"><br>
						<h4>
						<%=map.get("cartday")%></h4><br>
					<h4>
						<b>상품명: <%=map.get("sangpum")%></b>&nbsp;<span
						class="del glyphicon glyphicon-trash" idx="<%=map.get("idx")%>"></span>
					</h4><br>
					<h4>
						갯수:
						<%=cnt%>개
					</h4>
					
				</div>
			</td>

			<td style="vertical-align: middle;margin-left:100px;">
				<%
				int price = Integer.parseInt(map.get("price"));
				int pojang = Integer.parseInt(map.get("pojang"));
				price *= cnt;
				price+=pojang;
				allmoney += price;
				%>

				<h4><b style="color:#FF7BAC;font-size:1.5em;margin-left:150px;"><%=nf.format(price)%></b> 
				
				<!-- 포장했을 시에 뜨도록 -->
				<%
						if(pojang>=2000){
							%>
							(+2,000)
							<%
						}					
						%>
				
				</h4>
			</td>

		</tr>
		<form name="frm2" id="frm2" enctype="multipart/form-data">
	<input type="hidden" name="idx" value="<%=map.get("idx")%>">
	<input type="hidden" name="shopnum" value="<%=map.get("shopnum")%>">
	<input type="hidden" name="num" value="<%=num%>">
	
	
	<%
		}
		%>
		<tr>
			<td colspan="3">
				<button type="button" class="btn btn-danger"
					style="background-color:#FF7BAC;border:1px solid #FF7BAC;" id="btncartdel">장바구니에서 내보내기</button> <span
				style="font-size: 1.7em; float: right;position:relative;right:175px;">총 합계:<b style="color: #FF7BAC;"> <%=nf.format(allmoney)%></b>
			</span>
			</td>
		</tr>
		<!-- <button type="button" class="btn"
            style="width: 100px; height: 70px; border: 1px solid black; font-size: 12pt; color: white; background-color: black;" id="btnorder">결제하기</button> -->
	</form>
	</table>
	<br><br>
	</center>
	
	
		
		
		<script type="text/javascript">
		
		$("#btnorder").click(function(){
			//form태그의 모든 값 가져오기
			var formdata=$("#frm2").serialize();
			
			//alert(formdata);
			//alert(num);
			
			$.ajax({
				
				type:"post",
				dataType:"html",
				url:"teashop/orderdetailproc.jsp",
				data:formdata,
				success:function(){
					//alert("success");
					
					var a=confirm("결제하시겠습니까?")
					if(a){
						location.href="index.jsp?main=teashop/myreview.jsp";
					}
				}
			});
		});
		</script>
</body>
</html>