using System;
using System.Data;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_MStateList : System.Web.UI.Page
{
    bool sqlexec;
    string sqlresult;
    string mid;

    protected void Page_Load(object sender, EventArgs e)
    {
        mid = Request["mid"];
        if (!IsPostBack)
        {
            aAdd.HRef = "MStateEdit.aspx?mid=" + mid;
            DataTable dt = MySQL.ExecProc("usp_M_State_GetByMid", new string[] { mid }, out sqlexec, out sqlresult).Tables[0];
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}