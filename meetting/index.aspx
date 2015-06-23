<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="meetting_index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    <div class="index" style="position: relative">
        <div class="top indextop" style="font-size: 2.2em" id="divtitle" runat="server">
            会议会议会议会议
        </div>
        <div id="d1" onclick="urljump('mGuide.aspx')" style="position: absolute">
            &nbsp;
        </div>
        <div id="d2" onclick="urljump()" style="position: absolute">
            &nbsp;
        </div>
        <div id="d3" onclick="urljump('FileList.aspx')" style="position: absolute">
            &nbsp;
        </div>
        <div id="d4" onclick="urljump()" style="position: absolute">
            &nbsp;
        </div>
    </div>
    <script>

        function urljump(url) {
            var mid = "<%=mid %>";
            window.location.href = url + "?mid=" + mid;
        }

        $("#d1")[0].style.width = 165 * document.body.offsetWidth / 642 + "px";
        $("#d1")[0].style.height = 200 * document.body.offsetWidth / 642 + "px";
        $("#d1")[0].style.left = 110 * document.body.offsetWidth / 642 + "px";
        $("#d1")[0].style.top = 180 * document.body.offsetWidth / 642 + "px";

        $("#d2")[0].style.width = 165 * document.body.offsetWidth / 642 + "px";
        $("#d2")[0].style.height = 200 * document.body.offsetWidth / 642 + "px";
        $("#d2")[0].style.left = 345 * document.body.offsetWidth / 642 + "px";
        $("#d2")[0].style.top = 180 * document.body.offsetWidth / 642 + "px";

        $("#d3")[0].style.width = 165 * document.body.offsetWidth / 642 + "px";
        $("#d3")[0].style.height = 200 * document.body.offsetWidth / 642 + "px";
        $("#d3")[0].style.left = 110 * document.body.offsetWidth / 642 + "px";
        $("#d3")[0].style.top = 415 * document.body.offsetWidth / 642 + "px";

        $("#d4")[0].style.width = 165 * document.body.offsetWidth / 642 + "px";
        $("#d4")[0].style.height = 200 * document.body.offsetWidth / 642 + "px";
        $("#d4")[0].style.left = 345 * document.body.offsetWidth / 642 + "px";
        $("#d4")[0].style.top = 415 * document.body.offsetWidth / 642 + "px";
    </script>
</body>
</html>
