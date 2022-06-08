<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학사 정보 조회</title>
</head>
<body>
<%@include file="../Main/header.jsp" %>
<%@include file="../Main/nav.jsp" %>
<section>
	<form name=form>
		<br>
		<h3 style="text-align:center;font-size:2em;font-weight:bolder;">학사 정보 목록</h3>
		<br>
		<%
			Integer number=0;
			try{
				sql="select count(studno) from stud0608";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()){
					number=rs.getInt(1);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
		<pre>                                 총 <%=number %>명의 학사정보가 있습니다.</pre>
		<hr>
		<table border=1 style="margin:0 auto;width:70%;text-align:center;">
			<tr>
				<th style="height:40px;font-size:1.3em;font-weight:bolder;background-color:mediumpurple;color:white;">학번</th>
				<th style="height:40px;font-size:1.3em;font-weight:bolder;background-color:mediumpurple;color:white;">성명</th>
				<th style="height:40px;font-size:1.3em;font-weight:bolder;background-color:mediumpurple;color:white;">학과</th>
				<th style="height:40px;font-size:1.3em;font-weight:bolder;background-color:mediumpurple;color:white;">학년</th>
				<th style="height:40px;font-size:1.3em;font-weight:bolder;background-color:mediumpurple;color:white;">학년</th>
				<th style="height:40px;font-size:1.3em;font-weight:bolder;background-color:mediumpurple;color:white;">주소</th>
				<th style="height:40px;font-size:1.3em;font-weight:bolder;background-color:mediumpurple;color:white;">취미</th>
				<th style="height:40px;font-size:1.3em;font-weight:bolder;background-color:mediumpurple;color:white;">관리</th>
			</tr>
		<%
			String[] studno=new String[number];
			String name=null;
			Integer d=0;
			String dept=null;
			Integer p=0;
			String position=null;
			String address=null;
			String phone=null;
			String hobby=null;
			Integer i=0;
			try{
				sql="select * from stud0608";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()){
					studno[i]=rs.getString(1);
					name=rs.getString(2);
					d=rs.getInt(3);
					switch(d){
					case 1:
						dept="컴퓨터공학과";
						break;
					case 2:
						dept="기계공학과";
						break;
					case 3:
						dept="전자과";
						break;
					case 4:
						dept="영문학과";
						break;
					case 5:
						dept="일어과";
						break;
					case 6:
						dept="경영학과";
						break;
					case 7:
						dept="무역학과";
						break;
					case 8:
						dept="교육학과";
						break;
					}
					p=rs.getInt(4);
					switch(p){
					case 1:
						position="1학년";
						break;
					case 2:
						position="2학년";
						break;
					case 3:
						position="3학년";
						break;
					case 4:
						position="4학년";
						break;
					}
					address=rs.getString(5);
					phone=rs.getString(6);
					hobby=rs.getString(7);
		%>
			<tr>
				<td style="height:40px;font-weight:bold;"><%=studno[i] %></td>
				<td style="height:40px;font-weight:bold;"><%=name %></td>
				<td style="height:40px;font-weight:bold;"><%=dept %></td>
				<td style="height:40px;font-weight:bold;"><%=position %></td>
				<td style="height:40px;font-weight:bold;"><%=address %></td>
				<td style="height:40px;font-weight:bold;"><%=phone %></td>
				<td style="height:40px;font-weight:bold;"><%=hobby %></td>
				<td style="height:40px;font-weight:bold;"><a href="updateStudent.jsp?studno=<%=studno[i] %>" id="a1">수정</a>/<a href=# onclick=if(confirm("학번:<%=studno[i]%>\n삭제하시겠습니까?")){location.href="deleteStudent.jsp?studno=<%=studno[i] %>"} id="a1">삭제</a></td>
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
				<input type=button value="작성" onclick="location.href='addStudent.jsp'" style="height:40px;width:70px;font-size:1.2em;font-weight:bold;background-color:black;color:white;">
			</td>
		</tr>
	</table>
	</form>
</section>
<%@include file="../Main/footer.jsp" %>
</body>
</html>