<%@ Page Title="" Language="C#" MasterPageFile="~/panel/Dash.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="E_Class.panel.Student.test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphCSS" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
    <form runat="server">
        <div class="form-row">
            <div class="form-group col-md-12">
                <label>Testler</label>
                <asp:DropDownList ID="ddlTest" runat="server" CssClass="form-control"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ErrorMessage="Test Boş Geçilemez" ControlToValidate="ddlTest" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
        </div>
    </form>
    <canvas id="bar-chart" height="400"></canvas>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphScript" runat="server">
    <script>
        var linechart;
        getStatistics('Today');
        function getStatistics(statisticsType) {
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
                maintainAspectRatio: false,
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
            var data = JSON.stringify({
                member: {
                    Id: MemberId
                },
                statisticsType: statisticsType
            });
            var statisticsTypes = [["Bugün", "Today"], ["Son 1 Hafta", "LastWeek"], ["Son 1 Ay", "LastMonth"], ["Son 6 Ay", "LastSixMonth"], ["Son 1 Sene", "LastYear"]];
            var labels, returnData;
            for (var a = 0; a < statisticsTypes.length; a++) {
                if (statisticsTypes[a][1] === statisticsType) {
                    labels = [statisticsTypes[a][0]];
                    break;
                }
            }
            $.ajax({
                type: "POST",
                url: "../../../AuthenticationService.asmx/GetStatistics",
                data: data,
                contentType: "application/json; charset=utf-8",
                async: false,
                dataType: "json",
                success: function (r) {
                    returnData = JSON.parse(r.d);
                    returnData = returnData["GetStatistics"];
                },
                error: function (r) {
                    console.log(r.responseText);
                },
                failure: function (r) {
                    console.log(r.responseText);
                }
            });
            var chartData = {
                labels: labels,
                datasets: [
                    {
                        label: "Birinci Kontrol Noktası",
                        data: [returnData[0].StageCount],
                        backgroundColor: "#173E5F",
                        hoverBackgroundColor: "rgba(2, 24, 43, 1)",
                        borderColor: "transparent"
                    },
                    {
                        label: "İkinci Kontrol Noktası",
                        data: [returnData[1].StageCount],
                        backgroundColor: "#20639B",
                        hoverBackgroundColor: "rgba(6, 58, 101, 1)",
                        borderColor: "transparent"
                    },
                    {
                        label: "Üçüncü Kontrol Noktası",
                        data: [returnData[2].StageCount],
                        backgroundColor: "#3CAEA2",
                        hoverBackgroundColor: "rgba(9, 132, 119, 1)",
                        borderColor: "transparent"
                    },
                    {
                        label: "Dördüncü Kontrol Noktası",
                        data: [returnData[3].StageCount],
                        backgroundColor: "#F6D55C",
                        hoverBackgroundColor: "rgba(181, 148, 25, 1)",
                        borderColor: "transparent"
                    },
                    {
                        label: "Öğrenildi",
                        data: [returnData[4].StageCount],
                        backgroundColor: "#ED573B",
                        hoverBackgroundColor: "rgba(165, 31, 6, 1)",
                        borderColor: "transparent"
                    }
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
