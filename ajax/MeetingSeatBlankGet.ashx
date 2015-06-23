<%@ WebHandler Language="C#" Class="MeetingSeatBlankGet" %>

using System;
using System.Web;
using System.Data;

public class MeetingSeatBlankGet : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        bool sqlexec;
        string sqlresult;
        DataTable dt = MySQL.ExecProc("usp_Meeting_SeatInit_GetBymid", new string[] { context.Request["mid"].ToString() }, out sqlexec, out sqlresult).Tables[0];

        string str = "";
        foreach (DataRow dr in dt.Rows)
        {
            str += dr["SeatX"].ToString() + "_" + dr["SeatY"].ToString() + ",";
        }

        context.Response.Write(str);
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}