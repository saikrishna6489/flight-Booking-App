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
	padding:30px 15%;
}
.contain2{
	padding:30px 25%;
}
</style>
</head>
<body>
<body>
	<div class="contain1">
		<div class="row">
			<div class = "col-4">
				<button class="btn btn-primary btn-lg btn-block">master list of flights</button>
			</div>
			<div class = "col-4">
				<button class="btn btn-primary btn-lg btn-block">master list of cities</button>
			</div>
			<div class = "col-4">
				<button class="btn btn-primary btn-lg btn-block">master list of airlines</button>
			</div>
		</div>
	</div>
	<div class="contain2">
		<div class="row">
			<div class="col">
			<h2>ADD FLIGHT</h2>
				<form action="admininsertflight" method="post">
				  <div class="form-row">
				    <div class="form-group col-4">
				      <label for="flightno">Flight no:</label>
				      <input type="text" class="form-control" id="flightno" placeholder="Flight no" name="flightno">
				    </div>
				    <div class="form-group col-4">
				      <label for="airline">airline:</label>
				      <select class="form-control" id="airline" name="airline">
				        <option selected>Choose...</option>
				        <option value="south">southern</option>
				        <option value="north">deccan</option>
				        <option value="east">indian</option>
				      </select>
				    </div>
				    <div class="form-group col-4">
				      <label for="traveldate">Travel date:</label>
				      <input type="date" class="form-control" id="traveldate" name="traveldate">
				    </div>
				  </div>
				  <div class="form-row">
				    <div class="form-group col-4">
				      <label for="starttime">Start time:</label>
				      <input type="time" class="form-control" id="starttime" name="starttime">
				    </div>
				    <div class="form-group col-4">
				      <label for="endtime">End time:</label>
				      <input type="time" class="form-control" id="endtime" name="endtime">
				    </div>
				    <div class="form-group col-4">
				      <label for="hrs">Travel time:</label>
				      <div class="form-row">
				      <select class="form-control col" id="hrs" name="hours">
				        <option>Hours</option>
				        <option value="1">1</option>
				        <option value="2">2</option>
				        <option value="3">3</option>
				      </select>
				      <select class="form-control col" id="min" name="minutes">
				        <option>Minutes</option>
				        <option value="1">1</option>
				        <option value="2">2</option>
				        <option value="3">3</option>
				      </select>
				      </div>
				    </div>
				  </div>
				  <div class="form-row">
				    <div class="form-group col">
				      <label for="hrs">From</label>
				      <select class="form-control col" id="hrs" name="source">
				        <option selected>From:</option>
				        <option value="Banglore">Banglore</option>
				        <option value="Delhi">Delhi</option>
				        <option value="Mumbai">Mumbai</option>
				      </select>
				    </div>
				    <div class="form-group col">
				      <label for="min">To:</label>
				      <select class="form-control col" id="min" name="destination">
				        <option selected>To</option>
				        <option value="Banglore">Banglore</option>
				        <option value="Delhi">Delhi</option>
				        <option value="Mumbai">Mumbai</option>
				      </select>
				    </div>
				    <div class="form-group col">
				      <label for="ticketprice">Fare:</label>
				      <input type="number" class="form-control" id="ticketprice" name="ticketprice">
				    </div>
				  </div>
				  <button type="submit" class="btn btn-primary">ADD FLIGHT</button>
				</form>
            </div>
		</div>
	</div>
</body>
</html>