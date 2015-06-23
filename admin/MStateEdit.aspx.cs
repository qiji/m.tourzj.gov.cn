using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_MStateEdit : System.Web.UI.Page
{
    bool sqlexec;
    string sqlresult;
    string pstate;
    string mid;

    protected void Page_Load(object sender, EventArgs e)
    {
        mid = Request["mid"];
        pstate = Request["pstate"];
        if (!IsPostBack)
        {
            aBack.HRef = "MStateList.aspx?mid=" + mid;
            DataTable dt = MySQL.ExecProc("usp_M_State_GetBypState", new string[] { pstate }, out sqlexec, out sqlresult).Tables[0];
            if (dt.Rows.Count > 0)
            {
                tbOrderNo.Text = dt.Rows[0]["OrderNO"].ToString();
                tbsName.Text = dt.Rows[0]["sName"].ToString();
            }
            else
            {
                btnDelete.Visible = false;
            }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        MySQL.ExecProc("usp_M_State_Save", new string[] { pstate, mid, tbOrderNo.Text, tbsName.Text }, out sqlexec, out sqlresult);
        if (sqlexec)
        {
            Session[WebHint.Web_Hint] = new WebHint("保存成功", "admin/MStateList.aspx?mid=" + mid, HintFlag.跳转);
        }
        else
        {
            Session[WebHint.Web_Hint] = new WebHint("保存失败", "#", HintFlag.错误);
        }
        Response.Redirect(WebHint.HintURL);
    }


    protected void btnDelete_Click(object sender, EventArgs e)
    {
        MySQL.ExecProc("usp_M_State_Delete", new string[] { pstate }, out sqlexec, out sqlresult);
        if (sqlexec)
        {
            Session[WebHint.Web_Hint] = new WebHint("保存成功", "admin/MStateList.aspx?mid=" + mid, HintFlag.跳转);
        }
        else
        {
            Session[WebHint.Web_Hint] = new WebHint("保存失败", "#", HintFlag.错误);
        }
        Response.Redirect(WebHint.HintURL);
    }
}