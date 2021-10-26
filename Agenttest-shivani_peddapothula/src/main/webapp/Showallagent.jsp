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
<sql:setDataSource var="conn" 
			driver="oracle.jdbc.driver.OracleDriver"
			url="jdbc:oracle:thin:@localhost:1521:xe"
			user="navya"
			password="navya"
	/>
	<sql:query var="AgentQuery" dataSource="${conn}">
	    select * from Agent
   </sql:query>
<table border="3">
	<tr>
		<th>Agent ID</th>
		<th>Agent Name</th>
		<th>Agent City</th>
		<th>GENDER</th>
		<th>Marital Status</th>
		<th>Premium</th>
	</tr>
<c:forEach var="e" items="${AgentQuery.rows}">
	<tr>
		<td><c:out value="${e.AgentID}"/> </td>
		<td><c:out value="${e.Name}"/> </td>
		<td><c:out value="${e.City}"/></td>
		<td><c:out value="${e.GENDER}"/> </td>
		<td><c:out value="${e.MaritalStatus}"/> </td>
		<td><c:out value="${e.Premium}"/> </td>
	</tr>
</c:forEach>
</table>
</body>
</html>