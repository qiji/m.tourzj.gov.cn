using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class login : System.Web.UI.Page
{
    bool sqlexec;
    string sqlresult;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        DataTable dt = MySQL.ExecProc(
                         "usp_M_Users_Login",
                        new string[] { username.Value, password.Value },
                        out sqlexec,
                        out sqlresult).Tables[0];

        if (dt.Rows.Count == 0)
        {
            Session[WebHint.Web_Hint] = new WebHint("用户名或者密码错误", "#", HintFlag.错误);
            Response.Redirect("Hint.aspx");
        }
        else
        {
            UserCookieInfo uc = new UserCookieInfo(Convert.ToInt32(dt.Rows[0]["PubID"]),
                dt.Rows[0]["UserName"].ToString(),
                Convert.ToInt32(dt.Rows[0]["UserType"].ToString()),
                dt.Rows[0]["PubNo"].ToString());

            new WebUserCookie(WebUserCookie.CookierUser).WriteCookies(uc);

            if (uc.UserType == 1)
            {
                //超级管理员
                Response.Redirect("manage/WelCome.aspx");
            }
            else
            {
                //普通管理员
                Response.Redirect("admin/Welcome.aspx");
            }
        }
    }
}
