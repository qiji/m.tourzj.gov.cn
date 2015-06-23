<%@ WebHandler Language="C#" Class="ImgService" %>


using System;
using System.Web;
using System.IO;
using System.Web.Caching;


public class ImgService : IHttpHandler
{

    //bool sqlexec;
    //string sqlresult;

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string id = context.Request["mid"].ToLower();

        //MySQL.ExecProc("usp_Meeting_Test_Save", new string[] { "URL is :" + context.Request.Url.ToString() }, out sqlexec, out sqlresult);

        MI mi = GetMI(context, id);

        if (context.Request["type"] == "state")
        {
            //MySQL.ExecProc("usp_Meeting_Test_Save", new string[] { "Client Return . ClientID is " + mi.ClientID }, out sqlexec, out sqlresult);
            context.Response.Write(mi.ClientID);

        }
        else if (context.Request["type"] == "changeclientid")
        {
            string origian = mi.ClientID;
            mi.ClientID = Guid.NewGuid().ToString();
            context.Cache.Insert(id, mi, null, DateTime.Now.AddDays(1), Cache.NoSlidingExpiration, CacheItemPriority.Normal, null);
            mi = GetMI(context, id);
            //context.Response.Write(origian + "|" + mi.ClientID + "|" + mi.WebID);
            context.Response.Write("OldClientID:" + origian + "|NewClientID:" + mi.ClientID);
        }
        else
        {
            try
            {
                int imgsize = Convert.ToInt32(context.Request["imgsize"]);

                mi.ScreenImage = new byte[imgsize];
                context.Request.InputStream.Read(mi.ScreenImage, 0, imgsize);
                mi.WebID = Guid.NewGuid().ToString();
                context.Cache.Insert(id, mi, null, DateTime.Now.AddDays(10), Cache.NoSlidingExpiration, CacheItemPriority.Normal, null);
                context.Response.Write("T");
            }
            catch (Exception ee)
            {
                context.Response.Write(ee.Message);
            }
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
            //MySQL.ExecProc("usp_Meeting_Test_Save", new string[] { "MI Is Null" }, out sqlexec, out sqlresult);
            mi = null;
        }

        if (mi == null)
        {
            mi = new MI();
            mi.ClientID = Guid.NewGuid().ToString();
            mi.WebID = "";
            mi.ScreenImage = null;
            context.Cache.Insert(mid, mi, null, DateTime.Now.AddDays(1), Cache.NoSlidingExpiration, CacheItemPriority.Normal, null);

            //MySQL.ExecProc("usp_Meeting_Test_Save", new string[] { "MI Create . ClientID is " + mi.ClientID }, out sqlexec, out sqlresult);
        }
        else
        {
            //MySQL.ExecProc("usp_Meeting_Test_Save", new string[] { "MI Exists . ClientID is " + mi.ClientID }, out sqlexec, out sqlresult);
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