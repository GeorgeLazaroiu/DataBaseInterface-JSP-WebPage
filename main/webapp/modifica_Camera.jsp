<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<!-- Bootstrap CSS -->
		<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
        <title>Tabela Camera</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-color:grey;">
        
        <h1 align="center"><strong>Tabela Camera:</strong></h1>
         <br>
        <form action="m1_Camera.jsp" method="post">
           <div class="container-fluid">
			<div class="row text-center">
				<div class="col-md-10 offset-1">
					<table border="2" class="table table-dark table-striped">
                <tr>
                    <td><b>Mark:</b></td>
					<td><b>IdCamera:</b></td>
					<td><b>NumarCamera:</b></td>
					<td><b>PretCamera:</b></td>
					<td><b>NumarPersoane:</b></td>
					<td><b>ConfortCamera:</b></td>
					
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedereTabela("camere");
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idcamere");
                %>
                <tr>
                    <td><input type="radio" name="primarykey" value="<%= x%>" /></td>
                    <td><%= x%></td>
                    <td><%= rs.getInt("numar")%></td>
					<td><%= rs.getFloat("pret")%></td>
					<td><%= rs.getInt("numar_persoane")%></td>
					<td><%= rs.getInt("confort")%></td>
                    
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            </div>
			</div>
		</div>
		<br />
		<p align="center">
            <button type="submit" class="btn btn-dark">Modifica linia</button>
        </p>
        </form>
        <%
    jb.disconnect();%>
        <br/>
        <p align="center">
		<button type="button" onclick="location.href='index.html'"
			class="btn btn-info">
			<div>HomePage</div>
		</button>
	</p>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
    </body>
</html>