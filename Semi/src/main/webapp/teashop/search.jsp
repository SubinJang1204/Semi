<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String sangpum=request.getParameter("sangpum");
ShopDao dao=new ShopDao();

//검색한 상품만 얻기
List<ShopDto> list=dao.getSearchSang(sangpum);

//json 배열선언
JSONArray arr=new JSONArray();
for(ShopDto dto:list){
	JSONObject ob=new JSONObject();
	ob.put("shopnum", dto.getShopnum());
	ob.put("sangpum", dto.getSangpum());
	ob.put("price", dto.getPrice());
	ob.put("photo", "../images2/"+dto.getPhoto()+".jpg");
	
	arr.add(ob);
}

%>

<%=arr.toString()%>