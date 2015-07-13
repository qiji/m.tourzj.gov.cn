<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    ValidateRequest="false" CodeFile="MLive.aspx.cs" Inherits="admin_MLive" Title="" %>

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

    <div class="cibody" id="cibody">
        <div class="mainNav">
            微信直播&nbsp;&nbsp;<a href="Welcome.aspx">返回</a>
        </div>
        <div class="ciline">
            <div class="cill">
                <a href="#" id="add" runat="server">列表内容查看</a>
            </div>
        </div>
        <div class="ciline">
            <div class="cill">
                名称</div>
            <div class="cilr">
                <asp:TextBox runat="server" ID="tbTitle" Width="200px"></asp:TextBox></div>
        </div>
        <div class="ciline">
            <div class="cill">
                地址</div>
            <div class="cilr">
                <asp:TextBox runat="server" ID="tbAddress" Width="200px"></asp:TextBox></div>
        </div>
        <div class="ciline">
            <div class="cill">
                顶部图片
            </div>
            <div class="cilr">
                <uc1:Upload ID="Upload1" runat="server" WH="641*237" />
            </div>
        </div>
        <div class="ciline">
            <div class="cill">
                标识图片
            </div>
            <div class="cilr">
                <uc1:Upload ID="Upload2" runat="server" WH="69*68" />
            </div>
        </div>
        <div class="ciline">
            <div class="cill">
                分享会简介
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
