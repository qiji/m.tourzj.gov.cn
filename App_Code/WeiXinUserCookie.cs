using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
///WeiXinUserCookie 的摘要说明
/// </summary>
public class WeiXinUserCookie
{
    public static string CookierUser = "WeiMeeting";

    HttpCookie cookie;
    string cookien;

    public WeiXinUserCookie(string cookieName)
    {
        cookie = HttpContext.Current.Request.Cookies[cookieName];
        cookien = cookieName;
    }

    public static void ClearCookie()
    {
        HttpCookie aCookie;
        string cookieName;
        int limit = HttpContext.Current.Request.Cookies.Count;
        for (int i = 0; i < limit; i++)
        {
            cookieName = HttpContext.Current.Request.Cookies[i].Name;
            aCookie = new HttpCookie(cookieName);
            aCookie.Expires = DateTime.Now.AddDays(-1);
            HttpContext.Current.Response.Cookies.Add(aCookie);
        }
    }

    public static void ClearCookie(string CookierName)
    {
        HttpCookie aCookie;
        string cookieName;
        aCookie = new HttpCookie(CookierName);
        aCookie.Expires = DateTime.Now.AddDays(-1);
        HttpContext.Current.Response.Cookies.Add(aCookie);
    }

    public WeiCookieInfo GetCookiesValues()
    {
        //尝试获取Cookies
        WeiCookieInfo cookieValue = null;
        if (cookie != null)
        {
            cookieValue = new WeiCookieInfo();
            cookieValue.OpenId = HttpUtility.UrlDecode(cookie.Values["OpenId"]);
            cookieValue.MId = HttpUtility.UrlDecode(cookie.Values["MId"]);
        }
        return cookieValue;
    }

    public void WriteCookies(WeiCookieInfo values)
    {
        //创建cookies,写入初始数据
        cookie = new HttpCookie(cookien);
        cookie.Values.Add("OpenId", HttpUtility.UrlEncode(values.OpenId));
        cookie.Values.Add("MId", HttpUtility.UrlEncode(values.MId));

        cookie.Expires = DateTime.Now.AddDays(1);
        HttpContext.Current.Response.Cookies.Add(cookie);
    }
}

public class WeiCookieInfo
{
    public WeiCookieInfo()
    {

    }

    public WeiCookieInfo(string openid, string mid)
    {
        _openid = openid;
        _mid = mid;

    }

    string _openid;


    public string OpenId
    {
        get { return _openid; }
        set { _openid = value; }
    }
    string _mid;

    public string MId
    {
        get { return _mid; }
        set { _mid = value; }
    }

}
