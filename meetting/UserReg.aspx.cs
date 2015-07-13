using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class meetting_UserReg : System.Web.UI.Page
{
    bool sqlexec;
    string sqlresult;
    public string mid;
    public string openid;
    public string pp = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        WeiCookieInfo uc = new WeiXinUserCookie(WeiXinUserCookie.CookierUser).GetCookiesValues();
        mid = uc.MId;
        openid = uc.OpenId;

        DataTable dt = MySQL.ExecProc("usp_M_Info_GetByMid", new string[] { mid }, out sqlexec, out sqlresult).Tables[0];
        divtitle.InnerHtml = dt.Rows[0]["mName"].ToString();
        pp = dt.Rows[0]["HintInfo"].ToString();
        if (!IsPostBack)
        {
            divInfo.InnerHtml = "会议地点：" + dt.Rows[0]["mAddress"].ToString() + "<br />";
            divInfo.InnerHtml += "会议时间：" + Convert.ToDateTime(dt.Rows[0]["mBeginTime"].ToString()).ToString("yyyy-MM-dd HH:mm") + "-" + Convert.ToDateTime(dt.Rows[0]["mEndTime"].ToString()).ToString("yyyy-MM-dd HH:mm") + "<br />";
            divInfo.InnerHtml += "会议联系人：" + dt.Rows[0]["mContact"].ToString();

            if (Convert.ToDateTime(dt.Rows[0]["mSignEndTime"].ToString()) < DateTime.Now)
            {
                Response.Redirect("UserSign.aspx");
            }

            dt = MySQL.ExecProc("usp_GetMyReg_User", new string[] { openid, mid }, out sqlexec, out sqlresult).Tables[0];
            if (dt.Rows.Count > 0)
                userlist.InnerHtml = "";

            int j = 1;
            foreach (DataRow dr in dt.Rows)
            {
                string nan = "", nv = "";
                if (dr["pGender"].ToString() == "男")
                {
                    nan = "checked=\"checked\"";
                }
                else
                    nv = "checked=\"checked\"";
                userlist.InnerHtml += "<div class=\"itc_block\" style=\"font-size: 1.5em\"><div class=\"mts_connew\">"
                    + "<div style=\"float: left; width: 20%; text-align: right\">姓名：</div><div style=\"float: left; width: 70%\">"
                    + "<input type=\"text\"  value=\"" + dr["pname"].ToString() + "\" id=\"txtName" + j.ToString() + "\" style=\"width: 80%; font-size: 1em;\" />&nbsp;&nbsp;<a href=\"#\" onclick=\"deluser(" + dr["ID"].ToString() + ")\">删除</a>"
                    + "<input id=\"txtID" + j.ToString() + "\" type=\"hidden\" value=\"" + dr["ID"].ToString() + "\" /></div>"
                    + "<div class=\"clear\"></div><br /><div style=\"float: left; width: 20%; text-align: right\">性别：</div>"
                    + "<div style=\"float: left; width: 70%\"><input name=\"sextype" + j.ToString() + "\" type=\"radio\" " + nan + " onclick=\"selectsex(this,1)\" /><label>男</label>"
                    + "<input name=\"sextype" + j.ToString() + "\" type=\"radio\" " + nv + " onclick=\"selectsex(this,1)\" /><label>女</label>"
                    + "<input id=\"txtSex" + j.ToString() + "\" type=\"hidden\" value=\"" + dr["pGender"].ToString() + "\" /></div>"
                    + "<div class=\"clear\"></div><br /><div style=\"float: left; width: 20%; text-align: right\">单位：</div><div style=\"float: left; width: 70%\">"
                    + "<input type=\"text\"  value=\"" + dr["pUnitName"].ToString() + "\" id=\"txtUnit" + j.ToString() + "\" style=\"width: 90%; font-size: 1em;\" /></div>"
                    + "<div class=\"clear\"></div><br /><div style=\"float: left; width: 20%; text-align: right\">职务：</div>"
                    + "<div style=\"float: left; width: 70%\"><input type=\"text\" value=\"" + dr["pTitle"].ToString() + "\" id=\"txtJob" + j.ToString() + "\" style=\"width: 90%; font-size: 1em;\" />"
                    + "</div><div class=\"clear\"></div><br /><div style=\"float: left; width: 20%; text-align: right\">手机：</div>"
                    + "<div style=\"float: left; width: 70%\"><input type=\"number\" value=\"" + dr["pMobile"].ToString() + "\" id=\"txtMob" + j.ToString() + "\" style=\"width: 90%; font-size: 1em;\" />"
                    + "</div><div class=\"clear\"></div><br /><div style=\"float: left; width: 20%; text-align: right\">备注：</div><div style=\"float: left; width: 70%\"><input type=\"text\" id=\"txtnote" + j.ToString() + "\"  value=\"" + dr["remark"].ToString()
                    + "\" placeholder=\"是否拼房或单间\" style=\"width: 90%; font-size: 1em;\" /></div><div class=\"clear\"></div></div></div> <br />";
                j++;
            }
        }
    }
}