<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/webjars/bootstrap/4.3.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/myinfo.css">

<script src="/webjars/jquery/3.4.1/dist/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.3.1/dist/js/bootstrap.bundle.js"></script>


<!------ Include the above in your HEAD tag ---------->

<head>
    <title>내정보</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="/resources/js/mail.js"></script>
    <script type="text/javascript" src="/resources/js/user.js"></script>
</head>

<body>
<%@include file="../include/header.jsp"%>
<hr>
<sec:authentication property="principal.user" var="userinfo"/>
<c:set var="provider" value="${userinfo.provider}"/>
    <div class="container">
        <div class="row">
            <div class="col-sm-10"><h1>내정보</h1></div>
        </div>
        <div class="row">
            <div class="col-sm-3"><!--left col-->

                <div class="profile-image">

                </div></hr><br>


                <div class="panel panel-default">
                    <div class="panel-heading">Website <i class="fa fa-link fa-1x"></i></div>
                    <div class="panel-body"><a href="/">giveandtake.com</a></div>
                </div>


                <ul class="list-group">
                    <li class="list-group-item text-muted">Activity <i class="fa fa-dashboard fa-1x"></i></li>
                    <li class="list-group-item text-right"><span class="pull-left"><strong>Shares</strong></span> 125</li>
                    <li class="list-group-item text-right"><span class="pull-left"><strong>Likes</strong></span> 13</li>
                    <li class="list-group-item text-right"><span class="pull-left"><strong>Posts</strong></span> 37</li>
                </ul>


            </div><!--/col-3-->
            <div class="col-sm-9">
                <ul class="nav nav-tabs">
                    <li class="nav-item"><a  class="nav-link active" data-toggle="tab" href="#home">내정보</a></li>
                    <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#email">이메일 인증</a></li>
                    <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#withdrawal">회원탈퇴</a></li>
                </ul>



                <!--------------------------------------내정보---------------------------------------------------->
                <div class="tab-content">
                    <div class="tab-pane active" id="home">
                        <hr>
                            <div class="form-group">

                                <div class="col-xs-6">
                                    <h4>ID</h4>
                                    <input type="text" class="form-control" name="username" value="${userinfo.username}" readonly="readonly" placeholder="ID">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-6">
                                    <h4>NAME</h4>
                                    <input type="text" class="form-control" name="name" value="${userinfo.name}" readonly="readonly" placeholder="NAME" title="enter your last name if any.">
                                </div>
                            </div>

                            <div class="form-group">

                                <div class="col-xs-6">
                                    <h4>NICKNAME</h4>
                                    <input type="text" class="form-control" name="nickname" value="${userinfo.nickname}" readonly="readonly" placeholder="NICKNAME" title="enter your first name if any.">
                                </div>
                            </div>

                            <div class="form-group">

                                <div class="col-xs-6">
                                    <h4>EMAIL</h4>
                                    <input type="text" class="form-control" name="email" value="${userinfo.email}" readonly="readonly" placeholder="enter phone" title="enter your phone number if any.">
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-6">
                                    <h4>PHONE NUMBER</h4>
                                    <input type="text" class="form-control" name="phone" value="${userinfo.phone}" readonly="readonly" placeholder="enter mobile number" title="enter your mobile number if any.">
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-12">
                                    <br>
                                    <input class="btn btn-primary btn-sm" type="button" value="회원정보수정" onClick="self.location='/user/modifyuser';">
                                    <input class="btn btn-primary btn-sm" type="button" value="홈으로 이동" onClick="self.location='/';">
                                </div>
                            </div>
                        </form>
                    </div>

                <!--------------------------------------이메일인증---------------------------------------------------->
                <div class="tab-pane" id="email">
                        <sec:authorize access="hasAnyRole('GUEST','SOCIAL')">
                        <br>
                        <br>
                        <h6>이메일 인증 (이메일인증을 받으시면 보다 나은 서비스를 이용할 수 있습니다.)</h6>
                        <br> <br>
                            <div class="authEmail">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <button type="submit"><img class="btn-img" src="/resources/image/mail.png"></button>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <c:set var="mail" value="${userinfo.email}"/>
                                <div class="col-sm-5">
                                        <c:if test = "${mail eq null}">
                                            <input type="text" class="form-control" id="e_mail" name="email" placeholder="이메일을 입력해주세요" >
                                        </c:if>
                                        <c:if test = "${mail ne null}">
                                            <input type="text" class="form-control" id="e_mail" name="email" value="${userinfo.email}" readonly="readonly" >
                                        </c:if>
                                </div>
                                <div class="col-sm-4">
                                    <button class="btn btn-danger btn-sm" id="checkbtn" type="submit">중복 확인</button>
                                    <button class="btn btn-danger btn-sm" id="auth" type="submit" disabled="disabled">이메일 전송</button>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-5">
                                    <div class="alert" id="email_check"></div><br>
                                </div>
                            </div>

                            <br><br>
                            <div class="row" id="codex">

                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" id="code" placeholder = "인증번호" >
                                    </div>
                                    <div class="col-sm-4">
                                        <button class="btn btn-primary btn-sm" id="confirm" type="submit">인증번호 확인</button>
                                    </div>
                            </div>

                        </sec:authorize>


                        <sec:authorize access="hasAnyRole('ADMIN', 'USER')">
                        <br>
                        <br>
                            <h6>이메일 인증 완료</h6>
                            <input class="form-control" type="text" value="${userinfo.email}" readonly="readonly" required><br>

                        </sec:authorize>
                </div>
                <!-------------------------------------- 회원탈퇴 ---------------------------------------------------->
                    <div class="tab-pane" id="withdrawal">
                        <c:if test = "${provider eq 'giveandtake'}">
                            <form action="/user/delete" method="post">

                                <div class="form-group">
                                    <br><br><br>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <h4>PASSWORD</h4>
                                        </div>
                                        <div class="col-md-6">
                                            <h4>CONFIRM PASSWORD</h4>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <input type="password" class="form-control" name="password" id="pwd1" placeholder="비밀번호">
                                        </div>
                                        <div class="col-md-6">
                                            <input type="password" class="form-control" name="password2" id="pwd2" placeholder="비밀번호 확인">
                                        </div>
                                    </div>
                                    <div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
                                    <div class="alert alert-danger" id="alert-danger">비밀번호확인이 필요합니다. 비밀번호가 일치하지 않습니다.</div>
                                    <p>${valid_password}</p>
                                </div>

                                <button class="btn btn-danger btn-sm" id="submit" type="submit">회원탈퇴</button>
                            </form>
                        </c:if>
                    <%--social 회원 탈퇴 --%>
                        <c:forEach items="${socialList}" var="social">
                            <c:if test = "${provider eq social}">
                                <form action="/user/socialdelete" method="post">
                                    <div class="form-group">
                                        ${social}
                                        소셜회원 탈퇴
                                        보안문자 입력 구현예정
                                    </div>

                                    <button class="btn btn-danger btn-sm"  type="submit">회원탈퇴</button>
                                </form>
                            </c:if>
                        </c:forEach>
                    </div><!--/회원 탈퇴-->

                </div><!--/tab-content-->

        </div><!--/col-9-->
    </div><!--/row-->
