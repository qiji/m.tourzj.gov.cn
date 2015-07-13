<%@ WebHandler Language="C#" Class="MeetingSeatGet" %>

using System;
using System.Web;
using System.Data;

public class MeetingSeatGet : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        bool sqlexec;
        string sqlresult;
        DataTable dt = MySQL.ExecProc("usp_Meeting_Seat_GetBymid", new string[] { context.Request["mid"].ToString() }, out sqlexec, out sqlresult).Tables[0];

        context.Response.Write(Newtonsoft.Json.JsonConvert.SerializeObject(dt));
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}