<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    ValidateRequest="false" CodeFile="MLiveInfo.aspx.cs" Inherits="admin_MLiveInfo"
    Title="" %>

<%@ Register Src="Upload.ascx" TagName="Upload" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" href="kindeditor/themes/default/default.css" />
    <link rel="stylesheet" href="kindeditor/plugins/code/prettify.css" />

    <script charset="utf-8" src="kindeditor/kindeditor.js"></script>

    <script charset="utf-8" src="kindeditor/lang/zh_CN.js"></script>

    <script charset="utf-8" src="kindeditor/plugins/code/prettify.js"></script>

    <script>
        KindEditor.ready(function (K) {
            var editor1 = K.create('#ctl00_ContentPlaceHolder1_content1', {
                cssPath: 'kindeditor/plugins/code/prettify.css',
                uploadJson: 'kindeditor/asp.net/upload_json.ashx',
                fileManagerJson: 'kindeditor/asp.net/file_manager_json.ashx',
                allowFileManager: true,

                afterCreate: function () {
                    var self = this;
                    K.ctrl(document, 13, function () {
                        self.sync();
                        K('form[name=example]')[0].submit();
                    });
                    K.ctrl(self.edit.doc, 13, function () {
                        self.sync();
                        K('form[name=example]')[0].submit();
                    });
                }
            });
            prettyPrint();
        });
    </script>

    <script src="../js/datePicker/WdatePicker.js" type="text/javascript"></script>

    <div class="cibody" id="cibody">
        <div class="mainNav">
            微信直播内容编辑&nbsp;&nbsp;<a id="divback" runat="server" href="Welcome.aspx">返回</a>
        </div>
        <div class="ciline">
            <div class="cill">
                标题</div>
            <div class="cilr">
                <asp:TextBox runat="server" ID="tbTitle" Width="200px"></asp:TextBox></div>
        </div>
        <div class="ciline">
            <div class="cill">
                图片
            </div>
            <div class="cilr">
                <uc1:Upload ID="Upload1" runat="server" WH="481*385" />
            </div>
        </div>
        <div class="ciline">
            <div class="cill">
                时间
            </div>
            <div class="cilr">
                <input id="tbPublishDate" runat="server" class="ctextboxdate" name="tbPublishDate"
                    onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" style="width: 145px"
                    type="text" /></div>
            <div class="clinerightdate">
                <img alt="date" onclick="WdatePicker({el:'<%= tbPublishDate.ClientID %>',dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                    src="../images/date.png" style="cursor: pointer" />
            </div>
        </div>
        <div class="ciline">
            <div class="cill">
                点赞数</div>
            <div class="cilr">
                <asp:TextBox runat="server" ID="tbZan" Width="200px"></asp:TextBox></div>
        </div>
        <div class="ciline">
            <div class="cill">
                内容
            </div>
            <div class="cilr">
                <textarea id="content1" cols="100" rows="8" style="width: 700px; height: 300px; visibility: hidden;"
                    runat="server"></textarea>
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
    </div>
</asp:Content>
