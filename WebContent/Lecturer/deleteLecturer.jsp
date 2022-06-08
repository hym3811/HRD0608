<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../DBConn.jsp" %>
<%
	String idx=request.getParameter("idx");
	try{
		sql="delete from lecturer0608 where idx=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, idx);
		pstmt.executeUpdate();
%>
<script>
alert("강사코드:<%=idx%>\n삭제 완료");
location.href="selectLecturer.jsp";
</script>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>