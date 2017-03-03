using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TLLib;

public partial class tin_tuc_chi_tiet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string strTitle, strDescription, strMetaTitle, strMetaDescription, strKeyword;
            if (!string.IsNullOrEmpty(Request.QueryString["tt"]))
            {
                var oProject = new Project();
                var dv = oProject.ProjectSelectOne(Request.QueryString["tt"]).DefaultView;
                if (dv != null && dv.Count <= 0) return;
                var row = dv[0];
                strTitle = Server.HtmlDecode(row["ProjectTitleEn"].ToString());
                strDescription = Server.HtmlDecode(row["DescriptionEn"].ToString());
                strMetaTitle = Server.HtmlDecode(row["MetaTittleEn"].ToString());
                strMetaDescription = Server.HtmlDecode(row["MetaDescriptionEn"].ToString());
                strKeyword = Server.HtmlDecode(row["TagEn"].ToString());
                //hdnSanPhamDetails.Value = progressTitle(dv2[0]["ProductCategoryName"].ToString()) + "-pci-" + dv2[0]["ProductCategoryID"].ToString() + ".aspx";
                hdnTitle.Value = dv[0]["ProjectTitle"].ToString();
                hdnDescription.Value = dv[0]["MetaDescription"].ToString();
                hdnImageName.Value = dv[0]["ImageName"].ToString();
            }
            else
            {
                strTitle = strMetaTitle = "News";
                strDescription = "";
                strMetaDescription = "";
                strKeyword = "";
            }
            Page.Title = !string.IsNullOrEmpty(strMetaTitle) ? strMetaTitle : strTitle;
            var meta = new HtmlMeta()
            {
                Name = "description",
                Content = !string.IsNullOrEmpty(strMetaDescription) ?
                    strMetaDescription : strDescription
            }; 
            var metaKeyword = new HtmlMeta()
            {
                Name = "keywords",
                Content = !string.IsNullOrEmpty(strKeyword) ?
                    strKeyword : strDescription
            };
            Header.Controls.Add(meta);
            Header.Controls.Add(metaKeyword);
            //lblTitle.Text = strTitle;
        }
    }
    protected string progressTitle(object input)
    {
        return TLLib.Common.ConvertTitle(input.ToString());
    }
}