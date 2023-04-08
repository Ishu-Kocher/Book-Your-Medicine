
<% 
	String message = (String)session.getAttribute("message");
	String eType = (String)session.getAttribute("eType");
	if(message != null){
		
%>

<div
	class="alert <%=eType%> alert-dismissible fade show text-center mt-3"
	role="alert">
	<strong><%=message%></strong>
	<button type="button" class="btn-close" data-bs-dismiss="alert"
		aria-label="Close"></button>
	</button>
</div>




<%
		session.removeAttribute("message");
		session.removeAttribute("eType");
	}else{
		
	}
%>