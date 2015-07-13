<%@ WebHandler Language="C#" Class="MeetSeatUserSearch" %>

using System;
using System.Web;
using System.Data;

public class MeetSeatUserSearch : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        bool sqlexec;
        string sqlresult;


        DataTable dt = MySQL.ExecProc("usp_Meeting_SeatSearchUser",
            new string[] { context.Request["mid"], context.Request["uName"] },
            out sqlexec, out sqlresult).Tables[0];
        string result = "";
        foreach (DataRow dr in dt.Rows)
        {
            if (string.IsNullOrEmpty(dr["BID"].ToString()) && string.IsNullOrEmpty(dr["SeatX"].ToString()))
            {
                result += "<input id=\"chkadd" + dr["ID"].ToString() + "\" name=\"meetuser\" type=\"checkbox\" onclick=\"chkid(this)\" /><span>" + dr["pUnitName"].ToString() + " " + dr["pTitle"].ToString() + " " + dr["pName"].ToString()
                    + "</span>&nbsp;<a id='" + dr["ID"].ToString() + "' user='" + dr["pName"].ToString() + "' seat='' onclick='AddSeat(this);' style='cursor:pointer;TEXT-DECORATION: underline'>添加座位</a><br/>";
            }
            else
            {
                string seat = "";
                if (!string.IsNullOrEmpty(dr["SeatX"].ToString()))
                {
                    seat = dr["SeatX"].ToString() + "_" + dr["SeatY"].ToString();
                }
                else
                {
                    seat = dr["BID"].ToString();
                }
                result += "<span>" + dr["pUnitName"].ToString() + " " + dr["pTitle"].ToString() + " " + dr["pName"].ToString()
                    + "</span>&nbsp;<a id='" + dr["ID"].ToString() + "' user='" + dr["pName"].ToString() + "' seat='" + seat + "' onclick='AddSeat(this);' style='cursor:pointer;TEXT-DECORATION: underline'>移除座位</a><br/>";
            }
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