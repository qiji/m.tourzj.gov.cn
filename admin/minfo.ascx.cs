using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;

public partial class admin_minfo : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bool sqlexec;
            string sqlresult;
            DataTable dt = MySQL.ExecProc("usp_M_Info_GetByMid", new string[] { Request["mid"] }, out sqlexec, out sqlresult).Tables[0];
            lbmName.Text = dt.Rows[0]["mName"].ToString().Replace("<br/>","");
            lbBeginTime.Text = Convert.ToDateTime(dt.Rows[0]["mBeginTime"]).ToString("yyyy-MM-dd hh:mm:ss");
            lbEndTime.Text = Convert.ToDateTime(dt.Rows[0]["mEndTime"]).ToString("yyyy-MM-dd hh:mm:ss");
        }
    }
}