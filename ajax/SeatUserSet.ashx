<%@ WebHandler Language="C#" Class="SeatUserSet" %>

using System;
using System.Data;
using System.Web;

public class SeatUserSet : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        bool sqlexec;
        string sqlresult;
        string seatx = null;
        string seaty = null;
        string bid = null;
        if (!string.IsNullOrEmpty(context.Request["seat"]))
        {
            if (context.Request["seat"].IndexOf("_") > 0)
            {
                string[] ss = context.Request["seat"].Split('_');
                seatx = ss[0];
                seaty = ss[1];
            }
        }
        if (context.Request["bid"]!="null")
        {
            bid = context.Request["bid"];
        }

        MySQL.ExecProc("usp_Meeting_Seat_UserSet", new string[] { context.Request["uid"], seatx, seaty, bid, context.Request["olduid"], context.Request["type"] }, out sqlexec, out sqlresult);
        if (sqlexec)
        {
            context.Response.Write(sqlresult);
        }
        else
        {
            context.Response.Write("F");
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}