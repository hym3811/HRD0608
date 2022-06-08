<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../DBConn.jsp" %>
<%
	String id=request.getParameter("id");
	try{
		sql="delete from sub0608 where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.executeUpdate();
%>
<script>
alert("교과목 정보 삭제 완료");
location.href="selectSubject.jsp";
</script>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>