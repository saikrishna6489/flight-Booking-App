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
	.detailsbox{
		padding:110px 20% 80px 20%;
	}
	.person{
		border-radius:15px;
	}
	.flightdetails{
		border-radius:15px;
	}
	.marg{
		background-color: #d5ffcc87;
		border-radius:15px;
	}
</style>
</head>
<body>
		<%
		if(session.getAttribute("loguser")!=null)
		{
		%>
<%@ include file = "header.jsp" %>
	<div class="detailsbox">
	<div class="d-flex flex-row justify-content-center">
		<p style="font-size:20px; font-weight:bold;">Welcome to DASHBOARD</p>
	</div>
	<div class="d-flex flex-row justify-content-start">
		<p style="font-size:20px; font-weight:bold;">Booking History</p>
	</div>
	<c:forEach var="booking" items="${bookinglists}">
	<div class="marg alert alert-light">
		<div class="row flightdetails alert alert-danger">
			<div class="col-12">
				<h4><strong>Flight Details</strong></h4>
			</div>
			<div class="col-4">
				<p><strong>Flight no: </strong><c:out value="${booking.flight.flightno}"/></p>
				<p><strong>Airline: </strong><c:out value="${booking.flight.airline}"/></p>
				<p><strong>Source: </strong><c:out value="${booking.flight.source}"/></p>
				<p><strong>Destination: </strong><c:out value="${booking.flight.destination}"/></p>
			</div>
			<div class="col-4">
				<p><strong>duration: </strong><c:out value="${booking.flight.duration}"/></p>
				<p><strong>Ticket Fare: Rs </strong><c:out value="${booking.flight.ticketprice}"/></p>
				<p><strong>Total price: Rs </strong><c:out value="${booking.flight.ticketprice*booking.personsno}"/></p>
				<p><strong>Card no: </strong><c:out value="${booking.cardno}"/></p>
			</div>
			<div class="col-4">
				<p><strong>Travel date: </strong><c:out value="${booking.flight.traveldate}"/></p>
				<p><strong>Booking id: </strong><c:out value="${booking.id}"/></p>
				<p><strong>Arriving time: </strong><c:out value="${booking.flight.starttime}"/></p>
				<p><strong>Departure time: </strong><c:out value="${booking.flight.endtime}"/></p>
			</div>
		</div>
		<div class="row personsdetails">
		<% int i = 0; %>
		<c:forEach var="person" items="${booking.persons}">
			<div class="col-4 person alert alert-success">
				<h5><strong>Traveller <% i=i+1; out.print(i); %></strong></h5>
				<p><strong>First name: </strong><c:out value="${person.firstname}"/></p>
				<p><strong>Last name: </strong><c:out value="${person.lastname}"/></p>
				<p><strong>Gender: </strong><c:out value="${person.gender}"/></p>
			</div>
		</c:forEach>
		</div>
	</div>
	</c:forEach>
	</div>
        <%}
		else
		{
			response.sendRedirect("login.jsp");
		}
        %>
</body>
</html>