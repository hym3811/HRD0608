<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>교과목 추가</title>
</head>
<body>
<%@include file="../Main/header.jsp" %>
<%@include file="../Main/nav.jsp" %>
<section>
<form name=form>
	<br>
	<h3 style="font-size:2em;text-align:center;">교과목 추가</h3>
	<br>
	<table border=1 style="width:50%;margin:0 auto;">
		<%
			String id=request.getParameter("id");
			if(id!=null&&id!=""){
				try{
					sql="select * from sub0608 where id=?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, id);
					rs=pstmt.executeQuery();
					if(rs.next()){
						id="";
		%>
		<script>
		alert("교과목 코드 중복\n다른 교과목 코드를 입력하세요.");
		</script>
		<%
					}
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		%>
		<tr>
			<th style="height:40px;width:30%;font-size:1.1em;">교과목 코드</th>
			<td><input type=number name=id value="<%=id==null ? "" : id%>" onchange=search() style="width:100%;height:40px;font-size:1.2em;font-weight:bold;"></td>
		</tr>
		<tr>
			<th style="height:40px;width:30%;font-size:1.1em;">과목명</th>
			<td><input type=text name=subject_name style="width:100%;height:40px;font-size:1.2em;font-weight:bold;"></td>
		</tr>
		<tr>
			<th style="height:40px;width:30%;font-size:1.1em;">학점</th>
			<td><input type=number name=credit style="width:100%;height:40px;font-size:1.2em;font-weight:bold;"></td>
		</tr>
		<tr>
			<th style="height:40px;width:30%;font-size:1.1em;">담당강사</th>
			<td>
				<select name=lecturer style="width:100%;height:40px;font-size:1.2em;font-weight:bold;">
					<option value="">담당강사 선택</option>
					<%
						String idx=null;
						String name=null;
						try{
							sql="select idx,name from lecturer0608";
							pstmt=conn.prepareStatement(sql);
							rs=pstmt.executeQuery();
							while(rs.next()){
								idx=rs.getString(1);
								name=rs.getString(2);
					%>
					<option value="<%=idx%>">[<%=idx%>]<%=name %></option>
					<%
							}
						}catch(Exception e){
							e.printStackTrace();
						}
					%>
				</select>
			</td>
		</tr>
		<tr>
			<th style="height:40px;width:30%;font-size:1.1em;">요일</th>
			<td>
				<%
					String d=null;
					for(int i=0;i<6;i++){
						switch(i){
						case 0:
							d="월요일";
							break;
						case 1:
							d="화요일";
							break;
						case 2:
							d="수요일";
							break;
						case 3:
							d="목요일";
							break;
						case 4:
							d="금요일";
							break;
						case 5:
							d="토요일";
							break;
						}
				%>
					<label style="width:100%;height:40px;font-size:1.1em;font-weight:bold;margin:0 1.2%;"><input type=radio name=week value="<%=i%>"><%=d %></label>
				<%
					}
				%>
				
			</td>
		</tr>
		<tr>
			<th style="height:40px;width:30%;font-size:1.1em;">시작시간</th>
			<td><input type=number name=start_hour style="width:100%;height:40px;font-size:1.2em;font-weight:bold;"></td>
		</tr>
		<tr>
			<th style="height:40px;width:30%;font-size:1.1em;">종료시간</th>
			<td><input type=number name=end_hour style="width:100%;height:40px;font-size:1.2em;font-weight:bold;"></td>
		</tr>
		<tr>
			<td colspan=2 style="height:40px;text-align:center;">
				<input type=button value="목록" onclick=sel() style="background-color:black;color:white;width:70px;height:40px;margin:0 2%;font-size:1.2em;font-weight:bold;">
				<input type=button value="등록" onclick=add() style="background-color:black;color:white;width:70px;height:40px;margin:0 2%;font-size:1.2em;font-weight:bold;">
			</td>
		</tr>
	</table>
</form>
</section>
<%@include file="../Main/footer.jsp" %>
</body>
<script>
function search(){
	document.form.action="addSubject.jsp";
	document.form.submit();
}
function add(){
	var doc=document.form;
	var chk=0;
	var rdo=document.getElementsByName("week");
	for(var i=0;i<rdo.length;i++){
		if(rdo[i].checked==true){
			chk++;
			break;
		}
	}
	
	if(doc.id.value==""){
		alert("[교과목 코드]\n교과목 코드를 입력하세요.");
		doc.id.focus();
	}else if(doc.subject_name.value==""){
		alert("[과목명]\n과목명을 입력하세요.");
		doc.subject_name.focus();
	}else if(doc.credit.value==""){
		alert("[학점]\n학점을 입력하세요.");
		doc.credit.focus();
	}else if(doc.lecturer.value==""){
		alert("[담당강사]\n담당강사를 선택하세요.");
		doc.lecturer.focus();
	}else if(chk==0){
		alert("[요일]\n요일을 체크하세요.");
	}else if(doc.start_hour.value==""){
		alert("[시작시간]\n시작시간을 입력하세요.");
		doc.start_hour.focus();
	}else if(doc.start_hour.value>9999){
		alert("[시작시간]\n시작시간은 숫자4자리입니다.");
		doc.start_hour.focus();
	}else if(doc.end_hour.value==""){
		alert("[종료시간]\n종료시간을 입력하세요.");
		doc.end_hour.focus();
	}else if(doc.end_hour.value>9999){
		alert("[종료시간]\n종료시간은 숫자4자리입니다.");
		doc.end_hour.focus();
	}else{
		doc.action="addSubjectProcess.jsp";
		doc.submit();
	}
}
function sel(){
	location.href="selectSubject.jsp";
}
</script>
</html>