using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class j : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string encodeurl = HttpUtility.UrlEncode("http://m.tourzj.gov.cn/setcookie.aspx?mid=" + Request["mid"]);
        string dhurl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx9c20277acdfbe85b&redirect_uri=" + encodeurl + "&response_type=code&scope=snsapi_base#wechat_redirect";
        Response.Redirect(dhurl);

    }
}