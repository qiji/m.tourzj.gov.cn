using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;

public partial class manage_MInfoList : System.Web.UI.Page
{
    bool sqlexec;
    string sqlresult;
    string pubid;

    protected void Page_Load(object sender, EventArgs e)
    {
        pubid = Request["pubid"];
        if (!IsPostBack)
        {
            aAdd.HRef = "MInfoEdit.aspx?PubID=" + pubid;
            DataTable dt = MySQL.ExecProc("usp_M_Info_GetByPubID", new string[] { pubid }, out sqlexec, out sqlresult).Tables[0];
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}