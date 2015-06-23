<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>微会议</title>
    <link href="css/login.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="login_body">
        <div id="login_div">
            <div id="login_form_div">
                <table width="300px" border="0">
                    <tr>
                        <td width="170">
                            <label>
                                用户名:<br />
                                <input runat="server" id="username" type="text" class="input input_width_150" />
                            </label>
                            <br />
                            <label>
                                密码：<br />
                                <input runat="server" id="password" type="password" class="input input_width_150" />
                            </label>
                        </td>
                        <td align="left">
                            <asp:ImageButton ID="ImageButton1" runat="server" CssClass="login_btn" ImageUrl="images/login_btn.gif"
                                OnClick="ImageButton1_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="login_footer">
            浙江省旅游信息中心 &copy; 2015
        </div>
    </div>
    </form>
</body>
</html>
