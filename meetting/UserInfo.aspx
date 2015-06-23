<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserInfo.aspx.cs" Inherits="meetting_UserInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>微会议</title>
    <link href="css/weihuiyi.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        (function () {
            var phoneWidth = parseInt(window.screen.width),
				phoneScale = phoneWidth / 640,
				ua = navigator.userAgent;

            if (/Android (\d+\.\d+)/.test(ua)) {
                var version = parseFloat(RegExp.$1);
                // andriod 2.3
                if (version > 2.3) {
                    document.write('<meta name="viewport" content="width=640, minimum-scale = ' + phoneScale + ', maximum-scale = ' + phoneScale + ', target-densitydpi=device-dpi">');
                    // andriod 2.3以上
                } else {
                    document.write('<meta name="viewport" content="width=640, target-densitydpi=device-dpi">');
                }
                // 其他系统
            } else {
                document.write('<meta name="viewport" content="width=640, user-scalable=no, target-densitydpi=device-dpi">');
            }
        })();
    </script>
    <style type="text/css">
        HTML
        {
            width: 100%;
            height: 100%;
            overflow: hidden;
        }
        BODY
        {
            width: 100%;
            height: 100%;
            overflow: hidden;
        }
    </style>
</head>
<body>
    <div class="personal">
        <div class="top pstop" style="font-size: 2.2em" id="divtitle" runat="server">
            会议名称<br />
        </div>
        <div class="main psmain" id="UserInfo" runat="server">
            姓名：<br />
            电话<br />
            职位<br />
            单位</div>
        <div class="bottom psbo">
        </div>
    </div>
</body>
</html>
