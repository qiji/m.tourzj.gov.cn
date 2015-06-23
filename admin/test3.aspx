<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test3.aspx.cs" Inherits="admin_test3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>Selectables demo - Interface plugin for jQuery</title>
    <script src="//code.jquery.com/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="../js/interface.js"></script>
    <style type="text/css" media="all">
        body
        {
            background: #fff;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 11px;
        }
        .selectableitem
        {
            width: 160px;
            height: 140px;
            margin: 10px;
            float: left;
            text-align: center;
            padding: 10px;
            border: 2px solid #fff;
        }
        .selectableitem p
        {
            font-weight: bold;
        }
        .selectableitem div
        {
            line-height: 120px;
            height: 120px;
        }
        .selectableitem div img
        {
        }
        .selecteditem
        {
            border: 2px solid #999;
        }
        .selecthelper
        {
            background-color: #000;
            filter: alpha(opacity=30);
            -moz-opacity: 0.3;
            opacity: 0.3;
        }
        .serializer
        {
            clear: both;
            margin: 20px 0;
        }
        .serializer a
        {
            color: #33f;
        }
        .serializer a:hover
        {
            color: #FF6600;
        }
        .msd
        {
            width: 700px;
            height: 400px;
            overflow: auto;
        }
    </style>
</head>
<body>
    <div class="msd">
        <div class="selectableitem" id="item1">
            <div>
                <img src="images/brasov2.jpg" alt="" /></div>
            <p>
                Item 1</p>
        </div>
        <div class="selectableitem" id="item2">
            <div>
                <img src="images/brasov3.jpg" alt="" /></div>
            <p>
                Item 2</p>
        </div>
        <div class="selectableitem" id="item3">
            <div>
                <img src="images/brasov7.jpg" alt="" /></div>
            <p>
                Item 3</p>
        </div>
        <div class="selectableitem" id="item4">
            <div>
                <img src="images/brasov18.jpg" alt="" /></div>
            <p>
                Item 4</p>
        </div>
        <div class="selectableitem" id="item5">
            <div>
                <img src="images/brasov22.jpg" alt="" /></div>
            <p>
                Item 5</p>
        </div>
        <div class="selectableitem" id="item6">
            <div>
                <img src="images/brasov26.jpg" alt="" /></div>
            <p>
                Item 6</p>
        </div>
        <div class="selectableitem" id="item7">
            <div>
                <img src="images/brasov2.jpg" alt="" /></div>
            <p>
                Item 7</p>
        </div>
        <div class="selectableitem" id="item8">
            <div>
                <img src="images/brasov3.jpg" alt="" /></div>
            <p>
                Item 8</p>
        </div>
        <div class="selectableitem" id="item9">
            <div>
                <img src="images/brasov7.jpg" alt="" /></div>
            <p>
                Item 9</p>
        </div>
        <div class="selectableitem" id="item10">
            <div>
                <img src="images/brasov18.jpg" alt="" /></div>
            <p>
                Item 10</p>
        </div>
        <div class="selectableitem" id="item11">
            <div>
                <img src="images/brasov22.jpg" alt="" /></div>
            <p>
                Item 11</p>
        </div>
        <div class="selectableitem" id="item12">
            <div>
                <img src="images/brasov26.jpg" alt="" /></div>
            <p>
                Item 12</p>
        </div>
    </div>
    <input type="button" onclick="test()" value="OK" />
    <script type="text/javascript">

    function test()
    {
        $(".selecteditem").html("abc");
    }

    $('div.msd').Selectable(
	{
	    accept: 'selectableitem',
	    opacity: 0.2,
	    selectedclass: 'selecteditem',
	    helperclass: 'selecthelper',       
	}


);
    </script>
</body>
</html>
