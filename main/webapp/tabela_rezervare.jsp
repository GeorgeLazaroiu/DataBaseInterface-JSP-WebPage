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
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-color:grey;">
        <h1 align="center">
        <span class="badge bg-secondary"> Tabela Rezervare: </span>
        </h1>
        <br/>
        <p align="center">
		<button type="button" onclick="location.href='nou_Rezervare.jsp'" class="btn btn-dark"><div > Adauga o noua rezervare.</div> </button>
	</p>
	<div class="container-fluid">
	<div class="row text-center">
	<div class="col-md-10 offset-1">
        <form action="stergere_Rezervare.jsp" method="post">
					<table border="2" class="table table-dark table-striped">
						
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>IdRezervare:</b></td>
                    <td><b>IdCamera:</b></td>
                    <td><b>NumarCamera:</b></td>
                    <td><b>PretCamera:</b></td>
                    <td><b>IdHotel:</b></td>
                    <td><b>NumeHotel:</b></td>
                    <td><b>TaraHotel:</b></td>
                    <td><b>SteleHotel:</b></td>
                    <td><b>RecenziiHotel:</b></td>          
                    <td><b>Check-In:</b></td>
                    <td><b>Check-Out:</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedereRezervare();
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idrezervare");
                %>
                <tr>
                    <td><input type="radio" name="primarykey" value="<%= x%>" /></td><td><%= x%></td>
                    <td><%= rs.getLong("idcamera_rez")%></td>
                    <td><%= rs.getInt("NumarCamera")%></td>
                    <td><%= rs.getFloat("PretCamera")%></td>
                    <td><%= rs.getLong("idhotel_rez")%></td>
                    <td><%= rs.getString("NumeHotel")%></td>
                    <td><%= rs.getString("Tara")%></td>
                    <td><%= rs.getInt("Stars")%></td>
                    <td><%= rs.getFloat("Reviews")%></td>                    
                    <td><%= rs.getString("checkin")%></td>
                    <td><%= rs.getString("checkout")%></td>
                    <%
                        }
                    %>
                </tr>
                
            </table>
			
			<br/>
	        <p align="center">
			<button type="submit" onclick="location.href='tabela_rezervare.jsp'"  class="btn btn-dark">Sterge liniile marcate</button>
			
			</p>
        </form>
        </div>
			</div>
		</div>
        <%
            rs.close();
            jb.disconnect();
        %>
        <br/>
        <p align="center">
		<button type="button" onclick="location.href='index.html'" class="btn btn-info"><div >HomePage</div> </button>
		</p>
        
        <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
    </body>
</html>