﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="E_Class.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCSS" runat="server">
    <link rel="stylesheet" href="Content/sign.css" />
    <style>
        .bracket {
            width: 50%;
        }

        #password {
            margin-bottom: -1px;
            border-radius: 0px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
    <form class="form-signin" name="register" id="signinform">
        <img class="mb-4" src="https://lh3.googleusercontent.com/O5T0FGXUrqIcq1Y2hx72-yZVPbb8Um02pt_QyMP7ZSsC_uscP90fDbJSkOkZBUn3jCshq5KIek1NOd9FNhesRLX9VhdgKcEGM-eWbNkX-5VxzzDotPS3uZimTT2zyFKNrfjaEKSo" alt="" width="72" height="72">
        <h1 class="h3 mb-3 font-weight-normal">E-Class</h1>
        <label for="inputEmail" class="sr-only">E-Mail Adres</label>
        <input name="email" type="email" id="inputEmail"  maxlength="30"  class="form-control m-0" placeholder="E-Mail Adres" required autofocus>
        <label for="password" class="sr-only">Şifre</label>
        <input name="password" type="password" minlength="6" maxlength="30" id="password" class="form-control m-0" placeholder="Şifre" required>
        <label for="password_again" class="sr-only">Şifre Tekrar</label>
        <input name="password_again" type="password" minlength="6" maxlength="30" id="password_again" class="form-control m-0" placeholder="Şifre Tekrar" required>
        <button class="btn btn-lg btn-success btn-block mt-2" type="submit">Kayıt Ol</button>
        <hr class="bracket" />
        <a href="Login.aspx" class="btn btn-lg btn-primary btn-block">Giriş Yap</a>
        <p class="mt-5 mb-3 text-muted">&copy; 2019</p>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphScript" runat="server">
    <script>
        $(document).ready(function () {
            $("body").addClass("text-center")
            $('#signinform').validate({
                errorClass: 'm-0 mt-2 text-danger',
                rules: {
                    password: "required",
                    password_again: {
                        equalTo: "#password"
                    }
                },
                submitHandler: function () {
                    var data = JSON.stringify({
                        student: {
                            Email: $("input[type='email']").val(),
                            Password: $("input[type='password']").val()
                        }
                    });                    
                    $.ajax({
                        type: "POST",
                        url: "../../../WebService/AuthenticationServiceAPI.asmx/Register",
                        data: data,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (r) {                              
                            location.replace("/Panel/Student/index.aspx");
                        },
                        error: function (r) {
                            console.log(r.responseText);
                        },
                        failure: function (r) {
                            console.log(r.responseText);
                        }
                    });
                }
            })
        })       
    </script>
</asp:Content>
