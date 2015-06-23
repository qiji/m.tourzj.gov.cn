using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;


public partial class WXInterface : System.Web.UI.Page
{
    bool SQLExec;
    string SQLResult;

    protected void Page_Load(object sender, EventArgs e)
    {
        MySQL.ExecProc("usp_Test_Save", new string[] { Request.Url.ToString() + "-" + Request.HttpMethod.ToLower() }, out SQLExec, out SQLResult);
    }
}