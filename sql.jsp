<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*"%>
<%
java.sql.Connection conn;
java.lang.String strConn;
 
conn=null;
try{
Class.forName("org.gjt.mm.mysql.Driver").newInstance();
conn=java.sql.DriverManager.getConnection("JDBC:mysql://172.24.100.9/mall","dbuser","redhat");
}
catch(Exception e){
    System.out.println("连接错误");
    }
Statement stmt=conn.createStatement();
ResultSet RS_result=null;
%>
<html>
<head><title>JSP Page</title></head>
<body>
 
<%-- <jsp:useBean id="beanInstanceName" scope="session" class="beanPackage.BeanClassName" /> --%>
<%-- <jsp:getProperty name="beanInstanceName"  property="propertyName" /> --%>
<center>
Now time is: <%=new java.util.Date()%>
<hr>
<% out.println("这辆奔驰的价格是::::"); %>
<hr>
<%
RS_result=stmt.executeQuery("select * from car");
String Name;
while (RS_result.next()){
    Name=RS_result.getString("price");
%>
<font size=7 color=Red><%=Name%></font>
<%
}
RS_result.close();
stmt.close();
conn.close();
%>
</center>
</body>
</html>
