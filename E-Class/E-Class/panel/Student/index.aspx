<%@ Page Title="" Language="C#" MasterPageFile="~/Panel/Dash.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="E_Class.Panel.Student.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCSS" runat="server">
    <style>
        .wizard .steps ul li {
            width: 20%;
        }

        .wizard .content {
            min-height: 100px;
        }

            .wizard .content > .body {
                width: 100%;
                height: auto;
                padding: 15px;
                position: absolute;
            }

            .wizard .content .body.current {
                position: relative;
            }


        section .card:hover {
            border: solid black 2px;
        }

        section .selected {
            background-color: #223dc773;
            z-index: 9999;
            color: black;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
    <div id="questions">
        <asp:Repeater ID="repQuestions" runat="server">
            <ItemTemplate>
                <h3>Soru</h3>
                <section>
                    <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                        <div class="col-auto ">
                            <img src="https://cdn.pixabay.com/photo/2017/08/30/01/05/milky-way-2695569_960_720.jpg" height="180">
                        </div>
                        <div class="col p-4 d-flex flex-column position-static">
                            <h5><%# Container.DataItem %></h5>
                        </div>
                    </div>
                    <div class="p-3">
                        <div class="row">
                            <div class="card w-50" data-letter="A">
                                <div class="row no-gutters">
                                    <div class="col-auto">
                                        <img src="https://cdn.pixabay.com/photo/2017/08/30/01/05/milky-way-2695569_960_720.jpg" height="180">
                                    </div>
                                    <div class="col">
                                        <div class="card-block px-2">
                                            <h5 class="card-title">A şıkkı</h5>
                                            <p class="card-text">4 Ayaklıdır.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card w-50" data-letter="B">
                                <div class="row no-gutters">
                                    <div class="col-auto">
                                        <img src="https://cdn.pixabay.com/photo/2017/08/30/01/05/milky-way-2695569_960_720.jpg" height="180">
                                    </div>
                                    <div class="col">
                                        <div class="card-block px-2">
                                            <h5 class="card-title">A şıkkı</h5>
                                            <p class="card-text">4 Ayaklıdır.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card w-50" data-letter="C">
                                <div class="row no-gutters">
                                    <div class="col-auto">
                                        <img src="https://cdn.pixabay.com/photo/2017/08/30/01/05/milky-way-2695569_960_720.jpg" height="180">
                                    </div>
                                    <div class="col">
                                        <div class="card-block px-2">
                                            <h5 class="card-title">A şıkkı</h5>
                                            <p class="card-text">4 Ayaklıdır.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card w-50" data-letter="D">
                                <div class="row no-gutters">
                                    <div class="col-auto">
                                        <img src="https://cdn.pixabay.com/photo/2017/08/30/01/05/milky-way-2695569_960_720.jpg" height="180">
                                    </div>
                                    <div class="col">
                                        <div class="card-block px-2">
                                            <h5 class="card-title">A şıkkı</h5>
                                            <p class="card-text">4 Ayaklıdır.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphScript" runat="server">
    <script>
        $("#questions").steps({
            headerTag: "h3",
            bodyTag: "section",
            transitionEffect: "slideLeft",
            autoFocus: true,
            labels: {
                current: "Bu soru:",
                pagination: "Sayfa",
                finish: "Bitir",
                next: "Sıradaki",
                previous: "Önceki",
                loading: "Yükleniyor ..."
            }
        });
        let selected = false,
            selectedValue;
        $('.card').click(function () {
            if (!$(this).hasClass('selected') && !selected) {
                $(this).addClass('selected');
                selected = true;
                console.log("Seçilen Şık " + $(this).data('letter'));
                console.log(selectedValue)
            }
            else {
                if ($(this).hasClass('selected')) {
                    $(this).removeClass('selected');
                    selected = false;
                }

            }

        })
    </script>
</asp:Content>
