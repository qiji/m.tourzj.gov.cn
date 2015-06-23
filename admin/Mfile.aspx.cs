using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_Mfile : System.Web.UI.Page
{
    bool sqlexec;
    string sqlresult;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            aback.HRef = "MfileList.aspx?mid=" + Request["mid"];
            if (Request["ID"] != null)
            {
                DataTable dt = MySQL.ExecProc("usp_M_Data_GetByid", new string[] { Request["ID"] }, out sqlexec, out sqlresult).Tables[0];
                MTitle.Text = dt.Rows[0]["dName"].ToString();
                Upload1.FileName = dt.Rows[0]["dFileName"].ToString();
            }
            else
            {
                btnDel.Visible = false;
            }
        }
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {
        MySQL.ExecProc("usp_M_Data_Del", new string[] 
                   { 
                       Request["ID"]
                   }, out sqlexec, out sqlresult);

        if (sqlexec)
        {
            Session[WebHint.Web_Hint] = new WebHint("成功", "admin/MfileList.aspx?mid=" + Request["mid"], HintFlag.跳转);
        }
        else
        {
            Session[WebHint.Web_Hint] = new WebHint("保存失败", "#", HintFlag.错误);
        }
        Response.Redirect(WebHint.HintURL);
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {

        MySQL.ExecProc("usp_M_Data_Save", new string[] 
                   { 
                       Request["ID"],
                       Request["mid"],
                       MTitle.Text,
                       Upload1.FileName
                   }, out sqlexec, out sqlresult);


        if (sqlexec)
        {
            Session[WebHint.Web_Hint] = new WebHint("成功", "admin/MfileList.aspx?mid=" + Request["mid"], HintFlag.跳转);
        }
        else
        {
            Session[WebHint.Web_Hint] = new WebHint("保存失败", "#", HintFlag.错误);
        }
        Response.Redirect(WebHint.HintURL);
    }
}