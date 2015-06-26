<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="MeetSeatSet.aspx.cs"
    Inherits="admin_MeetSeatSet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>座位设置</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
    <link href="../Css/seatpc.css" rel="stylesheet" type="text/css" />
    <script src="//code.jquery.com/jquery-1.9.1.js"></script>
    <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <link href="../css/common.css" type="text/css" rel="Stylesheet" />
    <link href="../css/FrameWork.css" type="text/css" rel="Stylesheet" />
    <link href="../css/DataList.css" type="text/css" rel="Stylesheet" />
    <link href="../css/PageStyle.css" type="text/css" rel="Stylesheet" />
    <script language="javascript" type="text/javascript" src="../js/adminframe/frameJS.js"></script>
    <script src="../js/drawselect2.js"></script>
    <style>
        .ui-widget-header
        {
            background: #87CEFA;
        }
        #tabs ul li a
        {
            background: #C6E2FF;
        }
        #tabs ul li.ui-tabs-active a
        {
            background: #fff;
        }
        #divseat div.selected {

            background-color: red;
        }

        div.draw {
            border: solid 1px blue;


        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="tabs" style="width: 98%; margin: 0 auto; top: 5px;height:98%;bottom:5px">
        <ul>
            <li><a href="#tabs-1">排座位</a></li>
            <li><a href="#tabs-2">初始化</a></li>
        </ul>
        <div id="tabs-1">
        </div>
        <div id="tabs-2">
            <div class="ciline">
                <div class="cilr">
                    会场位置
                </div>
                <div class="cilr">
                    横排<input id="tbSeatX" type="text" style="width:50px" />
                    竖排<input id="tbSeatY" type="text" style="width:50px"/>
                </div>
                <div class="cilr">
                    <input id="btnSave" type="button" value="保存" />
                </div>
                <div class="cilr">
                    <input id="btnClear" type="button" value="座位清除" />
                </div>
                <div class="cilr">
                    <input id="btnAdd" type="button" value="座位还原" />
                </div>
                <div class="cilr">
                    <input id="btnMerge" type="button" value="座位设置" />
                </div>
                <div class="cilr">
                    <input id="btnAreaRestore" type="button" value="取消座位设置" />
                </div>
                selected:<span id="result"></span>
            </div>
            <div class="mtintro">
                <div class="mt_other">
                    主席台</div>
                <div id="divseat" class="mtseats" runat="server">
                </div>
            </div>
            <div id="tzbox" style="position: absolute; width: 100%; top: 100px; left: 0px; display: none">
            <div class="ciline" style="position: absolute; border: 3px solid #AAAAAA; width: 500px;
                height: auto; background-color: #DDDDDD; left: 50%; top: 50%; margin-left: -250px;
                margin-top: 50px;">
                <div class="ciline" style="margin-left: 0px; margin-bottom: 10px; border-bottom: 1px solid #666666;">
                    <div id="atitle" class="cilr" style="float: left;">座位设置
                    </div>
                    <div class="cilr" style="float: right; cursor: pointer;" onclick="hiddentz()">
                        关闭</div>
                </div>
                <div id="cardtable" style="text-align: center">
                    <div class="ciline">
                        <div class="cill">
                            所属区域名称：
                        </div>
                        <div class="cilr">
                            <input id="txtbName" type="text" />
                        </div>
                    </div>
                    <div class="ciline">
                        <div class="cill">
                            &nbsp;
                        </div>
                        <div class="cilr">
                            <input id="Button2" type="button" value="确定" onclick='Submit()' />
                            <input id="Button4" type="button" value="取消" onclick='hiddentz()' />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>
    </form>
</body>
</html>
<script>
    var tab;
    var mid = "<%= mid %>";
    $(function () {
        $("#tabs").tabs();
        SeatInfo(true);
    });

    $("#tabs li").bind("click", function () {
        if (tab == 1) {
            alert("请先初始化座位信息");
            $('#tabs').tabs('option', 'active', tab);
        }
    });

    function SeatInfo(a) {
        $.get("../ajax/GetSeatInfo.ashx?mid=" + mid, function (e) {
            if (e != "") {
                $("#tbSeatX").val(e.split('|')[0]);
                $("#tbSeatY").val(e.split('|')[1]);
                tab = e.split('|')[2];
                if (a) {
                    $('#tabs').tabs('option', 'active', tab);
                }
                if (e.split('|')[0] != 0) {
                    var width = (($(document).width() - 89) / (e.split('|')[0] * 1 + 1)) - 3;
                    $('head').append("<style>.mt_sli{ width:" + width + "px}</style>");
                    var height = (($(document).height() - 170) / (e.split('|')[1] * 1 + 1)) - 4;
                    $('head').append("<style>.mt_sli{ height:" + height + "px;line-height:" + height + "px;}</style>");
                }
                Seatinit();
                SeatBlock();
            }
        });
    }

    function Seatinit() {
        $.get("../ajax/MeetingSeatBlankGet.ashx?mid=" + mid, function (e) {
            if (e != "") {
                var ss = e.split(',');
                for (i = 0; i < ss.length; i++) {
                    if (ss[i] != "") {
                        if (document.getElementById("divseat" + ss[i]) != null) {
                            document.getElementById("divseat" + ss[i]).className = "mt_sli";
                        }
                    }
                }
            }
        });
    }

    function SeatBlock() {
        $.get("../ajax/MeetingSeatBlockGet.ashx?mid=" + mid, function (e) {
            if (e != "") {
                var ss = e.split('|');
                $.each(ss, function (n, value) {
                    var tt = value.split('+');
                    var bid = tt[0];
                    var bname = tt[1];
                    var xx = tt[2].split(',');
                    $.each(xx, function (m, val) {
                        $("#divseat" + val).text(bname);
                        $("#divseat" + val).attr("name", bid);
                    });
                });
            }
        });
    }

    $("#btnSave").click(function () {
        $.post("../ajax/UpdateSeatXY.ashx", {
            mid: mid,
            SeatX: $("#tbSeatX").val(),
            SeatY: $("#tbSeatY").val()
        }, function (data) {
            alert(data);
            SeatInfo(false);
        });
    })

    var selectseat=[];
    var selectbid = [];
    var selectemp = [];
    function seatSet(seatstr) {
        if ($.inArray(seatstr, selectseat) == -1) {
            if ($("#divseat" + seatstr).attr("class") == "mt_sli") {
                selectemp.push(seatstr);
            }
            if ($("#divseat" + seatstr).attr("name") != "") {
                if ($.inArray($("#divseat" + seatstr).attr("name"), selectbid) == -1) {
                    selectbid.push($("#divseat" + seatstr).attr("name"));
                    $("div[name='" + $("#divseat" + seatstr).attr("name") + "']").attr("class", "mt_sli area");
                }
            }
            selectseat.push(seatstr);
            document.getElementById("divseat" + seatstr).className = "mt_sli select";
        }
        else {
            if ($.inArray(seatstr, selectemp) == -1) {
                document.getElementById("divseat" + seatstr).className = "mt_sli sblock";
            }
            else {
                document.getElementById("divseat" + seatstr).className = "mt_sli";
            }
            $("div[name='" + $("#divseat" + seatstr).attr("name") + "']").attr("class", "mt_sli sblock");
            if ($.inArray($("#divseat" + seatstr).attr("name"), selectbid) != -1) {
                selectbid.splice($.inArray($("#divseat" + seatstr).attr("name"), selectbid), 1);
            }
            selectseat.splice($.inArray(seatstr, selectseat), 1);
            if ($.inArray(seatstr, selectemp) != -1) {
                selectemp.splice($.inArray(seatstr, selectemp), 1);
            }
            $("#divseat" + seatstr).removeAttr("fixed");
        }
    }

    $("#btnClear").click(function () {
        if (selectseat.length == 0) {
            alert("请先选择要清除的座位");
            return false;
        }
        var rr = false;
        $.each(selectseat, function (m, val) {
            if ($("#divseat" + val).text() != "") {
                rr = true;
            }
        });
        if (!rr) {
            $.each(selectseat, function (n, value) {
                $.post("../ajax/MeetingSeatBlankSet.ashx", {
                    mid: mid,
                    seatinfo: value,
                    type: 1
                }, function (e) {
                    document.getElementById("divseat" + value).className = e;
                }
                )
            });
            selectseat = [];
            selectemp = [];
            selectbid = [];
        }
        else {
            alert("已设置的座位不能清除");
        }
    })

    $("#btnAdd").click(function () {
        if (selectseat.length == 0) {
            alert("请先选择要还原的座位");
            return false;
        }
        $.each(selectseat, function (n, value) {
            $.post("../ajax/MeetingSeatBlankSet.ashx", {
                mid: mid,
                seatinfo: value,
                type: 0
            }, function (e) {
                document.getElementById("divseat" + value).className = e;
            }
                )
        });
        selectseat = [];
        selectemp = [];
        selectbid = [];
    })

    $("#btnMerge").click(function () {
        if (selectseat.length == 0) {
            alert("请先选择要设置的座位");
            return false;
        }
        var rr = false;
        if (selectemp.length > 0) {
            rr = true;
        }
        if (!rr) {
            $("#tzbox").show();
        }
        else {
            alert("已清除的座位不能进行设置");
        }
    })

    function hiddentz() {
        $("#tzbox").hide();
        $("#txtbName").val("");
    }

    function Submit() {
        var bName = $("#txtbName").val();
        $.post("../ajax/SeatBlockSet.ashx", {
            bid: selectbid.join(','),
            mid: mid,
            bName: bName,
            SeatBlock: selectseat.join(',')
        }, function (e) {
            $.each(selectseat, function (n, value) {
                document.getElementById("divseat" + value).className = e;
            });
            SeatBlock();
            selectseat = []; 
            selectemp = [];
            selectbid = [];
        }
        )
        $("#tzbox").hide();
        $("#txtbName").val("");
    }

    $("#btnAreaRestore").click(function () {
        if (selectseat.length == 0) {
            alert("请先选择要取消设置的座位");
            return false;
        }
        $.post("../ajax/SeatBlockClear.ashx", {
            bid: selectbid.join(','),
            SeatBlock: selectseat.join(',')
        }, function (e) {
            $.each(selectseat, function (n, value) {
                if ($.inArray(value, selectemp) == -1) {
                    document.getElementById("divseat" + value).className = e;
                }
                else {
                    document.getElementById("divseat" + value).className = "mt_sli";
                }
                $("#divseat" + value).text("");
                $("#divseat" + value).removeAttr("name");
            });
            selectseat = [];
            selectemp = [];
            selectbid = [];
        }
            )
    })

    $("#divseat").DrawSelect(
            { 'mouse_up': function (result) {
                //                $('#result').val("");
                for (var i = 0; i < result.length; i++) {
                    //                    $("#result").append($(result[i]).attr("id") + ";")
                    var seatstr = $(result[i]).attr("id").replace("divseat", "");
                    if ($.inArray(seatstr, selectseat) == -1) {
                        if ($("#divseat" + seatstr).attr("name") != "") {
                            if ($.inArray($("#divseat" + seatstr).attr("name"), selectbid) == -1) {
                                selectbid.push($("#divseat" + seatstr).attr("name"));
                                //$("div[name='" + $("#divseat" + seatstr).attr("name") + "']").attr("class", "mt_sli area");
                            }
                        }
                        selectseat.push(seatstr);
                    }
                }

            }
            }
    );
</script>
