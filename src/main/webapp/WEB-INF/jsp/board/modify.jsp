<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <link href="/resources/css/board.css" rel="stylesheet">
    <link rel="stylesheet" href="/webjars/bootstrap/4.3.1/dist/css/bootstrap.min.css">

    <script src="/webjars/jquery/3.4.1/dist/jquery.min.js"></script>

    <script src="/webjars/bootstrap/4.3.1/dist/js/bootstrap.bundle.js"></script>
</head>
<body>
    <%@include file="../include/header.jsp"%>

    <div class="container">
        <div class="row">
            <div class="col">
                <form action="/board/modify" method="post">
                    <input type="hidden" name="bid" value="${boardDto.bid}"/>
                    <input type="hidden" name="viewCnt" value="${boardDto.viewCnt}"/>
                    <input type="hidden" name="replyCnt" value="${boardDto.replyCnt}"/>
                    <input type="hidden" name="writer" value="${boardDto.writer}"/>
<%--                    <input type="hidden" name="page" value="<c:out value="${cri.page}"/>">--%>
<%--                    <input type="hidden" name="type" value="<c:out value="${cri.type}"/>">--%>
<%--                    <input type="hidden" name="keyword" value="<c:out value="${cri.keyword}"/>">--%>

                    <div class="form-group">
                        <select class="custom-select col-4" name="btype">
                            <option value="">카테고리</option>
                            <option value="기프티콘">기프티콘</option>
                            <option value="디지털">디지털/가전</option>
                            <option value="생활">생활</option>
                            <option value="기타">기타</option>
                        </select>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-9">
                            <input type="text" class="form-control" name="title" value="${boardDto.title}">
                        </div>
                        <div class="form-group input-group col-3">
                            <div class="input-group-prepend">
                                <span class="input-price-text">&#8361;</span>
                            </div>
                            <input type="text" class="form-control" name="price" value="${boardDto.price}">
                        </div>
                    </div>
                    <div class="form-group">
                        <textarea class="form-control" name="content" rows="10">${boardDto.content}</textarea>
                    </div>
                </form>
            </div>

        </div>

        <!-- 사진 업로드 -->
        <div class="row mb-3">
            <div class="col">
                <div class="image-frame">
                    <div class="file-head">
                        <span class="h5 font-weight-bold">사진</span>
                        <span class="h6 text-muted">(최대 10장 까지 가능하며 총 50MB까지 가능합니다.)</span>
                        <label class="uploadDiv" for="input-img-icon">
                            <img class="uploadimg" src="/resources/image/plus.png"/>
                        </label>
                        <input id="input-img-icon" class="input-image" type="file" name="uploadFile" onclick="this.value=null;" multiple>

                    </div>

                    <div class="file-body">
                        <div class="uploadResult">
                            <ul>

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div>
            <button class="btn btn-outline-dark btn-submit" data-oper="modify" type="submit">수정</button>
            <button class="btn btn-dark float-right" data-oper="list" type="submit">목록</button>
        </div>
    </div>

    <script type="text/javascript" src="/resources/js/fileupload.js"></script>
    <script>
        $(document).ready(function(){
            var formObj = $("form");
            var btype = "<c:out value="${boardDto.btype}"/>";

            $(".custom-select option[value='" + btype + "']").attr('selected', 'selected')

            $("button").on("click", function(e){
                e.preventDefault();

                var operation = $(this).data("oper");

                if(operation === "list"){
                    formObj.attr("action", "/board").attr("method", "get");

                    var pageTag = $("input[name='page']").clone();
                    var typeTag = $("input[name='type']").clone();
                    var keywordTag = $("input[name='keyword']").clone();

                    formObj.append(pageTag);
                    formObj.append(typeTag);
                    formObj.append(keywordTag);
                }else if (operation === 'modify'){
                    var str = "";

                    $(".uploadResult ul li").each(function (i, obj) {
                        var jobj = $(obj);

                        str += "<input type='hidden' name='boardFileList[" + i + "].fid' value='" + jobj.data("fid") + "'>";
                        str += "<input type='hidden' name='boardFileList[" + i + "].fileName' value='" + jobj.data("filename") + "'>";
                        str += "<input type='hidden' name='boardFileList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
                        str += "<input type='hidden' name='boardFileList[" + i + "].uploadPath' value='" + jobj.data("path") + "'>";
                        str += "<input type='hidden' name='boardFileList[" + i + "].image' value='" + jobj.data("type") + "'>";
                    });
                    formObj.append(str).submit();
                }
                formObj.submit();
            });

            var bidValue = "<c:out value="${boardDto.bid}"/>";

            $.getJSON("/board/getFileList", {bid: bidValue}, function (arr) {
                var str = "";

                $(arr).each(function (i, file) {
                    if (file.image){
                        var fileCallPath = encodeURIComponent(file.uploadPath + "/s_" + file.uuid + "_" + file.fileName);

                        str += "<li data-fid='" + file.fid + "' data-path='" + file.uploadPath + "' data-uuid='" + file.uuid + "' data-fileName='" + file.fileName + "' data-type='" + file.image + "'>";
                        str += "<img class='img-thumbnail' src='/display?fileName=" + fileCallPath + "'>";
                        str += "<input class='del-image' type='button' data-file=\'" + fileCallPath + "\' data-type='image'/>";
                        str += "</li>"
                    }
                });
                $(".uploadResult ul").html(str);
            });

            $(".uploadResult").on("click", "button", function (e) {
                if (confirm("사진을 삭제하시겠습니까?")){
                    var targetLi = $(this).closest("li");
                    targetLi.remove();
                }
            });

            $("body").on({
                mouseenter: function () {
                    $(this).closest("li").css("border", "1px solid red");
                },
                mouseleave: function () {
                    $(this).closest("li").css("border", "none");
                }
            }, ".del-image");
        });
    </script>
</body>
</html>