<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="MInfo.aspx.cs" Inherits="admin_MInfo" %>

<%@ Register Src="Upload.ascx" TagName="Upload" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
 <script language="javascript" src="../js/datePicker/WdatePicker.js"></script>
    <div class="cibody" id="cibody">
        <div class="mainNav">
            会议信息编辑
        </div>
        <div class="ciline">
            <div class="cill">
                会议名称
            </div>
            <div class="cilr">
                <asp:TextBox runat="server" ID="tbMName"></asp:TextBox>
            </div>
        </div>
        <div class="ciline">
            <div class="cill">
                主办单位
            </div>
            <div class="cilr">
                <asp:TextBox runat="server" ID="tbmHost"></asp:TextBox>
            </div>
        </div>
        <div class="ciline">
            <div class="cill">
                承办单位
            </div>
            <div class="cilr">
                <asp:TextBox runat="server" ID="tbmUnderTake"></asp:TextBox>
            </div>
        </div>
        <div class="ciline">
            <div class="cill">
                协办单位
            </div>
            <div class="cilr">
                <asp:TextBox runat="server" ID="tbmJointly"></asp:TextBox>
            </div>
        </div>
        <div class="ciline">
            <div class="cill">
                报名时间
            </div>
            <div class="cilr">
                <input id="tbmSignBeginTime" runat="server" class="ctextboxdate" name="tbmSignBeginTime"
                    onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly"
                    style="width: 145px" type="text" /></div>
            <div class="clinerightdate">
                <img alt="date" onclick="WdatePicker({el:'<%= tbmSignBeginTime.ClientID %>',dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                    src="../images/date.png" style="cursor: pointer" />
            </div>
            <div class="cilr">
                -
            </div>
            <div class="cilr">
                <input id="tbmSignEndTime" runat="server" class="ctextboxdate" name="tbmSignEndTime"
                    onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly"
                    style="width: 145px" type="text" /></div>
            <div class="clinerightdate">
                <img alt="date" onclick="WdatePicker({el:'<%= tbmSignEndTime.ClientID %>',dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                    src="../images/date.png" style="cursor: pointer" />
            </div>
        </div>
        <div class="ciline">
            <div class="cill">
                会议时间
            </div>
            <div class="cilr">
                <input id="tbmBeginTime" runat="server" class="ctextboxdate" name="tbmBeginTime"
                    onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly"
                    style="width: 145px" type="text" /></div>
            <div class="clinerightdate">
                <img alt="date" onclick="WdatePicker({el:'<%= tbmBeginTime.ClientID %>',dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                    src="../images/date.png" style="cursor: pointer" />
            </div>
            <div class="cilr">
                -
            </div>
            <div class="cilr">
                <input id="tbmEndTime" runat="server" class="ctextboxdate" name="tbmEndTime" onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                    readonly="readonly" style="width: 145px" type="text" /></div>
            <div class="clinerightdate">
                <img alt="date" onclick="WdatePicker({el:'<%= tbmEndTime.ClientID %>',dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                    src="../images/date.png" style="cursor: pointer" />
            </div>
        </div>
        <div class="ciline">
            <div class="cill">
                地址
            </div>
            <div class="cilr">
                <asp:TextBox runat="server" ID="tbmAddress"></asp:TextBox>
            </div>
        </div>
        <div class="ciline">
            <div class="cill">
                联系人
            </div>
            <div class="cilr">
                <asp:TextBox runat="server" ID="tbmContact"></asp:TextBox>
            </div>
        </div>
        <div class="ciline">
            <div class="cill">
                是否需要报名
            </div>
            <div class="cilr">
                <asp:RadioButtonList ID="RBLIsRegistration" runat="server" 
                    RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="1">是</asp:ListItem>
                    <asp:ListItem Value="0">否</asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>
        <div class="ciline">
            <div class="cill">
                提示信息
            </div>
            <div class="cilr">
                <asp:TextBox ID="txtHintInfo" runat="server" TextMode="MultiLine"></asp:TextBox>
            </div>
        </div>
        <div class="ciline">
            <div class="cill">
                议程
            </div>
            <div class="cilr">
                <uc1:Upload ID="Upload1" runat="server" WH="100*200" />
            </div>
        </div>
        <div class="ciline">
            <div class="cill">
                会场座位图
            </div>
            <div class="cilr">
                <uc1:Upload ID="mSeatFile" runat="server" WH="350*250" />
            </div>
        </div>
        <div class="ciline">
            <div class="cill">
                <a href="WelCome.aspx">返回</a>
            </div>
            <div class="cilr">
                <asp:Button runat="server" ID="btnSave" Text="保存" OnClick="btnSave_Click" />
            </div>
        </div>
    </div>
</asp:Content>
