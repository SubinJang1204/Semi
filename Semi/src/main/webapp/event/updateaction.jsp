<%@page import="data.dao.SmartDao"%>
<%@page import="data.dto.SmartDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String root = request.getParameter("root");
String realFolder=getServletContext().getRealPath("/save");
System.out.println(realFolder);

int uploadSize=1024*1024*3; //3MB

MultipartRequest multi=null;

try{
multi=new MultipartRequest(request,realFolder,uploadSize,"UTF-8",
		new DefaultFileRenamePolicy());
//주의: request가 아니라 multi로 모든 폼데이터를 읽는다
//실제 업로드된 파일명
String writer=multi.getParameter("writer");
String subject=multi.getParameter("subject");
String content=multi.getParameter("content");
//메인사진
String mainphoto=multi.getFilesystemName("mainphoto");

String currentPage=multi.getParameter("currentPage");
String num=multi.getParameter("num");


//dto에 저장
SmartDto dto=new SmartDto();
dto.setWriter(writer);
dto.setSubject(subject);
dto.setContent(content);
//dto.setMainphoto(mainphoto);
//ㅠㅠㅠㅠㅠㅠ수정에선 꼭 num 추가하기...
dto.setNum(num);

//dao
SmartDao dao=new SmartDao();

String oldphoto=dao.getData(num).getMainphoto();

//이렇게 하면 메인이미지 수정 안 해도 처음 insert 했던 이미지가 출력됨
if(mainphoto==null)
	dto.setMainphoto(oldphoto);
else
dto.setMainphoto(mainphoto);

dao.updateSmart(dto);

//방명록 목록 이동
response.sendRedirect("../../index.jsp?main=event/contentview.jsp?num="+num+"&currentPage="+currentPage);

}catch(Exception e){
	System.out.println("업로드 오류: "+e.getMessage());
}
%>