<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<html>
<head>
    <title>������</title>

</head>
<body>

<h1>���� ����</h1>

    <label>�̸���</label> <input type="text" name="email" value="${userList.email }"><br>

    <label>��й�ȣ</label> <input type="text" name="password" value="${userList.password }"><br>

    <label>�ڵ�����ȣ</label> <input type="text" name="phone" value="${userList.phone}"><br>

    <label>�г���</label> <input type="text" name="nickname" value="${userList.nickname}"><br>

    <label>�̸�</label> <input type="text" name="nickname" value="${userList.username}"><br>

    <input type="submit" value="����">

    <input type="hidden" name="id" value="${user.id }">

</form>
</body>
</html>
