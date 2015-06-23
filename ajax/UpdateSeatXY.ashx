<%@ WebHandler Language="C#" Class="UpdateSeatXY" %>

using System;
using System.Web;

public class UpdateSeatXY : IHttpHandler
{
    
    public void ProcessRequest (HttpContext context) {
        bool SQLExec;
        string SQLResult;
        context.Response.ContentType = "text/plain";
        string mid = context.Request["mid"];
        string SeatX = context.Request["SeatX"];
        string SeatY = context.Request["SeatY"];

        MySQL.ExecProc("usp_Meeting_UpdateSeat", new string[] { mid, SeatX, SeatY }, out SQLExec, out SQLResult);
        if (SQLExec)
        {
            context.Response.Write("保存成功");
        }
        else
        {
            context.Response.Write(SQLResult);
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}