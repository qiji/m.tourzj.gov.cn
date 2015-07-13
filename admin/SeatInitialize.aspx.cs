using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_SeatInitialize : System.Web.UI.Page
{
    public string mid;
    public string tab;
    protected void Page_Load(object sender, EventArgs e)
    {
        mid = Request["mid"];
        int width = int.Parse(Request["width"]);
        int height = int.Parse(Request["height"]);
        if (!IsPostBack)
        {
            bool sqlexec;
            string sqlresult;

            DataTable dt = MySQL.ExecProc("usp_M_Info_GetByMid", new string[] { mid }, out sqlexec, out sqlresult).Tables[0];
            string result = "";
            string seatinfo = "";
            int seatx = Convert.ToInt32(dt.Rows[0]["seatx"]);
            int seaty = Convert.ToInt32(dt.Rows[0]["seaty"]);
            tbSeatX.Value = dt.Rows[0]["seatx"].ToString();
            tbSeatY.Value = dt.Rows[0]["seaty"].ToString();
            int iwidth = ((width - 40) / (seatx * 1 + 1)) - 3;
            int iheight = ((height-120) / (seaty * 1 + 1)) - 4;
            if (seatx == 0)
            {
                tab = "0";
            }
            else
            {
                tab = "1";
            }
            for (int y = 0; y < seaty; y++)
            {
                seatinfo += "<div class=\"mt_sli str\" style=\"width:" + iwidth + "px;height:" + iheight + "px;line-height:" + iheight + "px;\">" + y.ToString() + "</div> \r\n";
                for (int x = 0; x < seatx; x++)
                {
                    string seatstr = x.ToString() + "_" + y.ToString();
                    seatinfo += "<div id='divseat" + seatstr + "' class='mt_sli sblock' style=\"width:" + iwidth + "px;height:" + iheight + "px;line-height:" + iheight + "px;\"></div>\r\n";
                }
                seatinfo += "<div class='clear'></div>";
            }

            seatinfo += "<div  class='mt_sli' style=\"width:" + iwidth + "px;height:" + iheight + "px;line-height:" + iheight + "px;\"></div>\r\n";

            for (int x = 0; x < seatx; x++)
            {

                seatinfo += "<div  class='mt_sli str' style=\"width:" + iwidth + "px;height:" + iheight + "px;line-height:" + iheight + "px;\">" + x.ToString() + "</div>\r\n";
            }
            seatinfo += "<div class='clear'></div>";
            result += seatinfo;
            divseat.InnerHtml = result;

        }
    }
}