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
<link rel="stylesheet" type="text/css" href="slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
<link rel="stylesheet" type="text/css" href="css/datepicker.css"/>  
<link rel="stylesheet" href="css/tooplate-style.css">  
<link rel="stylesheet" href="css/ss.css">
<style>
.flightstore{
	background-color:black;
	padding:15px;
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
	padding-top: 18px;
}
.price{
	padding-top: 13px;
}
.options{
	padding-left: 39px;
    padding-top: 28px;
}
</style>
</head>
	<body>

            <%@ include file = "header.jsp" %>
            <div class="tm-section tm-bg-img" id="tm-section-1">
            	<div class="row">
                <div class="tm-bg-white ie-container-width-fix-2">
                    <div class="container ie-h-align-center-fix">
                        <div class="row">
                            <div class="col-xs-12 ml-auto mr-auto ie-container-width-fix">
                                <form action="ind" method="get" class="tm-search-form tm-section-pad-2">
                                    <div class="form-row tm-search-form-row">
                                        <div class="form-group tm-form-element tm-form-element-2">                                            
                                            <select class="form-control tm-select" id="travelfrom" name="travelfrom">
                                                <option value="">FROM</option>
                                                <option value="banglore">Banglore</option>
                                                <option value="delhi">Delhi</option>
                                                <option value="mumbai">Mumbai</option>
                                                <option value="hyderabed">Hyderabed</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                            </select>
                                            <i class="fa fa-2x fa-user tm-form-element-icon"></i>
                                        </div>
                                        <div class="form-group tm-form-element tm-form-element-2">                                            
                                            <select class="form-control tm-select" id="travelto" name="travelto">
                                                <option value="">TO</option>
                                                <option value="banglore">Banglore</option>
                                                <option value="delhi">Delhi</option>
                                                <option value="mumbai">Mumbai</option>
                                                <option value="hyderabed">Hyderabed</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                            </select>
                                            <i class="fa fa-2x fa-user tm-form-element-icon"></i>
                                        </div>
                                        <div class="form-group tm-form-element tm-form-element-50">
                                            <i class="fa fa-calendar fa-2x tm-form-element-icon"></i>
                                            <input type="date" class="form-control" id="traveldate" value="2020-11-16" placeholder="Date of travel" name="traveldate">
                                        </div>
                                    </div>
                                    <div class="form-row tm-search-form-row">
                                        <div class="form-group tm-form-element tm-form-element-2">                                            
                                            <select class="form-control tm-select" id="travelpersons" name="travelpersons">
                                                <option value="">number of persons</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                            </select>
                                            <i class="fa fa-2x fa-user tm-form-element-icon"></i>
                                        </div>
                                       
                                        <div class="form-group tm-form-element tm-form-element-2">
                                            <button type="submit" class="btn btn-primary tm-btn-search">Check Availability</button>
                                        </div>
                                      </div>
                                      <div class="form-row clearfix pl-2 pr-2 tm-fx-col-xs">
                                          <p class="tm-margin-b-0">flights are available from date   to date   .</p>
                                          <a href="#" class="ie-10-ml-auto ml-auto mt-1 tm-font-semibold tm-color-primary">Need Help?</a>
                                      </div>
                                </form>
                            </div>                        
                        </div>      
                    </div>
                </div>
                </div>               
            </div>
            <div class="flightstore container"> 
            	<div class="flightbox">    
            	<div class="row">
		            <div class="col-2">
		                <img>
		                <h6>flight-name</h6>
		                <p>flight-no</p>
		            </div>
		            <div class="col-2">
		                <h3>06:50 - 09.00</h3>
		                <p>delhi - bombay</p>
		            </div>
		            <div class="col-4">
		                <h6>non-stop</h6>
		                <p>2h10m</p>
		            </div>
		            <div class="col-2">
		                from<h3>Rs 5005</h3>
		                <p>190 instant off</p>
		            </div>
		            <div class="col-2">
		                <a type="submit" class="btn btn-danger" href="detailsform.jsp">BOOK</a>
		            </div>
		        </div>
	            </div>
	            <c:forEach var="flight" items="${listflights}">
	                <div class="flightbox">    
	            	<div class="row">
			            <div class="col-2 planeinfo">
			                <img>
			                <h6><c:out value="${flight.airline}"/></h6>
			                <p><c:out value="${flight.flightno}"/></p>
			            </div>
			            <div class="col-3 tourdetail">
			                <h3><c:out value="${flight.starttime}"/> - <c:out value="${flight.endtime}"/></h3>
			                <p><c:out value="${flight.source}"/> - <c:out value="${flight.destination}"/></p>
			            </div>
			            <div class="col-3 travelduration">
			                <h6>non-stop</h6>
			                <p><c:out value="${flight.duration}"/></p>
			            </div>
			            <div class="col-2 price">
			                <h3>Rs <c:out value="${flight.ticketprice}"/></h3>
			                <p>190 instant off</p>
			            </div>
			            <div class="col-2 options">
			                <a type="submit" class="btn btn-danger" href="bookdetails?id=<c:out value='${flight.id}'/>">BOOK</a>
			            </div>
			        </div>
		            </div>
                </c:forEach>
            </div>
            <div class="tm-section-2">
                <div class="container">
                    <div class="row">
                        <div class="col text-center">
                            <h2 class="tm-section-title">HAVE A HAPPY JOURNEY</h2>
                            <p class="tm-color-white tm-section-subtitle">Subscribe to get our newsletters</p>
                            <a href="#" class="tm-color-white tm-btn-white-bordered">Subscribe Newletters</a>
                        </div>                
                    </div>
                </div>        
            </div>
            
            <div class="tm-section tm-position-relative">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100" preserveAspectRatio="none" class="tm-section-down-arrow">
                    <polygon fill="#ee5057" points="0,0  100,0  50,60"></polygon>                   
                </svg> 
                <div class="container tm-pt-5 tm-pb-4">
                    <div class="row text-center">
                        <article class="col-sm-12 col-md-4 col-lg-4 col-xl-4 tm-article">                            
                            <i class="fa tm-fa-6x fa-legal tm-color-primary tm-margin-b-20"></i>
                            <h3 class="tm-color-primary tm-article-title-1">Level HTML Template by Tooplate website</h3>
                            <p>You are allowed to download, edit and use this template for your business or client websites.</p>
                            <a href="#" class="text-uppercase tm-color-primary tm-font-semibold">Continue reading...</a>
                        </article>
                        <article class="col-sm-12 col-md-4 col-lg-4 col-xl-4 tm-article">                            
                            <i class="fa tm-fa-6x fa-plane tm-color-primary tm-margin-b-20"></i>
                            <h3 class="tm-color-primary tm-article-title-1">Original Website Template Producer</h3>
                            <p>You are NOT allowed to re-distribute the downloadable template ZIP file on any website.</p>
                            <a href="#" class="text-uppercase tm-color-primary tm-font-semibold">Continue reading...</a>                            
                        </article>
                        <article class="col-sm-12 col-md-4 col-lg-4 col-xl-4 tm-article">                           
                            <i class="fa tm-fa-6x fa-life-saver tm-color-primary tm-margin-b-20"></i>
                            <h3 class="tm-color-primary tm-article-title-1">Contact us if you have any question</h3>
                            <p>If you see this template being distributed on any other site, that is an illegal copy.</p>
                            <a href="#" class="text-uppercase tm-color-primary tm-font-semibold">Continue reading...</a>                           
                        </article>
                    </div>        
                </div>
            </div>
	</body>
</html>
