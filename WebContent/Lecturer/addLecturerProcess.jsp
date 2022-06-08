<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../DBConn.jsp" %>
<%
	String idx=request.getParameter("idx");
	String name=request.getParameter("name");
	String major=request.getParameter("major");
	String field=request.getParameter("field");
	try{
		sql="insert into lecturer0608 values(?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, idx);
		pstmt.setString(2, name);
		pstmt.setString(3, major);
		pstmt.setString(4, field);
		pstmt.executeUpdate();
%>
<script>
alert("강사 정보 등록 성공");
location.href="addLecturer.jsp";
</script>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>