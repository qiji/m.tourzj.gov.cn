<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="MStateEdit.aspx.cs" Inherits="admin_MStateEdit" %>

<%@ Register Src="minfo.ascx" TagName="minfo" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="cibody" id="cibody">
        <uc1:minfo ID="minfo1" runat="server" />
        <div class="ciline">
            <div class="cill">
                序号
            </div>
            <div class="cilr">
                <asp:TextBox runat="server" ID="tbOrderNo"></asp:TextBox>
            </div>
        </div>
        <div class="ciline">
            <div class="cill">
                状态名称
            </div>
            <div class="cilr">
                <asp:TextBox runat="server" ID="tbsName"></asp:TextBox>
            </div>
        </div>
        <div class="ciline">
            <div class="cill">
                <a href="MStateList.aspx?mid=xxx" runat="server" id="aBack">返回</a>
            </div>
            <div class="cilr">
                <asp:Button runat="server" ID="btnSave" Text="保存" OnClick="btnSave_Click" />
                <asp:Button runat="server" ID="btnDelete" Text="删除" onclick="btnDelete_Click" />
            </div>
        </div>
    </div>
</asp:Content>
