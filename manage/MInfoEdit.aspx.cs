using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class manage_MInfoEdit : System.Web.UI.Page
{
    bool sqlexec;
    string sqlresult;
    string pubid;
    string mid;

    protected void Page_Load(object sender, EventArgs e)
    {
        pubid = Request["PubID"];
        mid = Request["mid"];
        if (!IsPostBack)
        {
            aBack.HRef = "MInfoList.aspx?PubID=" + pubid;
            if (string.IsNullOrEmpty(mid))
            {
                btnDelete.Visible = false;
            }
            else
            {
                DataTable dt = MySQL.ExecProc("usp_M_Info_GetByMid", new string[] { mid }, out sqlexec, out sqlresult).Tables[0];
                tbmName.Text = dt.Rows[0]["mName"].ToString();
                tbBeginTime.Value = Convert.ToDateTime(dt.Rows[0]["mBeginTime"]).ToString("yyyy-MM-dd hh:mm:ss");
                tbEndTime.Value = Convert.ToDateTime(dt.Rows[0]["mEndTime"]).ToString("yyyy-MM-dd hh:mm:ss");

            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        MySQL.ExecProc("usp_M_Info_SaveByManage", new string[] { mid, pubid, tbmName.Text, tbBeginTime.Value, tbEndTime.Value }, out sqlexec, out sqlresult);
        if (sqlexec)
        {
            Session[WebHint.Web_Hint] = new WebHint("保存成功", "Manage/MInfoList.aspx?PubID=" + pubid, HintFlag.跳转);
        }
        else
        {
            Session[WebHint.Web_Hint] = new WebHint("保存失败", "#", HintFlag.错误);
        }
        Response.Redirect(WebHint.HintURL);


    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        MySQL.ExecProc("usp_M_Info_Delete", new string[] { mid }, out sqlexec, out sqlresult);
        if (sqlexec)
        {
            Session[WebHint.Web_Hint] = new WebHint("删除成功", "Manage/MInfoList.aspx?PubID=" + pubid, HintFlag.跳转);
        }
        else
        {
            Session[WebHint.Web_Hint] = new WebHint("删除失败", "#", HintFlag.错误);
        }
        Response.Redirect(WebHint.HintURL);
    }
}