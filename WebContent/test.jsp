<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>JSP forward example with parameters</title>
</head>
<body>
	<jsp:forward page="display.jsp">
		<jsp:param name="name" value="Chaitanya" />
		<jsp:param name="site" value="BeginnersBook.com" />
		<jsp:param name="tutorialname" value="jsp forward action" />
		<jsp:param name="reqcamefrom" value="index.jsp" />
	</jsp:forward>
</body>
</html>