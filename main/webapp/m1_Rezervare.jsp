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
        <h1 align="center"><strong>Adauga o noua rezervare:</strong></h1>
        <%
            jb.connect();

            String aux = request.getParameter("primarykey");
            try {
            	ResultSet rs = jb.intoarceRezervareId(java.lang.Long.parseLong(aux));
            
            rs.first();
           	long id1 = rs.getLong("idcamera_rez");
            long id2 = rs.getLong("idhotel_rez");

            int Numar = rs.getInt("NumarCamera");
            float Price = rs.getFloat("PretCamera");
            int NoPers = rs.getInt("NoPers");
            int Confort = rs.getInt("Confort");
            
            String Nume = rs.getString("NumeHotel");
            String Adresa = rs.getString("AdresaHotel");
            String Tara = rs.getString("Tara");
            int Stars = rs.getInt("Stars");
            float Reviews = rs.getFloat("Reviews");
            String NoPhone = rs.getString("NoPhone");
            
            String Checkin = rs.getString("checkin");
            String Checkout = rs.getString("checkout");

            ResultSet rs1 = jb.vedereTabela("camere");
            ResultSet rs2 = jb.vedereTabela("hoteluri");
            long idcamere, idhoteluri;


        %>
        <form action="m2_Rezervare.jsp" method="post">
            <div class="container-fluid">
			<div class="row text-center">
				<div class="col-md-10 offset-1">
					<table border="2" class="table table-dark table-striped">
                <tr>
                    <td align="center">IdRezervare:</td>
                    <td> <input type="text" name="idrezervare" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="center">IdCamere:</td>
                    <td> 
                        <SELECT NAME="idcamere">
                            <%
                                while (rs1.next()) {
                                	idcamere = rs1.getLong("idcamere");
                                    Numar = rs1.getInt("numar");
                                    Price = rs1.getFloat("pret");
                                    NoPers = rs1.getInt("numar_persoane");
                                    Confort = rs1.getInt("confort");
                                    
                                    if (idcamere != id1) {
                            %>
                            <OPTION VALUE="<%= idcamere%>"><%= idcamere%>, <%= Numar%>, <%= Price%>, <%= NoPers%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="YES" VALUE="<%= idcamere%>"><%= idcamere%>, <%= Numar%>, <%= Price%>, <%= NoPers%>, <%= Confort%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="center">IdHoteluri:</td>
                    <td> 
                        <SELECT NAME="idhoteluri">
                            <%
                                while (rs2.next()) {
                                	idhoteluri = rs2.getLong("idhoteluri");
                                    Nume = rs2.getString("nume");
                                    Adresa = rs2.getString("adresa");
                                    Tara = rs2.getString("tara");
                                    Stars = rs2.getInt("stele");
                                    Reviews = rs2.getFloat("recenzii");
                                    NoPhone = rs2.getString("numar_telefon");
                            if (idhoteluri != id2) {
                            %>
                            <OPTION VALUE="<%= idhoteluri%>"><%= idhoteluri%>, <%= Nume%>, <%= Tara%>, <%= Stars%>, <%= Reviews%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idhoteluri%>"><%= idhoteluri%>, <%= Nume%>, <%= Tara%>, <%= Stars%>, <%= Reviews%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="center">Check-In:</td>
                    <td> <input type="text" name="checkin" size="30" value="<%= Checkin%>"/></td>
                </tr>
                <tr>
                    <td align="center">Check-Out:</td>
                    <td> <input type="text" name="checkout" size="30" value="<%= Checkout%>"/></td>
                </tr>
            </table>
                      	
            
            </div>
            </div>
            </div>
            <p align="center">
            <button type="submit" class="btn btn-dark">Modifica linia</button>
        	</p>
        </form>
        <p align="center">
		<button type="button" onclick="location.href='index.html'"
			class="btn btn-info">
			<div>HomePage</div>
		</button>
            <br/>
    </body>
    <%
        rs.close();
        rs1.close();
        rs2.close();
        jb.disconnect();
    }
    catch(Exception e)
   {
   	 %> <script>
		alert("Nu ati selectat nimic.");
		location.replace("http://localhost:8080/Lazaroiu/modifica_Rezervare.jsp");
	 	</script>
		<%
   } 
    %>
</html>