<%@ Page Title="" Language="C#" MasterPageFile="~/Panel/Dash.Master" EnableViewState="true" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="E_Class.Panel.Teacher.index" UnobtrusiveValidationMode="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCSS" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
    <div class="mt-3">
        <form runat="server">
            <div class="form-row">
                <div class="form-group col-md-12">
                    <label>Konu</label>
                    <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control" ></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ErrorMessage="Konu Boş Geçilemez" ControlToValidate="ddlSubject" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-10">
                    <label>Soru</label>
                    <textarea id="txtQuestion" clientidmode="Static" runat="server"></textarea>
                </div>
                <div class="form-group col-md-2">
                    <label>Sorunun Resmi</label>
                    <asp:FileUpload ID="fuQuestion" runat="server" CssClass="form-control-file" />
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label>A</label>
                    <asp:TextBox ID="txtA" runat="server" CssClass="form-control" placeholder="A Seçeneği"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvA" runat="server" ErrorMessage="Seçenek Boş Geçilemez" ControlToValidate="txtA" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:FileUpload ID="fuA" runat="server" CssClass="form-control-file" />
                </div>
                <div class="form-group col-md-6">
                    <label>B</label>
                    <asp:TextBox ID="txtB" runat="server" CssClass="form-control" placeholder="B Seçeneği"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvB" runat="server" ErrorMessage="Seçenek Boş Geçilemez" ControlToValidate="txtB" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:FileUpload ID="fuB" runat="server" CssClass="form-control-file" />
                </div>
                <div class="form-group col-md-6">
                    <label>C</label>
                    <asp:TextBox ID="txtC" runat="server" CssClass="form-control" placeholder="C Seçeneği"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvC" runat="server" ErrorMessage="Seçenek Boş Geçilemez" ControlToValidate="txtC" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:FileUpload ID="fuC" runat="server" CssClass="form-control-file" />
                </div>
                <div class="form-group col-md-6">
                    <label>D</label>
                    <asp:TextBox ID="txtD" runat="server" CssClass="form-control" placeholder="D Seçeneği"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvD" runat="server" ErrorMessage="Seçenek Boş Geçilemez" ControlToValidate="txtD" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:FileUpload ID="fuD" runat="server" CssClass="form-control-file" />
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-12">
                    <label>Cevap</label>
                    <asp:DropDownList ID="ddlAnswer" runat="server" CssClass="form-control"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvAnswer" runat="server" ErrorMessage="Cevap Boş Geçilemez" ControlToValidate="ddlAnswer" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
            </div>
            <asp:Button ID="btnQuestion" runat="server" Text="Kaydet" CssClass="btn btn-primary" OnClick="btnQuestion_Click" />
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphScript" runat="server">
    <script>
        CKEDITOR.replace("txtQuestion");
    </script>
</asp:Content>
