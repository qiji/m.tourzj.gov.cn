<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mGuide.aspx.cs" Inherits="meetting_mGuide" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>微会议</title>
    <link href="css/weihuiyi.css" rel="stylesheet" type="text/css" />
    <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js" type="text/javascript"></script>
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
        }
        BODY
        {
            width: 100%;
        }
    </style>
</head>
<body style="padding-bottom: 0px">
    <div class="direction">
        <div class="drc_pic" id="mGuide" runat="server">
            <img src="images/pic-hy2.jpg" width="640" height="1008" /></div>
    </div>
</body>
</html>
