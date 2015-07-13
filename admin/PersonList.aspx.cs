using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_PersonList : System.Web.UI.Page
{
    bool sqlexec;
    string sqlresult;
    string mid;

    protected void Page_Load(object sender, EventArgs e)
    {
        mid = Request["mid"];
        if (!IsPostBack)
        {
            add.HRef = "PersonEdit.aspx?mid=" + Request["mid"];
            ddlpState.Items.Add(new ListItem("全部", "0"));
            DataTable dt = MySQL.ExecProc("usp_M_State_GetByMid", new string[] { mid }, out sqlexec, out sqlresult).Tables[0];
            foreach (DataRow dr in dt.Rows)
            {
                ddlpState.Items.Add(new ListItem(dr["sName"].ToString(), dr["pState"].ToString()));
            }
            GetData();
        }
    }

    private void GetData()
    {
        DataTable dt = MySQL.ExecProc("usp_M_Person_GetBymid",
            new string[] { mid, ddlpState.SelectedValue, tbKey.Text },
            out sqlexec, out sqlresult).Tables[0];

        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        GetData();
    }

    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        GetData();
        GridView1.PageIndex = e.NewSelectedIndex;
    }
    protected void btnExcel_Click(object sender, EventArgs e)
    {
        Export(GridView1, "application/vnd.ms-excel", "人员导出.xls");
    }

    public void Export(System.Web.UI.Control source, string fileType, string fileName)
    {
        HttpResponse response = HttpContext.Current.Response;
        response.Clear();
        response.Buffer = true;
        response.Charset = "UTF-8"; //default-value
        response.ContentEncoding = System.Text.Encoding.UTF7;
        response.AddHeader("content-disposition", "attachment;filename=" + HttpUtility.UrlEncode(fileName, System.Text.Encoding.UTF8).ToString());
        response.ContentType = fileType;
        source.Page.EnableViewState = false;
        System.IO.StringWriter sw = new System.IO.StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        source.RenderControl(hw);
        response.Write(sw.ToString());
        response.End();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
    }
}