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
        string seatinfo = "";
        int seatx = Convert.ToInt32(dt.Rows[0]["seatx"]);
        int seaty = Convert.ToInt32(dt.Rows[0]["seaty"]);

        for (int y = 0; y < seaty; y++)
        {
            seatinfo += "<div class=\"mt_sli str\">" + y.ToString() + "</div> \r\n";
            for (int x = 0; x < seatx; x++)
            {
                string seatstr = x.ToString() + "_" + y.ToString();
                seatinfo += "<div id='divseat" + seatstr + "' class='mt_sli sblock' onclick=\"seatSet('" + seatstr + "')\"></div>\r\n";
            }
            seatinfo += "<div class='clear'></div>";
        }

        seatinfo += "<div  class='mt_sli'></div>\r\n";

        for (int x = 0; x < seatx; x++)
        {

            seatinfo += "<div  class='mt_sli str'>" + x.ToString() + "</div>\r\n";
        }
        seatinfo += "<div class='clear'></div>";
        result += seatinfo;
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