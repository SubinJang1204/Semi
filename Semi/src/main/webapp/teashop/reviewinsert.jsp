<%@page import="data.dto.ShopDto"%>
<%@page import="data.dao.ShopDao"%>
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
<script type="text/javascript">
$(function(){
	$("span.camera").click(function(){
		$("#photo").trigger("click");
	});
});

//이미지 미리보기, 사용자함수
function readURL(input){
	if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
        $('#showimg').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
</script>
<style type="text/css">
 .rating {
  width: 150px;
  height: 30px;
  padding: 5px 10px;
  margin: auto;
  border-radius: 30px;
  background: #FFF;
  display: block;
  overflow: hidden;
  box-shadow: 0 1px #CCC,
              0 5px #DDD,
              0 9px 6px -3px #999;
  unicode-bidi: bidi-override;
  direction: rtl;
}
.rating:not(:checked) > input {
  display: none;
}

/* - - - - - RATE */
#rate {
 
}
#rate:not(:checked) > label {
  cursor:pointer;
  float: right;
  width: 30px;
  height: 30px;
  display: block;
  color: #eeeeee;
  line-height: 33px;
  text-align: center;
}
#rate:not(:checked) > label:hover,
#rate:not(:checked) > label:hover ~ label {
  color: #ff7a00;
}
#rate > input:checked + label:hover,
#rate > input:checked + label:hover ~ label,
#rate > input:checked ~ label:hover,
#rate > input:checked ~ label:hover ~ label,
#rate > label:hover ~ input:checked ~ label {
  color: #ff7a00;
}
#rate > input:checked ~ label {
  color: #ff7a00;
}
-webkit-font-smoothing: antialiased;
</style>
</head>
<body>
<%
String loginok=(String)session.getAttribute("loginok");
String myid=(String)session.getAttribute("myid");
String shopnum=request.getParameter("shopnum");

%>
<center>
<form action="teashop/insertaction.jsp" method="post" enctype="multipart/form-data">

<input type="hidden" value="<%=shopnum %>" name="shopnum">


<table style="width:600px;margin-top:200px;" class="table table-bordered">

<caption>
<b>리뷰 등록</b>

<span class="glyphicon glyphicon-camera camera" style="color:#FF7BAC;cursor:pointer"></span>
<input type="file" onchange="readURL(this)" name="photo" style="visibility: hidden" id="photo">
</caption>
<tr>
<td>
<%
if("#showimg"==null){ /* 이 부분 예외 처리 전에 한 거 찾아보기  */
	%>
	<img src="images/logo2.png" id="showimg" style="width:200px;height:200px">
	<%
}else{
	%>
	<img id="showimg" src="" style="width:600px;height:200px;">
	<%
}
%>

</td>
</tr>
<tr>
<td>
<input type="text" name="writer" value="<%=myid %>" class="form-control" style="width:80px;">
</td>
</tr>

<tr>
<td>
<textarea style="width:500px;height:100px" class="form-control"
name="content" required="required"></textarea>
</td>
</tr>

<!-- 별점 -->
<tr>
<td>맛
<section id="rate" name="taste" class="rating" style="">
  <!-- FIFTH STAR -->
  <input type="radio" id="star_5" name="taste" value="5" />
  <label for="star_5" title="Five">&#9733;</label>
  <!-- FOURTH STAR -->
  <input type="radio" id="star_4" name="taste" value="4" />
  <label for="star_4" title="Four">&#9733;</label>
  <!-- THIRD STAR -->
  <input type="radio" id="star_3" name="taste" value="3" />
  <label for="star_3" title="Three">&#9733;</label>
  <!-- SECOND STAR -->
  <input type="radio" id="star_2" name="taste" value="2" />
  <label for="star_2" title="Two">&#9733;</label>
  <!-- FIRST STAR -->
  <input type="radio" id="star_1" name="taste" value="1" />
  <label for="star_1" title="One">&#9733;</label>
</section>
</td>
</tr>

<tr>
<td>배달
<section id="rate" name="delivery" class="rating" style="">
  <!-- FIFTH STAR -->
  <input type="radio" id="star_10" name="delivery" value="5" />
  <label for="star_10" title="Five">&#9733;</label>
  <!-- FOURTH STAR -->
  <input type="radio" id="star_9" name="delivery" value="4" />
  <label for="star_9" title="Four">&#9733;</label>
  <!-- THIRD STAR -->
  <input type="radio" id="star_8" name="delivery" value="3" />
  <label for="star_8" title="Three">&#9733;</label>
  <!-- SECOND STAR -->
  <input type="radio" id="star_7" name="delivery" value="2" />
  <label for="star_7" title="Two">&#9733;</label>
  <!-- FIRST STAR -->
  <input type="radio" id="star_6" name="delivery" value="1" />
  <label for="star_6" title="One">&#9733;</label>
</section>
</td>
</tr>

<tr>
<td>향
<section id="rate" name="smell" class="rating" style="">
  <!-- FIFTH STAR -->
  <input type="radio" id="star_15" name="smell" value="5" />
  <label for="star_15" title="Five">&#9733;</label>
  <!-- FOURTH STAR -->
  <input type="radio" id="star_14" name="smell" value="4" />
  <label for="star_14" title="Four">&#9733;</label>
  <!-- THIRD STAR -->
  <input type="radio" id="star_13" name="smell" value="3" />
  <label for="star_13" title="Three">&#9733;</label>
  <!-- SECOND STAR -->
  <input type="radio" id="star_12" name="smell" value="2" />
  <label for="star_12" title="Two">&#9733;</label>
  <!-- FIRST STAR -->
  <input type="radio" id="star_11" name="smell" value="1" />
  <label for="star_11" title="One">&#9733;</label>
</section>
</td>
</tr>

<tr>
<td>
<button type="submit" class="btn btn-default" >등록</button>
</td>
</tr>
</table>

</form>
</center>
</body>
</html>