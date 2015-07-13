<%@ WebHandler Language="C#" Class="SeatUserAutoSet" %>

using System;
using System.Data;
using System.Web;

public class SeatUserAutoSet : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        bool sqlexec;
        string sqlresult;
        string seatx = null;
        string seaty = null;
        
        if (!string.IsNullOrEmpty(context.Request["seat"]))
        {
            if (context.Request["seat"].IndexOf("_") > 0)
            {
                string[] ss = context.Request["seat"].Split('_');
                seatx = ss[0];
                seaty = ss[1];
            }
        }

        DataTable dt=MySQL.ExecProc("usp_Meeting_Seat_UserAutoSet", new string[] { seatx, seaty, context.Request["mid"] }, out sqlexec, out sqlresult).Tables[0];
        if (sqlexec)
        {
            context.Response.Write(dt.Rows[0][1].ToString());
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