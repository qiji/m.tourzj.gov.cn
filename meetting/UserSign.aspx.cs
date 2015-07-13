using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class meetting_UserSign : System.Web.UI.Page
{
    bool sqlexec;
    string sqlresult;
    public string mid;
    protected void Page_Load(object sender, EventArgs e)
    {
        WeiCookieInfo uc = new WeiXinUserCookie(WeiXinUserCookie.CookierUser).GetCookiesValues();
        mid = uc.MId;

        if (!IsPostBack)
        {
            DataTable dt = MySQL.ExecProc("usp_M_Info_GetByMid", new string[] { mid }, out sqlexec, out sqlresult).Tables[0];
            divtitle.InnerHtml = dt.Rows[0]["mName"].ToString();

            divInfo.InnerHtml = "会议地点：" + dt.Rows[0]["mAddress"].ToString() + "<br />";
            divInfo.InnerHtml += "会议时间：" + Convert.ToDateTime(dt.Rows[0]["mBeginTime"].ToString()).ToString("yyyy-MM-dd HH:mm") + "-" + Convert.ToDateTime(dt.Rows[0]["mEndTime"].ToString()).ToString("yyyy-MM-dd HH:mm");

            dt = MySQL.ExecProc("usp_My_Info_GetByOpenIDMid", new string[] { uc.OpenId, mid }, out sqlexec, out sqlresult).Tables[0];

            if (dt.Rows.Count > 0)
            {
                Response.Redirect("index.aspx");
            }
        }
    }
}