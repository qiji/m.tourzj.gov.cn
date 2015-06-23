using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class meetting_mGuide : System.Web.UI.Page
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
            mGuide.InnerHtml = "<img src=\"../UpLoad/" + dt.Rows[0]["mAgendaFile"].ToString() + "\" width=\"640px\" />";
        }
    }
}