<%-- 
    Document   : index.jsp
    Created on : Mar 25, 2023, 11:00:40 PM
    Author     : atul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
>
<form method="post">

<table border="2">
   <tr>
        
        <td>Name</td>
        <td> number</td>
        <td>  email</td>
   </tr>
   <%
   try
   {
       Class.forName("com.mysql.jdbc.Driver");
       String url="jdbc:mysql://localhost:3306/java";
                    
       String username="root";
       String password="";
       String query="select * from form";
       Connection conn=DriverManager.getConnection(url, username, password);
       Statement stmt=conn.createStatement();
       ResultSet rs=stmt.executeQuery(query);
       while(rs.next())
       {
        String name = rs.getString("name");
         String number = rs.getString("number"); 
         String email = rs.getString("email");
         
   %>
          
            <tr><td><%out.println(name); %></td>
           <td><%out.println(number); %></td>
           <td><%out.println(email); %></td></tr>

   <%
       }
   %>
   </table>
   <%
        rs.close();
        stmt.close();
        conn.close();
   }
   catch(Exception e)
   {
        e.printStackTrace();
   }
   %>
</form>`

    </body>
</html>