<script>
    $(document).ready(function() {
        var profileImage = "<c:out value="${userinfo.profileImage}"/>";
        var profile = $(".profile-image");
        if (profileImage === ""){
            profile.html("<img class='img-thumbnail' src='/resources/image/profile.png'/>")
        }
        else{
            profile.html("<img class='img-thumbnail' src='/display?fileName=${userinfo.id}/profile/${userinfo.profileImage}'/>")
        }
    });
    $("#auth").attr("disabled", true);


    $("#checkbtn").on("click", function () {
        var email = $("#e_mail").val();
        userService.checkEmail(email, function (data) {
            if (data) {
                $("#email_check").attr("class", "alert alert-danger");
                $("#email_check").html("중복된 이메일 입니다.");
                $("#auth").attr("disabled", "disabled");
                $("#email_check").show();
            }
            else {
                $("#email_check").attr("class", "alert alert-success");
                $("#email_check").html("사용 가능한 이메일 입니다.");
                $("#auth").removeAttr("disabled");
            }
        });
    });

    $("#codex").hide();
    $('#auth').click(function(){
        var email = $('#e_mail').val();
        console.log(email);
        var e_mail = {
                email : email
            };

            $("#codex").show();
            mailService.sendEmail(e_mail, function (result) {
                if (result != "true"){
                    alert(result);
                }
                return;
            });
    });
    $('#confirm').click(function(){

        var email = $('#e_mail').val();
        var code = $('#code').val();
        var checking = {
            codekey : code,
            email : email
        };

        mailService.checkCode(checking, function (result) {
            if (result){
                    alert("계정이 활성화 되었습니다.");
                    location.href = "/user/info";
                    return;
            }
             else {
                 alert("인증번호가 틀렸습니다. 인증번호를 다시 확인해주세요");
                return;
            }

        });

    });

    $(function(){
        $("#alert-success").hide();
        $("#alert-danger").hide();
        $("input").keyup(function(){
            var pwd1=$("#pwd1").val(); var pwd2=$("#pwd2").val();
            if(pwd1 != "" || pwd2 != ""){
                if(pwd1 == pwd2){
                $("#alert-success").show();
                $("#alert-danger").hide();
                $("#submit").removeAttr("disabled"); }
            else{
                $("#alert-success").hide(); $("#alert-danger").show();
                $("#submit").attr("disabled", "disabled");
            }
            }
        });
    });

</script>
</body>
</html>