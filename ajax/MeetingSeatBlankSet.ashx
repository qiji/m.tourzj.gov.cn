<%@ WebHandler Language="C#" Class="MeetingSeatBlankSet" %>

using System;
using System.Web;
using System.Data;

public class MeetingSeatBlankSet : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        bool sqlexec;
        string sqlresult;

        string[] ss = context.Request["seatinfo"].Split('_');

        if (context.Request["type"] == "1")
        {
            DataTable dt = MySQL.ExecProc("usp_Meeting_SeatInitInfo_Save", new string[] { context.Request["mid"], ss[0], ss[1] }, out sqlexec, out sqlresult).Tables[0];

            context.Response.Write(dt.Rows[0][1].ToString());
        }
        else
        {
            DataTable dt = MySQL.ExecProc("usp_Meeting_SeatInitInfo_Restore", new string[] { context.Request["mid"], ss[0], ss[1] }, out sqlexec, out sqlresult).Tables[0];

            context.Response.Write(dt.Rows[0][1].ToString());
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