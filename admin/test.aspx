﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="admin_test" %>

<html>
<head>
<script src="http://code.jquery.com/jquery-1.4.4.min.js" type="text/javascript"></script>
</head>
<body>
<input type="checkbox" name="chk_list" id="chk_list_1" value="1" />1<br />
<input type="checkbox" name="chk_list" id="chk_list_2" value="2" />2<br />
<input type="checkbox" name="chk_list" id="chk_list_3" value="3" />3<br />
<input type="checkbox" name="chk_list" id="chk_list_4" value="4" />4<br />
<input type="checkbox" name="chk_all" id="chk_all" />全选/取消全选
<script type="text/javascript">
    $("#chk_all").click(function () {
        $("input[name='chk_list']").attr("checked", $(this).attr("checked"));
    });
</script>
</body>
</html>