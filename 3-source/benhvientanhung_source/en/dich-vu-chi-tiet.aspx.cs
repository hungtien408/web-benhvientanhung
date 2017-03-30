using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class dich_vu_chi_tiet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string strTitle, strDescription, strMetaTitle, strMetaDescription, strKeyword;
            if (!string.IsNullOrEmpty(Request.QueryString["dv"]))
            {
                var oProject = new TLLib.ProjectCategory();
                var dv = oProject.ProjectCategorySelectOne(Request.QueryString["dv"]).DefaultView;
                if (dv != null && dv.Count <= 0) return;
                var row = dv[0];
                strTitle = Server.HtmlDecode(row["ProjectCategoryNameEn"].ToString());
                strDescription = Server.HtmlDecode(row["DescriptionEn"].ToString());
                strMetaTitle = Server.HtmlDecode(row["MetaTitleEn"].ToString());
                strMetaDescription = Server.HtmlDecode(row["MetaDescriptionEn"].ToString());
                strKeyword = Server.HtmlDecode(row["TagEn"].ToString());
                //hdnSanPhamDetails.Value = progressTitle(dv2[0]["ProductCategoryName"].ToString()) + "-pci-" + dv2[0]["ProductCategoryID"].ToString() + ".aspx";
            }
            else
            {
                strTitle = strMetaTitle = "Services";
                strDescription = "Services";
                strMetaDescription = "Services";
                strKeyword = "Services";
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
}