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
background-color:#ebebeb;
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
<body>

<!-- form inline하면 따로 인라인 블록 지정 안 해도 됨!! -->
<div style="position:absolute;top:-50px;z-index:-10;width:1920px;height:100px;background-color:white;"></div>

<div style="width:600px;height:650px;margin:150px auto;padding-top:70px;padding-left:50px;background-color:white;">

<form action="member/memberadd.jsp" method="post" class="form-inline" onsubmit="return check(this)" style="">

<caption><h2>JOIN</h2></caption><br><br>

<input type="text" name="id" id="id" class="form-control"
required="required" style="width:120px;border:none" placeholder="ID">

<button type="button" class="btn btn-danger" id="btncheck" style="background-color:#FF7BAC;border:none">중복체크</button><br><br>


<input type="text" name="pass" class="form-control"
required="required" style="width:120px;border:none" placeholder="PASSWORD"><br><br>


<input type="text" name="name" class="form-control"
required="required" style="width:120px;border:none" placeholder="NAME"><br><br>


<input type="text" name="hp" class="form-control"
required="required" style="width:200px;border:none" placeholder="HP"><br><br>


<input type="text" name="addr" class="form-control"
required="required" style="width:400px;border:none" placeholder="ADDRESS"><br><br>


<input type="text" name="email" class="form-control" 
required="required" style="width:80px;border:none"  placeholder="EMAIL">
<b>@</b>
<input type="text" name="email2" id="email2" class="form-control" 
required="required" style="width:150px;border:none">

<select id="selemail" class="form-control">
<option value="-">직접입력</option>
<option value="naver.com">네이버</option>
<option value="gmail.com">구글</option>
<option value="daum.com">다음</option>
<option value="nate.com">네이트</option>
</select><br><br>


<button type="submit" class="btn btn-default btn-sm" style="width:100px;background-color:#000;color:#fff">
가입저장</button>
<button type="reset" class="btn btn-default btn-sm" style="width:100px;background-color:#000;color:#fff">
초기화</button>

</form>
</div>

</body>
</html>