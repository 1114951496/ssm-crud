<%--
  Created by IntelliJ IDEA.
  User: yangyonghao
  Date: 2017/7/16
  Time: 21:43
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% session.setAttribute("project_path", request.getContextPath());%>
<html>
<head>
    <title>用户列表</title>
    <script src="${project_path}/res/js/jquery.min.js"></script>

    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>

</head>
<body>

<!-- 用户添加 -->
<div id="addUserModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">添加用户</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">userName</label>
                        <div class="col-sm-10">
                            <input type="text" name="userName" class="form-control userName_input"
                                   id="save_userName_input" placeholder="userName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control email_input" id="save_email_input"
                                   placeholder="email@mk95.cn">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">sex</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="sex" class="sex_m" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="sex" class="sex_f" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">team</label>
                        <div class="col-sm-4">
                            <select name="teamId" class="form-control team_list">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="user_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 用户更新-->
<div id="updateUserModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">编辑用户</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">userName</label>
                        <div class="col-sm-10">
                            <p type="text" name="userName" id="edit_userName"
                               class="form-control-static userName_input">
                                <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" id="edit_email" class="form-control email_input"
                                   placeholder="email@mk95.cn">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">sex</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="sex" class="sex_m" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="sex" class="sex_f" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">team</label>
                        <div class="col-sm-4">
                            <select name="teamId" class="form-control team_list">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="user_update_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>ssm_crud</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-info" id="addUser">增加</button>
            <button class="btn btn-danger" id="delAll">删除</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <thead>
                <tr>
                    <td><input type="checkbox" id="check_all"></td>
                    <td>id</td>
                    <td>user_name</td>
                    <td>sex</td>
                    <td>email</td>
                    <td>team_id</td>
                    <td>team_name</td>
                    <td>操作</td>
                </tr>
                </thead>
                <tbody id="list">

                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            当前第<span id="pageNum"></span>页，共<span id="pages"></span>页，总<span id="total"></span>条记录
        </div>
        <div class="col-md-6" id="nav_page">

        </div>
    </div>

    <script>
        var totalRecord, currentPage;
        $(function () {
            to_page(1);
            //点击新增按钮弹出表单
            $("#addUser").click(function () {
                //发送ajax请求获取团队信息
                getTeams("#addUserModal .team_list");
                $("#addUserModal").modal({
                    backdrop: "true"
                })
            });
            //保存用户信息,jquery的serialize方法将form表单数据转为请求需要的字符串
            $("#user_save_btn").click(function () {
                //alert($("#addUserModal form").serialize()) ;
                //发送ajax请求前先验证用户名和邮箱
                if (!validate_user_input()) {
                    return false;
                }

                $.ajax({
                    url: "${project_path}/user",
                    type: "POST",
                    data: $("#addUserModal form").serialize(),
                    success: function (result) {
                        $('#addUserModal').modal('hide');
                        to_page(totalRecord);
                    },
                    error: function () {
                        $('#addUserModal').modal('hide');
                        alert("保存用户信息请求失败");
                    }
                })
            })
            //为编辑按钮添加事件
            $(document).on("click", ".edit_user_btn", function () {
                //发送ajax请求获取团队信息
                getTeams("#updateUserModal .team_list");
                getUser($(this).attr("edit_id"));
                $("#user_update_btn").attr("edit_id", $(this).attr("edit_id"));
                $("#updateUserModal").modal({
                    backdrop: "true"
                })
            })

            //为单个删除按钮添加事件
            $(document).on("click", ".del_user_btn", function () {
                var user_name = $(this).parents("tr").find("td:eq(2)").text();
                if (confirm("确认删除【" + user_name + "】?")) {
                    $.ajax({
                        url: "${project_path}/user/" + $(this).attr("del_id"),
                        type: "DELETE",
                        success: function (result) {
                            alert("删除成功！");
                            to_page(currentPage);
                        },
                        error: function () {
                            alert("删除失败！");
                        }
                    })
                }
            })
        });
        //回显用户信息
        function getUser(id) {
            $.ajax({
                url: "${project_path}/user/" + id,
                type: "GET",
                success: function (result) {
                    var userData = result.map.user;
                    $("#edit_userName").text(userData.userName);
                    $("#edit_email").val(userData.email);
                    $("#updateUserModal input[name=sex]").val([userData.sex]);
                    $("#updateUserModal select").val(userData.teamId);
                }
            })
        }
        //发送更新用户信息的请求
        $("#user_update_btn").click(function () {
            $.ajax({
                url: "${project_path}/user/" + $(this).attr("edit_id"),
                data: $("#updateUserModal form").serialize(),//使用post方式时末尾添加"&_method=PUT"标识为put请求
                type: "PUT",
                success: function () {
                    $("#updateUserModal").modal('hide');
                    alert("更新成功");
                    to_page(currentPage);
                }
            })
        })

        //校验添加用户表单
        function validate_user_input() {
            var userName_input = $("#save_userName_input").val();
            var email_input = $("#save_email_input").val();
            var userName_validate = /^[a-z0-9_-]{3,16}$/;
            var email_validate = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
            if (userName_validate.test(userName_input)) {
                show_validate_msg("#save_userName_input", "success", "");
            } else {
                show_validate_msg("#save_userName_input", "error", "由a-z0-9_-组成，3-16位");
                return false;
            }
            if (email_validate.test(email_input)) {
                show_validate_msg("#save_email_input", "success", "");
            } else {
                show_validate_msg("#save_email_input", "error", "邮箱格式错误");
                return false;
            }
            return true;
        }
        function show_validate_msg(id, status, msg) {
            $(id).parent().removeClass("has-success").removeClass("has-error");
            if (status == "success") {
                $(id).parent().addClass("has-success");
                $(id).next("span").text(msg);
            } else {
                $(id).parent().addClass("has-error");
                $(id).next("span").text(msg);
            }
        }

        //ajax请求团队信息
        function getTeams(ele) {
            $(ele).empty();
            $.ajax({
                url: "${project_path}/jsonTeamList",
                type: "GET",
                success: function (result) {
                    $.each(result.map.teams, function (index, item) {
                        var opt = $("<option></option>").append(item.teamName).attr("value", item.teamId);
                        $(ele).append(opt);
                    })
                }
            })
        }
        //ajax请求用户信息
        function to_page(pn) {
            $.ajax({
                url: "${project_path}/jsonUserList",
                data: "pn=" + pn,
                type: "GET",
                success: function (result) {
                    build_user_table(result);
                    build_page_nav(result);
                },
                error: function () {
                    alert("更新列表失败");
                }
            })
        };
        //表格内容组件
        function build_user_table(result) {
            totalRecord = result.map.pageinfo.total;
            $("#list").empty();//添加内容前先清空
            var user = result.map.pageinfo.list;
            $.each(user, function (index, item) {
                var checkbox = $("<td><input type='checkbox' class='check_item'></td>");
                var userIdTd = $("<td></td>").append(item.userId);
                var userNameTd = $("<td></td>").append(item.userName);
                var sexTd = $("<td></td>").append(item.sex);
                var emailTd = $("<td></td>").append(item.email);
                var teamIdTd = $("<td></td>").append(item.team.teamId);
                var teamNameTd = $("<td></td>").append(item.team.teamName);
                var edit = $("<button></button>").addClass("btn btn-info btn-sm edit_user_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                    .append(" 编辑");
                //使用自定义属性表示编辑按钮对应的用户id
                $(edit).attr("edit_id", item.userId);
                var del = $("<button></button>").addClass("btn btn-danger btn-sm del_user_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                    .append(" 删除");
                del.attr("del_id", item.userId);
                var funcTd = $("<td></td>").append(edit).append(" ").append(del);
                var list = $("<tr></tr>").append(checkbox).append(userIdTd).append(userNameTd).append(sexTd)
                    .append(emailTd).append(teamIdTd).append(teamNameTd).append(funcTd);
                $("#list").append(list);
            });
        }
        //页面导航组件
        function build_page_nav(result) {
            $("#pageNum").html(result.map.pageinfo.pageNum);
            $("#pages").html(result.map.pageinfo.pages);
            $("#total").html(result.map.pageinfo.total);
            $("#nav_page").empty();//添加内容前先清空
            var ul = $("<ul></ul>").addClass("pagination");
            var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
            var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href", "#"));
            if (!result.map.pageinfo.hasPreviousPage) {
                firstPageLi.addClass("disabled");
                prePageLi.addClass("disabled");
            } else {
                firstPageLi.click(function () {
                    to_page(1);
                });
                prePageLi.click(function () {
                    to_page(result.map.pageinfo.pageNum - 1);
                });
            }
            var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href", "#"));
            var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href", "#"));
            if (!result.map.pageinfo.hasNextPage) {
                nextPageLi.addClass("disabled");
                lastPageLi.addClass("disabled");
            } else {
                lastPageLi.click(function () {
                    to_page(result.map.pageinfo.pages);
                });
                nextPageLi.click(function () {
                    to_page(result.map.pageinfo.pageNum + 1);
                });
            }
            ul.append(firstPageLi).append(prePageLi);
            $.each(result.map.pageinfo.navigatepageNums, function (index, item) {
                var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href", "#"));
                if (item == result.map.pageinfo.pageNum) {
                    numLi.addClass("active");
                }
                numLi.click(function () {
                    to_page(item);
                });
                ul.append(numLi);
            })
            ul.append(nextPageLi).append(lastPageLi);
            $("#nav_page").append(ul);
            currentPage = result.map.pageinfo.pageNum;
        };

        //全选、全不选
        $(document).on("click", "#check_all", function () {
            $(".check_item").prop("checked", $("#check_all").prop("checked"));
        })
        $(document).on("click", ".check_item", function () {
            if ($(".check_item:checked").length == $(".check_item").length) {
                $("#check_all").prop("checked", true);
            } else {
                $("#check_all").prop("checked", false);
            }
        })
        $("#delAll").click(function () {
            var checkUserNames="", checkUserIds="";
            $.each($(".check_item:checked"), function () {
                checkUserNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
                checkUserIds += $(this).parents("tr").find("td:eq(1)").text() + "-";
            })
            var names=checkUserNames.substring(0,checkUserNames.length-1);
            if(confirm("确认删除【"+names+"】?")){
                $.ajax({
                    url: "${project_path}/user/" + checkUserIds.substring(0,checkUserNames.length-1),
                    type: "DELETE",
                    success: function (result) {
                        alert("删除成功！");
                        to_page(currentPage);
                    },
                    error: function () {
                        alert("删除失败！");
                    }
                })
            }
        })
    </script>
</div>
</body>
</html>

