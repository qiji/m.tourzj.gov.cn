using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.IO;
using System.Drawing;

public partial class admin_Upload : System.Web.UI.UserControl
{
    public delegate bool DeleteImg();

    public event DeleteImg OnDeleteImg;

    public delegate bool AfterUpLoad(string filename);

    public event AfterUpLoad OnAfterUpLoad;

    public string FileName
    {
        get
        {
            return HiddenField1.Value;
        }
        set
        {
            HiddenField1.Value = value;
            if (string.IsNullOrEmpty(HiddenField1.Value))
            {
                view.Visible = false;
                FileView.NavigateUrl = "";
            }
            else
            {
                view.Visible = true;
                FileView.NavigateUrl = "../UpLoad/" + HiddenField1.Value;
            }
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lb.Text = "";
        }
    }


    protected void btnUpLoad_Click(object sender, EventArgs e)
    {
        string date = DateTime.Now.ToString("yyMMdd");
        string newPath = Server.MapPath("../Upload/" + date + "/");
        if (!Directory.Exists(newPath))
        {
            System.IO.DirectoryInfo di = new System.IO.DirectoryInfo(newPath);
            di.Create();
        }

        if (fp.HasFile)
        {
            if (fp.FileBytes.Length > 50 * 1024 * 1024)
            {
                Session["WebHint"] = new WebHint("上传文件太大。请确保上传的文件不超过50M。", "#", HintFlag.跳转);
                Response.Redirect("Hint.aspx");
            }
            try
            {

                HiddenField1.Value = date + "/" + Guid.NewGuid().ToString() + Path.GetExtension(fp.FileName); ;
                view.Visible = true;
                fp.SaveAs(Server.MapPath("../UpLoad/" + HiddenField1.Value));
                FileView.NavigateUrl = "../UpLoad/" + HiddenField1.Value;
                lb.Text = "上传成功";
                if (OnAfterUpLoad != null)
                {
                    OnAfterUpLoad(HiddenField1.Value);
                }
            }
            catch (Exception ee)
            {
                lb.Text = "出错" + ee.Message;
                return;
            }
        }
        else
        {
            lb.Text = "请选择需要上传的文件！";
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (OnDeleteImg != null)
        {
            if (OnDeleteImg())
            {
                File.Delete(Server.MapPath("../UpLoad/" + HiddenField1.Value));
                lb.Text = "删除成功!";
                HiddenField1.Value = "";
                view.Visible = false;
                FileView.NavigateUrl = "";
            }
            else
                lb.Text = "删除失败!";
        }
        else
            lb.Text = "删除失败!OnDeleteImg is null";
    }
}
