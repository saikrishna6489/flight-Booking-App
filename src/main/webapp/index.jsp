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
.flightstore{
	background-color: #00000066;
    padding: 15px;
    border-radius: 52px;
}
.flightbox{
	background-color:white;
	border-radius:10px;
	margin:15px;
}
.detailsbox{
	background-color:black;
}
.planeinfo{
	padding-left: 25px;
	
}
.planeinfo h3{
	margin-bottom: 0;
}
.tourdetail{
	padding-top: 16px;
}
.travelduration{
	padding-top: 24px;
	padding-left: 49px;
}
.price{
	padding-top: 13px;
}
.options{
	padding-left: 39px;
    padding-top: 28px;
}
.banner{
	padding-top: 100px;
	background-image:url("images/27278647-flight-wallpapers.jpg");
	background-position: center;
}
.avaform{
	width:572px;
}
.submitbutton{
	align-items:center;
}
.submitbutton button{
	width: 274px;
    height: 53px;
    font-size: 20px;
}
.form-body{
	background-color: #a6a9ca36;
    padding: 26px 20px 2px 20px;
    border-radius: 29px;
    margin-top: 111px;
    margin-bottom: 4px;
}
.headerback{
	background-color: #ff940021 !important;
}
.logo{
	font-size: 31px;
    font-weight: bold;
}
.avabutton{
	background-color: #552d8466;
    border-radius: 30px;
}
.avabutton:hover {
	background-color: #c472d1;
}
.flightwholebox{
	background-image: url(images/backgroundsunnycloud.jpg);
    background-size: cover;
    background-position: center;
}
.login{
	color: black;
    border: 2px solid;
}
.buttonstylehome{
	color: black;
    border: 2px solid;
}
.buttonstylehome:hover , .login:hover{
	background-color: #8b78b480;
    color: #0e008094;
    border-color: #736fa1;
}
.caution{
	color: black;
	margin-bottom: 34px;
	padding-left: 23px;
}
</style>
</head>
	<body>

            <%@ include file = "header.jsp" %>
            
            <div class="banner d-flex flex-row justify-content-center" id="tm-section-1">

                                <form action="ind" method="get" class="avaform">
                                  <div class="d-flex flex-column form-body">
                                    <div class="form-row">
                                        <div class="form-group col-6">                                            
                                            <select class="form-control hi" id="travelfrom" name="travelfrom" style="height:53px" required>
                                                <option value="">FROM</option>
                                            	<c:forEach var="place" items="${bookinplaces}">
                                                <option value="<c:out value="${place}"/>"><c:out value="${place}"/></option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group col-6">                                            
                                            <select class="form-control hi" id="travelto" name="travelto"  style="height:53px" required>
                                            	<option value="">TO</option>
                                            	<c:forEach var="place" items="${bookinplaces}">
                                                <option value="<c:out value="${place}"/>"><c:out value="${place}"/></option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                    	<div class="form-group col-6">
                                            <input type="date" class="form-control"  style="height:53px" id="traveldate" value="2020-12-02" placeholder="Date of travel" name="traveldate" required>
                                        </div>
                                        <div class="form-group col-6">                                            
                                            <select class="form-control" id="travelpersons" name="travelpersons"  style="height:53px" required>
                                                <option value="">number of persons</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                            </select>
                                        </div>
                                        
                                     </div>
                                     <div class="form-row">
                                        <div class="form-group col-12 submitbutton d-flex flex-row justify-content-center">
                                            <button type="submit" class="btn btn-primary avabutton">Check Availability</button>
                                        </div>
                                     </div>
                                   </div>
                                   <p class="caution">Database is provided from 29-11-2020 to 15-12-2020 so select date in b/w</p>
                                 </form>
                                 
                               
            </div>
            
            <div class="flightwholebox"> 
            <br>
            <div class="flightstore container">
	            <c:forEach var="flight" items="${listflights}">
	                <div class="flightbox">    
	            	<div class="row">
			            <div class="col-2 planeinfo">
			                <img>
			                <h6 style="color: brown; font-size: 19px;"><strong><c:out value="${flight.airline}"/></strong></h6>
			                <p><c:out value="${flight.flightno}"/></p>
			            </div>
			            <div class="col-3 tourdetail">
			                <h3><c:out value="${flight.starttime}"/> - <c:out value="${flight.endtime}"/></h3>
			                <p><c:out value="${flight.source}"/> - <c:out value="${flight.destination}"/></p>
			            </div>
			            <div class="col-3 travelduration">
			                <h6 style="font-size: 18px;">Non-stop</h6>
			                <p><c:out value="${flight.duration}"/></p>
			            </div>
			            <div class="col-2 price">
			                <h3><i class="fa fa-rupee" style="font-size:24px"></i> <c:out value="${flight.ticketprice}"/></h3>
			                <p>190 instant off</p>
			            </div>
			            <div class="col-2 options">
			                <a type="submit" class="btn btn-danger" href="bookdetails?id=<c:out value='${flight.id}'/>">BOOK</a>
			            </div>
			        </div>
		            </div>
                </c:forEach>
            </div>
            </div>
	</body>
</html>
