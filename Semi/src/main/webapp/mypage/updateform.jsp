<%@page import="java.util.StringTokenizer"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
String root=request.getContextPath();
%>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
body{
font-family: 'Gowun Dodum', sans-serif;
}
</style>
<script type="text/javascript">
$(function(){
	
	//id 중복체크
	$("#btncheck").click(function(){
		
		//id 읽기
		var id=$("#id").val();
		//alert(id);
		
		$.ajax({
			type:"get",
			url:"member/idcheck.jsp",
			dataType:"json",
			data:{
				"id":id
			},
			success:function(res){
				if(res.count==1){
					alert("이미 가입된 아이디 입니다\n 다시 입력해주세요");
					//초기화
					$("#id").val(' ');
				}else{
					alert("가능한 아이디입니다");
				
				}
			}
		})
	});
	//이메일 선택
	//select는 change
	$("#selemail").change(function(){
	
		if($(this).val()=='-'){
			$("#email2").val(' '); //지정된 메일 지우기
		$("#email2").focus();// 포커스 주기
		}else{
			//셀렉트 선택하면 값이 폼에 들어오게
			$("#email2").val($(this).val());
		}
	});
});

//비밀번호 체크
function check(f){
	
	if(f.pass.value!=f.pass2.value){
		alert("비밀번호가 서로 다릅니다");
		//비밀번호를 비워줌, 받아오도록
		f.pass.value="";
		f.pass2.value="";
		//action이 호출되지 않는다
		return false;
	}
}
</script>
</head>
<%
String num=request.getParameter("num");
MemberDao dao=new MemberDao();
MemberDto dto=dao.getMember(num);

/* //@위치 찾아내는 법
int idx=dto.getEmail().indexOf('@');
String email1=dto.getEmail().substring(0, idx); //이메일 앞부분
String email2=dto.getEmail().substring(idx+1);//이메일 뒷부분 */

//@를 구분자로 분리하는 법
StringTokenizer st=new StringTokenizer(dto.getEmail(),"@");
String email1=st.nextToken();
String email2=st.nextToken();
%>
<body>
<center>
<!-- form inline하면 따로 인라인 블록 지정 안 해도 됨!! -->
<form action="mypage/updateaction.jsp" method="post" class="form-inline" onsubmit="return check(this)" style="margin-top:250px;">
<table class="table table bordered" style="width:500px;">
<caption><b>회원가입 수정</b></caption>


<tr>
<th width="100">이름</th>
<td>
<input type="text" name="name" class="form-control"
required="required" style="width:120px" value="<%=dto.getName()%>">
</td>
</tr>

<tr>
<th width="100">번호</th>
<td>
<input type="text" name="hp" class="form-control"
required="required" style="width:200px" value="<%=dto.getHp()%>">
</td>
</tr>

<tr>
<th width="100">주소</th>
<td>
<input type="text" name="addr" class="form-control" value="<%=dto.getAddr()%>"
required="required" style="width:400px">
</td>
</tr>

<tr>
<th width="100">이메일</th>
<td>
<input type="text" name="email" class="form-control" 
required="required" style="width:80px"  value="<%=email1%>">
<b>@</b>
<input type="text" name="email2" id="email2" class="form-control" 
required="required" style="width:150px"  value="<%=email2%>">

<select id="selemail" class="form-control">
<option value="-">직접입력</option>
<option value="naver.com">네이버</option>
<option value="gmail.com">구글</option>
<option value="daum.com">다음</option>
<option value="nate.com">네이트</option>
</select>
</td>
</tr>

<tr>
<td align="center" colspan="2">
<input type="hidden" name="num" value="<%=num%>">
<button type="submit" class="btn btn-default" style="width:100px;color:white;background-color:#FF7BAC;border:1px solid #FF7BAC;">
수정하기&nbsp;<span class="glyphicon glyphicon-edit"></span></button>
<button type="reset" class="btn btn-default" style="width:100px;">
초기화</button>
</td>
</tr>

</table>
</form>
</center>
</body>
</html>