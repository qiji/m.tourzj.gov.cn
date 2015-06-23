<%@ WebHandler Language="C#" Class="GetMeetInfo" %>

using System;
using System.Web;
using System.Data;

public class GetMeetInfo : IHttpHandler
{
    bool sqlexec;
    string sqlresult;
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string mid = context.Request["mid"];
        DataTable dt = MySQL.ExecProc("usp_M_Info_GetByMid", new string[] { mid }, out sqlexec, out sqlresult).Tables[0];
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