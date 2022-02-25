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
        <title>Adauga Hotel</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-color:grey;">
        <%
            String Nume = request.getParameter("nume");
            String Adresa = request.getParameter("adresa");
            String Tara = request.getParameter("tara");
            String Stars = request.getParameter("stele");
            String Reviews = request.getParameter("recenzii");
            String NoPhone = request.getParameter("numar_telefon");
            if (Nume != null && Adresa != null && Tara != null && Stars != null && Reviews != null && NoPhone != null ) {
                jb.connect();
                try {jb.adaugareHotel(Nume, Adresa, Tara, java.lang.Integer.parseInt(Stars), java.lang.Float.parseFloat(Reviews), NoPhone);
                jb.disconnect();}
                catch(Exception e){
                	%> <script>
					alert("Nu ati introdus toate campurile");
					location.replace("http://localhost:8080/Lazaroiu/nou_Hotel.jsp");
					   </script>
					<%
                }
        %><p>
        <script>
						alert("Datele au fost adaugate");
						location.replace("http://localhost:8080/Lazaroiu/tabela_hoteluri.jsp");
			</script></p>
			<%
        }    
            else {
        	
        %>
        <h1 align="center">
        
		<span class="badge bg-secondary"> Aici puteti adauga un nou hotel!</span>
	    </h1>
	    <br><br/>
        <form action="nou_Hotel.jsp" method="post">
         <div class="container-fluid">
			<div class="row text-center">
				<div class="col-md-6 offset-3">
					<table border="2" class="table table-dark table-striped">
                <tr>
                    <td align="center">NumeHotel:</td>
                    <td> <input  type="text" name="nume" placeholder="Numele hotelului"></td>
                </tr>
                <tr>
                    <td align="center">AdresaHotel:</td>
                    <td> <input  type="text" name="adresa" placeholder="Adresa"></td>
                </tr>
                <tr>
                    <td align="center">TaraHotel:</td>
                    <td> <input  type="text" name="tara" placeholder="Tara"></td>
                </tr>
                <tr>
                    <td align="center">NumarStele:</td>
                    <td> <input  type="text" name="stele" placeholder="Nr stele"></td>
                </tr>
                <tr>
                    <td align="center">Recenzii:</td>
                    <td> <input  type="text" name="recenzii" placeholder="Recenzii"></td>
                </tr>
                <tr>
                    <td align="center">NumarTelefon:</td>
                    <td> <input  type="text" name="numar_telefon" placeholder="Nr telefon"></td>
                </tr>
            </table>
           </div>
		</div>
	</div>
			<p align="center">
            <button type="submit" class="btn btn-dark">Adauga noul hotel</button>
            </p>
            <p align="center">
		<button type="button" onclick="location.href='index.html'" class="btn btn-info"><div >HomePage</div> </button>
	</p>
        </form>
        <%
            }
        %>
	
        <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
    </body>
</html>