<%@ Page Language="C#" MasterPageFile="admin.master" AutoEventWireup="true" CodeFile="Welcome.aspx.cs"
    Inherits="Welcome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="cibody" class="cibody">
        <div class="mainNav">
            <asp:Label runat="server" ID="lbPubNo"></asp:Label>
        </div>
        <div class="ciline">
            <div class="cilr">
                <div class="cilineforgridview">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                        GridLines="Vertical" BorderColor="#C2D3ED" CellPadding="3" BorderStyle="Solid"
                        BorderWidth="1px" HeaderStyle-Height="25" EmptyDataText="没有相关数据" PageSize="20"
                        EnableModelValidation="True">
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <RowStyle Height="25px" BorderColor="#C2D3ED" BorderStyle="Solid" BorderWidth="1px" />
                        <Columns>
                            <asp:HyperLinkField DataNavigateUrlFields="mid" DataNavigateUrlFormatString="MInfo.aspx?mid={0}"
                                DataTextField="mName" HeaderText="会议名称" />
                            <%--<asp:TemplateField HeaderText="会议地址">
                                <ItemTemplate>
                                    <%# GetShortAddress(Eval("mAddress")) %>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <%--<asp:BoundField DataField="mContact" HeaderText="联系人" />--%>
                            <asp:BoundField DataField="mBeginTime" HeaderText="开始时间"/>
                            <asp:BoundField DataField="mEndTime" HeaderText="结束时间"/>
                            <asp:TemplateField HeaderText="会议链接">
                                <ItemTemplate>
                                    <%# GetMeetUrl(Eval("mid"))%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="操作" HeaderStyle-Width="160px">
                                <ItemTemplate>
                                    <a href="PersonList.aspx?mid=<%# Eval("mid") %>">人员</a>| <a class="seat" href='<%# GetSeatUrl(Eval("SeatX"))%>?mid=<%# Eval("mid") %>' target="_blank">座位设置</a> | <a
                                        href='MStateList.aspx?mid=<%# Eval("mid") %>'>状态设置</a> |<a href='MScreen.aspx?mid=<%# Eval("mid") %>'>会议互动</a>|<a
                                            href='MfileList.aspx?mid=<%# Eval("mid") %>'>会议资料</a>
                                            |<a
                                            href='MLive.aspx?mid=<%# Eval("mid") %>'>会议直播</a>
                                            </ItemTemplate>
                            </asp:TemplateField>
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
<script>
    $(".seat").attr("href", $(".seat").attr("href") + "&width=" + $(document).width() + "&height=" + $(document).height()); 
</script>
</asp:Content>
