<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Camera</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
	<%
            String[] s = request.getParameterValues("primarykey");
            jb.connect();
            if(s != null ) {jb.stergeDateTabela(s, "camere", "idcamere");
            %> <script>
						alert("Linia a fost stearsa.");
						location.replace("http://localhost:8080/Lazaroiu/tabela_hoteluri.jsp");
			 	</script>
			<%
            
            }
            else {
            	%>
					<script>
						alert("Nu ati selectat nicio linie pentru a fi stearsa.");
						location.replace("http://localhost:8080/Lazaroiu/tabela_camere.jsp");
					</script>
					<%
				}
	jb.disconnect();
	%>
	<p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
        </p>
    </body>
</html>