<%@ WebHandler Language="C#" Class="GetMeetingImg" %>

using System;
using System.Web;
using System.Web.Caching;
using System.Data;

public class GetMeetingImg : IHttpHandler
{
    bool sqlexec;
    string sqlresult;
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string id = context.Request["mid"].ToLower();
        MI mi = GetMI(context, id);
        if (context.Request["type"] == "state")
        {
            context.Response.Write(mi.WebID);
        }
        else
        {
            context.Response.BinaryWrite(mi.ScreenImage);
        }
    }

    private MI GetMI(HttpContext context, string mid)
    {
        MI mi;
        try
        {
            mi = (MI)context.Cache.Get(mid);
        }
        catch
        {
            mi = null;
        }

        if (mi == null)
        {
            mi = new MI();
            mi.ClientID = Guid.NewGuid().ToString();
            mi.WebID = "";
            mi.ScreenImage = null;
            context.Cache.Insert(mid, mi, null, DateTime.Now.AddDays(1), Cache.NoSlidingExpiration, CacheItemPriority.Normal, null);
        }
        return mi;
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}