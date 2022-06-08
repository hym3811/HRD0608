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
		Integer studno=0;
		String date=null;
		Integer year=null;
		try{
			sql="select max(studno) from stud0608";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				if(rs.getString(1)!=null){
					studno=rs.getInt(1)+1;
				}else{
					sql="select sysdate from dual";
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					if(rs.next()){
						date=rs.getString(1);
						year=Integer.parseInt(date.substring(0, 4))*10000;
					}pstmt.close();
					studno=year+1;
				}
			}
		}catch(Exception e){
			
		}
	%>
		<tr>
			<th style="width:20%;height:40px;background-color:black;color:white;">학번</th>
			<td><input type=number name=studno value="<%=studno==0 ? "" : studno%>" readonly style="width:100%;height:40px;font-size:1.2em;font-weight:bold;"></td>
		</tr>
		<tr>
			<th style="width:20%;height:40px;background-color:black;color:white;">성명</th>
			<td><input type=text name=name style="width:100%;height:40px;font-size:1.2em;font-weight:bold;"></td>
		</tr>
		<tr>
			<th style="width:20%;height:40px;background-color:black;color:white;">학과</th>
			<td>
				<select name=dept style="width:100%;height:40px;font-size:1.2em;font-weight:bold;">
					<option value="">학과 선택</option>
					<option value="1">컴퓨터공학과</option>
					<option value="2">기계공학과</option>
					<option value="3">전자과</option>
					<option value="4">영문학과</option>
					<option value="5">일어과</option>
					<option value="6">경영학과</option>
					<option value="7">무역학과</option>
					<option value="8">교육학과</option>
				</select>
			</td>
		</tr>
		<tr>
			<th style="width:20%;height:40px;background-color:black;color:white;">학년</th>
			<td>
				<label style="font-size:1.2em;font-weight:bold;margin-right:1%;margin-left:1%;"><input type=radio name=position value="1">1학년</label>
				<label style="font-size:1.2em;font-weight:bold;margin-right:1%;"><input type=radio name=position value="2">2학년</label>
				<label style="font-size:1.2em;font-weight:bold;margin-right:1%;"><input type=radio name=position value="3">3학년</label>
				<label style="font-size:1.2em;font-weight:bold;margin-right:1%;"><input type=radio name=position value="4">4학년</label>
			</td>
		</tr>
		<tr>
			<th style="width:20%;height:40px;background-color:black;color:white;">취미</th>
			<td>
				<label style="font-size:1.2em;font-weight:bold;margin-right:1%;margin-left:1%;"><input type=checkbox name=hobby value="프로그램">프로그램</label>
				<label style="font-size:1.2em;font-weight:bold;margin-right:1%;"><input type=checkbox name=hobby value="독서">독서</label>
				<label style="font-size:1.2em;font-weight:bold;margin-right:1%;"><input type=checkbox name=hobby value="등산">등산</label>
				<label style="font-size:1.2em;font-weight:bold;margin-right:1%;"><input type=checkbox name=hobby value="여행">여행</label>
				<label style="font-size:1.2em;font-weight:bold;margin-right:1%;"><input type=checkbox name=hobby value="낚시">낚시</label>
				<label style="font-size:1.2em;font-weight:bold;margin-right:1%;"><input type=checkbox name=hobby value="영화보기">영화보기</label>
				<label style="font-size:1.2em;font-weight:bold;margin-right:1%;"><input type=checkbox name=hobby value="잠자기">잠자기</label>
				<label style="font-size:1.2em;font-weight:bold;margin-right:1%;"><input type=checkbox name=hobby value="멍때리기">멍때리기</label>
			</td>
		</tr>
		<tr>
			<th style="width:20%;height:40px;background-color:black;color:white;">주소</th>
			<td><input type=text name=address style="width:100%;height:40px;font-size:1.2em;font-weight:bold;"></td>
		</tr>
		<tr>
			<th style="width:20%;height:40px;background-color:black;color:white;">연락처</th>
			<td><input type=text name=phone style="width:100%;height:40px;font-size:1.2em;font-weight:bold;"></td>
		</tr>
		<tr>
			<td colspan=2 style="text-align:center;">
				<input type=button value="등록" onclick=add() style="width:80px;height:40px;font-size:1.5em;font-weight:bolder;">
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
		doc.action="addStudentProcess.jsp";
		doc.submit();
	}
}
</script>

</html>