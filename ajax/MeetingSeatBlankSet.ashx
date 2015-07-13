<%@ WebHandler Language="C#" Class="MeetingSeatBlankSet" %>

using System;
using System.Web;
using System.Data;

public class MeetingSeatBlankSet : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        bool sqlexec;
        string sqlresult;

        string[] ss = context.Request["seatinfo"].Split('_');
        int seatx = int.Parse(context.Request["seatx"]);
        int xcount = int.Parse(context.Request["xcount"]);
        if (context.Request["type"] == "1")
        {
            DataTable dt = MySQL.ExecProc("usp_Meeting_SeatInitInfo_Save", new string[] { context.Request["mid"], ss[0], ss[1] }, out sqlexec, out sqlresult).Tables[0];

            string[] nums = GetNums(seatx-1).Split(',');
            int i = 0;
            for (int x = 0; x < xcount; x++)
            {
                DataTable dt2 = MySQL.ExecProc("usp_Meeting_IsExitSeatInit", new string[] { context.Request["mid"], x.ToString(), ss[1] }, out sqlexec, out sqlresult).Tables[0];
                {
                    if (dt2.Rows[0][1].ToString() == "mt_sli sblock")
                    {
                        if (x != int.Parse(ss[0]))
                        {
                            MySQL.ExecProc("usp_Meeting_SeatWeight_Save", new string[] { context.Request["mid"], nums[i], x.ToString(), ss[1] }, out sqlexec, out sqlresult);
                            i++;
                        }
                    }
                }
            }
            
            context.Response.Write(dt.Rows[0][1].ToString());
        }
        else
        {
            DataTable dt = MySQL.ExecProc("usp_Meeting_SeatInitInfo_Restore", new string[] { context.Request["mid"], ss[0], ss[1] }, out sqlexec, out sqlresult).Tables[0];

            string[] nums = GetNums(seatx + 1).Split(',');
            int i = 0;
            for (int x = 0; x < xcount; x++)
            {
                DataTable dt2 = MySQL.ExecProc("usp_Meeting_IsExitSeatInit", new string[] { context.Request["mid"], x.ToString(), ss[1] }, out sqlexec, out sqlresult).Tables[0];
                {
                    if (dt2.Rows[0][1].ToString() == "mt_sli sblock" || x == int.Parse(ss[0]))
                    {
                        MySQL.ExecProc("usp_Meeting_SeatWeight_Save", new string[] { context.Request["mid"], nums[i], x.ToString(), ss[1] }, out sqlexec, out sqlresult);
                        i++;
                    }
                }
            }
            context.Response.Write(dt.Rows[0][1].ToString());
        }
    }

    private string GetNums(int num)
    {
        string r = "1";
        for (int i = 2; i <= num; i++)
        {
            if (i % 2 == 0)
            {
                r = i + "," + r;
            }
            else
            {
                r += "," + i;
            }
        }
        return r;
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}