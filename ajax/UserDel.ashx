<%@ WebHandler Language="C#" Class="UserDel" %>

using System;
using System.Web;

public class UserDel : IHttpHandler
{
    bool sqlexec;
    string sqlresult;
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string id = context.Request["ID"];

        MySQL.ExecProc("usp_Meeting_User_Del", new string[] { id }, out sqlexec, out sqlresult);

    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}