<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="MStateList.aspx.cs" Inherits="admin_MStateList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="cibody" id="cibody">
        <div class="mainNav">
            人员状态&nbsp;&nbsp;<a href="Welcome.aspx">返回</a>
        </div>
        <div class="ciline">
            <div class="cill">
                <a id="aAdd" runat="server" href="MStateEdit.aspx?mid=xxx">新增</a>
            </div>
            <div class="cilr">
                <div class="cilineforgridview">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                        BorderColor="#C2D3ED" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" EmptyDataText="没有相关数据"
                        GridLines="Vertical" HeaderStyle-Height="25">
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <RowStyle BorderColor="#C2D3ED" BorderStyle="Solid" BorderWidth="1px" Height="25px" />
                        <Columns>
                            <asp:BoundField DataField="OrderNO" HeaderText="序号" />
                            <asp:HyperLinkField DataNavigateUrlFields="pState,mid" DataNavigateUrlFormatString="MStateEdit.aspx?pState={0}&mid={1}"
                                DataTextField="sName" HeaderText="状态名称" />
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
    </div>
</asp:Content>
