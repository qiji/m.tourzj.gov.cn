<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserReg.aspx.cs" Inherits="meetting_UserReg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>微会议</title>
    <script src="http://libs.baidu.com/jquery/1.6.4/jquery.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <meta content="telephone=no" name="format-detection" />
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
            <div id="userlist" runat="server">
                <div class="itc_block" style="font-size: 1.5em">
                    <div class="mts_connew">
                        <div style="float: left; width: 20%; text-align: right">
                            姓名：
                        </div>
                        <div style="float: left; width: 70%">
                            <input type="text" id="txtName1" style="width: 90%; font-size: 1em;" />
                            <input id="txtID1" type="hidden" value="0" />
                        </div>
                        <div class="clear">
                        </div>
                        <br />
                        <div style="float: left; width: 20%; text-align: right">
                            性别：
                        </div>
                        <div style="float: left; width: 70%">
                            <input name="sextype1" type="radio" checked="checked" onclick="selectsex(this,1)" /><label>男</label><input
                                name="sextype1" type="radio" onclick="selectsex(this,1)" /><label>女</label>
                            <input id="txtSex1" type="hidden" value="男" />
                        </div>
                        <div class="clear">
                        </div>
                        <br />
                        <div style="float: left; width: 20%; text-align: right">
                            单位：
                        </div>
                        <div style="float: left; width: 70%">
                            <input type="text" id="txtUnit1" placeholder="" style="width: 90%; font-size: 1em;" />
                        </div>
                        <div class="clear">
                        </div>
                        <br />
                        <div style="float: left; width: 20%; text-align: right">
                            职务：
                        </div>
                        <div style="float: left; width: 70%">
                            <input type="text" id="txtJob1" style="width: 90%; font-size: 1em;" />
                        </div>
                        <div class="clear">
                        </div>
                        <br />
                        <div style="float: left; width: 20%; text-align: right">
                            手机：
                        </div>
                        <div style="float: left; width: 70%">
                            <input type="number" id="txtMob1" style="width: 90%; font-size: 1em;" />
                        </div>
                        <div class="clear">
                        </div>
                        <br />
                        <div style="float: left; width: 20%; text-align: right">
                            备注：
                        </div>
                        <div style="float: left; width: 70%">
                            <input type="text" id="txtnote1" placeholder="是否住宿（如住宿拼房或单间）" style="width: 90%;
                                font-size: 1em;" />
                        </div>
                        <div class="clear">
                        </div>
                    </div>
                </div>
                <br />
            </div>
            <div class="clear">
            </div>
            <br />
            <div class="mtsc_sub">
                <a onclick="save()" runat="server" id="aback">确&nbsp;&nbsp;定</a></div>
            <div class="mtsc_sub">
                <a onclick="addUser()" runat="server" id="a1">增加其他参会人员</a></div>
        </div>
        <div class="bottom itcbo">
        </div>
    </div>
    <script>

        $("#txtUnit1")[0].placeholder = "<%=pp %>";

        function deluser(id) {
            if (confirm("确认删除吗")) {
                $.post("../ajax/UserDel.ashx", {
                    ID: id,
                    t: Math.random()
                }, function (e) {
                    alert("删除成功~")
                    location.reload();
                });
            }
            else {

            }
        }

        function addUser() {
            var pp = "<%=pp %>";
            var count = $("#userlist").children(".itc_block").length * 1.0 + 1;
            var html = "<div class=\"itc_block\" style=\"font-size: 1.5em\"><div class=\"mts_connew\">"
            + "<div style=\"float: left; width: 20%; text-align: right\">姓名：</div><div style=\"float: left; width: 70%\">"
            + "<input type=\"text\" id=\"txtName" + count + "\" style=\"width: 90%; font-size: 1em;\" /><input id=\"txtID" + count + "\" type=\"hidden\" value=\"0\" /></div>"
            + "<div class=\"clear\"></div><br /><div style=\"float: left; width: 20%; text-align: right\">性别：</div>"
            + "<div style=\"float: left; width: 70%\"><input name=\"sextype" + count + "\" type=\"radio\" checked=\"checked\" onclick=\"selectsex(this," + count + ")\" /><label>男</label>"
            + "<input name=\"sextype" + count + "\" type=\"radio\" onclick=\"selectsex(this," + count + ")\" /><label>女</label><input id=\"txtSex" + count + "\" type=\"hidden\" value=\"男\" /></div>"
            + "<div class=\"clear\"></div><br /><div style=\"float: left; width: 20%; text-align: right\">单位：</div>"
            + "<div style=\"float: left; width: 70%\"><input type=\"text\" id=\"txtUnit" + count + "\"  placeholder=\"" + pp + "\" style=\"width: 90%; font-size: 1em;\" />"
            + "</div><div class=\"clear\"></div><br /><div style=\"float: left; width: 20%; text-align: right\">职务：</div>"
            + "<div style=\"float: left; width: 70%\"><input type=\"text\" id=\"txtJob" + count + "\" style=\"width: 90%; font-size: 1em;\" /></div>"
            + "<div class=\"clear\"></div><br /><div style=\"float: left; width: 20%; text-align: right\">手机：</div>"
            + "<div style=\"float: left; width: 70%\"><input type=\"number\" id=\"txtMob" + count + "\" style=\"width: 90%; font-size: 1em;\" /></div>"
            + "<div class=\"clear\"></div><br /><div style=\"float: left; width: 20%; text-align: right\">备注：</div><div style=\"float: left; width: 70%\"><input type=\"text\" id=\"txtnote" + count + "\" placeholder=\"是否拼房或单间\" style=\"width: 90%; font-size: 1em;\" /></div><div class=\"clear\"></div></div></div><br />";

            $("#userlist").append(html);
        }
        function selectsex(e, idnex) {
            $("#txtSex" + idnex).val($(e).next("label").text());
        }
        function save() {

            if (checkSubmitMobil()) {
                var count = $("#userlist").children(".itc_block").length;
                var userlist = [];
                for (var i = 1; i <= count; i++) {
                    var userinfo = "";
                    $(".userinfo" + i).each(function () {
                        if (userinfo != "") {
                            userinfo += "|" + $(this).val()
                        }
                        else {
                            userinfo = $(this).val()
                        }
                    });
                    userlist.push(userinfo);
                }

                for (i = 1; i <= userlist.length; i++) {
                    if ($("#txtName" + i).val() != "" && $("#txtMob" + i).val() != "") {
                        $.post("../ajax/UserReg.ashx", {
                            ID: $("#txtID" + i).val(),
                            mid: "<%=mid %>",
                            openid: "",
                            mobile: $("#txtMob" + i).val(),
                            name: $("#txtName" + i).val(),
                            sex: $("#txtSex" + i).val(),
                            unit: $("#txtUnit" + i).val(),
                            job: $("#txtJob" + i).val(),
                            remark: $("#txtnote" + i).val(),
                            uGroup: "<%=openid %>",
                            t: Math.random()
                        }, function (e) {

                        });
                    }
                }
                alert("报名成功~")
                location.reload();
            }
        }

        function checkSubmitMobil() {
            mobs = [];
            ids = [];
            var count = $("#userlist").children(".itc_block").length;
            for (var i = 1; i <= count; i++) {
                if ($.trim($("#txtName" + i).val()) != "" && $.trim($("#txtMob" + i).val()) == "") {
                    alert("请输入手机号");
                    return false;
                }
                else if ($.trim($("#txtName" + i).val()) == "" && $.trim($("#txtMob" + i).val()) != "") {
                    alert("请输入姓名");
                    return false;
                }
                else if ($.trim($("#txtName" + i).val()) != "" && $.trim($("#txtMob" + i).val()) != "") {
                    if ($.trim($("#txtUnit" + i).val()) == "" || $.trim($("#txtJob" + i).val()) == "" || $.trim($("#txtnote" + i).val()) == "") {
                        alert("请输入完整信息~");
                        return false;
                    }
                }
                else if ($.trim($("#txtMob" + i).val()) != "") {
                    if ($.inArray($("#txtMob" + i).val(), mobs) < 0) {
                        mobs.push($("#txtMob" + i).val());
                    }
                    else {
                        alert("参会人员手机号重复");
                        return false;
                    }
                }
            }
            return true;
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
