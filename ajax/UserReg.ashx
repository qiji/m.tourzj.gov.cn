<%@ WebHandler Language="C#" Class="UserReg" %>

using System;
using System.Web;
using System.Data;

public class UserReg : IHttpHandler
{
    bool sqlexec;
    string sqlresult;
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string id = context.Request["ID"];
        string mid = context.Request["mid"];
        string openid = context.Request["openid"];
        string mobile = context.Request["mobile"];
        string name = context.Request["name"];
        string sex = context.Request["sex"];
        string unit = context.Request["unit"];
        string job = context.Request["job"];
        string uGroup = context.Request["uGroup"];
        string remark = context.Request["remark"];

        MySQL.ExecProc("usp_Meeting_User_Save", new string[] { id, mid, name, unit, job, sex, mobile, "0", openid, uGroup, remark }, out sqlexec, out sqlresult);

        if (sqlexec)
        {
            context.Response.Write("T");
        }
        else
        {
            context.Response.Write(sqlresult);
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