using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_MfileList : System.Web.UI.Page
{
    bool sqlexec;
    string sqlresult;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            add.HRef = "Mfile.aspx?mid=" + Request["mid"];

            DataTable dt = MySQL.ExecProc("usp_M_Data_GetByMID", new string[] { Request["mid"] }, out sqlexec, out sqlresult).Tables[0];
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}