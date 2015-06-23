<%@ WebHandler Language="C#" Class="SeatBlockClear" %>

using System;
using System.Web;
using System.Data;

public class SeatBlockClear : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        bool sqlexec;
        string sqlresult;
        DataTable dt = MySQL.ExecProc("usp_Meeting_SeatBlockCancel", new string[] { context.Request["bid"], context.Request["SeatBlock"] }, out sqlexec, out sqlresult).Tables[0];

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