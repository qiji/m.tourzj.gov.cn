<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SeatPersonSet.aspx.cs" Inherits="admin_SeatPersonSet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>排座位</title>
    <link href="../Css/seatpc.css" rel="stylesheet" type="text/css" />
    <script src="//code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/jquery-1.4.4.min.js" type="text/javascript"></script>
    <link href="../css/common.css" type="text/css" rel="Stylesheet" />
    <link href="../css/FrameWork.css" type="text/css" rel="Stylesheet" />
    <link href="../css/DataList.css" type="text/css" rel="Stylesheet" />
    <link href="../css/PageStyle.css" type="text/css" rel="Stylesheet" />
    <script language="javascript" type="text/javascript" src="../js/adminframe/frameJS.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="cibody" id="cibody">
    <div class="mainNav">
            排座位&nbsp;&nbsp;<input id="btnSeatInitialize" type="button" value="座位初始化" />
        </div>
    <div style="width: 400px; float: left; word-wrap: break-word">
      <div class="ciline">
        <div class="cilr">
            <input id="chkAll" type="checkbox" name="chkAll"/>&nbsp;<label>全选</label>
        </div>
        <div class="cilr">
            <input type="button" id="btnMutAddSeat" value="批量添加座位" onclick="MutAddSeat()" />
        </div>
        <div class="cilr">
            <input type="button" id="btnAuto" value="自动排座" onclick="AutoSeat()" />
        </div>
        </div>
      <div class="ciline">  
        <div class="cill">
            单位/姓名/手机
        </div>
        <div class="cilr">
            <input type="text" id="tbUser"/>
        </div>
        <div class="cilr">
            <input type="button" id="btSearch" value="搜索" onclick="SearchUser()" />
        </div>
      <div class="ciline">  
        <div id="divUserInfo" class="cilr">
            <%--显示人员信息--%>
        </div>
      </div>
      </div>
    </div>
    <div class="mtintro" style="width: 73%; float: left">
        <div class="mt_other">
            主席台</div>
        <div id="divseat" class="mtseats" runat="server">
                </div>
    </div>
    </div>
    </form>
