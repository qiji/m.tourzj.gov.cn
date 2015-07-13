using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_MLiveList : System.Web.UI.Page
{
    bool sqlexec;
    string sqlresult;
    string mid;

    protected void Page_Load(object sender, EventArgs e)
    {
        mid = Request["mid"];
        if (!IsPostBack)
        {
            divback.HRef = "MLive.aspx?mid=" + Request["mid"];

            a1.HRef = "MLiveInfo.aspx?mid=" + Request["mid"];
           
            GetData();
        }
    }

    private void GetData()
    {
        DataTable dt = MySQL.ExecProc("usp_M_LiveInfo_mid",
            new string[] { mid },
            out sqlexec, out sqlresult).Tables[0];

        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        GetData();
        GridView1.PageIndex = e.NewSelectedIndex;
    }

}
