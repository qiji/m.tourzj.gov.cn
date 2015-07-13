<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Upload.ascx.cs" Inherits="admin_Upload" %>
<div>
    <div id="upload" runat="server" style="line-height: 35px; height: 35px; float: left;">
        <div id="upfile" runat="server">
            <div style="float: left; line-height: 35px;">
                <asp:FileUpload ID="fp" runat="server" Width="150px" />
            </div>
        </div>
    </div>
    <div style="line-height: 35px">
        <asp:Label ID="lb" runat="server" Text="Label"></asp:Label>
    </div>
    <div style="line-height: 30px; padding-top: 5px; float: left">
        <asp:Button ID="btnUpLoad" runat="server" Text="上传" OnClick="btnUpLoad_Click" />
    </div>
    <div id="view" runat="server" style="line-height: 35px;">
        <asp:HyperLink ID="FileView" runat="server" Target="_blank">查看文件</asp:HyperLink>
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">删除文件</asp:LinkButton>
        <asp:HiddenField ID="HiddenField1" runat="server" />
    </div>
    <br />
    <asp:Image runat="server" ID="Img" ImageUrl="#" />
</div>
<p>
&nbsp;&nbsp;&nbsp;&nbsp;
</p>

