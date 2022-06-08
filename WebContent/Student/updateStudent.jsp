<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학사 정보 등록</title>
</head>
<body>
<%@include file="../Main/header.jsp" %>
<%@include file="../Main/nav.jsp" %>
<section>
<form name=form>
	<br>
	<h3 style="font-size:2em;font-weight:bolder;text-align:center;">학사 정보 등록 화면</h3>
	<br>
	<table border=1 style="margin:0 auto; width:60%;">
	<%
		String studno=request.getParameter("studno");
		String name=null;
		Integer dept=null;
		Integer position=null;
		String hobby=null;
		String address=null;
		String phone=null;
		try{
			sql="select * from stud0608 where studno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, studno);
			rs=pstmt.executeQuery();
			if(rs.next()){
				name=rs.getString(2);
				dept=rs.getInt(3);
				position=rs.getInt(4);
				address=rs.getString(5);
				phone=rs.getString(6);
				hobby=rs.getString(7);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
		<tr>
			<th style="width:20%;height:40px;background-color:black;color:white;">학번</th>
			<td><input type=number name=studno value="<%=studno==null ? "" : studno%>" readonly style="width:100%;height:40px;font-size:1.2em;font-weight:bold;"></td>
		</tr>
		<tr>
			<th style="width:20%;height:40px;background-color:black;color:white;">성명</th>
			<td><input type=text name=name style="width:100%;height:40px;font-size:1.2em;font-weight:bold;" value="<%=name==null ? "" : name%>"></td>
		</tr>
		<tr>
			<th style="width:20%;height:40px;background-color:black;color:white;">학과</th>
			<td>
				<select name=dept style="width:100%;height:40px;font-size:1.2em;font-weight:bold;">
					<option value="">학과 선택</option>
					<option value="1" <%=dept==1 ? "selected" : "" %>>컴퓨터공학과</option>
					<option value="2" <%=dept==2 ? "selected" : "" %>>기계공학과</option>
					<option value="3" <%=dept==3 ? "selected" : "" %>>전자과</option>
					<option value="4" <%=dept==4 ? "selected" : "" %>>영문학과</option>
					<option value="5" <%=dept==5 ? "selected" : "" %>>일어과</option>
					<option value="6" <%=dept==6 ? "selected" : "" %>>경영학과</option>
					<option value="7" <%=dept==7 ? "selected" : "" %>>무역학과</option>
					<option value="8" <%=dept==8 ? "selected" : "" %>>교육학과</option>
				</select>
			</td>
		</tr>
		<tr>
			<th style="width:20%;height:40px;background-color:black;color:white;">학년</th>
			<td>
				<label style="font-size:1.2em;font-weight:bold;margin-right:1%;margin-left:1%;"><input type=radio name=position value="1" <%=position==1 ? "checked" : "" %>>1학년</label>
				<label style="font-size:1.2em;font-weight:bold;margin-right:1%;"><input type=radio name=position value="2" <%=position==2 ? "checked" : "" %>>2학년</label>
				<label style="font-size:1.2em;font-weight:bold;margin-right:1%;"><input type=radio name=position value="3" <%=position==3 ? "checked" : "" %>>3학년</label>
				<label style="font-size:1.2em;font-weight:bold;margin-right:1%;"><input type=radio name=position value="4" <%=position==4 ? "checked" : "" %>>4학년</label>
			</td>
		</tr>
		<tr>
			<th style="width:20%;height:40px;background-color:black;color:white;">취미</th>
			<td>
				<label style="font-size:1.2em;font-weight:bold;margin-right:1%;margin-left:1%;"><input type=checkbox name=hobby value="프로그램" <%=hobby.contains("프로그램") ? "checked" : "" %>>프로그램</label>
				<label style="font-size:1.2em;font-weight:bold;margin-right:1%;"><input type=checkbox name=hobby value="독서" <%=hobby.contains("독서") ? "checked" : "" %>>독서</label>
				<label style="font-size:1.2em;font-weight:bold;margin-right:1%;"><input type=checkbox name=hobby value="등산" <%=hobby.contains("등산") ? "checked" : "" %>>등산</label>
				<label style="font-size:1.2em;font-weight:bold;margin-right:1%;"><input type=checkbox name=hobby value="여행" <%=hobby.contains("여행") ? "checked" : "" %>>여행</label>
				<label style="font-size:1.2em;font-weight:bold;margin-right:1%;"><input type=checkbox name=hobby value="낚시" <%=hobby.contains("낚시") ? "checked" : "" %>>낚시</label>
				<label style="font-size:1.2em;font-weight:bold;margin-right:1%;"><input type=checkbox name=hobby value="영화보기" <%=hobby.contains("영화보기") ? "checked" : "" %>>영화보기</label>
				<label style="font-size:1.2em;font-weight:bold;margin-right:1%;"><input type=checkbox name=hobby value="잠자기" <%=hobby.contains("잠자기") ? "checked" : "" %>>잠자기</label>
				<label style="font-size:1.2em;font-weight:bold;margin-right:1%;"><input type=checkbox name=hobby value="멍때리기" <%=hobby.contains("멍때리기") ? "checked" : "" %>>멍때리기</label>
			</td>
		</tr>
		<tr>
			<th style="width:20%;height:40px;background-color:black;color:white;">주소</th>
			<td><input type=text name=address style="width:100%;height:40px;font-size:1.2em;font-weight:bold;" value="<%=address==null ? "" : address%>"></td>
		</tr>
		<tr>
			<th style="width:20%;height:40px;background-color:black;color:white;">연락처</th>
			<td><input type=text name=phone style="width:100%;height:40px;font-size:1.2em;font-weight:bold;" value="<%=phone==null ? "" : phone%>"></td>
		</tr>
		<tr>
			<td colspan=2 style="text-align:center;">
				<input type=button value="수정" onclick=add() style="width:80px;height:40px;font-size:1.5em;font-weight:bolder;">
				<input type=button value="취소" onclick=reset() style="width:80px;height:40px;font-size:1.5em;font-weight:bolder;">
			</td>
		</tr>
	</table>
</form>
</section>
<%@include file="../Main/footer.jsp" %>
</body>

<script>
function add(){
	var doc=document.form;
	var chk1=0;
	var chk2=0;
	var rdo=document.getElementsByName("position");
	var box=document.getElementsByName("hobby");
	
	for(var i=0;i<rdo.length;i++){
		if(rdo[i].checked==true){
			chk1++;
			break;
		}
	}
	
	for(var i=0;i<box.length;i++){
		if(box[i].checked==true){
			chk2++;
			break;
		}
	}
	
	if(doc.name.value==""){
		alert("[성명]\n성명을 입력하세요.");
		doc.name.focus();
	}else if(doc.dept.value==""){
		alert("[학과]\n학과를 선택하세요.");
		doc.dept.focus();
	}else if(chk1==0){
		alert("[학년]\n학년을 체크하세요.");
		doc.position.focus();
	}else if(chk2==0){
		alert("[취미]\n취미를 1개 이상 선택하세요.");
		doc.hobby.focus();
	}else if(doc.address.value==""){
		alert("[주소]\n주소를 입력하세요.");
		doc.address.focus();
	}else if(doc.phone.value==""){
		alert("[연락처]\n연락처를 입력하세요.");
		doc.phone.focus();
	}else{
		doc.action="updateStudentProcess.jsp";
		doc.submit();
	}
}
</script>

</html>