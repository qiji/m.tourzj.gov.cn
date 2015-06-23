<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="Mfile.aspx.cs" Inherits="admin_Mfile" %>

<%@ Register Src="UploadFile.ascx" TagName="UploadFile" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="cibody" id="cibody">
        <div class="mainNav">
            会议资料
        </div>
        <div class="ciline">
            <div class="cill">
                资料名称：
            </div>
            <div class="cilr">
                <asp:TextBox runat="server" ID="MTitle"></asp:TextBox>
            </div>
            <div class="cilr">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                    ControlToValidate="MTitle"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="ciline">
            <div class="cill">
                附件：
            </div>
            <div class="cilr">
                <uc1:UploadFile ID="Upload1" runat="server" />
            </div>
        </div>
        <div class="ciline">
            <div class="cill">
                <a id="aback" runat="server" href="WelCome.aspx">返回</a>
            </div>
            <div class="cilr">
                <asp:Button runat="server" ID="btnSave" Text="保存" OnClick="btnSave_Click" />
            </div>
            <div class="cilr">
                <asp:Button runat="server" ID="btnDel" Text="删除" OnClick="btnDel_Click" />
            </div>
        </div>
    </div>
</asp:Content>
