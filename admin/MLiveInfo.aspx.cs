using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_MLiveInfo : System.Web.UI.Page
{
    bool sqlexec;
    string sqlresult;
    string mid;
    string id = "0";

    protected void Page_Load(object sender, EventArgs e)
    {

        mid = Request["mid"];

        if (!string.IsNullOrEmpty(Request["id"]))
        {
            id = Request["id"];
        }

        if (!IsPostBack)
        {
            divback.HRef = "MLiveList.aspx?mid=" + mid;

            GetData();
        }
    }

    private void GetData()
    {
        tbZan.Text = "0";

        DataTable dt = MySQL.ExecProc("usp_M_LiveInfo_id",
            new string[] { id },
            out sqlexec, out sqlresult).Tables[0];

        if (dt.Rows.Count > 0)
        {
            tbTitle.Text = dt.Rows[0]["Title"].ToString();
            Upload1.FileName = dt.Rows[0]["Img"].ToString();
            tbPublishDate.Value = Convert.ToDateTime(dt.Rows[0]["CrtDate"]).ToString();
            content1.Value = dt.Rows[0]["Context"].ToString();
            tbZan.Text = dt.Rows[0]["Zan"].ToString();
        }
       
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        MySQL.ExecProc("usp_M_LiveInfo_save",
            new string[] { 
                id,mid,tbTitle.Text,Upload1.FileName,tbPublishDate.Value =="" ?DateTime.Now.ToString() : tbPublishDate.Value,content1.Value,tbZan.Text},
            out sqlexec, out sqlresult);
        if (sqlexec)
        {
            Session[WebHint.Web_Hint] = new WebHint("保存成功", "admin/MLiveList.aspx?mid=" + mid, HintFlag.跳转);
        }
        else
        {
            Session[WebHint.Web_Hint] = new WebHint("保存失败", "#", HintFlag.错误);
        }
        Response.Redirect(WebHint.HintURL);
    }
}
