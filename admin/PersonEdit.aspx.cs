using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_PersonEdit : System.Web.UI.Page
{
    bool sqlexec;
    string sqlresult;
    string mid;
    string id;
    protected void Page_Load(object sender, EventArgs e)
    {
        mid = Request["mid"];
        id = Request["ID"];
        if (!IsPostBack)
        {
            aback.HRef = "PersonList.aspx?mid=" + Request["mid"];
            DataTable dt = MySQL.ExecProc("usp_M_State_GetByMid", new string[] { mid }, out sqlexec, out sqlresult).Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    ddlpState.Items.Add(new ListItem(dr["sName"].ToString(), dr["pState"].ToString()));
                }
            }
            else
            {
                divstate.Visible = false;
            }

            if (!string.IsNullOrEmpty(id))
            {
                GetData();
            }
            else
            {
                divTime.Visible = false;
            }
        }
    }

    private void GetData()
    {
        DataTable dt = MySQL.ExecProc("usp_M_Person_GetByid",
            new string[] { id },
            out sqlexec, out sqlresult).Tables[0];

        if (dt.Rows.Count > 0)
        {
            tpName.Text = dt.Rows[0]["pName"].ToString();
            ddlpGender.SelectedValue = dt.Rows[0]["pGender"].ToString();
            tpMobile.Text = dt.Rows[0]["pMobile"].ToString();
            tpUnitName.Text = dt.Rows[0]["pUnitName"].ToString();
            tpTitle.Text = dt.Rows[0]["pTitle"].ToString();
            ddlpState.SelectedValue = dt.Rows[0]["pState"].ToString();
            lblSignTime.Text = dt.Rows[0]["SignTime"].ToString();
            lblRegTime.Text = dt.Rows[0]["RegTime"].ToString();
            btnDel.Visible = true;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!IsHandset(tpMobile.Text.Trim()))
        {
            Session[WebHint.Web_Hint] = new WebHint("操作失败:手机号码格式错误！", "#", HintFlag.错误);
            Response.Redirect(WebHint.HintURL);
            return;
        }
        MySQL.ExecProc("usp_M_Person_Save",
                        new string[] 
                        { 
                            id,
                            mid,
                            tpName.Text.Trim(),
                            tpUnitName.Text.Trim(),
                            tpTitle.Text.Trim(),
                            ddlpGender.SelectedValue,
                            tpMobile.Text.Trim(),
                            string.IsNullOrEmpty(ddlpState.SelectedValue)?"0":ddlpState.SelectedValue,
                            "",
                            ""
                        },
                        out sqlexec, out sqlresult);

        if (sqlexec)
        {
            Session["WebHint"] = new WebHint("保存成功！", "admin/PersonList.aspx?mid=" + mid, HintFlag.跳转);
        }
        else
        {
            Session["WebHint"] = new WebHint("保存失败，错误代码：" + sqlresult, "#", HintFlag.跳转);
        }
        Response.Redirect(WebHint.HintURL);
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {
        MySQL.ExecProc("usp_M_Person_Del",
                       new string[] 
                        { 
                            id
                        },
                       out sqlexec, out sqlresult);

        if (sqlexec)
        {
            Session["WebHint"] = new WebHint("保存成功！", "admin/PersonList.aspx?mid=" + Request["mid"], HintFlag.跳转);
        }
        else
        {
            Session["WebHint"] = new WebHint("保存失败，错误代码：" + sqlresult, "#", HintFlag.跳转);
        }
        Response.Redirect(WebHint.HintURL);
    }
    public bool IsHandset(string str_handset)
    {
        return System.Text.RegularExpressions.Regex.IsMatch(str_handset, @"^1[34578]\d{9}$");
    }
}