<%@ Page Language="C#" AutoEventWireup="true" CodeFile="meetimgtest.aspx.cs" Inherits="admin_meetimgtest" %>

<!doctype html>
<html lang="en-US">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Cache-control" content="no-cache" />
    <meta name="description" content="" />
    <title></title>
    <script src="http://libs.baidu.com/jquery/1.6.4/jquery.js" type="text/javascript"></script>
</head>
<body>
    <div class="mtbigtl" id="meetname">
        -会议互动-</div>
    <div class="mtintro">
        <div id="divImage" style="position: relative; padding-bottom: 10px; font-size: 1.2em;">
            <img id="img_meeting" style="width: 100%" name="img_meeting" src="111111.jpg" alt="" />
            <div id="h" style="position: absolute; top: 13%; left: 35%; width: 9%; height: 13%;
                display: none; right: 0; text-align: center; color: White;">
            </div>
            <div id="m" style="position: absolute; top: 13%; left: 47.5%; width: 9%; height: 13%;
                display: none; right: 0; text-align: center; color: White;">
            </div>
            <div id="s" style="position: absolute; top: 13%; left: 60%; width: 9%; height: 13%;
                display: none; right: 0; text-align: center; color: White;">
            </div>
            <div id="showDate" style="position: absolute; top: 30px; left: 0; right: 0; text-align: center;">
                <div id="date" style="color: #3366ff;">
                </div>
            </div>
        </div>
        <div class="mtsc_sub" style="display: none">
            <a href="javascript:window.history.go(-1)" runat="server" id="aback">返 回</a></div>
    </div>
</body>
</html>
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
                        if (e == "" || e == "[object XMLDocument]") {
                            document["img_meeting"].src = "../Upload/" + item.mScreenFile;
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
