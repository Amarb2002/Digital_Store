<%@ page import="java.sql.*" %>
<%@ page import="Digi.DoorStep_DB" %>

<%
    DoorStep_DB db = new DoorStep_DB();
    int i = 10;
    int j = 10;
    int z = db.stm.executeUpdate("INSERT INTO cart VALUES (NULL, '" + i + "', '" + j + "')");
    if (z > 0) {
        out.print("Data inserted successfully!");
    } else {
        out.print("Data insertion failed!");
    }
%>
