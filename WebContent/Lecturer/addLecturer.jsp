<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강사 추가</title>
</head>
<body>
<%@include file="../Main/header.jsp" %>
<%@include file="../Main/nav.jsp" %>
<section>
	<form name=form>
		<br>
		<h3 style="font-size:2em;text-align:center;font-weight:bolder;">강사 추가</h3>
		<br>
		<table border=1 style="margin:0 auto;width:30%;">
		<%
			Integer number=0;
			try{
				sql="select max(idx) from lecturer0608";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()){
					number=rs.getInt(1);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
			<tr>
				<th style="height:40px;background-color:gray;color:white;">강사 I D</th>
				<td><input type="number" name=idx value="<%=number+1%>" readonly style="height:40px;width:100%;"></td>
			</tr>
			<tr>
				<th style="height:40px;background-color:gray;color:white;">강사명</th>
				<td><input type=text name=name style="height:40px;width:100%;"></td>
			</tr>
			<tr>
				<th style="height:40px;background-color:gray;color:white;">전공</th>
				<td><input type=text name=major style="height:40px;width:100%;"></td>
			</tr>
			<tr>
				<th style="height:40px;background-color:gray;color:white;">세부 전공</th>
				<td><input type=text name=field style="height:40px;width:100%;"></td>
			</tr>
			<tr>
				<td colspan=2 style="text-align:center;">
					<input type=button value="목록" onclick=sel() style="background-color:black;color:white;width:70px;height:40px;margin:0 3%;font-weight:bolder;font-size:1.2em;">
					<input type=button value="등록" onclick=add() style="background-color:black;color:white;width:70px;height:40px;margin:0 3%;font-weight:bolder;font-size:1.2em;">
				</td>
			</tr>
		</table>
	</form>
</section>
<%@include file="../Main/footer.jsp" %>
</body>
<script>
function sel(){
	location.href="selectLecturer.jsp";
}
function add(){
	var doc=document.form;
	if(doc.idx.value==""){
		alert("[강사코드]\n강사코드를 입력하세요.");
		doc.idx.focus();
	}else if(doc.name.value==""){
		alert("[강사명]\n강사명을 입력하세요.");
		doc.name.focus();
	}else if(doc.major.value==""){
		alert("[전공]\n전공을 입력하세요.");
		doc.major.focus();
	}else if(doc.field.value==""){
		alert("[세부 전공]\n세부 전공을 입력하세요.");
		doc.field.focus();
	}else{
		doc.action="addLecturerProcess.jsp";
		doc.submit();
	}
}
</script>

</html>