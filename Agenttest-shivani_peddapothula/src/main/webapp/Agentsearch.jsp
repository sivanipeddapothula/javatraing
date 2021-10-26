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
<form method="get" action="Agentsearch.jsp">
		<center>
			AgentID : 
			<input type="number" name="AgentID" /> <br/><br/> 
			<input type="submit" value="Search" />
		</center>
	</form>
	<c:if test="${param.AgentID !=null}">
			<sql:setDataSource var="conn" 
				driver="oracle.jdbc.driver.OracleDriver"
			url="jdbc:oracle:thin:@localhost:1521:xe"
			user="navya"
			password="navya"
			/>
	<sql:query var="agentQuery" dataSource="${conn}">
	    		select * from Agent where AgentID=?
	    		<sql:param value="${param.AgentID}"/>
   			</sql:query>	
   			<c:set var="flag" value="0" />
<c:forEach var="e" items="${agentQuery.rows}">
	Agent ID : 
	<c:out value="${e.AgentID}"/> <br/>
	Agent Name : 
	<c:out value="${e.Name}"/> <br/>
	Agent City : 
	<c:out value="${e.City}"/> <br/>
	GENDER : 
	<c:out value="${e.GENDER}"/> <br/>
	Marital Status : 
	<c:out value="${e.MaritalStatus}"/> <br/>
	Premium :
	<c:out value="${e.Premium}"/> <br/> <hr/>
	<c:set var="flag" value="1" />
</c:forEach>
<c:if test="${flag==0}">
	<c:out value="Record Not Found..."/>
</c:if>
   			
	</c:if>
</body>
</html>