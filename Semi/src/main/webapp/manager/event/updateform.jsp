<%@page import="data.dto.SmartDto"%>
<%@page import="data.dao.SmartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<%
	//프로젝트의 경로
String root=request.getContextPath();

String num=request.getParameter("num");
String currentPage = request.getParameter("currentPage");
SmartDao dao=new SmartDao();
SmartDto dto=dao.getData(num);
%>
<!-- se2 폴더에서 js 파일 가져오기 -->
<script type="text/javascript" src="<%=root%>/se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>

<script type="text/javascript" src="<%=root%>/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js"
	charset="utf-8"></script>	
	<style type="text/css">
	body *{
	font-family: 'Gowun Dodum', sans-serif;
	
	}
	#blah{
	position:absolute;
	left:900px;
	width:200px;
	top:100px;
	border:1px solid gray;
	}
	
	</style>
	<script type="text/javascript">
	//이미지 미리보기, 사용자함수
	function readURL(input){
		
		if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	        $('#blah').attr('src', e.target.result);
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	</script>
</head>

<body>

<!-- 이미지 미리보기 -->


<form action="manager/event/updateaction.jsp" method="post" enctype="multipart/form-data">
	
	<!-- hidden으로 넘기기!!!! -->
	<input type="hidden" name="num" value="<%=num%>">
	<input type="hidden" name="currentPage" value="<%=currentPage%>">
	
	<table class="table table-bordered" style="width: 850px;margin-left: 100px;">
		
		<tr>
			<th bgcolor="orange" width="100">작성자</th>
			<td>
				<input type="text" name="writer" class="form-control"
					required="required" style="width: 130px;" value="<%=dto.getWriter() %>">
			</td>
		</tr>
			<tr>
			<th bgcolor="orange" width="100">대표사진</th>
			<h5>대표 사진을 변경할 경우에만 다시선택해주세요</h5>
			<td>
				<input type="file" name="mainphoto" class="form-control"
					 style="width: 210px;" value="<%=dto.getMainphoto() %>">
			</td>
		</tr>
		
		<tr>
			<th bgcolor="orange" width="100">제  목</th>
			<td>
				<input type="text" name="subject" class="form-control"
					required="required" style="width: 500px;" value="<%=dto.getSubject() %>">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<textarea name="content" id="content"		
					required="required"			
					style="width: 100%;height: 300px;display: none;"><%=dto.getContent() %></textarea>		
			
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" class="btn btn-warning"
					style="width: 120px;"
					onclick="submitContents(this)">DB수정</button>
				
				<button type="button" class="btn btn-warning"
					style="width: 120px;"
					onclick="location.href='index.jsp?main=manager/event/smartlist.jsp?currentPage=<%=currentPage%>'">목록</button>
			</td>
		</tr>
		
	</table>   
</form>

<!-- 스마트게시판에 대한 스크립트 코드 넣기 -->
<script type="text/javascript">
var oEditors = [];

nhn.husky.EZCreator.createInIFrame({

    oAppRef: oEditors,

    elPlaceHolder: "content",

    sSkinURI: "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html",

    fCreator: "createSEditor2"

}); 

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.

function submitContents(elClickedObj) {

    // 에디터의 내용이 textarea에 적용된다.

    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [ ]);

    // 에디터의 내용에 대한 값 검증은 이곳에서

    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
    try {
        elClickedObj.form.submit();
    } catch(e) { 

    }
}

// textArea에 이미지 첨부

function pasteHTML(filepath){
    var sHTML = '<img src="<%=request.getContextPath()%>/save/'+filepath+'">';
    oEditors.getById["content"].exec("PASTE_HTML", [sHTML]); 

}
</script>

</body>
</html>