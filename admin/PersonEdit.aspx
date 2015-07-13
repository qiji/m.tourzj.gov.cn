<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="PersonEdit.aspx.cs" Inherits="admin_PersonEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="cibody" class="cibody">
<div class="mainNav">
            会议人员
        </div>
        <div class="ciline">
            <div class="cill">
                姓名:
            </div>
            <div class="cilr">
                <asp:TextBox ID="tpName" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="tpName"
                    ValidationGroup="Group1"></asp:RequiredFieldValidator>
            </div>
            <div class="cill">
                性别:
            </div>
            <div class="cilr">
                <asp:DropDownList ID="ddlpGender" runat="server">
                    <asp:ListItem>男</asp:ListItem>
                    <asp:ListItem>女</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="cill">
                手机:
            </div>
            <div class="cilr">
                <asp:TextBox ID="tpMobile" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator SetFocusOnError="true" ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="tpMobile" ErrorMessage="(手机必须填写)" ValidationGroup="Group1"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="ciline">
            <div class="cill">
                单位:
            </div>
            <div class="cilr">
                <asp:TextBox ID="tpUnitName" runat="server"></asp:TextBox>
            </div>
            <div class="cill">
                职务:
            </div>
            <div class="cilr">
                <asp:TextBox ID="tpTitle" runat="server"></asp:TextBox>
            </div>
          <div id="divstate" runat="server">
            <div class="cill">
                状态
            </div>
            <div class="cilr">
                <asp:DropDownList runat="server" ID="ddlpState">
                </asp:DropDownList>
            </div>
        </div>
        </div>
        <div id="divTime" runat="server" class="ciline">
            <div class="cill">
                报名时间:
            </div>
            <div class="cilr">
                <asp:Label ID="lblSignTime" runat="server"></asp:Label>
            </div>
            <div class="cill">
                签到时间:
            </div>
            <div class="cilr">
                <asp:Label ID="lblRegTime" runat="server"></asp:Label>
            </div>
        </div>
        <div class="ciline">
            <div class="cill">
                备注
            </div>
            <div class="cilr">
                <textarea id="tpRemark" runat="server" cols="20" rows="2" style="width: 420px; height: 200px"></textarea>
            </div>
        </div>
        <div class="ciline">
            <div class="cill">
                <a href="#" id="aback" runat="server">返回</a>
            </div>
            <div class="cilr">
                <asp:Button ID="btnSave" runat="server" Text="保存" ValidationGroup="Group1" 
                    onclick="btnSave_Click" />
            </div>
            <div class="cilr">
                <asp:Button ID="btnDel" runat="server" Text="删除" Visible="false" 
                    onclick="btnDel_Click" />
            </div>
        </div>
</div>
</asp:Content>

