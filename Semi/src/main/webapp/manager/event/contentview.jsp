<%@page import="data.dto.ShopDto"%>
<%@page import="data.dao.ShopDao"%>
<%@page import="data.dao.SmartAnswerDao"%>
<%@page import="data.dto.SmartAnswerDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.SmartDto"%>
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
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
div.alist {
	margin-left: 20px;
}
</style>
<script>
$(function(){
	//처음 시작 시 댓글 호출해야함
	list();
		var num=$("#num").val();
	$("#btnasend").click(function(){
		
		//alert(num);
		var nickname=$("#nickname").val();
		var content=$("#content").val();

		//if(nickname=='')
			if(nickname.trim().length==0){
				alert("닉네임을 입력 후 저장해주세요");
		        return;
	}
			if(content.trim().length==0){
				alert("댓글을 입력 후 저장해주세요");
		        return;
	}
			$.ajax({
				
				type:"get",
				url:"manager/event/insertanswer.jsp",
				//리턴 받는 게 없으니 html
				dataType:"html",
				data:{
					"num":num,"nickname":nickname,"content":content
				},
				success:function(){
					//기존 입력값 지우기
					$("#nickname").val('');
					$("#content").val('');
					
					list();
				},
				statusCode:{
					404:function(){
						alert("파일을 찾을 수 없어요");
					},
					500:function(){
						alert("서버 오류... 코드를 확인해주세요");
					}
				}
			});
		
	});
	
	$(document).on("click","span.adel",function(){
		//제발 큰 따옴표 잊지말기
		var idx=$(this).attr("idx");
		//alert(idx);
		var a=confirm("댓글을 삭제합니다");
		
		if(a){
		$.ajax({
			
			type:"get",
			url:"manager/event/delete.jsp",
			//리턴 받는 게 없으니 html
			dataType:"html",
			data:{
				"idx":idx
			},
			success:function(){
				list();
			}
			});
		}
	});
	
	//댓글목록 수정 span을 누르면 수정 폼에 해당하는 modal이 뜬다
	$(document).on("click","span.amod",function(){
		
		idx=$(this).attr("idx");
		//alert(idx);
		
		$.ajax({
			
			type:"get",
			url:"manager/event/updateformjson.jsp",
			dataType:"json",
			data:{"idx":idx},
			success:function(res){
				
				//unickname에 res에서 넘어온 nickname을 넣어준다
				$("#unickname").val(res.nickname);
				$("#ucontent").val(res.content);
			}
		});
		$("#myModal").modal();
		
	});
	
	//댓글수정
	 $(document).on("click","#btnaupdate",function(){
	
	var nickname=$("#unickname").val();
	var content=$("#ucontent").val();
		 
	$.ajax({
			
			type:"get",
			url:"manager/event/updateactionjson.jsp",
			dataType:"html",
			data:{"idx":idx,
				"nickname":nickname,
				"content":content
			},
			success:function(res){
				
				list();
			}
	    });
	}); 
	 
	 
	 
});

