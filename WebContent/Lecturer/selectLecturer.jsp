<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강사 조회</title>
</head>
<body>
<%@include file="../Main/header.jsp" %>
<%@include file="../Main/nav.jsp" %>
<section>
<form name=form>
	<br>
	<h3 style="font-size:2em;text-align:center;">강사 리스트</h3>
	<br>
	<%
		Integer number=0;
		try{
			sql="select count(idx) from lecturer0608";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				number=rs.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
<pre>					총 <%=number %>명의 강사가 있습니다.</pre>
	<hr>
	<table border=1 style="margin:0 auto;width:60%;text-align:center;">
		<tr>
			<th style="height:40px;background-color:mediumpurple;color:white;">강사코드</th>
			<th style="height:40px;background-color:mediumpurple;color:white;">강사명</th>
			<th style="height:40px;background-color:mediumpurple;color:white;">전공</th>
			<th style="height:40px;background-color:mediumpurple;color:white;">세부전공</th>
			<th style="height:40px;background-color:mediumpurple;color:white;">관리</th>
		</tr>
	<%
		String[] idx=new String[number];
		String name=null;
		String major=null;
		String field=null;
		Integer i=0;
		try{
			sql="select * from lecturer0608";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				idx[i]=rs.getString(1);
				name=rs.getString(2);
				major=rs.getString(3);
				field=rs.getString(4);
	%>
		<tr>
			<td style="height:40px;font-weight:bold;"><%=idx[i] %></td>
			<td style="height:40px;font-weight:bold;"><%=name %></td>
			<td style="height:40px;font-weight:bold;"><%=major %></td>
			<td style="height:40px;font-weight:bold;"><%=field %></td>
			<td style="height:40px;font-weight:bold;"><a id="a2" href="updateLecturer.jsp?idx=<%=idx[i]%>">수정</a>/<a id="a2" href=# onclick=if(confirm("강사코드:<%=idx[i]%>\n삭제하시겠습니까?")){location.href="deleteLecturer.jsp?idx=<%=idx[i] %>"}>삭제</a></td>
		</tr>
	<%
				i++;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	</table>
	<table style="margin:0 auto;">
		<tr>
			<td>
				<input type=button value="작성" onclick="location.href='addLecturer.jsp'" style="width:80px;height:40px;background-color:black;color:white;font-size:1.2em;font-weight:bold;">
			</td>
		</tr>
	</table>
</form>
</section>
<%@include file="../Main/footer.jsp" %>
</body>
</html>