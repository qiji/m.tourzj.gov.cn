using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json.Linq;
using System.Data;

public partial class setcookie : System.Web.UI.Page
{
    bool sqlexec;
    string sqlresult;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dt = MySQL.ExecProc("usp_M_Info_GetByMid", new string[] { Request["mid"] }, out sqlexec, out sqlresult).Tables[0];

            if (!Convert.ToBoolean(dt.Rows[0]["IsRegistration"].ToString()))
            {
                new WeiXinUserCookie(WeiXinUserCookie.CookierUser).WriteCookies(new WeiCookieInfo("-1", Request["mid"]));
                Response.Redirect("meetting/index.aspx");
             
            }
            else
                new WeiXinUserCookie(WeiXinUserCookie.CookierUser).WriteCookies(new WeiCookieInfo(Request["openid"], Request["mid"]));

            if (!string.IsNullOrEmpty(Request["r"]))
            {
                Response.Redirect("meetting/UserReg.aspx");
            }
            else
            {
                Response.Redirect("meetting/UserSign.aspx");
            }
        }
    }
}