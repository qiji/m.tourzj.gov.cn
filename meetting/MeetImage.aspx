<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MeetImage.aspx.cs" Inherits="meetting_MeetImage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>微会议</title>
    <link href="css/weihuiyi.css" rel="stylesheet" type="text/css" />
    <script src="http://libs.baidu.com/jquery/1.6.4/jquery.js" type="text/javascript"></script>
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
    <div class="interaction">
        <div class="top itctop" style="font-size: 2.2em" id="divtitle" runat="server">
            会议名称<br />
        </div>
        <div class="itcpic" id="myimg" runat="server">
            <img id="img_meeting" name="img_meeting" src="images/pic-hy.jpg" width="640" height="471" /></div>
        <div class="bottom itcbo">
        </div>
    </div>
</body>
<script>
    $(document).ready(function () {
        getimage();
    });

    var mid = "<%= mid %>";
    var webid = "";
    var dateTimer;
    var start = new Date("2014/06/24 09:00");
    clearInterval(dateTimer);
    dateTimer = setInterval(function () {
        var d = new Date();
        var dd = (start.getTime() - d.getTime()) / 1000;
        dd = Math.floor(dd);
        var h = Math.floor(dd / 60 / 60);
        var m = Math.floor((dd - h * 60 * 60) / 60);
        var s = dd % 60;
        if (dd <= 0) {
            h = "00";
            m = "00";
            s = "00";
            clearInterval(dateTimer);
        } else {
            h = h < 0 ? 0 : h < 10 ? ("0" + h) : h;
            m = m < 0 ? 0 : m < 10 ? ("0" + m) : m;
            s = s < 0 ? 0 : s < 10 ? ("0" + s) : s;
        }
        $('#h').html(h);
        $('#m').html(m);
        $('#s').html(s);
    }, 1000);

    function getimage() {
        $.getJSON("../ajax/GetMeetInfo.ashx", { mid: mid, Time: Math.random() }, function (data) {

            if (data != "") {
                $.each(data, function (i, item) {
                    $.get("../ajax/GetMeetingImg.ashx?mid=" + mid + "&type=state&r=" + Math.random(), function (e) {
                        if (e == "") {
                            document["img_meeting"].src = "../upload/" + item.mScreenFile;
                        }
                        else if (webid != e) {
                            clearInterval(dateTimer);
                            $('#showDate').hide();
                            webid = e;
                            document["img_meeting"].src = "../ajax/GetMeetingImg.ashx?mid=" + mid + "&r=" + Math.random();
                        }
                    });
                })
            }
        });



    }

    var timer = setInterval("getimage()", 3000);
</script>
</html>
