<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<html>
<head>
    <title>������</title>

</head>
<body>

<h1>���� ����</h1>
<sec:authentication property="principal" var="userinfo"/>
<label>�̸���</label> <input type="text" name="email" value="${userinfo.email}" readonly="readonly"><br>

<label>��й�ȣ</label> <input type="password" name="password" value="${userinfo.password}" readonly="readonly"><br>

<label>�̸�</label> <input type="text" name="name" value="${userinfo.name}" readonly="readonly"><br>

<label>ID</label> <input type="text" name="username" value="${userinfo.username}" readonly="readonly"><br>

<label>�ڵ�����ȣ</label> <input type="text" name="phone" value="${userinfo.phone}" readonly="readonly"><br>

<input type="button" value="ȸ����������" onClick="self.location='/user/modifyuser';">
<input type="button" value="ȸ��Ż��" onClick="self.location='/user/password';">
<input type="button" value="Ȩ���� �̵�" onClick="self.location='/';">
<input type="hidden" name="id" value="${userinfo.id}">

</form>
</body>
</html>
