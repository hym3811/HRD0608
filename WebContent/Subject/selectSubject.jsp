<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>교과목 목록</title>
</head>
<body>
<%@include file="../Main/header.jsp" %>
<%@include file="../Main/nav.jsp" %>
<section>
<form name=form>
	<br>
	<h3 style="font-size:2em;text-align:center;">교과목 목록</h3>
	<br>
	<%
		Integer number=0;
		try{
			sql="select count(id) from sub0608";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				number=rs.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	<pre style="font-size:1.1em;">				총 <%=number %>개의 교과목이 있습니다.</pre>
	<hr>
	<table border=1 style="margin:0 auto;width:60%;text-align:center;">
		<tr>
			<th style="height:40px;background-color:mediumpurple;color:white;">No</th>
			<th style="height:40px;background-color:mediumpurple;color:white;">강사코드</th>
			<th style="height:40px;background-color:mediumpurple;color:white;">담당강사</th>
			<th style="height:40px;background-color:mediumpurple;color:white;">교과목코드</th>
			<th style="height:40px;background-color:mediumpurple;color:white;">과목명</th>
			<th style="height:40px;background-color:mediumpurple;color:white;">학점</th>
			<th style="height:40px;background-color:mediumpurple;color:white;">요일</th>
			<th style="height:40px;background-color:mediumpurple;color:white;">시작시간</th>
			<th style="height:40px;background-color:mediumpurple;color:white;">종료시간</th>
			<th style="height:40px;background-color:mediumpurple;color:white;">관리</th>
		</tr>
	<%
		String[] id=new String[number];
		String subject_name=null;
		String credit=null;
		String name=null;
		String idx=null;
		Integer w=null;
		String week=null;
		String start_hour=null;
		String start1=null;
		String start2=null;
		String end_hour=null;
		String end1=null;
		String end2=null;
		Integer i=0;
		Integer no=0;
		try{
			sql="select a.id,a.subject_name,a.credit,b.name,a.week,a.start_hour,a.end_hour,b.idx from sub0608 a join lecturer0608 b on a.lecturer=b.idx order by a.id";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				no++;
				id[i]=rs.getString(1);
				subject_name=rs.getString(2);
				credit=rs.getString(3);
				name=rs.getString(4);
				w=rs.getInt(5);
				switch(w){
				case 1:
					week="월요일";
					break;
				case 2:
					week="화요일";
					break;
				case 3:
					week="수요일";
					break;
				case 4:
					week="목요일";
					break;
				case 5:
					week="금요일";
					break;
				case 6:
					week="토요일";
					break;
				}
				start_hour=rs.getString(6);
				if(Integer.parseInt(start_hour)<1000){
					start_hour="0"+start_hour;
				}
				start1=start_hour.substring(0, 2);
				start2=start_hour.substring(2);
				end_hour=rs.getString(7);
				end1=end_hour.substring(0, 2);
				end2=end_hour.substring(2);
				idx=rs.getString(8);
	%>
		<tr>
			<td style="height:40px;font-size:1.1em;font-weight:bold;"><%=no %></td>
			<td style="height:40px;font-size:1.1em;font-weight:bold;"><%=idx %></td>
			<td style="height:40px;font-size:1.1em;font-weight:bold;"><%=name %></td>
			<td style="height:40px;font-size:1.1em;font-weight:bold;"><%=id[i] %></td>
			<td style="height:40px;font-size:1.1em;font-weight:bold;"><%=subject_name %></td>
			<td style="height:40px;font-size:1.1em;font-weight:bold;"><%=credit %></td>
			<td style="height:40px;font-size:1.1em;font-weight:bold;"><%=week %></td>
			<td style="height:40px;font-size:1.1em;font-weight:bold;"><%=start1 %>:<%=start2 %></td>
			<td style="height:40px;font-size:1.1em;font-weight:bold;"><%=end1 %>:<%=end2 %></td>
			<td style="height:40px;font-size:1.1em;font-weight:bold;"><a id="a3" href="updateSubject.jsp?id=<%=id[i]%>">수정</a>/<a id="a3" href=# onclick=if(confirm("교과목코드:<%=id[i]%>\n삭제하시겠습니까?")){location.href="deleteSubject.jsp?id=<%=id[i]%>"}>삭제</a></td>
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
				<input type=button value="작성" onclick="location.href='addSubject.jsp'" style="height:40px;width:70px;font-size:1.2em;font-weight:bold;background-color:black;color:white;">
			</td>
		</tr>
	</table>
</form>
</section>
<%@include file="../Main/footer.jsp" %>
</body>
</html>