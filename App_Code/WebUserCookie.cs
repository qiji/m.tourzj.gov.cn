using System;
using System.Collections.Generic;
using System.Web;

// <summary>
//WebUserCookie 的摘要说明
// </summary>
public class WebUserCookie
{
    public static string CookierUser = "MUser";

    HttpCookie cookie;
    string cookien;

    public WebUserCookie(string cookieName)
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
        aCookie = new HttpCookie(CookierName);
        aCookie.Expires = DateTime.Now.AddDays(-1);
        HttpContext.Current.Response.Cookies.Add(aCookie);
    }

    public UserCookieInfo GetCookiesValues()
    {
        //尝试获取Cookies
        UserCookieInfo cookieValue = null;
        if (cookie != null)
        {
            cookieValue = new UserCookieInfo();
            cookieValue.UserName = HttpUtility.UrlDecode(cookie.Values["UserName"]);
            cookieValue.PubID = Convert.ToInt32(HttpUtility.UrlDecode(cookie.Values["PubID"]));
            cookieValue.UserType = Convert.ToInt32(HttpUtility.UrlDecode(cookie.Values["UserType"]));
            cookieValue.PubNo = HttpUtility.UrlDecode(cookie.Values["PubNo"]);
        }
        return cookieValue;
    }

    public void WriteCookies(UserCookieInfo values)
    {
        //创建cookies,写入初始数据
        cookie = new HttpCookie(cookien);
        cookie.Values.Add("PubID", HttpUtility.UrlEncode(values.PubID.ToString()));
        cookie.Values.Add("UserName", HttpUtility.UrlEncode(values.UserName));
        cookie.Values.Add("UserType", HttpUtility.UrlEncode(values.UserType.ToString()));
        cookie.Values.Add("PubNo", HttpUtility.UrlEncode(values.PubNo));
        cookie.Expires = DateTime.Now.AddDays(1);
        HttpContext.Current.Response.Cookies.Add(cookie);
    }
}
public class UserCookieInfo
{
    public UserCookieInfo()
    {

    }

    public UserCookieInfo(int pubid, string username, int usertype, string pubno)
    {
        PubID = pubid;
        UserName = username;
        UserType = usertype;
        PubNo = pubno;
    }

    public string PubNo;
    public int PubID;
    public string UserName;
    public int UserType;

}
