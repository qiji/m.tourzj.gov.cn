using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net;
using System.IO;
using System.Text;
using System.Drawing;

public partial class admin_MScreen : System.Web.UI.Page
{
    bool sqlexec;
    string sqlresult;
    public string mid;
    bool IsUpLoad = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        mid = Request["mid"];
        if (!IsPostBack)
        {
            DataTable dt = MySQL.ExecProc("usp_M_Info_GetByMid", new string[] { mid }, out sqlexec, out sqlresult).Tables[0];
            Upload1.FileName = dt.Rows[0]["mScreenFile"].ToString();
            iframeScreen.Attributes.Add("src", "http://m.tourzj.gov.cn/admin/meetimgtest.aspx?mid=" + mid);
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        MySQL.ExecProc("usp_M_ScreenFile_SaveByAdmin",
            new string[] { 
                mid,Upload1.FileName,},
            out sqlexec, out sqlresult);
        if (sqlexec)
        {
            Session[WebHint.Web_Hint] = new WebHint("保存成功", "admin/MScreen.aspx?mid=" + mid, HintFlag.跳转);
        }
        else
        {
            Session[WebHint.Web_Hint] = new WebHint("保存失败", "#", HintFlag.错误);
        }
        Response.Redirect(WebHint.HintURL);
    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Upload1.FileName))
        {
            divResult.InnerHtml = "请先上传默认图片";
            return;
        }
        if (IsUpLoad)
        {
            return;
        }
        IsUpLoad = true;
        try
        {
            SendImageToService();
        }
        catch(Exception ex)
        {
            divResult.InnerHtml = ex.Message;
        }
        IsUpLoad = false;
    }

    private void SendImageToService()
    {
        try
        {
            byte[] Img = getImageByte(Server.MapPath("../UpLoad/" + Upload1.FileName));


            if (Img != null)
            {
                HttpWebRequest r = (HttpWebRequest)WebRequest.Create("http://m.tourzj.gov.cn/ajax/ImgService.ashx?mid=" + mid + "&imgsize=" + Img.Length.ToString() + "&r=" + Guid.NewGuid().ToString());
                r.Method = "POST";
                Stream writer = r.GetRequestStream();
                writer.Write(Img, 0, Img.Length);
                writer.Close();

                HttpWebResponse response = (System.Net.HttpWebResponse)r.GetResponse();

                StreamReader ReaderText = new StreamReader(response.GetResponseStream(), Encoding.GetEncoding("utf-8"));
                string ResponseText = ReaderText.ReadToEnd();
                if (ResponseText != "T")
                {
                    divResult.InnerHtml = ResponseText;
                }
            }
        }
        catch (Exception ex)
        {
            divResult.InnerHtml = ex.Message;
        }
    }

    private static byte[] getImageByte(string imagePath)
    {
        Bitmap b = new Bitmap(imagePath);
        MemoryStream ms = new MemoryStream();
        b.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
        byte[] imgByte = ms.GetBuffer();
        ms.Dispose();
        b.Dispose();
        return imgByte;
    }
    //protected void btnScreen_Click(object sender, EventArgs e)
    //{
    //    bool IsUpLoad2 = false;
    //    if (IsUpLoad2)
    //    {
    //        return;
    //    }
    //    IsUpLoad2 = true;
    //    try
    //    {
    //        HttpWebRequest r = (HttpWebRequest)WebRequest.Create("http://m.tourzj.gov.cn/ajax/ImgService.ashx?mid=" + mid + "&type=changeclientid&r=" + Guid.NewGuid().ToString());
    //        r.Method = "GET";
    //        HttpWebResponse response = (System.Net.HttpWebResponse)r.GetResponse();
    //        StreamReader ReaderText = new StreamReader(response.GetResponseStream(), Encoding.GetEncoding("utf-8"));
    //        string ResponseText = ReaderText.ReadToEnd().Split('|')[1];
    //    }
    //    catch (Exception ex)
    //    {
    //        divResult.InnerHtml = ex.Message;
    //    }
    //    IsUpLoad2 = false;
    //}
}