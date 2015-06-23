<%@ WebHandler Language="C#" Class="IsExitMeetingSeat" %>

using System;
using System.Web;
using System.Data;

public class IsExitMeetingSeat : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        bool sqlexec;
        string sqlresult;

        string[] ss = context.Request["seatinfo"].Split('_');
        DataTable dt = MySQL.ExecProc("usp_Meeting_IsExitSeatInit", new string[] { context.Request["mid"], ss[0], ss[1] }, out sqlexec, out sqlresult).Tables[0];

        context.Response.Write(dt.Rows[0][1].ToString());
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}