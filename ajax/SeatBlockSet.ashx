<%@ WebHandler Language="C#" Class="SeatBlockSet" %>

using System;
using System.Web;
using System.Data;

public class SeatBlockSet : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        bool sqlexec;
        string sqlresult;
        DataTable dt = MySQL.ExecProc("usp_Meeting_SeatBlockSave", new string[] { context.Request["bid"], context.Request["mid"], context.Request["bName"], context.Request["SeatBlock"] }, out sqlexec, out sqlresult).Tables[0];

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