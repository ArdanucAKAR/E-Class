﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="E_Class.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCSS" runat="server">
    <link rel="stylesheet" href="Content/sign.css" />
    <style>
        .bracket {
            width: 50%;
        }

        #inputPassword {
            margin-bottom: -1px;
            border-radius: 0px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
    <form class="form-signin" name="register">
        <img class="mb-4" src="https://getbootstrap.com/docs/4.4/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
        <h1 class="h3 mb-3 font-weight-normal">E-Class</h1>
        <label for="inputEmail" class="sr-only">E-Mail Adres</label>
        <input name="email" type="email" id="inputEmail" class="form-control" placeholder="E-Mail Adres" required autofocus>
        <label for="inputPassword" class="sr-only">Şifre</label>
        <input name="password" type="password" id="inputPassword" class="form-control" placeholder="Şifre" required>
        <label for="inputRepeatPassword" class="sr-only">Şifre Tekrar</label>
        <input name="repeatpassword" type="password" id="inputRepeatPassword" class="form-control mt-0" placeholder="Şifre Tekrar" required>
        <button class="btn btn-lg btn-success btn-block" type="submit">Kayıt Ol</button>
        <hr class="bracket" />
        <a href="Login.aspx" class="btn btn-lg btn-primary btn-block">Giriş Yap</a>
        <p class="mt-5 mb-3 text-muted">&copy; 2019</p>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphScript" runat="server">
    <script>
        $(document).ready(function () {
            $("body").addClass("text-center")
        }
        $(function () {
            $("form[name='register']").validate({
                rules: {
                    email: {
                        required: true,
                        email: true
                    },
                    password: {
                        required: true,
                        minlength: 5
                    },
                    repeatpassword: {
                        required: true,
                        equalTo: "#password"
                    }
                },
                messages: {
                    email: {
                        required: "Mail Boş Geçilemez",
                        email: "Girdiğiniz Mail Geçersiz"
                    },
                    password: {
                        required: "Şifre Boş Geçilemez",
                        minlength: "Şİfre En Az 5 Karakter Olmalı"
                    },
                    repeatpassword: {
                        required: "Şİfre Tekrar Boş Geçilemez",
                        equalTo: "Şifreler Uyuşmuyor"
                    }
                }
                //// Make sure the form is submitted to the destination defined
                //// in the "action" attribute of the form when valid
                //submitHandler: function (form) {
                //    form.submit();
                //}
            });
        });
    </script>
</asp:Content>
