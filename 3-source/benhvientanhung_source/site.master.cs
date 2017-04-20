using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TLLib;

public partial class site : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Page.Header.DataBind();
            string page = Request.Url.PathAndQuery.ToLower();

            string startScript = "<script type='text/javascript'>";
            string endScript = "')</script>";
            string activePage = "";

            if (page.Contains("san-pham.aspx?ci=") || page.Contains("chi-tiet-san-pham.aspx?pi="))
                activePage = "san-pham.aspx";
            else if (page.Contains("-tt-"))
                activePage = "tin-tuc.aspx";
            else if (!page.EndsWith("default.aspx"))
                activePage = Path.GetFileName(page);

            if (!string.IsNullOrEmpty(activePage))
                runScript.InnerHtml = startScript + "changeActiveMenu('" + activePage + endScript;

            runScript.InnerHtml += startScript + "changeSubActiveMenu('" + Path.GetFileName(page) + endScript;
        }
    }
    protected string progressTitle(object input)
    {
        return TLLib.Common.ConvertTitle(input.ToString());
    }
    protected void btnVN_Click(object sender, ImageClickEventArgs e)
    {
        string path = Page.Request.Url.AbsolutePath;
        if (path.ToLower() == "default.aspx")
        {
            path = "";
        }
        Response.Redirect("~/" + path);
    }
    protected void btnEN_Click(object sender, ImageClickEventArgs e)
    {
        string path = Page.Request.Url.AbsolutePath;
        if (path.ToLower() == "default.aspx")
        {
            path = "";
        }
        Response.Redirect("~/en/" + path);
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        //Response.Redirect("tim-kiem.aspx?kw=" + txtSearch.Text.Trim());
        if (txtSearch.Text != "")
        {
            Session["Keyword"] = txtSearch.Text;
            Response.Redirect("~/tim-kiem.aspx?kw=" + txtSearch.Text);
        }
        else
        {
            Common.ShowAlert("Chưa nhập từ khóa!");
        }
        //Response.Redirect("tim-kiem.aspx?dm=" + DropDownList1.SelectedValue + "&kw=" + searchTextBox.Text.Trim());
    }
}
