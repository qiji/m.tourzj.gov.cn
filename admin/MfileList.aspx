<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="MfileList.aspx.cs" Inherits="admin_MfileList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="cibody" id="cibody">
    <div class="mainNav">
            会议资料&nbsp;&nbsp;<a href="Welcome.aspx">返回</a>
        </div>
        <div class="ciline">
            <div class="cill">
                <a href="#" id="add" runat="server">新增</a>
            </div>
            <div class="cilineforgridview">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                    BorderColor="#C2D3ED" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" EmptyDataText="没有相关数据"
                    GridLines="Vertical" HeaderStyle-Height="25" EnableModelValidation="True">
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <RowStyle BorderColor="#C2D3ED" BorderStyle="Solid" BorderWidth="1px" Height="25px" />
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="mid,id" DataNavigateUrlFormatString="Mfile.aspx?mid={0}&ID={1}"
                            DataTextField="dName" HeaderText="资料名称" />
                        <asp:TemplateField HeaderText="查看">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <a href="../Upload/<%# Eval("dFileName") %>" target="_blank">查看</a>
                            </ItemTemplate>
                        </asp:TemplateField>
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
