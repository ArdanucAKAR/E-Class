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

        [role=menu] li:first-child a {
            position: fixed;
            right: 105px;
            bottom: 11px;
        }

        [role=menu] li:nth-child(2) a, [role=menu] li:nth-child(3) a {
            position: fixed;
            right: 18px;
            bottom: 11px;
        }

        [role=menu] li:nth-child(3) a {
            padding: 0.5em 2em !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
    <form runat="server">
        <div class="form-row">
            <div class="form-group col-md-12">
                <label>Ders</label>
                <asp:DropDownList ID="ddlLessons" runat="server" CssClass="form-control"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ErrorMessage="Ders Boş Geçilemez" ControlToValidate="ddlLessons" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
        </div>
        <asp:Button ID="btnCreateTest" runat="server" Text="Başlat" CssClass="btn btn-primary" ClientIDMode="Static" OnClick="btnCreateTest_Click" />
    </form>
    <div id="questions">
        <asp:Repeater ID="repQuestions" runat="server">
            <ItemTemplate>
                <h3>Soru</h3>
                <section>
                    <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                        <%#
                            Eval("QuestionPath").ToString() != string.Empty ? "<div class='col-auto'><img src='/images/"+Eval("QuestionPath").ToString()+"'  height='180'/></div>" : ""                           
                        %>
                        <div class="col p-4 d-flex flex-column position-static">
                            <h5><%# Eval("Question") %></h5>
                        </div>
                    </div>
                    <div class="p-3">
                        <div class="row">
                            <div class="card w-50" data-letter="A" data-question="<%# Eval("QuestionID") %>" data-test="<%# Eval("TestID") %>">
                                <div class="row no-gutters">
                                    <%#
                                        Eval("APath").ToString() != string.Empty ? "<div class='col-auto'><img src='/images/"+Eval("APath").ToString()+"'  height='180'/></div>" : ""                           
                                    %>
                                    <div class="col">
                                        <div class="card-block p-2">
                                            <h5 class="card-title">A</h5>
                                            <p class="card-text"><%#Eval("A") %></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card w-50" data-letter="B" data-question="<%# Eval("QuestionID") %>" data-test="<%# Eval("TestID") %>">
                                <div class="row no-gutters">
                                    <%#
                                        Eval("BPath").ToString() != string.Empty ? "<div class='col-auto'><img src='/images/"+Eval("BPath").ToString()+"'  height='180'/></div>" : ""                           
                                    %>
                                    <div class="col">
                                        <div class="card-block p-2">
                                            <h5 class="card-title">B</h5>
                                            <p class="card-text"><%#Eval("B") %></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card w-50" data-letter="C" data-question="<%# Eval("QuestionID") %>" data-test="<%# Eval("TestID") %>">
                                <div class="row no-gutters">
                                    <%#
                                        Eval("CPath").ToString() != string.Empty ? "<div class='col-auto'><img src='/images/"+Eval("CPath").ToString()+"'  height='180'/></div>" : ""                           
                                    %>
                                    <div class="col">
                                        <div class="card-block p-2" data-question="<%# Eval("QuestionID") %>" data-test="<%# Eval("TestID") %>">
                                            <h5 class="card-title">C</h5>
                                            <p class="card-text"><%#Eval("C") %></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card w-50" data-letter="D" data-question="<%# Eval("QuestionID") %>" data-test="<%# Eval("TestID") %>">
                                <div class="row no-gutters">
                                    <%#
                                        Eval("DPath").ToString() != string.Empty ? "<div class='col-auto'><img src='/images/"+Eval("DPath").ToString()+"'  height='180'/></div>" : ""                           
                                    %>
                                    <div class="col">
                                        <div class="card-block p-2">
                                            <h5 class="card-title">D</h5>
                                            <p class="card-text"><%#Eval("D") %></p>
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
            onFinished: function (event, currentIndex) {
                $.ajax({
                    type: "POST",
                    url: "../../../WebService/AuthenticationServiceAPI.asmx/Results",
                    data: JSON.stringify({
                        questionAnswers: answers
                    }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        console.log(r.d)
                        alert(`Doğru sayısı : ${r.d.TrueCount} \nYanlış sayısı: ${r.d.FalseCount}`)
                        location.replace("/Panel/Student/index.aspx");
                    },
                    error: function (r) {
                        console.log(r.responseText);
                    },
                    failure: function (r) {
                        console.log(r.responseText);
                    }
                });
                
            },
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

        let answers = [];

        $('.card').click(function () {
            if ($(this).hasClass('selected')) {
                $(this).removeClass('selected')
                answers.pop()
            } else {
                let itHas = answers.find(element => {
                    return element.QuestionID == $(this).data('question')
                });
                if (!itHas) {
                    $(this).addClass('selected')

                    answers.push({
                        TestID: $(this).data('test'),
                        QuestionID: $(this).data('question'),
                        Choice: $(this).data('letter')
                    })
                }

            }



            console.log(answers)

            //if (!$(this).hasClass('selected') && !selected) {
            //    selected = true;
            //    console.log("Seçilen Şık " + $(this).data('letter'));
            //    console.log(selectedValue)
            //}
            //else {
            //    if ($(this).hasClass('selected')) {
            //        $(this).removeClass('selected');
            //        selected = false;
            //    }

            //}

        })
    </script>
</asp:Content>
