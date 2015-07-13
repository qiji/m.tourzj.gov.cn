<%@ WebHandler Language="C#" Class="UpdateSeatXY" %>

using System;
using System.Web;

public class UpdateSeatXY : IHttpHandler
{
    
    public void ProcessRequest (HttpContext context) {
        bool SQLExec;
        string SQLResult;
        context.Response.ContentType = "text/plain";
        string mid = context.Request["mid"];
        string SeatX = context.Request["SeatX"];
        string SeatY = context.Request["SeatY"];

        MySQL.ExecProc("usp_Meeting_UpdateSeat", new string[] { mid, SeatX, SeatY }, out SQLExec, out SQLResult);
        if (SQLExec)
        {
            string[] nums = GetNums(int.Parse(SeatX)).Split(',');
            for (int y = 0; y < int.Parse(SeatY); y++)
            {
                for (int x = 0; x < int.Parse(SeatX); x++)
                {
                    MySQL.ExecProc("usp_Meeting_SeatWeight_Save", new string[] { mid,nums[x],x.ToString(), y.ToString() }, out SQLExec, out SQLResult);
                }
            }
            context.Response.Write("保存成功");
        }
        else
        {
            context.Response.Write(SQLResult);
        }
    }

    private string GetNums(int num)
    {
        string r="1";
        for (int i = 2; i <=num; i++)
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
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}