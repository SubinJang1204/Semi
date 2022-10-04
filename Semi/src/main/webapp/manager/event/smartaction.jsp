<%@page import="data.dao.SmartDao"%>
<%@page import="data.dto.SmartDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

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

//dto에 저장
SmartDto dto=new SmartDto();
dto.setWriter(writer);
dto.setSubject(subject);
dto.setContent(content);
dto.setMainphoto(mainphoto);

//dao
SmartDao dao=new SmartDao();
dao.insertSmart(dto);

//방명록 목록 이동, 폴더 두 개니까 한 번 더 쓰기
response.sendRedirect("../../index.jsp?main=manager/event/smartlist.jsp");

}catch(Exception e){
	System.out.println("업로드 오류: "+e.getMessage());
	
}

%>