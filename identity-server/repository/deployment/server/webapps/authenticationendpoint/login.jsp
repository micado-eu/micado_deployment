<%  
String relyingParty = request.getParameter("relyingParty");
String migrantHostname = System.getenv("MIGRANTS_HOSTNAME");

if (relyingParty.equals(migrantHostname)) {
    RequestDispatcher dispatcher = request.getRequestDispatcher("migrants_micadoproject.jsp");
    dispatcher.forward(request, response);
} else {
    RequestDispatcher dispatcher = request.getRequestDispatcher("default_login.jsp");
    dispatcher.forward(request, response);
} 
    %>
