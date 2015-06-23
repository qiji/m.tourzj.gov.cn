using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Welcome : System.Web.UI.Page
{
    UserCookieInfo uc;
    bool sqlexec;
    string sqlresult;

    protected void Page_Load(object sender, EventArgs e)
    {
        uc = new WebUserCookie(WebUserCookie.CookierUser).GetCookiesValues();
        if (!IsPostBack)
        {
            lbPubNo.Text = uc.PubNo;

            DataTable dt = MySQL.ExecProc("usp_M_Info_GetByPubID", new string[] { uc.PubID.ToString() }, out sqlexec, out sqlresult).Tables[0];
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }


    protected string GetShortAddress(object address)
    {
        if (address.ToString().Length > 20)
        {
            return address.ToString().Substring(0, 20) + "...";
        }
        else
        {
            return address.ToString();
        }
    }



}
