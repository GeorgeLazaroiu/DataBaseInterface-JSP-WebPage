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
        <title>Adauga rezervare</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body style="background-color:grey;">
        <%  
            long idcamere, idhoteluri;
            String id1 = request.getParameter("idcamere");
            String id2 = request.getParameter("idhoteluri");
            String Checkin = request.getParameter("checkin");
            String Checkout = request.getParameter("checkout");
            
			String Nume,Adresa,Tara,NoPhone;
            float Price,Reviews;
            int NoPers,Confort,Stars,Numar;
            
            if (id1 != null) {
                jb.connect();
                try {jb.adaugareRezervare(java.lang.Long.parseLong(id2), java.lang.Long.parseLong(id1), Checkin, Checkout);
                jb.disconnect();}
                catch(Exception e){
                	%> <script>
					alert("Nu ati introdus toate campurile");
					location.replace("http://localhost:8080/Lazaroiu/nou_Rezervare.jsp");
					   </script>
					<%
                }
        %><p>
        <script>
						alert("Datele au fost adaugate");
						location.replace("http://localhost:8080/Lazaroiu/tabela_rezervare.jsp");
			</script></p>
			<%
        }  else {
        jb.connect();
        ResultSet rs1 = jb.vedereTabela("camere");
        ResultSet rs2 = jb.vedereTabela("hoteluri");
        %>
        <h1 align="center">
		<span class="badge bg-secondary">Aici puteti adauga o noua rezervare.</span>
		<br>
		<br>
		</h1>
        <form action="nou_Rezervare.jsp" method="post">
            <div class="container-fluid">
			<div class="row text-center">
				<div class="col-md-10 offset-1">
				 	<table border="2" class="table table-dark table-striped">
                <tr>
                    <td align="center">IdCamera:</td>
                    <td> 
                        Selectati Camera:
			<SELECT NAME="idcamere">
                                <%
                                    while(rs1.next()){
                                        idcamere = rs1.getLong("idcamere");
                                        Numar = rs1.getInt("numar");
                                        Price = rs1.getFloat("pret");
                                        NoPers = rs1.getInt("numar_persoane");
                                        Confort = rs1.getInt("confort");
                                %>
                                    <OPTION VALUE="<%= idcamere%>"><%= idcamere%>,<%= Numar%>,<%= Price%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                    
                    </td>
                </tr>
                <tr>
                    <td align="center">IdHotel:</td>
                    <td> 
                        Selectati hotelul:
			<SELECT NAME="idhoteluri">
				<!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
                                <%
                                    while(rs2.next()){
                                        idhoteluri = rs2.getLong("idhoteluri");
                                        Nume = rs2.getString("nume");
                                        Adresa = rs2.getString("adresa");
                                        Tara = rs2.getString("tara");
                                        Stars = rs2.getInt("stele");
                                        Reviews = rs2.getFloat("recenzii");
                                        NoPhone = rs2.getString("numar_telefon");
                                %>
                                    <OPTION VALUE="<%= idhoteluri%>"><%= idhoteluri%>,<%= Nume%>,<%= Reviews%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                     </td>
                </tr>               
                <tr>
                    <td align="center">Checkin:</td>
                    <td> <input type="text" name="checkin" size="30" /></td>
                </tr>
                <tr>
                    <td align="center">Checkout:</td>
                    <td> <input type="text" name="checkout" size="30" /></td>
                </tr>
            </table>
            </div>
			</div>
			</div>
            <p align="center">
			<button type="submit" class="btn btn-dark">Adauga noua rezervare</button>
		    </p>
        </form>
        <%
            }
        %>
        <br>
        <p align="center">
		<button type="button" onclick="location.href='index.html'" class="btn btn-info"><div >HomePage</div> </button>
		</p>
    </body>
</html>