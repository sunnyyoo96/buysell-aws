<%@ page import="com.example.giveandtake.model.entity.User" %>
<%@ page import="com.example.giveandtake.DTO.UserDTO" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<html>
<head>
    <title>������</title>

</head>
<body>
<div id = "wrap">
    <p>
        <input type="button" value="Ȩ���� �̵�" onClick="self.location='/';">

        <%
            // �α��� �ȵǾ��� ��� - �α���, ȸ������ ��ư�� �����ش�.
            if(session.getAttribute("email")==null){
        %>
        �α����� �Ǿ����� �ʽ��ϴ�.
        <input type="button" value="�α����Ϸ�����" onClick="self.location='/user/login';">
        <input type="button" value="ȸ������" onClick="self.location='/user/signup';">
        <input type="button" value="�α׾ƿ�" onClick="self.location='/user/logout';">
        <%
            // �α��� �Ǿ��� ��� - �α׾ƿ�, ������ ��ư�� �����ش�.
        }
            else{
        %>
        <input type="button" value="�α׾ƿ�" onClick="self.location='/user/logout';">
        <input type="button" value="������" onClick="self.location='/user/userdetail';">
        <%    }    %>


    </p>
</div>
</body>
</html>
