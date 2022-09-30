<%@page import="java.util.List"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
			
<%
MemberDao dao=new MemberDao();
List<MemberDto>list=dao.getAllMembers();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");

//json 라이브러리 이용해서 json 데이터 생성
JSONArray arr=new JSONArray();

for(MemberDto dto:list){//list를 dto로 대체
	
	JSONObject ob=new JSONObject();

	ob.put("num",dto.getNum());
	ob.put("name",dto.getName());
	ob.put("id",dto.getId());
	ob.put("pass",dto.getPass());
	ob.put("hp",dto.getHp());
	ob.put("addr",dto.getAddr());
	ob.put("email",dto.getEmail());
	ob.put("gaipday",sdf.format(dto.getGaipday()));
	
	arr.add(ob);
}
%>
<%=arr.toString()%>