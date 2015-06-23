<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="MScreen.aspx.cs" Inherits="admin_MScreen" %>

<%@ Register Src="Upload.ascx" TagName="Upload" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="cibody" id="cibody">
        <div class="mainNav">
            会议互动&nbsp;&nbsp;<a href="WelCome.aspx">返回</a>&nbsp;&nbsp;<asp:Button runat="server" ID="btnSend" Text="设置默认图片" onclick="btnSend_Click" />
            <%--<asp:Button runat="server" ID="btnScreen" Text="截屏" onclick="btnScreen_Click"/>--%>
            <input type="button" value="截屏" onclick="ChangeClientID()" />
        </div>
        <iframe runat="server" id="iframeScreen" src="" width="80%" height="530px"></iframe>
        <br />
        <div class="ciline">
            <div class="cill">
                默认图片
            </div>
            <div class="cilr">
                <uc1:Upload ID="Upload1" runat="server" WH="350*250"/>
            </div>
        </div>
        <div class="ciline">
            <div class="cill">
                &nbsp;
            </div>
            <div class="cilr">
                <asp:Button runat="server" ID="btnSave" Text="保存" OnClick="btnSave_Click" />
            </div>
        </div>
        <div id="divResult" class="divResult" runat="server">
        </div>
</div>
<script>
    var mid = "<%= mid %>";
    function ChangeClientID() {
        $.get("../ajax/ImgService.ashx?mid=" + mid + "&type=changeclientid&r=" + Math.random(), function (e) {
            $(".divResult").text(e);
        });
    }
    </script>
</asp:Content>

