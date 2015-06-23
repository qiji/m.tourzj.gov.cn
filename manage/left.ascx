<%@ Control Language="C#" AutoEventWireup="true" CodeFile="left.ascx.cs" Inherits="left" %>
<div id="divMenu">
    <div id="cleft" class="cleft">
        <div id="ctl00_left1_divMenu">
            <div id="b0" class="cleftbox" runat="server">
                <div onclick="BClick('b00');" class="cleftTit">
                    <div id="b00t" class="cleftclose">
                    </div>
                    <div class="cleftTitText">
                        <h3>
                            后台管理</h3>
                    </div>
                </div>
                <div id="b00">
                    <ul>
                        <li id="b0001" class="cli" onmouseover="LeftOnOver('b00','01');" onmouseout="LeftOnLeave('b00','01');">
                            <a href="WelCome.aspx">账号信息</a></li>
                        <li id="b0002" class="cli" onmouseover="LeftOnOver('b00','02');" onmouseout="LeftOnLeave('b00','02');">
                            <a href="password.aspx">修改密码</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<script language="javascript" type="text/javascript">
    var _currid = "<%=_currid %>";
    var _nextid = _currid;
    var _thid = "";
    if (_currid != "null") {
        document.getElementById(_currid).className = "clihover";
        var tcl = _currid.substr(0, 3);
        document.getElementById(tcl).style.display = "";
        document.getElementById(tcl + 't').className = "cleftopen";
    }

    function LeftOnOver(typeid, _id) {
        _thid = typeid + _id;
        document.getElementById(_thid).className = "clihover";


        if (_nextid != _currid && _nextid != _thid) {

        }
        _nextid = _thid;
    }
    function LeftOnLeave(typeid, _id) {
        if (_currid != (typeid + _id)) {
            //不操作
            document.getElementById(typeid + _id).className = "cli";

        }
    }

    function BClick(bid) {
        if (document.getElementById(bid).style.display == "none") {
            document.getElementById(bid).style.display = "";
            document.getElementById(bid + 't').className = "cleftopen";
        }
        else {
            document.getElementById(bid).style.display = "none";
            document.getElementById(bid + 't').className = "cleftclose";
        }
    }  
</script>
