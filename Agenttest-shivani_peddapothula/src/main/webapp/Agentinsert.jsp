<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form method="get" action="Agentinsert.jsp">
		<center>
			Agent No : 
			<input type="number" name="AgentID"> <br/><br/>
			Agent Name : 
			<input type="text" name="Name" /> <br/><br/> 
			Agent City : 
			<input type="text" name="City" /> <br/><br/> 
			GENDER :
			<select name="GENDER">
				<option value="MALE">Male</option>
				<option value="FEMALE">Female</option>
			</select> <br/><br/> 
			MaritalStatus : 
			<input type="number" name="MaritalStatus" /> <br/><br/>
			Premium: 
			<input type="number" name="Premium" /> <br/><br/> 
			<input type="submit" value="Add Agent" />
		</center>
	</form>
	<c:if test="${param.AgentID!=null && param.MaritalStatus!=null && param.Premium!=null}">
			<sql:setDataSource var="conn" 
			driver="oracle.jdbc.driver.OracleDriver"
			url="jdbc:oracle:thin:@localhost:1521:xe"
			user="navya"
			password="navya"
			/>
	<sql:update var="agentUpdate" dataSource="${conn}">
		Insert into Agent(AgentID,Name,City,GENDER,MaritalStatus,Premium) values(?,?,?,?,?,?)
		<sql:param value="${param.AgentID}" />
		<sql:param value="${param.Name}" />
		<sql:param value="${param.City}"/>
		<sql:param value="${param.GENDER}" />
		<sql:param value="${param.MaritalStatus}" />
		<sql:param value="${param.Premium}" />
	</sql:update>
	<c:out value="Record Inserted..." />
</c:if>
</body>
</html>