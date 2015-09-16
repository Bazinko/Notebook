<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title></title>
</head>
<body>

<%= request.getMethod() %>

<% try {

    if(request.getMethod().equalsIgnoreCase("post")) {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" +
                "Notebook", "root", "");

        PreparedStatement statement = con.prepareStatement("Select * from Notebooks WHERE HardDriveCapacity =" +
        request.getParameter("SelectHardDriveCapacity"));
        System.out.println(request.getParameter("SelectHardDriveCapacity"));
        @SuppressWarnings("unused")
        ResultSet result = statement.executeQuery();

    %>

<table border>
    <tr>
        <TH>id</TH>
        <TH>Объем ЖД(в гб)</TH>
        <TH>Объем ОП(в гб)</TH>
        <TH>Объем вдиеокарты(в гб)</TH>
        <TH>Диагональ</TH>
        <TH>Модель ноутбука</TH>
        <TH>Модель ЦП</TH>
        <TH>Частота ЦП</TH>
    </tr>
    <%while (result.next()) {%>
    <tr>
        <td><%=result.getString("Num")%></td>
        <td><%=result.getString("HardDriveCapacity")%></td>
        <td><%=result.getString("RamCapacity")%></td>
        <td><%=result.getString("GraphicCardCapacity")%></td>
        <td><%=result.getString("Monitor")%></td>
        <td><%=result.getString("Brand")%></td>
        <td><%=result.getString("CpuName")%></td>
        <td><%=result.getString("CpuFreq")%></td>
    </tr>
    <%}%>
</table>
<%}%>
<%}catch(Exception e){%>

<p>Ошибка!</p>
<%e.printStackTrace();}%>

</body>
</html>
