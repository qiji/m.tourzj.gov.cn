<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test3.aspx.cs" Inherits="admin_test3" %>

<html>
<head>
    <script src="//code.jquery.com/jquery-1.9.1.js"></script>
    <script src="../js/drawselect2.js"></script>
    <style>
        div#container {
            width: 500px;
        }

        #container div {

            float: left;
            width: 100px;
            height: 100px;
            border:solid 1px #76e3a7;

        }

        #container div.selected {

            background-color: #38f84e;
        }

        div.draw {
            border: solid 1px blue;


        }
    </style>
</head>
<body>
<div id="container">
    <div>a</div>

    <div>b</div>
    <div>c</div>
    <div>d</div>
    <div>e</div>
    <div>f</div>
    <div>g</div>
    <div>h</div>
    <div>i</div>
    <div>j</div>
    <div>k</div>
    <div>l</div>
    <div>m</div>
    <div>f</div>
    <div>g</div>
    <div>h</div>
    <div>i</div>
    <div>j</div>
    <div>k</div>
    <div>l</div>
    <div>m</div>
    <div>f</div>
    <div>g</div>
    <div>h</div>
    <div>i</div>
    <div>j</div>
    <div>k</div>
    <div>l</div>
    <div>m</div>
    <div>f</div>
    <div>g</div>
    <div>h</div>
    <div>i</div>
    <div>j</div>
    <div>k</div>
    <div>l</div>
    <div>m</div>
    <div>f</div>
    <div>g</div>
    <div>h</div>
    <div>i</div>
    <div>j</div>
    <div>k</div>
    <div>l</div>
    <div>m</div>
</div>

selected:<span id="result"></span>
</body>
<script>
    $("#container").DrawSelect(
            {
                'mouse_up': function (result) {
                    $('#result').text("");
                    for (var i = 0; i < result.length; i++) {
                        $("#result").append($(result[i]).text() + ";")
                    }
                }
            }
    );
</script>
</html>