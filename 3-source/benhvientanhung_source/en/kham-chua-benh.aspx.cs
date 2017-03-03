using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TLLib;

public partial class kham_benh : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string strTitle, strDescription, strMetaTitle, strMetaDescription, strKeyword;
            var oProject = new Project();
            var dv = oProject.ProjectSelectOne("126").DefaultView;
            if (dv != null && dv.Count <= 0) return;
            var row = dv[0];
            strTitle = Server.HtmlDecode(row["ProjectTitleEn"].ToString());
            strDescription = Server.HtmlDecode(row["DescriptionEn"].ToString());
            strMetaTitle = Server.HtmlDecode(row["MetaTittleEn"].ToString());
            strMetaDescription = Server.HtmlDecode(row["MetaDescriptionEn"].ToString());
            strKeyword = Server.HtmlDecode(row["TagEn"].ToString());

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
        }
    }
}