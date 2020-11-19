<nav class="navbar navbar-expand-lg fixed-top navbar-light"  style="background-color: #e3f2fd;">
  <a class="navbar-brand text-danger" href="/flight/index.jsp">FlyAway</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="/flight/index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
    	<%	
    		String s=(String)session.getAttribute("isAdmin");
			if(session.getAttribute("loguser")!=null)
			{
		%>
		<a class="btn btn-outline-success my-2 my-sm-0" type="submit" href="">Dashboard</a>
        <a class="btn btn-outline-success my-2 my-sm-0" type="submit" href="/flight/logout.jsp">Logout</a>
		<%}
		
     
			
			else if (s!=null)
			{
		%>
		<a class="btn btn-outline-success my-2 my-sm-0" type="submit" href="/flight/adminflights.jsp">Dashboard</a>
        <a class="btn btn-outline-success my-2 my-sm-0" type="submit" href="/flight/logout.jsp">Logout</a>
        <%}
			else
		{%>
		<a class="btn btn-outline-success my-2 my-sm-0" type="submit" href="/flight/login.jsp">Login</a>
		<%}%>
        
      
    </form>
  </div>
</nav>