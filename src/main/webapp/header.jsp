<nav class="navbar navbar-expand-lg fixed-top navbar-light headerback"  style="background-color: #e3f2fd;">
  <a class="navbar-brand text-danger logo" href="/flight/welcomepage">FlyAway</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="/flight/welcomepage">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
    	<%
    		String s=(String)session.getAttribute("isAdmin");
			if(session.getAttribute("loguser")!=null)
			{
		%>
			<p style="padding-right: 16px; padding-top: 15px; font-weight: bold;">Hi <c:out value='${loguser.username}'/>! </p>
			<a style="margin-right: 6px; font-weight: bold;" class="btn btn-outline-success my-2 my-sm-0 buttonstylehome" type="submit" href="/flight/userdashboard">User Dashboard</a>
		
        <a style="margin-right: 6px; font-weight: bold;" class="btn btn-outline-success my-2 my-sm-0 buttonstylehome" type="submit" href="/flight/logout.jsp">Logout</a>
		<%}
			
			else if (s!=null)
			{
		%>
		<p style="padding-right: 16px; padding-top: 15px; font-weight: bold;">Hi Admin! </p>
		<a style="margin-right: 6px; font-weight: bold;" class="btn btn-outline-success my-2 my-sm-0 buttonstylehome" type="submit" href="/flight/adminflights.jsp">Admin Dashboard</a>
        <a style="margin-right: 6px; font-weight: bold;" class="btn btn-outline-success my-2 my-sm-0 buttonstylehome" type="submit" href="/flight/logout.jsp">Logout</a>
        <%}
			else
		{%>
		<p style="padding-right: 16px; padding-top: 15px; font-weight: bold;">Hi Guest! </p>
		<a style="margin-right: 6px; font-weight: bold;" class="btn btn-outline-success my-2 my-sm-0 login" type="submit" href="/flight/login.jsp">Login</a>
		<%}%>
        
      
    </form>
  </div>
</nav>