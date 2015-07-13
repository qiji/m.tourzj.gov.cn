<%@ WebHandler Language="C#" Class="getsignature" %>

using System;
using System.Web;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
using System.Text;
using Newtonsoft.Json.Linq;
using System.Security.Cryptography;

public class getsignature : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        bool SQLExec;
        string SQLResult;
        DataTable wxInfo = MySQL.ExecProc("usp_GetShareTicket", new string[] { "fwh" }, out SQLExec, out SQLResult).Tables[0];
        string tt = wxInfo.Rows[0]["Ticket"].ToString();
        if (wxInfo.Rows.Count == 0 || string.IsNullOrEmpty(wxInfo.Rows[0]["CrtDate"].ToString()))
        {
            tt = UpdateTicket();
        }
        else
        {
            DateTime lasttime = Convert.ToDateTime(wxInfo.Rows[0]["CrtDate"].ToString());
            TimeSpan ss = DateTime.Now - lasttime;
            if (ss.Hours * 60 + ss.Minutes > 100)
            {
                tt = UpdateTicket();
            }
        }

        string noncestr = "zjslyj";
        string timestamp = context.Request["times"];
        string url = context.Request["url"];

        string string1 = "jsapi_ticket=" + tt + "&noncestr=" + noncestr + "&timestamp=" + timestamp + "&url=" + url;

        SHA1 sha;

        sha = new SHA1CryptoServiceProvider();
        ASCIIEncoding enc = new ASCIIEncoding();
        byte[] dataToHash = enc.GetBytes(string1);
        byte[] dataHashed = sha.ComputeHash(dataToHash);
        string hash = BitConverter.ToString(dataHashed).Replace("-", "");
        hash = hash.ToLower();

        context.Response.Write(hash);
    }

    private static string UpdateTicket()
    {
        bool SQLExec;
        string SQLResult;
        string url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=wx9c20277acdfbe85b&secret=e332597fb47e441cf9f3af2663129272";
        HttpWebRequest r = (HttpWebRequest)WebRequest.Create(url);
        r.Method = "GET";
        HttpWebResponse response = (System.Net.HttpWebResponse)r.GetResponse();

        StreamReader ReaderText = new StreamReader(response.GetResponseStream(), Encoding.GetEncoding("utf-8"));

        JObject obj = JObject.Parse(ReaderText.ReadToEnd());

        MySQL.ExecProc("usp_Update_Acess_Token", new string[] { "fwh", obj["access_token"].ToString() }, out SQLExec, out SQLResult);

        url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=" + obj["access_token"].ToString() + "&type=jsapi";

        r = (HttpWebRequest)WebRequest.Create(url);
        r.Method = "GET";
        response = (System.Net.HttpWebResponse)r.GetResponse();
        ReaderText = new StreamReader(response.GetResponseStream(), Encoding.GetEncoding("utf-8"));
        obj = JObject.Parse(ReaderText.ReadToEnd());
        MySQL.ExecProc("usp_Update_ticket", new string[] { "fwh", obj["ticket"].ToString() }, out SQLExec, out SQLResult);

        return obj["ticket"].ToString();
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}