﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage : System.Web.UI.MasterPage
{
    UserCookieInfo uc;

    protected void Page_Load(object sender, EventArgs e)
    {
        uc = new WebUserCookie(WebUserCookie.CookierUser).GetCookiesValues();
        if (uc == null)
        {
            Response.Redirect("../login.aspx");
        }
       
    }
}