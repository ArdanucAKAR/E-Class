<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="E_Class.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCSS" runat="server">
    <link rel="stylesheet" href="Content/cover.css" />
    <style>
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
    <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
        <header class="masthead mb-auto">
            <div class="inner">
                <h3 class="masthead-brand">E-CLASS</h3>
                <nav class="nav nav-masthead justify-content-center">
                    <a class="nav-link" href="https://github.com/ArdanucAKAR/E-Class" target="_blank">GitHub</a>
                </nav>
            </div>
        </header>

        <main role="main" class="inner cover">
            <h1 class="cover-heading">E-CLASS</h1>
            <p class="lead">
                Deneyimli öğretmenlerimizin hazırladığı birbirinden farklı çok çeşitte soruları çözerek seviyenizi ölçün ve seviyenizi takip edin.
            </p>
            <p class="lead">
                <a href="Login.aspx" class="btn btn-lg btn-secondary">Başlayın</a>
            </p>
        </main>

        <footer class="mastfoot mt-auto">
            <div class="inner">
                <p><a href="https://github.com/ArdanucAKAR">Ardanuc AKAR</a> & <a href="https://github.com/volkankahraman">Volkan KAHRAMAN</a></p>
            </div>
        </footer>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphScript" runat="server">
    <script>
        $(document).ready(function () {
            $("body").addClass("text-center")
            $("header nav a").hover(function () {
                $(this).toggleClass("active")
            })
        })
    </script>
</asp:Content>
