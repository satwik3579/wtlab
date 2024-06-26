<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<html>
    <head>
        <title>Create a Database using JSP</title>
    </head>

    <body>
        <h1>Create a Database using JSP</h1>

        <%  
            Connection connection;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306", "root", "root");

                Statement statement = connection.createStatement();
                String query = "CREATE DATABASE mydb";
                statement.executeUpdate(query);
                out.println("Database test created sucessfully.");
                
             // Connect to the newly created database
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306" + "mydb", "root", "root");
                statement = connection.createStatement();

            } 
            sql = "CREATE TABLE student " +
                    "(id INTEGER not NULL, " +
                    " name VARCHAR(255), " + 
                    " age INTEGER, " + 
                    " PRIMARY KEY ( id ))";
            stmt.executeUpdate(sql);
            System.out.println("Table created successfully...");
            
         // Insert values into table
            sql = "INSERT INTO student (id, name, age) " +
                    "VALUES (1, 'Alice', 20)";
            stmt.executeUpdate(sql);
            
            System.out.println("Inserted records into the table...");
            
            
            //showing data
            String sql = "SELECT * FROM student";
            ResultSet rs = statement.executeQuery(sql);

           while (rs.next()) {
               int id = rs.getInt("id");
               String name = rs.getString("name");
               int age = rs.getInt("age");
            %>
            <tr>
                <td><%= id %></td>
                <td><%= name %></td>
                <td><%= age %></td>
            </tr>
            <%
           }
            catch (Exception e) 
            {
                out.println("An error occurred.");
            }
        %>
       </body>
</html>
    
