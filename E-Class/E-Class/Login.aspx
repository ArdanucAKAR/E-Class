<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="E_Class.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCSS" runat="server">
    <link rel="stylesheet" href="Content/sign.css" />
    <style>
        .bracket {
            width: 50%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
    <form class="form-signin" id="loginForm">
        <img class="mb-4" src="https://lh3.googleusercontent.com/O5T0FGXUrqIcq1Y2hx72-yZVPbb8Um02pt_QyMP7ZSsC_uscP90fDbJSkOkZBUn3jCshq5KIek1NOd9FNhesRLX9VhdgKcEGM-eWbNkX-5VxzzDotPS3uZimTT2zyFKNrfjaEKSo" alt="" width="72" height="72">
        <h1 class="h3 mb-3 font-weight-normal">E-Class</h1>
        <label for="inputEmail" maxlength="30" class="sr-only">E-Mail Adres</label>
        <input type="email" id="inputEmail" class="form-control" placeholder="E-Mail Adres" required autofocus>
        <label for="inputPassword" class="sr-only">Şifre</label>
        <input type="password" minlength="6" id="inputPassword" class="form-control" placeholder="Şifre" required>
        <label for="userType" class="sr-only">Kullanıcı Tipi</label>
        <select class="form-control mb-2" id="userType">
            <option value="Student">Öğrenci</option>
            <option value="Teacher">Öğretmen</option>
        </select>
        <button class="btn btn-lg btn-success btn-block" type="submit">Giriş</button>
        <hr class="bracket" />
        <a href="Register.aspx" class="btn btn-lg btn-primary btn-block">Kayıt Ol</a>
        <p class="mt-5 mb-3 text-muted">&copy; 2019</p>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphScript" runat="server">
    <script src="<%= Page.ResolveUrl("~/") %>Scripts/jquery.cookie-1.4.1.min.js"></script>
    <script>
        $(document).ready(function () {
            $("body").addClass("text-center")
            $('#loginForm').validate({
                errorClass: 'm-0 mt-2 text-danger',
                submitHandler: function () {
                    if ($("#userType").val() == "Student") {
                        var data = JSON.stringify({
                            student: {
                                Email: $("input[type='email']").val(),
                                Password: $("input[type='password']").val()
                            }
                        });
                        $.ajax({
                            type: "POST",
                            url: "../../../WebService/AuthenticationServiceAPI.asmx/StudentLogin",
                            data: data,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (r) {
                                if (r.d != null) {
                                    location.replace("/Panel/Student/index.aspx");
                                }
                                else {
                                }
                            },
                            error: function (r) {
                                console.log(r.responseText);
                            },
                            failure: function (r) {
                                console.log(r.responseText);
                            }
                        });
                    }
                    else {
                        var data = JSON.stringify({
                            teacher: {
                                Email: $("input[type='email']").val(),
                                Password: $("input[type='password']").val()
                            }
                        });
                        $.ajax({
                            type: "POST",
                            url: "../../../WebService/AuthenticationServiceAPI.asmx/TeacherLogin",
                            data: data,
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (r) {
                                if (r.d != null) {
                                    location.replace("Panel/Teacher/index.aspx");
                                    $.cookie("Type","Teacher")
                                }
                                else {
                                }
                            },
                            error: function (r) {
                                console.log(r.responseText);
                            },
                            failure: function (r) {
                                console.log(r.responseText);
                            }
                        });
                    }
                }
            });
        })
    </script>
</asp:Content>
