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
		padding:120px 20% 80px 20%;
	}
</style>
</head>
<body>
	<div class="detailsbox">
	<p>welcome to dashboard</p>
	<c:forEach var="booking" items="${bookinglists}">
	<div class="margin">
		<div class="row flightdetails">
			<div class="col-12">
				<h4>Flight Details</h4>
			</div>
			<div class="col-4">
				<p>Flight no: <c:out value="${booking.flight.flightno}"/></p>
				<p>Airline: <c:out value="${booking.flight.airline}"/></p>
				<p>Source: <c:out value="${booking.flight.source}"/></p>
				<p>Destination: <c:out value="${booking.flight.destination}"/></p>
			</div>
			<div class="col-4">
				<p>duration: <c:out value="${booking.flight.duration}"/></p>
				<p>Ticket Fare: Rs <c:out value="${booking.flight.ticketprice}"/></p>
				<p>Total price: Rs <c:out value="${booking.flight.ticketprice*booking.personsno}"/></p>
				<p>Card no: <c:out value="${booking.cardno}"/></p>
			</div>
			<div class="col-4">
				<p>Travel date: <c:out value="${booking.flight.traveldate}"/></p>
				<p>Booking id: <c:out value="${booking.id}"/></p>
				<p>Arriving time: <c:out value="${booking.flight.starttime}"/></p>
				<p>Departure time: <c:out value="${booking.flight.endtime}"/></p>
			</div>
		</div>
		<div class="row personsdetails">
		<c:forEach var="person" items="${booking.persons}">
			<div class="col-4">
				<p>First name: <c:out value="${person.firstname}"/></p>
				<p>Last name: <c:out value="${person.lastname}"/></p>
				<p>Gender: <c:out value="${person.gender}"/></p>
			</div>
		</c:forEach>
		</div>
	</div>
	</c:forEach>
	</div>
	
</body>
</html>