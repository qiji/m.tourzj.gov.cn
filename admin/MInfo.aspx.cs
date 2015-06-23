using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_MInfo : System.Web.UI.Page
{
    bool sqlexec;
    string sqlresult;
    string mid;

    protected void Page_Load(object sender, EventArgs e)
    {

        mid = Request["mid"];
        if (!IsPostBack)
        {
            DataTable dt = MySQL.ExecProc("usp_M_Info_GetByMid", new string[] { mid }, out sqlexec, out sqlresult).Tables[0];
            tbMName.Text = dt.Rows[0]["mName"].ToString();
            tbmHost.Text = dt.Rows[0]["mHost"].ToString();
            tbmUnderTake.Text = dt.Rows[0]["mUnderTake"].ToString();
            tbmJointly.Text = dt.Rows[0]["mJointly"].ToString();
            if (!string.IsNullOrEmpty(dt.Rows[0]["mSignBeginTime"].ToString()))
            {
                tbmSignBeginTime.Value = Convert.ToDateTime(dt.Rows[0]["mSignBeginTime"]).ToString("yyyy-MM-dd hh:mm:ss");
            }
            if (!string.IsNullOrEmpty(dt.Rows[0]["mSignEndTime"].ToString()))
            {
                tbmSignEndTime.Value = Convert.ToDateTime(dt.Rows[0]["mSignEndTime"]).ToString("yyyy-MM-dd hh:mm:ss");
            }
            if (!string.IsNullOrEmpty(dt.Rows[0]["mBeginTime"].ToString()))
            {
                tbmBeginTime.Value = Convert.ToDateTime(dt.Rows[0]["mBeginTime"]).ToString("yyyy-MM-dd hh:mm:ss");
            }
            if (!string.IsNullOrEmpty(dt.Rows[0]["mEndTime"].ToString()))
            {
                tbmEndTime.Value = Convert.ToDateTime(dt.Rows[0]["mEndTime"]).ToString("yyyy-MM-dd hh:mm:ss");
            }

            tbmAddress.Text = dt.Rows[0]["mAddress"].ToString();
            tbmContact.Text = dt.Rows[0]["mContact"].ToString();
            Upload1.FileName = dt.Rows[0]["mAgendaFile"].ToString();


        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //@MID uniqueidentifier,  
        //@mName varchar(200),
        //@mSignBeginTime datetime,
        //@mSignEndTime datetime,
        //@mBeginTime datetime,
        //@mEndTime datetime,
        //@mAddress varchar(200),
        //@mContact varchar(200),
        //@mAgendaFile varchar(100),  
        //@mHost varchar(200),
        //@mUnderTake varchar(200),
        //@mJointly varchar(200)

        MySQL.ExecProc("usp_M_Info_SaveByAdmin",
            new string[] { 
                mid,
                tbMName.Text,                
                tbmSignBeginTime.Value,
                tbmSignEndTime.Value,
                tbmBeginTime.Value,
                tbmEndTime.Value,
                tbmAddress.Text,
                tbmContact.Text,
                Upload1.FileName,
                tbmHost.Text,
                tbmUnderTake.Text,
                tbmJointly.Text,},
            out sqlexec, out sqlresult);
        if (sqlexec)
        {
            Session[WebHint.Web_Hint] = new WebHint("保存成功", "admin/MInfo.aspx?mid=" + mid, HintFlag.跳转);
        }
        else
        {
            Session[WebHint.Web_Hint] = new WebHint("保存失败", "#", HintFlag.错误);
        }
        Response.Redirect(WebHint.HintURL);
    }
}