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
        
        <title>Adauga Camera</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-color:grey;">
        <%
            String Numar = request.getParameter("numar");
            String Price = request.getParameter("pret");
           	String NoPers = request.getParameter("numar_persoane");
            String Confort = request.getParameter("confort");
            
            if (Numar != null || Price != null || NoPers != null || Confort != null ) {
                jb.connect();
                try {jb.adaugareCamera(java.lang.Integer.parseInt(Numar), java.lang.Float.parseFloat(Price), java.lang.Integer.parseInt(NoPers), java.lang.Integer.parseInt(Confort));
                jb.disconnect();}
                catch(Exception e){
                	%> <script>
					alert("Nu ati introdus toate campurile");
					location.replace("http://localhost:8080/Lazaroiu/nou_Camera.jsp");
					   </script>
					<%
                }
        %>
        <p> <script>
						alert("Datele au fost adaugate");
						location.replace("http://localhost:8080/Lazaroiu/tabela_camere.jsp");
			</script></p><%
        } else {
        	
        %>
        <h1 align="center">
		<span class="badge bg-secondary">Aici puteti adauga o noua camera.</span>
		</h1>
        <br>
        <form action="nou_Camera.jsp" method="post">
          <div class="container-fluid">
			<div class="row text-center">
				<div class="col-md-10 offset-1">
					<table border="2" class="table table-dark table-striped">
                <tr>
                    <td align="center">Numar Camera:</td>
                    <td> <input type="text" name="numar" size="30" placeholder="Numarul camerei" /></td>
                </tr>
                <tr>
                    <td align="center">Pret Camera:</td>
                    <td> <input type="text" name="pret" size="30" placeholder="Pretul camerei" /></td>
                </tr>
                <tr>
                    <td align="center">NumarPersoane per Camera:</td>
                    <td> <input type="text" name="numar_persoane" size="30" placeholder="Nr de persoane" /></td>
                </tr>
                <tr>
                    <td align="center">Confort Camera:</td>
                    <td> <input type="text" name="confort" size="30" placeholder="Confortul camerei" /></td>
                </tr>
            </table>
            </div>
			</div>
			</div>
           <p align="center">
			<button type="submit" class="btn btn-dark">Adauga noua camera</button>
		 </p>
        </form>
        <%
            }
        %>
        <p align="center">
		<button type="button" onclick="location.href='index.html'" class="btn btn-info"><div >HomePage</div> </button>
		</p>
        
        <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
    </body>
</html>