using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class manage_MUserEdit : System.Web.UI.Page
{
    string pubid;
    bool sqlexec;
    string sqlresult;

    protected void Page_Load(object sender, EventArgs e)
    {
        pubid = Request["pubid"];
        if (!IsPostBack)
        {
            if (string.IsNullOrEmpty(pubid))
            {
                btnDelete.Visible = false;
                btnRePwd.Visible = false;
            }
            else
            {
                DataTable dt = MySQL.ExecProc("usp_M_Users_GetByPubID", new string[] { pubid }, out sqlexec, out sqlresult).Tables[0];
                tbPubNo.Text = dt.Rows[0]["PubNo"].ToString();
                tbusername.Text = dt.Rows[0]["UserName"].ToString();
                tbusername.ReadOnly = true;
            }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        MySQL.ExecProc("usp_M_Users_Save", new string[] { pubid, tbPubNo.Text, tbusername.Text }, out sqlexec, out sqlresult);
        if (sqlexec)
        {
            Session[WebHint.Web_Hint] = new WebHint("保存成功", "Manage/welcome.aspx", HintFlag.跳转);
        }
        else
        {
            Session[WebHint.Web_Hint] = new WebHint("保存失败", "#", HintFlag.错误);
        }
        Response.Redirect(WebHint.HintURL);
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        MySQL.ExecProc("usp_M_Users_Delete", new string[] { pubid }, out sqlexec, out sqlresult);
        if (sqlexec)
        {
            Session[WebHint.Web_Hint] = new WebHint("保存成功", "Manage/welcome.aspx", HintFlag.跳转);
        }
        else
        {
            Session[WebHint.Web_Hint] = new WebHint("保存失败", "#", HintFlag.错误);
        }
        Response.Redirect(WebHint.HintURL);
    }

    protected void btnRePwd_Click(object sender, EventArgs e)
    {
        MySQL.ExecProc("usp_M_Users_RePwd", new string[] { pubid }, out sqlexec, out sqlresult);
        if (sqlexec)
        {
            Session[WebHint.Web_Hint] = new WebHint("密码重置成功", "Manage/WelCome.aspx", HintFlag.跳转);
        }
        else
        {
            Session[WebHint.Web_Hint] = new WebHint("密码重置失败", "#", HintFlag.错误);
        }
        Response.Redirect(WebHint.HintURL);
    }
}