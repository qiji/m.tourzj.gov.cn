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

        if (!IsPostBack)
        {
            bool sqlexec;
            string sqlresult;

            DataTable dt = MySQL.ExecProc("usp_M_Info_GetByMid", new string[] { mid }, out sqlexec, out sqlresult).Tables[0];
            string result = "";
            string seatinfo = "";
            int seatx = Convert.ToInt32(dt.Rows[0]["seatx"]);
            int seaty = Convert.ToInt32(dt.Rows[0]["seaty"]);

            for (int y = 0; y < seaty; y++)
            {
                seatinfo += "<div class=\"mt_sli str\">" + y.ToString() + "</div> \r\n";
                for (int x = 0; x < seatx; x++)
                {
                    string seatstr = x.ToString() + "_" + y.ToString();
                    seatinfo += "<div id='divseat" + seatstr + "' class='mt_sli sblock' onclick=\"seatSet('" + seatstr + "')\"></div>\r\n";
                }
                seatinfo += "<div class='clear'></div>";
            }

            seatinfo += "<div  class='mt_sli'></div>\r\n";

            for (int x = 0; x < seatx; x++)
            {

                seatinfo += "<div  class='mt_sli str'>" + x.ToString() + "</div>\r\n";
            }
            seatinfo += "<div class='clear'></div>";
            result += seatinfo;
            divseat.InnerHtml = result;

        }
    }
}