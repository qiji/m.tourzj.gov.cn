<%@ WebHandler Language="C#" Class="MeetingSeatWeightGet" %>

using System;
using System.Web;
using System.Data;

public class MeetingSeatWeightGet : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        bool sqlexec;
        string sqlresult;
        DataTable dt = MySQL.ExecProc("usp_Meeting_SeatWeight_GetBymid", new string[] { context.Request["mid"].ToString() }, out sqlexec, out sqlresult).Tables[0];

        string str = "";
        foreach (DataRow dr in dt.Rows)
        {
            str += dr["Weight"].ToString() + "+" + dr["SeatX"].ToString() + "_" + dr["SeatY"].ToString() + ",";
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