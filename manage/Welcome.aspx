<%@ Page Language="C#" MasterPageFile="Manage.master" AutoEventWireup="true" CodeFile="Welcome.aspx.cs"
    Inherits="Welcome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="cibody" class="cibody">
        <div class="mainNav">
            微会议账号信息
        </div>
        <div class="ciline">
            <div class="cill">
                <a href="MUserEdit.aspx">新增</a>
            </div>
            <div class="cilr">
                <div class="cilineforgridview">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                        GridLines="Vertical" BorderColor="#C2D3ED" CellPadding="3" BorderStyle="Solid"
                        BorderWidth="1px" HeaderStyle-Height="25" EmptyDataText="没有相关数据" 
                        PageSize="20" EnableModelValidation="True">
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <RowStyle Height="25px" BorderColor="#C2D3ED" BorderStyle="Solid" BorderWidth="1px" />
                        <Columns>
                            <asp:HyperLinkField DataNavigateUrlFields="pubid" DataNavigateUrlFormatString="MUserEdit.aspx?pubid={0}"
                                DataTextField="PubNo" HeaderText="账号名称" />
                            <asp:BoundField DataField="UserName" HeaderText="用户名" />
                            <asp:HyperLinkField DataNavigateUrlFields="pubid" 
                                DataNavigateUrlFormatString="MInfoList.aspx?pubid={0}" HeaderText="会议信息" 
                                Text="会议信息" />
                        </Columns>
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" CssClass="cigvp"
                            Font-Size="15px" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle Height="25px" BackColor="#EDF4FC" Font-Bold="True" ForeColor="Black"
                            HorizontalAlign="Center"></HeaderStyle>
                        <AlternatingRowStyle BackColor="#EDF4FC" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
