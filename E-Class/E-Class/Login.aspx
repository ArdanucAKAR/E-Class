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
    <form class="form-signin">
        <img class="mb-4" src="https://getbootstrap.com/docs/4.4/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
        <h1 class="h3 mb-3 font-weight-normal">E-Class</h1>
        <label for="inputEmail" class="sr-only">E-Mail Adres</label>
        <input type="email" id="inputEmail" class="form-control" placeholder="E-Mail Adres" required autofocus>
        <label for="inputPassword" class="sr-only">Şifre</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="Şifre" required>
        <button class="btn btn-lg btn-success btn-block" type="submit">Giriş</button>
        <hr class="bracket" />
        <a href="Register.aspx" class="btn btn-lg btn-primary btn-block">Kayıt Ol</a>
        <p class="mt-5 mb-3 text-muted">&copy; 2019</p>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphScript" runat="server">
    <script>
        $(document).ready(function () {
            $("body").addClass("text-center")
        })
    </script>
</asp:Content>
