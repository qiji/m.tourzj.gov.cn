using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class meetting_UserInfo : System.Web.UI.Page
{
    bool sqlexec;
    string sqlresult;
    public string mid;
    protected void Page_Load(object sender, EventArgs e)
    {
        WeiCookieInfo uc = new WeiXinUserCookie(WeiXinUserCookie.CookierUser).GetCookiesValues();

        if (!IsPostBack)
        {
            DataTable dt = MySQL.ExecProc("usp_M_GetUserInfo_ByOpenIDMID", new string[] { uc.MId, uc.OpenId }, out sqlexec, out sqlresult).Tables[0];

            UserInfo.InnerHtml = "姓名：" + dt.Rows[0]["pName"].ToString() + "<br />电话：" + dt.Rows[0]["pMobile"].ToString() + "<br />职位：" + dt.Rows[0]["pTitle"].ToString() + "<br />单位：" + dt.Rows[0]["pUnitName"].ToString() + "</div>";

            dt = MySQL.ExecProc("usp_M_Info_GetByMid", new string[] { uc.MId }, out sqlexec, out sqlresult).Tables[0];
            divtitle.InnerHtml = dt.Rows[0]["mName"].ToString();

        }
    }
}