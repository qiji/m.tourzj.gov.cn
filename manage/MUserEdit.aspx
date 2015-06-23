<%@ Page Title="" Language="C#" MasterPageFile="~/manage/Manage.master" AutoEventWireup="true"
    CodeFile="MUserEdit.aspx.cs" Inherits="manage_MUserEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="cibody" id="cibody">
        <div class="mainNav">
            账号信息编辑
        </div>
        <div class="ciline">
            <div class="cill">
                账号名称
            </div>
            <div class="cilr">
                <asp:TextBox ID="tbPubNo" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="ciline">
            <div class="cill">
                用户名
            </div>
            <div class="cilr">
                <asp:TextBox runat="server" ID="tbusername"></asp:TextBox>
            </div>
        </div>
        <div class="ciline">
            <div class="cill">
                <a href="Welcome.aspx">返回</a>
            </div>
            <div class="cilr">
                <asp:Button runat="server" ID="btnSave" Text="保存" onclick="btnSave_Click" />
                <asp:Button runat="server" ID="btnDelete" Text="删除" onclick="btnDelete_Click" />
                <asp:Button runat="server" ID="btnRePwd" Text="重置密码" onclick="btnRePwd_Click" />
            </div>
        </div>
    </div>
</asp:Content>
