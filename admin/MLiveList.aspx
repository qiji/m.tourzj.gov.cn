﻿<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="MLiveList.aspx.cs" Inherits="admin_MLiveList" Title="" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="cibody" id="cibody">
        <div class="mainNav">
            微信直播内容&nbsp;&nbsp;<a id="divback" runat="server" href="Welcome.aspx">返回</a>
        </div>
        <div class="ciline">
            <div class="cill">
                <a href="#" id="a1" runat="server">新增</a>
            </div>
            <div class="cilineforgridview">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                    BorderColor="#C2D3ED" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" EmptyDataText="没有相关数据"
                    GridLines="Vertical" HeaderStyle-Height="25" OnSelectedIndexChanging="GridView1_SelectedIndexChanging"
                    EnableModelValidation="True">
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <RowStyle BorderColor="#C2D3ED" BorderStyle="Solid" BorderWidth="1px" Height="25px" />
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="mid,id" DataNavigateUrlFormatString="MLiveInfo.aspx?mid={0}&amp;ID={1}"
                            DataTextField="id" HeaderText="id" />
                        <asp:BoundField DataField="Title" HeaderText="标题" />
                        <asp:BoundField DataField="CrtDate" HeaderText="时间" DataFormatString="{0:yyyy-MM-dd HH:MM:ss}" />
                        <asp:BoundField DataField="Zan" HeaderText="点赞数" />
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
