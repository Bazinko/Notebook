<%--
  Created by IntelliJ IDEA.
  User: Jenejkee
  Date: 03.03.15
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<a href="http://localhost:8080/Output">Output</a><br/>
<a href="http://localhost:8080/First">First</a><br/>

<p>Выберите объем жесткого диска:</p>

<form action="http://localhost:8080/SecondTask.jsp" METHOD="post">
<select name="SelectHardDriveCapacity">
    <option value = "100">100</option>
    <option value = "120">120</option>
    <option value = "200">200</option>
    <option value = "300">300</option>
    <option value = "500">500</option>
    <option value = "1000">1000</option>
</select>
<input type="submit" value="OK">
</form>

<a href="http://localhost:8080/Third">Third</a><br/>
<a href="http://localhost:8080/Fourth">Fourth</a><br/>

</body>
</html>
