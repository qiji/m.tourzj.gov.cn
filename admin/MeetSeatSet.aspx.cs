using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_MeetSeatSet : System.Web.UI.Page
{
    public string mid;
    protected void Page_Load(object sender, EventArgs e)
    {
        mid = Request["mid"];
    }
}