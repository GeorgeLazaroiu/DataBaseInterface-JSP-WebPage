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
        <title>Tabela Rezervare</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-color:grey;">
        <h1 align="center"> Tabela Rezervare:</h1>
        <br/>
        <<p align="center"><a href="nou_Camera.jsp"><b>Adauga o noua rezervare.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            String aux = request.getParameter("idrezervare");
            String id1 = request.getParameter("idcamere");
            String id2 = request.getParameter("idhoteluri");
            String Checkin = request.getParameter("checkin");
            String Checkout = request.getParameter("checkout");

            String[] valori = {id1, id2, Checkin, Checkout};
            String[] campuri = {"idcamere", "idhoteluri", "checkin", "checkout"};
            try{
            	jb.modificaTabela("rezervare", "idrezervare", java.lang.Long.parseLong(aux), campuri, valori);
            }
            catch(Exception e){
            	aux = null;
            	%>
            	<p>
            	<script>
				alert("Eroare! Nu ati introdus toate datele");
				location.replace("http://localhost:8080/Lazaroiu/modifica_Rezervare.jsp");
				</script></p>
				<%
            }
            jb.disconnect();
        %>
        <p>
        <script>
						alert("Modificarile au fost efectuate !");
						location.replace("http://localhost:8080/Lazaroiu/modifica_Rezervare.jsp");
		</script></p>
            <br/>
    </body>
</html>