<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="PersonList.aspx.cs" Inherits="admin_PersonList" %>

<%@ Register Src="minfo.ascx" TagName="minfo" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="cibody" id="cibody">
        <uc1:minfo ID="minfo1" runat="server" />
        <div class="ciline">
            <div class="cill">
                <a href="Welcome.aspx">返回</a>
            </div>
            <div class="cill">
                状态
            </div>
            <div class="cilr">
                <asp:DropDownList runat="server" ID="ddlpState">
                </asp:DropDownList>
            </div>
            <div class="cill">
                单位/姓名/手机
            </div>
            <div class="cilr">
                <asp:TextBox runat="server" ID="tbKey"></asp:TextBox>
            </div>
            <div class="cilr">
                <asp:Button runat="server" ID="btnOK" Text="查询" OnClick="btnOK_Click" />
            </div>
            <div class="cilr">
                <asp:Button runat="server" ID="btnExcel" Text="导出EXCEL" 
                    onclick="btnExcel_Click" />
            </div>
        </div>
        <div class="ciline">
            <div class="cill">
                <a href="#" id="add" runat="server">新增</a>
            </div>
            <div class="cilineforgridview">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                    BorderColor="#C2D3ED" BorderStyle="Solid" BorderWidth="1px" 
                    CellPadding="3" EmptyDataText="没有相关数据"
                    GridLines="Vertical" HeaderStyle-Height="25" 
                    OnSelectedIndexChanging="GridView1_SelectedIndexChanging" 
                    EnableModelValidation="True">
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <RowStyle BorderColor="#C2D3ED" BorderStyle="Solid" BorderWidth="1px" Height="25px" />
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="mid,id" 
                            DataNavigateUrlFormatString="PersonEdit.aspx?mid={0}&amp;ID={1}" 
                            DataTextField="pName" HeaderText="姓名" />
                        <asp:BoundField DataField="pUnitName" HeaderText="单位" />
                        <asp:BoundField DataField="pMobile" HeaderText="电话" />
                        <asp:BoundField DataField="pTitle" HeaderText="职务" />
                        <asp:BoundField DataField="pGender" HeaderText="性别" />
                        <asp:BoundField DataField="sName" HeaderText="状态" />
                        <asp:BoundField DataField="SignTime" HeaderText="报名时间" DataFormatString="{0:yyyy-MM-dd HH:MM:ss}" />
                        <asp:BoundField DataField="RegTime" HeaderText="签到时间" DataFormatString="{0:yyyy-MM-dd HH:MM:ss}" />
                        <asp:BoundField DataField="Remark" HeaderText="备注"/>
                    </Columns>
                    <PagerStyle BackColor="White" CssClass="cigvp" Font-Size="15px" ForeColor="Black"
                        HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#EDF4FC" Font-Bold="True" ForeColor="Black" Height="25px"
                        HorizontalAlign="Center" />
                    <AlternatingRowStyle BackColor="#EDF4FC" />
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
