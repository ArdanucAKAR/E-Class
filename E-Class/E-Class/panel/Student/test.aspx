<%@ Page Title="" Language="C#" MasterPageFile="~/panel/Dash.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="E_Class.panel.Student.test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCSS" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
    <form runat="server">
        <div class="form-row">
            <div class="form-group col-md-12">
                <label>Testler</label>
                <asp:DropDownList ID="ddlTest" runat="server" CssClass="form-control" onchange="getStatistics()"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ErrorMessage="Test Boş Geçilemez" ControlToValidate="ddlTest" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
        </div>
    </form>
    <canvas id="bar-chart" height="250"></canvas>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphScript" runat="server">
    <script src="../../Scripts/Chart.min.js"></script>
    <script>
        var linechart;
        getStatistics();
        function getStatistics() {
            if (linechart !== undefined)
                linechart.destroy();
            var ctx = $("#bar-chart");
            var chartOptions = {
                elements: {
                    rectangle: {
                        borderWidth: 2,
                        borderColor: 'rgb(0, 255, 0)',
                        borderSkipped: 'left'
                    }
                },
                responsive: true,
                responsiveAnimationDuration: 500,
                legend: {
                    position: 'bottom',
                },
                scales: {
                    xAxes: [{
                        display: true,
                        gridLines: {
                            color: "#f3f3f3",
                            drawTicks: true,
                        },
                        scaleLabel: {
                            display: true,
                        }
                    }],
                    yAxes: [{
                        display: true,
                        ticks: {
                            beginAtZero: true
                        },
                        gridLines: {
                            color: "#f3f3f3",
                            drawTicks: true,
                        },
                        scaleLabel: {
                            display: true,
                        }
                    }]
                },
                title: {
                    display: true,
                    text: ''
                }
            };
            var chartData = {
                datasets: [
                    {
                        label: "Güneş Sistemi",
                        data: [Math.floor(Math.random() * 4)],
                        backgroundColor: "#173E5F",
                        hoverBackgroundColor: "rgba(2, 24, 43, 1)",
                        borderColor: "transparent"
                    },
                    {
                        label: "Güneş ve Ay Tutulmaları",
                        data: [Math.floor(Math.random() * 4)],
                        backgroundColor: "#20639B",
                        hoverBackgroundColor: "rgba(6, 58, 101, 1)",
                        borderColor: "transparent"
                    },
                    {
                        label: "Destek ve Hareket Sistemi",
                        data: [Math.floor(Math.random() * 4)],
                        backgroundColor: "#3CAEA2",
                        hoverBackgroundColor: "rgba(9, 132, 119, 1)",
                        borderColor: "transparent"
                    },
                    {
                        label: "Sindirim Sistemi",
                        data: [Math.floor(Math.random() * 4)],
                        backgroundColor: "#F6D55C",
                        hoverBackgroundColor: "rgba(181, 148, 25, 1)",
                        borderColor: "transparent"
                    },
                    {
                        label: "Dolaşım Sistemi",
                        data: [Math.floor(Math.random() * 4)],
                        backgroundColor: "#ED573B",
                        hoverBackgroundColor: "rgba(165, 31, 6, 1)",
                        borderColor: "transparent"
                    },
                    {
                        label: "Solunum Sistemi",
                        data: [Math.floor(Math.random() * 4)],
                        backgroundColor: "#173E5F",
                        hoverBackgroundColor: "rgba(2, 24, 43, 1)",
                        borderColor: "transparent"
                    },
                    {
                        label: "Boşaltım Sistemi",
                        data: [Math.floor(Math.random() * 4)],
                        backgroundColor: "#20639B",
                        hoverBackgroundColor: "rgba(6, 58, 101, 1)",
                        borderColor: "transparent"
                    },
                    {
                        label: "Bileşke Kuvvet",
                        data: [Math.floor(Math.random() * 4)],
                        backgroundColor: "#3CAEA2",
                        hoverBackgroundColor: "rgba(9, 132, 119, 1)",
                        borderColor: "transparent"
                    },
                    {
                        label: "Sabit Süratli Hareket",
                        data: [Math.floor(Math.random() * 4)],
                        backgroundColor: "#F6D55C",
                        hoverBackgroundColor: "rgba(181, 148, 25, 1)",
                        borderColor: "transparent"
                    },
                    {
                        label: "Maddenin Tanecikli Yapısı",
                        data: [Math.floor(Math.random() * 4)],
                        backgroundColor: "#ED573B",
                        hoverBackgroundColor: "rgba(165, 31, 6, 1)",
                        borderColor: "transparent"
                    },
                    {
                        label: "Yoğunluk",
                        data: [Math.floor(Math.random() * 4)],
                        backgroundColor: "#173E5F",
                        hoverBackgroundColor: "rgba(2, 24, 43, 1)",
                        borderColor: "transparent"
                    },
                    {
                        label: "Madde ve Isı",
                        data: [Math.floor(Math.random() * 4)],
                        backgroundColor: "#20639B",
                        hoverBackgroundColor: "rgba(6, 58, 101, 1)",
                        borderColor: "transparent"
                    },
                    {
                        label: "Yakıtlar",
                        data: [Math.floor(Math.random() * 4)],
                        backgroundColor: "#3CAEA2",
                        hoverBackgroundColor: "rgba(9, 132, 119, 1)",
                        borderColor: "transparent"
                    },
                    {
                        label: "Sesin Yayılması",
                        data: [Math.floor(Math.random() * 4)],
                        backgroundColor: "#F6D55C",
                        hoverBackgroundColor: "rgba(181, 148, 25, 1)",
                        borderColor: "transparent"
                    },
                    {
                        label: "Sesin Farklı Ortamlarda Farklı Duyulması",
                        data: [Math.floor(Math.random() * 4)],
                        backgroundColor: "#ED573B",
                        hoverBackgroundColor: "rgba(165, 31, 6, 1)",
                        borderColor: "transparent"
                    },
                    {
                        label: "Sesin Sürati",
                        data: [Math.floor(Math.random() * 4)],
                        backgroundColor: "#173E5F",
                        hoverBackgroundColor: "rgba(2, 24, 43, 1)",
                        borderColor: "transparent"
                    },
                    {
                        label: "Sesin Maddeyle Etkileşmesi",
                        data: [Math.floor(Math.random() * 4)],
                        backgroundColor: "#20639B",
                        hoverBackgroundColor: "rgba(6, 58, 101, 1)",
                        borderColor: "transparent"
                    },
                    {
                        label: "Denetleyici ve Düzenleyici Sistemler",
                        data: [Math.floor(Math.random() * 4)],
                        backgroundColor: "#3CAEA2",
                        hoverBackgroundColor: "rgba(9, 132, 119, 1)",
                        borderColor: "transparent"
                    },
                    {
                        label: "Duyu Organları",
                        data: [Math.floor(Math.random() * 4)],
                        backgroundColor: "#F6D55C",
                        hoverBackgroundColor: "rgba(181, 148, 25, 1)",
                        borderColor: "transparent"
                    },
                    {
                        label: "Sistemlerin Sağlığı",
                        data: [Math.floor(Math.random() * 4)],
                        backgroundColor: "#ED573B",
                        hoverBackgroundColor: "rgba(165, 31, 6, 1)",
                        borderColor: "transparent"
                    },
                ]
            };
            var config = {
                type: 'bar',
                options: chartOptions,
                data: chartData
            };
            linechart = new Chart(ctx, config);
            linechart.update();
        }
    </script>
</asp:Content>
