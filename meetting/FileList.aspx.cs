using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class meetting_FileList : System.Web.UI.Page
{
    bool sqlexec;
    string sqlresult;
    public string mid;
    protected void Page_Load(object sender, EventArgs e)
    {
        WeiCookieInfo uc = new WeiXinUserCookie(WeiXinUserCookie.CookierUser).GetCookiesValues();
        mid = "48939A26-ACF3-4C3E-804C-E3C8D9920674";

        DataTable dt = MySQL.ExecProc("usp_M_Info_GetByMid", new string[] { mid }, out sqlexec, out sqlresult).Tables[0];
        divtitle.InnerHtml = dt.Rows[0]["mName"].ToString();

        if (!IsPostBack)
        {
            dt = MySQL.ExecProc("usp_M_Data_GetByMID", new string[] { mid }, out sqlexec, out sqlresult).Tables[0];

            filelist.InnerHtml = "";

            foreach (DataRow dr in dt.Rows)
            {
                filelist.InnerHtml += "<div class=\"dlblock\"><div class=\"dl_filename\">" + dr["dName"].ToString() + "</div><a href=\"../UpLoad/" + dr["dFileName"].ToString() + "\" class=\"dl_buttom\"><img src=\"images/bu_dl.png\" width=\"133\" height=\"133\" /></a><div class=\"clear\"></div></div>";
            }
        }
    }
}