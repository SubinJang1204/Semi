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
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<style type="text/css">
body{
background-color:#ebebeb;
}
input, progress {
  accent-color: #fff;
  width:13px;
}
a span:hover{
color:#FF7BAC;
}

</style>
</head>
<%
//세션 값 얻기
String saveok=(String)session.getAttribute("saveok");
String myid="";
if(saveok!= null){
	myid=(String)session.getAttribute("myid");
}
%>
<body>
<div style="position:absolute;top:-50px;z-index:-10;width:1920px;height:100px;background-color:white;"></div>

<div style="width:600px;height:500px;margin:200px auto;padding-top:70px;padding-left:50px;background-color:white;">

<form action="login/loginaction.jsp" method="post" class="form-inline">

<caption><h2>LOGIN</h2></caption><br><br>

<input type="text" name="id" value="<%=myid %>" class="form-control"
autofocus="autofocus" required="required" style="width:120px;border:none" placeholder="ID"><br><br>

<input type="password" name="pass" class="form-control"
autofocus="autofocus" required="required" style="width:120px;border:none" placeholder="PASSWORD"><br><br>


<button type="submit" class="btn btn-default btn-sm"
 style="width:120px;color:white;background-color:black;font-size:13px;margin-bottom:8px;">Login</button><br>

<input type="checkbox" name="cbsave" <%=saveok==null?"":"checked" %> style="" class="progress"><b style="font-size:13px;position:relative;top:-4px;left:5px;">아이디 저장</b><br><br>

<div class="join">
<a href="index.jsp?main=member/memberform.jsp" style="color:black;">
<span class="glyphicon glyphicon-plus" style="font-size:15px;"><b style="font-size:17px;margin-top:-5px;text-decoration:none;border:none;">&nbsp;Join</b></span></a>
</div><!-- <br><br>
 <a href="javascript:void(0)">
          <img src="images/kakao_login_small.png" onclick="kakaoLogin();">
      </a>&nbsp;
      <span onclick="kakaoLogout();">
      <a href="javascript:void(0)">
          <span>카카오 로그아웃</span>
      </a></span> -->
</form>
</div>

	
     
	
	
	<!-- 
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('5f00a9d962cafddd47593b7de5be70da'); 
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
        	  var id = res.id;
			  scope : 'account_email';
			alert('로그인성공');
			alert('id');
              location.href="5235268";
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script> -->
</body>
</html>