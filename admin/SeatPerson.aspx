<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SeatPerson.aspx.cs" Inherits="admin_SeatPerson" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>排座位</title>
    <link href="../Css/seatpc.css" rel="stylesheet" type="text/css" />
    <script src="//code.jquery.com/jquery-1.9.1.js"></script>
    <link href="../css/common.css" type="text/css" rel="Stylesheet" />
    <link href="../css/FrameWork.css" type="text/css" rel="Stylesheet" />
    <link href="../css/DataList.css" type="text/css" rel="Stylesheet" />
    <link href="../css/PageStyle.css" type="text/css" rel="Stylesheet" />
    <script language="javascript" type="text/javascript" src="../js/adminframe/frameJS.js"></script>
    <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="cibody" id="cibody">
    <div class="mainNav">
            排座位&nbsp;&nbsp;<input id="btnSeatInitialize" type="button" value="座位初始化" />
        </div>
    <div style="width: 400px; float: left; word-wrap: break-word">
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
        <div id="divUserInfo" class="cilr" style="border:1px solid blue;">
            <%--显示人员信息--%>
        </div>
        <div id="divSelectUser" class="cilr" style="border:1px solid blue;">
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

    $(function () {
        $("#divSelectUser").draggable();
        $(".sblock").droppable({
            drop: function (event, ui) {
                alert("成功");
            }
        });
        Seatinit();
        SeatBlock();
    });

    $("#btnSeatInitialize").click(function () {
        location.href = "SeatInitialize.aspx?mid=" + mid + "&width=" + $(document).width() + "&height=" + $(document).height();
    })

    function SearchUser() {
        $.get("../ajax/MeetSeatUserSearch.ashx?mid=" + mid + "&r=" + Math.random() + "&uName=" + document.getElementById("tbUser").value, function (e) {
            document.getElementById("divUserInfo").innerHTML = e;
        });
    }

    function selectuser(e) {
        var val = $(e).val();
        var text = $(e).next().text().split(' ')[2];
        var html = "<span id='" + val + "'>" + text + "</span>&nbsp;&nbsp;<a href='' onclick='deluser()'>移除</a><br/>";
        $("#divSelectUser").html($("#divSelectUser").html() + html);
        $(e).parents("span").remove();
    }

    function deluser() {

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
        $.get("../ajax/MeetingSeatBlockGet.ashx?mid=" + mid, function (e) {
            if (e != "") {
                var ss = e.split('|');
                $.each(ss, function (n, value) {
                    var tt = value.split('+');
                    var bid = tt[0];
                    var bname = tt[1];
                    var xx = tt[2].split(',');
                    var oldbid = "";
                    $.each(xx, function (m, val) {
                        if (bid != oldbid) {
                            $("#divseat" + val).text(bname);
                            oldbid = bid;
                        }
                        $("#divseat" + val).css("margin-right", "0px");
                        $("#divseat" + val).attr("name", bid);
                    });
                });
            }
        });
    }
</script>
