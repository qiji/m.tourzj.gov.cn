<%@ WebHandler Language="C#" Class="UserJoin" %>

using System;
using System.Web;
using System.Data;

public class UserJoin : IHttpHandler
{
    bool sqlexec;
    string sqlresult;
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";

        WeiCookieInfo uc = new WeiXinUserCookie(WeiXinUserCookie.CookierUser).GetCookiesValues();


        string mobile = context.Request["mobile"];
        MySQL.ExecProc("usp_meeting_UserJoin", new string[] { mobile, uc.OpenId, uc.MId }, out sqlexec, out sqlresult);

        if (sqlexec)
        {
            context.Response.Write("T");
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