</body>
</html>
<script>
    var mid = "<%= mid %>";
    var currseat;
    var oldclass;
    var currbid;
    var olduid;
    var uids = [];
    $(function () {
        Seatinit();
        SeatBlock();
        SeatSet();
    });

    function chkid(e) {
        if ($(e).attr("checked")) {
            uids.push($(e).next().next().attr("id"));
        }
        else {
            uids.splice($.inArray($(e).next().next().attr("id"), uids), 1);
        }
    }

    $("#chkAll").click(function () {
        uids = [];
        $("input[name='meetuser']").attr("checked", $(this).attr("checked"));
        $("input[name='meetuser']").each(function () {
            if ($(this).attr("checked")) {
                uids.push($(this).next().next().attr("id"));
            }
            else {
                uids.splice($.inArray($(this).next().next().attr("id"), uids), 1);
            }
        })
    });

    $("#btnSeatInitialize").click(function () {
        location.href = "SeatInitialize.aspx?mid=" + mid + "&width=" + $(document).width() + "&height=" + $(document).height();
    })

    function SearchUser() {
        $.get("../ajax/MeetSeatUserSearch.ashx?mid=" + mid + "&r=" + Math.random() + "&uName=" + document.getElementById("tbUser").value, function (e) {
            document.getElementById("divUserInfo").innerHTML = e;
        });
        uids = [];
    }

    function selectseat(seatstr) {
        if (typeof ($("#divseat" + seatstr).attr("clear")) == "undefined") {
            if (typeof ($("#divseat" + seatstr).attr("uid")) == "undefined") {
                olduid = 0;
            }
            else {
                olduid = $("#divseat" + seatstr).attr("uid");
            }
            if (currseat == null&&currbid==null) {
                oldclass = document.getElementById("divseat" + seatstr).className;
                if (typeof ($("#divseat" + seatstr).attr("name")) == "undefined") {
                    document.getElementById("divseat" + seatstr).className = "mt_sli select";
                    currseat = seatstr;
                }
                else {
                    $("div[name='" + $("#divseat" + seatstr).attr("name") + "']").attr("class", "mt_sli select");
                    currbid = $("#divseat" + seatstr).attr("name");
                }
            }
            else {
                if (currseat != null && currseat != seatstr) {
                    document.getElementById("divseat" + currseat).className = oldclass;
                    currseat = null;
                    oldclass = document.getElementById("divseat" + seatstr).className;
                    if (typeof ($("#divseat" + seatstr).attr("name")) == "undefined") {
                        document.getElementById("divseat" + seatstr).className = "mt_sli select";
                        currseat = seatstr;
                    }
                    else {
                        $("div[name='" + $("#divseat" + seatstr).attr("name") + "']").attr("class", "mt_sli select");
                        currbid = $("#divseat" + seatstr).attr("name");
                    }
                }
                else if (currbid != null && currbid != $("#divseat" + seatstr).attr("name")) {
                    $("div[name='" + currbid + "']").attr("class", oldclass);
                    currbid = null;
                    oldclass = document.getElementById("divseat"+ seatstr).className;
                    if (typeof ($("#divseat" + seatstr).attr("name")) == "undefined") {
                        document.getElementById("divseat" +seatstr).className = "mt_sli select";
                        currseat = seatstr;
                    }
                    else {
                        $("div[name='" + $("#divseat" +seatstr).attr("name") + "']").attr("class", "mt_sli select");
                        currbid = $("#divseat" + seatstr).attr("name");
                    }
                }
                else {
                    if (typeof ($("#divseat" + seatstr).attr("name")) == "undefined") {
                        document.getElementById("divseat" + seatstr).className = oldclass;
                        currseat = null;
                    }
                    else {
                        $("div[name='" + $("#divseat" + seatstr).attr("name") + "']").attr("class", oldclass);
                        currbid = null;
                    }
                }
            }
        }
    }

    function AddSeat(e) {
        var type;
        var seat;
        if ($(e).attr("seat") == "") {
            type = 0;
            if (currseat != null) {
                seat = currseat;
            }
            else {
                seat = currbid;
            }
        }
        else {
            type = 1;
            seat = $(e).attr("seat");
        }
        if (type == 0) {
            if (currseat == null && currbid == null) {
                alert("请选择一个座位或区域");
                return false;
            }
        }
        $.post("../ajax/SeatUserSet.ashx", {
            uid: $(e).attr("id"),
            seat: seat,
            bid: currbid,
            olduid: olduid,
            type: type
        }, function (data) {
            if (data != "F") {
                if (type == 0) {
                    if (currseat != null) {
                        if ($("#divseat" + currseat).attr("uid") != null) {
                            $("#" + $("#divseat" + currseat).attr("uid")).text("添加座位");
                            $("#" + $("#divseat" + currseat).attr("uid")).attr("seat", "");
                        }
                        $("#divseat" + currseat).attr("uid", $(e).attr("id"));
                        $("#divseat" + currseat).html($(e).attr("user"));
                        $("#divseat" + currseat).attr("class", "mt_sli smyseat");
                    }
                    else {
                        $("div[name='" + currbid + "']").each(function () {
                            if (typeof ($(this).attr("set")) == "undefined") {
                                $(this).attr("set", $(this).html());
                                $(this).html($(e).attr("user"));
                                return false;
                            }
                        });
                        $("div[name='" + currbid + "']").attr("class", "mt_sli smyseat");
                    }
                    $(e).text("移除座位");
                    $(e).attr("seat", seat);
                    $("#chkadd" + $(e).attr("id")).remove();
                    currseat = null;
                    currbid = null;
                }
                else {
                    if (seat.indexOf('_') > 0) {
                        $("#divseat" + seat).removeAttr("uid");
                        $("#divseat" + seat).html("");
                        $("#divseat" + seat).attr("class", "mt_sli sblock");
                    }
                    else {
                        $("div[name='" + seat + "']").attr("class", "mt_sli sblock");
                        $("div[name='" + seat + "']").removeAttr("set");
                        SeatBlock();
                        SeatSet();
                    }
                    $(e).text("添加座位");
                    $(e).attr("seat", "");
                    $(e).prev().before("<input id=\"chkadd" + $(e).attr("id") + "\" name=\"meetuser\" type=\"checkbox\" onclick=\"chkid(this)\" />");
                    }
            }
        });
    }

    function MutAddSeat() {
        if (currbid == null) {
            alert("请选择一个区域");
            return false;
        }
        if (uids.length == 0) {
            alert("请至少选择一个人员");
            return false;
        }
        $.each(uids, function (n, value) {
            $.ajax({
                type: "post",
                url: "../ajax/SeatUserSet.ashx",
                data: "uid=" + value + "&seat=" + currbid + "&bid=" + currbid + "&olduid=" + olduid + "&type=0",
                async: false,
                success: function (data) {
                    if (data != "F") {
                        $("div[name='" + currbid + "']").each(function () {
                            if (typeof ($(this).attr("set")) == "undefined") {
                                $(this).attr("set", $(this).html());
                                $(this).html($("#" + value).attr("user"));
                                return false;
                            }
                        });
                        $("div[name='" + currbid + "']").attr("class", "mt_sli smyseat");
                        $("#" + value).text("移除座位");
                        $("#" + value).attr("seat", currbid);
                        $("#chkadd" + value).remove();
                    }
                }
            });
        });
        currseat = null;
        currbid = null;
        uids = [];
    }

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

    function SeatBlock() {
        $.ajax({
            type: "get",
            url: "../ajax/MeetingSeatBlockGet.ashx",
            data: "mid=" + mid,
            async: false,
            success: function (e) {
                if (e != "") {
                    var ss = e.split('|');
                    $.each(ss, function (n, value) {
                        var tt = value.split('+');
                        var bid = tt[0];
                        var bname = tt[1];
                        var xx = tt[2].split(',');
                        $.each(xx, function (m, val) {
                            $("#divseat" + val).text(bname);
                            $("#divseat" + val).css("margin-right", "0px");
                            $("#divseat" + val).attr("name", bid);
                        });
                    });
                }
            }
        });
    }

    function SeatSet() {
        $.getJSON("../ajax/MeetingSeatGet.ashx?mid=" + mid, function (e) {
            if (e != "") {
                $.each(e, function (n, value) {
                    if (value.SeatX != null) {
                        $("#divseat" + value.SeatX + "_" + value.SeatY).attr("uid", value.ID);
                        $("#divseat" + value.SeatX + "_" + value.SeatY).html(value.pName);
                        $("#divseat" + value.SeatX + "_" + value.SeatY).attr("class", "mt_sli smyseat");
                    }
                    else {
                        $("div[name='" + value.BID + "']").each(function () {
                            if (typeof ($(this).attr("set")) == "undefined") {
                                $(this).attr("set", $(this).html());
                                $(this).html(value.pName);
                                return false;
                            }
                        });
                        $("div[name='" + value.BID + "']").attr("class", "mt_sli smyseat");
                    }
                });
            }
        });
    }

    function AutoSeat() {
        $("#divUserInfo").html("");
        uids = [];
        $("#chkAll").attr("checked", false);
        $(".sblock").each(function () {
            if (typeof ($(this).attr("uid")) == "undefined" && typeof ($(this).attr("name")) == "undefined") {
                var seat = $(this).attr("id").replace("divseat", "");
                $.ajax({
                    type: "post",
                    url: "../ajax/SeatUserAutoSet.ashx",
                    data: "mid=" + mid + "&seat=" + seat,
                    async: false,
                    success: function (data) {
                        if (data != "F"&&data!="") {
                            var xx = data.split(',');
                            $("#divseat"+seat).attr("uid", xx[1]);
                            $("#divseat" + seat).html(xx[2]);
                            $("#divseat" + seat).attr("class", "mt_sli smyseat");
                        }
                    }
                });
            }
        });
    }
</script>

