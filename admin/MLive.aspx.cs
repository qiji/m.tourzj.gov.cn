using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_MLive : System.Web.UI.Page
{
    bool sqlexec;
    string sqlresult;
    string mid;

    protected void Page_Load(object sender, EventArgs e)
    {

        mid = Request["mid"];
        if (!IsPostBack)
        {
            add.HRef = "MLiveList.aspx?mid=" + Request["mid"];

            GetData();
        }
    }

    private void GetData()
    {
        DataTable dt = MySQL.ExecProc("usp_M_Live_MID",
            new string[] { mid },
            out sqlexec, out sqlresult).Tables[0];

        if (dt.Rows.Count > 0)
        {
            Upload1.FileName = dt.Rows[0]["ImgTop"].ToString();
            Upload2.FileName = dt.Rows[0]["ImgTitle"].ToString();
            content1.Value = dt.Rows[0]["Context"].ToString();
            tbTitle.Text = dt.Rows[0]["LiveTitle"].ToString();
            tbAddress.Text = dt.Rows[0]["Address"].ToString();
        }
        else
        {
            add.Visible = false;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        MySQL.ExecProc("usp_M_Live_save",
            new string[] { 
                mid,Upload1.FileName,Upload2.FileName,content1.Value,tbTitle.Text,tbAddress.Text},
            out sqlexec, out sqlresult);
        if (sqlexec)
        {
            Session[WebHint.Web_Hint] = new WebHint("保存成功", "admin/MLive.aspx?mid=" + mid, HintFlag.跳转);
        }
        else
        {
            Session[WebHint.Web_Hint] = new WebHint("保存失败", "#", HintFlag.错误);
        }
        Response.Redirect(WebHint.HintURL);
    }
}
