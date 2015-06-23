<%@ Page Title="" Language="C#" MasterPageFile="~/manage/Manage.master" AutoEventWireup="true"
    CodeFile="MInfoEdit.aspx.cs" Inherits="manage_MInfoEdit" %>

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
                <asp:TextBox ID="tbmName" runat="server"></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbmName"
                ErrorMessage="*"></asp:RequiredFieldValidator>
        </div>
        <div class="ciline">
            <div class="cill">
                开始时间
            </div>
            <div class="cilr">
                <input id="tbBeginTime" runat="server" class="ctextboxdate" name="tbBeginTime" onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                    readonly="readonly" style="width: 145px" type="text" /></div>
            <div class="clinerightdate">
                <img alt="date" onclick="WdatePicker({el:'<%= tbBeginTime.ClientID %>',dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                    src="../images/date.png" style="cursor: pointer" />
            </div>
        </div>
        <div class="ciline">
            <div class="cill">
                结束时间
            </div>
            <div class="cilr">
                <input id="tbEndTime" runat="server" class="ctextboxdate" name="tbEndTime" onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                    readonly="readonly" style="width: 145px" type="text" /></div>
            <div class="clinerightdate">
                <img alt="date" onclick="WdatePicker({el:'<%= tbEndTime.ClientID %>',dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                    src="../images/date.png" style="cursor: pointer" />
            </div>
        </div>
        <div class="ciline">
            <div class="cill">
                <a href="MInfoList.aspx?PubID=XXX" runat="server" id="aBack">返回</a>
            </div>
            <div class="cilr">
                <asp:Button runat="server" ID="btnSave" Text="保存" OnClick="btnSave_Click" />
                <asp:Button runat="server" ID="btnDelete" Text="删除" OnClick="btnDelete_Click" />
            </div>
        </div>
    </div>
</asp:Content>
