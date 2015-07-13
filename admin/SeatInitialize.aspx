<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SeatInitialize.aspx.cs" Inherits="admin_SeatInitialize" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>座位设置</title>
    <link href="../Css/seatpc.css" rel="stylesheet" type="text/css" />
    <script src="//code.jquery.com/jquery-1.9.1.js"></script>
    <link href="../css/common.css" type="text/css" rel="Stylesheet" />
    <link href="../css/FrameWork.css" type="text/css" rel="Stylesheet" />
    <link href="../css/DataList.css" type="text/css" rel="Stylesheet" />
    <link href="../css/PageStyle.css" type="text/css" rel="Stylesheet" />
    <script language="javascript" type="text/javascript" src="../js/adminframe/frameJS.js"></script>
    <script src="../js/drawselect2.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="cibody" id="cibody">
    <div class="mainNav">
            座位初始化&nbsp;&nbsp;<input id="btnSeat" type="button" value="排座位" />
        </div>
    <div class="ciline">
                <div class="cilr">
                    会场位置
                </div>
                <div class="cilr">
                    横排<input id="tbSeatX" runat="server" type="text" style="width:50px" />
                    竖排<input id="tbSeatY" runat="server" type="text" style="width:50px"/>
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
    </form>
</body>
</html>
<script>
    var mid = "<%= mid %>";
    var tab = "<%= tab %>";
    $(function () {
        Seatinit();
        SeatWeight();
        SeatBlock();
    });

    function Seatinit() {
        $.ajax({
            type: "get",
            url: "../ajax/MeetingSeatBlankGet.ashx",
            data: "mid=" + mid,
            async: false,
            success: function (e) {
                if (e != "") {
                    var ss = e.split(',');
                    for (i = 0; i < ss.length; i++) {
                        if (ss[i] != "") {
                            if (document.getElementById("divseat" + ss[i]) != null) {
                                document.getElementById("divseat" + ss[i]).className = "mt_sli";
                                $("#divseat" + ss[i]).attr('clear', 'clear')
                            }
                        }
                    }
                }
            }
        });
    }

    function SeatWeight() {
        $.get("../ajax/MeetingSeatWeightGet.ashx?mid=" + mid, function (e) {
            if (e != "") {
                var ss = e.split(',');
                for (i = 0; i < ss.length; i++) {
                    if (ss[i] != "") {
                        var xx = ss[i].split('+');
                        if (document.getElementById("divseat" + xx[1]) != null && $("#divseat" + xx[1]).attr("class") != "mt_sli") {
                            $("#divseat" + xx[1]).html(xx[0]+ "&nbsp;"+$("#divseat" + xx[1]).html());
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
                        $("#divseat" + val).html($("#divseat" + val).html().substring(0, $("#divseat" + val).html().indexOf("&nbsp;")) + "&nbsp;" + bname);
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
            window.location.reload();
        });
    })

    var selectseat = [];
    var selectbid = [];
    var selectemp = [];
    function seatSet(seatstr) {
            if ($("#divseat" + seatstr).attr("clear") == "clear") {
                selectemp.push(seatstr);
            }
            if ($("#divseat" + seatstr).attr("name") != "") {
                if ($.inArray($("#divseat" + seatstr).attr("name"), selectbid) == -1) {
                    selectbid.push($("#divseat" + seatstr).attr("name"));
                }
            }
            selectseat.push(seatstr);
    }

    $("#btnClear").click(function () {
        if (selectseat.length == 0) {
            alert("请先选择要清除的座位");
            return false;
        }
        var rr = false;
        $.each(selectseat, function (m, val) {
            var block = $("#divseat" + val).html().substring($("#divseat" + val).html().indexOf("&nbsp;"), $("#divseat" + val).html().length).replace("&nbsp;", "")
            if (block != "") {
                rr = true;
            }
        });
        if (!rr) {
            var xcount = $("#tbSeatX").val();
            $.each(selectseat, function (n, value) {
                var y = value.split('_')[1];
                var scount = 0;
                for (var i = 0; i < xcount; i++) {
                    if ($("#divseat" + i + "_" + y).attr("class") != "mt_sli") {
                        scount++;
                    }
                }
                $.ajax({
                    type: "post",
                    url: "../ajax/MeetingSeatBlankSet.ashx",
                    data: "mid=" + mid + "&seatinfo=" + value + "&type=1&seatx=" + scount + "&xcount="+xcount,
                    async: false,
                    success: function (e) {
                        document.getElementById("divseat" + value).className = e;
//                        $("#divseat" + value).attr('clear', 'clear')
//                        $("#divseat" + value).removeAttr("fixed");
//                        $("#divseat" + value).html("");
                        window.location.reload();
                    }
                });
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
        var xcount = $("#tbSeatX").val();
        $.each(selectseat, function (n, value) {
            var y = value.split('_')[1];
            var scount = 0;
            for (var i = 0; i < xcount; i++) {
                if ($("#divseat" + i + "_" + y).attr("class") == "mt_sli sblock") {
                    scount++;
                }
            }
            $.ajax({
                type: "post",
                url: "../ajax/MeetingSeatBlankSet.ashx",
                data: "mid=" + mid + "&seatinfo=" + value + "&type=0&seatx=" + scount + "&xcount=" + xcount,
                async: false,
                success: function (e) {
                    document.getElementById("divseat" + value).className = e;
//                    $("#divseat" + value).removeAttr("clear");
//                    $("#divseat" + value).removeAttr("fixed");
                    window.location.reload();
                }
            });
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
                $("#divseat" + value).removeAttr("fixed");
            });
            SeatBlock();
            $(".area").removeClass("area").addClass("sblock");
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
                $("#divseat" + value).html($("#divseat" + value).html().substring(0, $("#divseat" + value).html().indexOf("&nbsp;")) + "&nbsp;")
                $("#divseat" + value).removeAttr("name");
                $("#divseat" + value).removeAttr("fixed");
            });
            $(".area").removeClass("area").addClass("sblock");
            selectseat = [];
            selectemp = [];
            selectbid = [];
        }
            )
    })

    $("#divseat").DrawSelect(
                {
                    'on_select_complete': function (result) {
                        selectseat = [];
                        selectemp = [];
                        selectbid = [];
                        for (var i = 0; i < result.length; i++) {
                            var seatstr = $(result[i]).attr("id").replace("divseat", "");
                            seatSet(seatstr);
                        }
                    }
                }
    );

    $("#btnSeat").click(function () {
        if (tab == "0") {
            alert("请先初始化座位信息");
        }
        else {
            location.href = "SeatPersonSet.aspx?mid=" + mid + "&width=" + $(document).width() + "&height=" + $(document).height();
        }
    })
</script>
