<%@ Page Title="" Language="C#" MasterPageFile="~/manage/Manage.master" AutoEventWireup="true"
    CodeFile="MInfoList.aspx.cs" Inherits="manage_MInfoList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="cibody" class="cibody">
        <div class="mainNav">
            会议信息
        </div>
        <div class="ciline">
            <div class="cill">
                <a href="MInfoEdit.aspx" runat="server" id="aAdd">新增</a>
            </div>
            <div class="cilr">
                <div class="cilineforgridview">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                        GridLines="Vertical" BorderColor="#C2D3ED" CellPadding="3" BorderStyle="Solid"
                        BorderWidth="1px" HeaderStyle-Height="25" EmptyDataText="没有相关数据" PageSize="20"
                        EnableModelValidation="True">
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <RowStyle Height="25px" BorderColor="#C2D3ED" BorderStyle="Solid" BorderWidth="1px" />
                        <Columns>
                            <asp:HyperLinkField DataNavigateUrlFields="pubid,mid" DataNavigateUrlFormatString="MInfoEdit.aspx?pubid={0}&mid={1}"
                                DataTextField="mName" HeaderText="会议名称" />
                            <asp:BoundField DataField="mBeginTime" HeaderText="开始时间"/>
                            <asp:BoundField DataField="mEndTime" HeaderText="结束时间"/>
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
