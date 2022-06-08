<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../DBConn.jsp" %>
<%
	String studno=request.getParameter("studno");
	String name=request.getParameter("name");
	String dept=request.getParameter("dept");
	String position=request.getParameter("position");
	String address=request.getParameter("address");
	String phone=request.getParameter("phone");
	String hobby=null;
	String[] h=request.getParameterValues("hobby");
	if(h.length==1){
		hobby=h[0];
	}else{
		for(int i=0;i<h.length;i++){
			if(i==0){
				hobby=h[0];
			}else{
				hobby=hobby+","+h[i];
			}
		}
	}
	try{
		sql="insert into stud0608 values(?,?,?,?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, studno);
		pstmt.setString(2, name);
		pstmt.setString(3, dept);
		pstmt.setString(4, position);
		pstmt.setString(5, address);
		pstmt.setString(6, phone);
		pstmt.setString(7, hobby);
		pstmt.executeUpdate();
%>
<script>
alert("학사 정보 등록 성공");
location.href="selectStudent.jsp";
</script>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>