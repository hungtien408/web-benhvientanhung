using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TLLib;

public partial class bang_gia_dv : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string strTitle, strDescription, strMetaTitle, strMetaDescription;
            var oProjectCategory = new ProjectCategory();
            var dv = oProjectCategory.ProjectCategorySelectOne(Request.QueryString["bg"]).DefaultView;
            if (dv != null && dv.Count <= 0) return;
            var row = dv[0];
            strTitle = Server.HtmlDecode(row["ProjectCategoryNameEn"].ToString());
            strDescription = Server.HtmlDecode(row["DescriptionEn"].ToString());
            strMetaTitle = Server.HtmlDecode(row["MetaTitleEn"].ToString());
            strMetaDescription = Server.HtmlDecode(row["MetaDescriptionEn"].ToString());

            Page.Title = !string.IsNullOrEmpty(strMetaTitle) ? strMetaTitle : strTitle;
            var meta = new HtmlMeta()
            {
                Name = "description",
                Content = !string.IsNullOrEmpty(strMetaDescription) ?
                    strMetaDescription : strDescription
            };
            Header.Controls.Add(meta);
        }
    }
}