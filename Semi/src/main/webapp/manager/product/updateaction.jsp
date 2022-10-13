<%@page import="data.dao.ShopDao"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String shopnum=request.getParameter("shopnum");
String realFolder=getServletContext().getRealPath("/images2");
System.out.println(realFolder);

int uploadSize=1024*1024*3; //3MB

MultipartRequest multi=null;

try{
multi=new MultipartRequest(request,realFolder,uploadSize,"UTF-8",
		new DefaultFileRenamePolicy());
//주의: request가 아니라 multi로 모든 폼데이터를 읽는다
//실제 업로드된 파일명
String category=multi.getParameter("category");
String sangpum=multi.getParameter("sangpum");
int price=Integer.parseInt(multi.getParameter("price"));
String ipgoday=multi.getParameter("ipgoday");
//메인사진
String photo=multi.getFilesystemName("photo");
String sangsae=multi.getFilesystemName("sangsae");



//dto에 저장
ShopDto dto=new ShopDto();
dto.setCategory(category);
dto.setSangpum(sangpum);
dto.setPrice(price);
dto.setIpgoday(ipgoday);
dto.setPhoto(photo);
dto.setSangsae(sangsae);
dto.setShopnum(shopnum);


//dao
ShopDao dao=new ShopDao();
dao.updateShop(dto);

response.sendRedirect("../../index.jsp?main=manager/product/viewshop.jsp?shopnum="+shopnum);

}catch(Exception e){
	System.out.println("업로드 오류: "+e.getMessage());
}
%>