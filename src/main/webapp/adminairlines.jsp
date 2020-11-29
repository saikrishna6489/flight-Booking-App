<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">  
<link rel="stylesheet" href="css/bootstrap.min.css">
<style>
.contain1{
	padding:80px 10% 30px 10%;
}
.contain2{
	padding:30px 25%;
}
.pbox{
	margin:8px;
	background-color: #bbdbc4;
	padding:10px;
	border-radius: 10px;
}
.pbox:hover{
	background-color: burlywood;
}
</style>
</head>
		<%
		String si=(String)session.getAttribute("isAdmin");
		if(si!=null)
		{
		%>
<body>
<%@ include file = "header.jsp" %>
	<div class="contain1">
		<div class="row">
			<div class = "col-3">
				<a class="btn btn-outline-primary btn-lg btn-block" href="Adminflights">master list of flights</a>
			</div>
			<div class = "col-3">
				<a class="btn btn-outline-primary btn-lg btn-block" href="Admincities">master list of cities</a>
			</div>
			<div class = "col-3">
				<a class="btn btn-primary btn-lg btn-block" href="Adminairlines">master list of airlines</a>
			</div>
			<div class = "col-3">
				<a class="btn btn-outline-primary btn-lg btn-block" href="adminchangepassword.jsp">Change password</a>
			</div>
		</div>
	</div>
	<div class="contain2">
	    <h3 style="text-align: center;">AIRLINES</h3>
		<div class="row">
			<c:forEach var="airline" items="${listallairlines}">
			<div class="col-md-6 placebox">
	            <div class="d-flex flex-coloumn justify-content-center row pbox">
	                <h5 style="text-align: center;"><c:out value="${airline}"/></h5>
	            </div>
	        </div>
            </c:forEach>
		</div>
	</div>
<%}
		else
		{
			response.sendRedirect("login.jsp");
		}
%>
</body>
</html>