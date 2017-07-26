<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yyh
  Date: 2017/7/15
  Time: 19:28
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% session.setAttribute("project_path",request.getContextPath());%>
<html>
<head>
    <title>用户列表</title>
    <script src="${project_path}/res/js/jquery.min.js"></script>

    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>ssm_crud</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 col-md-offset-8" >
            <button class="btn btn-info">增加</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <td>id</td>
                    <td>user_name</td>
                    <td>sex</td>
                    <td>email</td>
                    <td>team_id</td>
                    <td>team_name</td>
                    <td>操作</td>
                </tr>
                <c:forEach items="${pageinfo.list}" var="user">
                    <tr>
                        <td>${user.userId}</td>
                        <td>${user.userName}</td>
                        <td>${user.sex}</td>
                        <td>${user.email}</td>
                        <td>${user.team.teamId}</td>
                        <td>${user.team.teamName}</td>
                        <td>
                            <button class="btn btn-info btn-sm">
                                <span class="glyphicon glyphicon-pencil"></span> 编辑
                            </button>
                            <button class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash"></span> 删除
                            </button>
                        </td>
                    </tr>
                </c:forEach>

            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            当前第${pageinfo.pageNum}页，共${pageinfo.pages}页，总${pageinfo.total}条记录
        </div>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <c:if test="${pageinfo.pageNum==1}">
                        <li  class="disabled"><a href="#">首页</a></li>
                        <li  class="disabled">
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${pageinfo.pageNum!=1}">
                        <li><a href="${project_path}/list?pn=1">首页</a></li>
                        <li>
                            <a href="${project_path}/list?pn=${pageinfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach items="${pageinfo.navigatepageNums}" var="page_num">
                        <c:if test="${pageinfo.pageNum.equals(page_num)}">
                            <li class="active"><a href="#">${page_num}</a></li>
                        </c:if>
                        <c:if test="${!pageinfo.pageNum.equals(page_num)}">
                            <li><a href="${project_path}/list?pn=${page_num}">${page_num}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageinfo.pageNum==pageinfo.pages}">
                        <li   class="disabled">
                            <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                        <li  class="disabled"><a href="#">尾页</a></li>
                    </c:if>
                    <c:if test="${pageinfo.pageNum!=pageinfo.pages}">
                        <li>
                            <a href="${project_path}/list?pn=${pageinfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                        <li><a href="${project_path}/list?pn=${pageinfo.pages}">尾页</a></li>
                    </c:if>

                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>
