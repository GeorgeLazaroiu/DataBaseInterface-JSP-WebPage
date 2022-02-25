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
        <title>Tabela Camere</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-color:grey;">
        <h1 align="center"><strong>Adauga o noua camere:</strong></h1>
        <br/>
       
        <%
            jb.connect();
           
            	String aux = request.getParameter("primarykey");

            try { 
            	ResultSet rs = jb.intoarceLinieDupaId("camere", "idcamere", java.lang.Long.parseLong(aux));
            rs.first();
            
            int Numar = rs.getInt("numar");
            float Price = rs.getFloat("pret");
            int NoPers = rs.getInt("numar_persoane");
            int Confort = rs.getInt("confort");
            
            rs.close();
            jb.disconnect();
            
        %>
        <form action="m2_Camera.jsp" method="post">
            <div class="container-fluid">
			<div class="row text-center">
				<div class="col-md-10 offset-1">
					<table border="2" class="table table-dark table-striped">
                <tr>
                    <td align="right">IdCamera:</td>
                    <td> <input type="text" name="idcamere" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Numar:</td>
                    <td> <input type="text" name="numar" size="30" value="<%= Numar%>"/></td>
                </tr>
                <tr>
                    <td align="right">Price:</td>
                    <td> <input type="text" name="pret" size="30" value="<%= Price%>"/></td>
                </tr>
                <tr>
                    <td align="right">NoPers:</td>
                    <td> <input type="text" name="numar_persoane" size="30" value="<%= NoPers%>"/></td>
                </tr>
                <tr>
                    <td align="right">Confort:</td>
                    <td> <input type="text" name="confort" size="30" value="<%= Confort%>"/></td>
                </tr>
            </table>
            </div>
            </div>
            </div>
            <% }
			catch(Exception e){ 
      	    	%> <script>
				alert("Nu ati selectat nimic.");
				location.replace("http://localhost:8080/Lazaroiu/modifica_Camera.jsp");
			 	</script>
				<%
      	    }
            %>
			<br>
			
			<p align="center">
            <button type="submit" class="btn btn-dark">Modifica linia</button>
        	</p>
        </form>
        <p align="center">
		<button type="button" onclick="location.href='index.html'"
			class="btn btn-info">
			<div>HomePage</div>
		</button>
		</p>
		}
	
            
            <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
    </body>
</html>