<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 

<html> 

    <head> 

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 

        <title>Tabela Rezervari</title> 

        <link href="table.css" rel="stylesheet" type="text/css" media="screen" /> 
	    <link rel="stylesheet" href="style.css">
    </head> 

    <jsp:useBean id="jb" scope="session" class="db.JavaBean" /> 

    <jsp:setProperty name="jb" property="*" /> 

    <body> 

        <h1 align="center">Modifica Rezervarea</h1> 

        <br/> 

       

        <% 

            jb.connect(); 

            String nume_hotel, adresa, numar_stele, spatii_cazare, tip_camera, dotari, numar_camera, data_rezervare, suma_rezervare, perioada_rezervata; 

 

            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey")); 

            ResultSet rs = jb.intoarceRezervareId(aux); 

            rs.first(); 

            int id1 = rs.getInt("idhotel_r"); 

            int id2 = rs.getInt("idcamera_r"); 

 

            nume_hotel = rs.getString("nume_hotel"); 

            adresa = rs.getString("adresa"); 

            numar_stele = rs.getString("numar_stele"); 

            spatii_cazare = rs.getString("spatii_cazare"); 

            tip_camera = rs.getString("tip_camera"); 

            dotari = rs.getString("dotari"); 
            
            numar_camera = rs.getString("numar_camera"); 

            data_rezervare = rs.getString("data_rezervare"); 

            suma_rezervare = rs.getString("suma_rezervare"); 

            perioada_rezervata = rs.getString("perioada_rezervata"); 

 

            ResultSet rs1 = jb.vedeTabela("hoteluri"); 

            ResultSet rs2 = jb.vedeTabela("camere"); 

            int idhotel, idcamera; 

 

 

        %> 

        <form action="m2_Rezervare.jsp" method="post"> 

            <table align="center"> 

                <tr> 

                    <td align="right">IdRezervare:</td> 

                    <td> <input type="text" name="idrezervare" size="30" value="<%= aux%>" readonly/></td> 

                </tr> 

                <tr> 

                    <td align="right">idhotel:</td> 

                    <td>  

                        <SELECT NAME="idhotel"> 

                            <% 

                                while (rs1.next()) { 

                                    idhotel = rs1.getInt("idhotel"); 

                                    nume_hotel = rs1.getString("nume_hotel"); 

                                    adresa = rs1.getString("adresa"); 

                                    numar_stele = rs1.getString("numar_stele");
                                    
                                   spatii_cazare = rs1.getString("spatii_cazare");

                                    if (idhotel != id1) { 

                            %> 

                            <OPTION VALUE="<%= idhotel%>"><%= idhotel%>, <%= nume_hotel%>, <%= adresa%>, <%= numar_stele%>, <%= spatii_cazare%></OPTION> 

                                <% 

                                        } else { 

                                %>                 

                            <OPTION selected="yes" VALUE="<%= idhotel%>"><%= idhotel%>, <%= nume_hotel%>, <%= adresa%>, <%= numar_stele%>, <%= spatii_cazare%></OPTION>

                                <% 

                                        } 

                                    } 

                                %> 

                        </SELECT> 

 

                    </td> 

                </tr> 

                <tr> 

                    <td align="right">idcamera:</td> 

                    <td>  

                        <SELECT NAME="idcamera"> 

                            <% 

                                while (rs2.next()) { 

                                    idcamera = rs2.getInt("idcamera"); 

                                    tip_camera = rs2.getString("tip_camera"); 

                                    dotari = rs2.getString("dotari"); 

                                    numar_camera = rs2.getString("numar_camera"); 

                            if (idcamera != id2) { 

                            %> 

                            <OPTION VALUE="<%= idcamera%>"><%= idcamera%>, <%= tip_camera%>, <%= dotari%>, <%= numar_camera%></OPTION> 

                                <% 

                                        } else { 

                                %>                 

                            <OPTION selected="yes" VALUE="<%= idcamera%>"><%= idcamera%>, <%= tip_camera%>, <%= dotari%>, <%= numar_camera%></OPTION> 

                                <% 

                                        } 

                                    } 

                                %> 

                        </SELECT> 

 

                    </td> 

                </tr> 

                <tr> 

                    <td align="right">Data Rezervare:</td> 

                    <td> <input type="text" name="data_rezervare" size="30" value="<%= data_rezervare%>"/></td> 

                </tr> 

                <tr> 

                    <td align="right">Suma Rezervare:</td> 

                    <td> <input type="text" name="suma_rezervare" size="30" value="<%= suma_rezervare%>"/></td> 

                </tr> 

                <tr> 

                    <td align="right">Perioada rezervata:</td> 

                    <td> <input type="text" name="perioada_rezervata" size="30" value="<%= perioada_rezervata%>"/></td> 

                </tr> 

            </table><p align="center"> 

                <input type="submit" value="Modifica linia"> 

            </p> 

        </form> 

        <p align="center"> 

            <a href="index.html"><b>Home</b></a> 
            </p>

            <br/> 

    </body> 

    <% 

        rs.close(); 

        rs1.close(); 

        rs2.close(); 

        jb.disconnect(); 

    %> 

</html> 