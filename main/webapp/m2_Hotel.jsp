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
        <title>Tabela Hoteluri</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-color:grey;">
        <h1 align="center"> Tabela Hoteluri:</h1>
        <br/>
        <p align="center"><a href="nou_Hotel.jsp"><b>Adauga un nou hotel.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
   
            String aux = request.getParameter("idhoteluri");
            String Nume = request.getParameter("nume");
            String Adresa = request.getParameter("adresa");
            String Tara = request.getParameter("tara");
            String Stars = request.getParameter("stele");
            String Reviews = request.getParameter("recenzii");
            String NoPhone = request.getParameter("numar_telefon");

            String[] valori = {Nume, Adresa, Tara, Stars, Reviews, NoPhone};
            String[] campuri = {"nume", "adresa", "tara","stele", "recenzii", "numar_telefon"};
            try {
            	jb.modificaTabela("hoteluri", "idhoteluri", java.lang.Long.parseLong(aux), campuri, valori);
            }
            catch (Exception e){
            	aux = null;
            	%>
            	<script>
				alert("Modificarile au fost efectuate !");
				location.replace("http://localhost:8080/Lazaroiu/modifica_Hotel.jsp");
				</script></p>
				<%
            }
            jb.disconnect();
        %>
        <script>
						alert("Modificarile au fost efectuate !");
						location.replace("http://localhost:8080/Lazaroiu/modifica_Hotel.jsp");
		</script></p>
        
    </body>
</html>