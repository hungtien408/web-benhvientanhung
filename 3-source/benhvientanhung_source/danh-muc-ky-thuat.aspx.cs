using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class danh_muc_kt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Page.Title = "Danh Mục Kỹ Thuật";
            var meta = new HtmlMeta() { Name = "description", Content = "Danh Mục Kỹ Thuật" };
            Header.Controls.Add(meta);
        }
    }
}