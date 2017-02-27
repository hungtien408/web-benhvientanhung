using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class goi_kham : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Page.Title = "Gói Khám Sức Khoẻ";
            var meta = new HtmlMeta() { Name = "description", Content = "Gói Khám Sức Khoẻ" };
            Header.Controls.Add(meta);
        }
    }
}