function list(){
	//댓글 출력
	console.log("list num="+$("#num").val());
	
	//현재 로그인 중인 아이디
	var loginid=$("#myid").val();
   
    $.ajax({
	   
	   type:"get",
	   url:"manager/event/listanswer.jsp",
	   dataType:"json",
	   data:{"num":$("#num").val()},
	   success:function(res){
		  
		   //댓글 갯수 출력, 스판 태그에 res.length를 출력
		   $("b.acount>span").text(res.length);
		   
		   //댓글 목록...nickname,content,writeday,수정,삭제버튼
		   var s="";
		   
		   $.each(res,function(idx,item){
			
			 //삭제 본인만 보이게
				var myid=item.nickname;
			// alert(myid);
				
					   s+="<br><div><b>"+item.nickname+"</b>&nbsp;&nbsp;<span class='aday'>"+item.writeday+"</span><br>"
					   s+=item.content		   
			           s+="&nbsp;&nbsp;<span class='glyphicon glyphicon-trash adel' idx="+item.idx+" style='cursor:pointer'></span>";
			           s+="&nbsp;<span class='glyphicon glyphicon-edit amod' idx="+item.idx+" style='cursor:pointer'></span>";
			           s+="</div>";
				
			  
		   });
		   $("div.alist").html(s);
	   }
   }); 
}
</script>
</head>
<body>
	<%
	//로그인 상태
	String loginok=(String)session.getAttribute("loginok");

	//로그인한 아이디
	String myid=(String)session.getAttribute("myid");
	
	String num = request.getParameter("num");
	String currentPage=request.getParameter("currentPage");

	//dao선언
	SmartDao dao = new SmartDao();
	dao.updateReadCount(num);
	//num에 해당하는 dto 받기
	SmartDto dto = dao.getData(num);
	
	NumberFormat nf = NumberFormat.getCurrencyInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH시 mm분");
    SmartAnswerDao bdao=new SmartAnswerDao();
    SmartAnswerDto bdto=new SmartAnswerDto();
	%>


	<div style="margin: 70px auto">
		<input type="hidden" id="num" value="<%=num %>">
		<table class="table table-bordered"
			style="width: 1200px; margin: 0 auto;">
			<tr>
				<th width="10">제목</th>
				<td width="100"><%=dto.getSubject()%></td>

				<th width="10">작성자</th>
				<td width="30"><%=dto.getWriter()%></td>

				<th width="10">작성일</th>
				<td width="100"><%=sdf.format(dto.getWriteday())%></td>

				<td width="10" align="center"><span
					class="glyphicon glyphicon-eye-open"></span>&nbsp;&nbsp;<%=dto.getReadcount()%></td>
			</tr>

			<tr>

				<td width="150" colspan="7" align="center"><%=dto.getContent()%></td>
			</tr>

			<!-- 댓글 -->
			<tr>
				<td colspan="7"><b class="acount">댓글&nbsp;<span class="">0</span></b>
					<input type="hidden" id="myid" value="<%=myid%>">

					<div class="alist">댓글 목록(리스트)</div> <br>
					<div class="aform" class="form-control" id="alist">
						<input type="text" id="nickname" class="form-control"
							style="width: 100px" placeholder="nickname" value="<%=myid%>">
						<input type="text" id="content" class="form-control"
							style="width: 300px" placeholder="reply message"><br>
						<button type="button" id="btnasend" class="btn btn-info asend"
							value="<%=bdto.getIdx()%>">저장</button>
					</div></td>
			</tr>

			<tr>
				<td align="right" colspan="7">

                    
					<button type="button" class="btn btn-warning"
						onclick="location.href='index.jsp?main=manager/event/updateform.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>'" style="background-color:#FF7BAC;border:none;">
						수정&nbsp;<span class="glyphicon glyphicon-edit"></span>
					</button>
					<button type="button" class="btn btn-danger"
						onclick="funcdel(<%=num%>,<%=currentPage%>)" style="background-color:#FF7BAC;border:none;">
						삭제&nbsp;<span class="glyphicon glyphicon-trash"></span>
					</button>
					<button type="button" class="btn btn-default"
						onclick="location.href='index.jsp?main=manager/event/smartlist.jsp?currentPage=<%=currentPage%>'">
						목록&nbsp;<span class="glyphicon glyphicon-th-list"></span>
					</button>
				</td>
			</tr>
		</table>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">

		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">댓글 수정</h4>
				</div>
				<div class="modal-body">
					<b>Nickname: </b> <input type="text" id="unickname"
						style="width: 100px"> <b>Content: </b> <input type="text"
						id="ucontent" style="width: 200px">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="btnaupdate">Update</button>
				</div>
			</div>
		</div>
	</div>

	<script>
function funcdel(num,currentPage){
		
	//alert(num+","+ currentPage);
	
	var a=confirm("삭제하시겠습니까?");
	
   if(a){
	   location.href="manager/event/deleteaction.jsp?num="+num+"&currentPage="+currentPage;
   }
}
</script>


</body>
</html>