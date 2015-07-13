<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserSign.aspx.cs" Inherits="meetting_UserSign" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>微会议</title>
    <link href="css/weihuiyi.css" rel="stylesheet" type="text/css" />
    <meta content="telephone=no" name="format-detection" />
    <script src="http://libs.baidu.com/jquery/1.6.4/jquery.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
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
        .mtsc_sub a
        {
            background-image: url(images/bu_sub.jpg);
            background-repeat: no-repeat;
            background-position: center center;
            display: block;
            clear: both; /*height: 100px;*/
            font-size: 1.5em;
            color: #FFF;
            text-decoration: none; /*line-height: 100px;*/
            padding: 15px 0;
            text-align: center;
            margin-bottom: 15px;
            border-radius: 100px;
        }
    </style>
</head>
<body style="padding-bottom: 0px">
    <div class="interaction">
        <div class="top itctop" style="font-size: 2.2em" id="divtitle" runat="server">
            会议名称<br />
        </div>
        <div class="main itcmain">
            <div class="itc_intro" style="font-size: 1.4em" id="divInfo" runat="server">
                会议地点<br />
                会议时间
            </div>
            <div class="itc_block">
                <input type="number" style="width: 100%; padding: 5px; font-size: 2.0em; border: none;"
                    placeholder="请输入报名时的手机号" id="mobile" tabindex="1" />
            </div>
            <div class="clear">
            </div>
            <br />
            <div class="mtsc_sub">
                <a onclick="save()" runat="server" id="aback">签&nbsp;&nbsp;到</a></div>
        </div>
        <div class="bottom itcbo">
        </div>
    </div>
    <script>
        function save() {
            $.post("../ajax/UserJoin.ashx", {
                mobile: $("#mobile").val(),
                t: Math.random()
            }, function (e) {
                if (e == "T") {
                    alert("签到成功~");
                    document.location.href = "index.aspx";
                }
                else {
                    alert("手机号不存在~");
                }
            });
        }

        var times = Date.parse(new Date()) / 1000;
        var signature = "";

        $.get("../ajax/getsignature.ashx", {
            times: times,
            r: Math.random(),
            url: window.location.href
        }, function (e) {
            wx.config({
                debug: false,
                appId: 'wx9c20277acdfbe85b',
                timestamp: times,
                nonceStr: 'zjslyj',
                signature: e,
                jsApiList: [
                'checkJsApi',
                'onMenuShareTimeline',
                'onMenuShareAppMessage',
                'onMenuShareQQ',
                'onMenuShareWeibo',
                'hideMenuItems',
                'showMenuItems',
                'hideAllNonBaseMenuItem',
                'showAllNonBaseMenuItem',
                'translateVoice',
                'startRecord',
                'stopRecord',
                'onRecordEnd',
                'playVoice',
                'pauseVoice',
                'stopVoice',
                'uploadVoice',
                'downloadVoice',
                'chooseImage',
                'previewImage',
                'uploadImage',
                'downloadImage',
                'getNetworkType',
                'openLocation',
                'getLocation',
                'hideOptionMenu',
                'showOptionMenu',
                'closeWindow',
                'scanQRCode',
                'chooseWXPay',
                'openProductSpecificView',
                'addCard',
                'chooseCard',
                'openCard'
              ]
            });
            wx.error(function (res) {
                alert("error:" + res.errMsg);
            });
            wx.ready(function () {
                wx.hideOptionMenu();
            });
        });
    </script>
</body>
</html>
