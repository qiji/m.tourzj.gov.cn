using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class meetting_MeetImage : System.Web.UI.Page
{
    bool sqlexec;
    string sqlresult;
    public string mid;
    protected void Page_Load(object sender, EventArgs e)
    {
        WeiCookieInfo uc = new WeiXinUserCookie(WeiXinUserCookie.CookierUser).GetCookiesValues();
        mid = "48939A26-ACF3-4C3E-804C-E3C8D9920674";

        if (!IsPostBack)
        {
            DataTable dt = MySQL.ExecProc("usp_M_Info_GetByMid", new string[] { mid }, out sqlexec, out sqlresult).Tables[0];
            divtitle.InnerHtml = dt.Rows[0]["mName"].ToString();

            myimg.InnerHtml = " <img id=\"img_meeting\" name=\"img_meeting\" src=\"../Upload/" + dt.Rows[0]["mScreenFile"].ToString() + "\" width=\"640\" />";
        }
    }
}