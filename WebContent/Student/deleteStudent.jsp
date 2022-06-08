<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../DBConn.jsp" %>
<%
	String studno=request.getParameter("studno");
	try{
		sql="delete from stud0608 where studno=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, studno);
		pstmt.executeUpdate();
%>
<script>
alert("학번:<%=studno%>\n삭제 완료");
location.href="selectStudent.jsp";
</script>
<%
	}catch(Exception e){
		
	}
%>