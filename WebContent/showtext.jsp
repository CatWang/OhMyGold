<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html;charset=GB2312"%> 
<html>
<meta http-equiv="refresh" content="1;url=showtext.jsp" >
<body>
<%
if(application.getAttribute("words")!=null)
out.println(application.getAttribute("words"));
out.println(111);

%>
</body>
</html>