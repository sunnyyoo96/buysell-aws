
<!DOCTYPE html>
<html lang="en" xmlns:sec="" xmlns:th="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>로그인 성공</title>
</head>
<body>
<h1>로그인 성공!!</h1>
<hr>
<p>
    <span sec:authentication="username"></span>님 환영합니다~
</p>
<a th:href="@{'/'}">쇼핑시작하기</a>
</body>
</html>