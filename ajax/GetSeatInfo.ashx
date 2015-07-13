<%@ WebHandler Language="C#" Class="GetSeatInfo" %>

using System;
using System.Web;
using System.Data;

public class GetSeatInfo : IHttpHandler
{
    bool sqlexec;
    string sqlresult;
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string mid = context.Request["mid"];
        DataTable dt = MySQL.ExecProc("usp_M_Info_GetByMid", new string[] { mid }, out sqlexec, out sqlresult).Tables[0];
        string result = "";
        result += dt.Rows[0]["SeatX"].ToString()+"|";
        result += dt.Rows[0]["SeatY"].ToString() + "|";
        if (dt.Rows[0]["SeatX"].ToString() == "0")
        {
            result += 1 + "|";
        }
        else
        {
            result += 0 + "|";
        }
        context.Response.Write(result);
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}