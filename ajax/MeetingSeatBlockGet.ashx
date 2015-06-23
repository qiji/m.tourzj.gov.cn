<%@ WebHandler Language="C#" Class="MeetingSeatBlockGet" %>

using System;
using System.Web;
using System.Data;

public class MeetingSeatBlockGet : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        bool sqlexec;
        string sqlresult;
        DataTable dt = MySQL.ExecProc("usp_Meeting_SeatBlock_GetBymid", new string[] { context.Request["mid"].ToString() }, out sqlexec, out sqlresult).Tables[0];

        string str = "";
        foreach (DataRow dr in dt.Rows)
        {
            str += dr["BID"].ToString() + "+" + dr["bName"].ToString() +"+"+dr["SeatBlock"].ToString()+"|";
        }

        context.Response.Write(str.TrimEnd('|'));
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}