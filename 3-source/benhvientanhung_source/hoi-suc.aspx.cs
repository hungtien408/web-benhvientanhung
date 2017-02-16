using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class hoi_suc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Page.Title = "Hồi Sức Cấp Cứu";
            var meta = new HtmlMeta() { Name = "description", Content = "Hồi Sức Cấp Cứu" };
            Header.Controls.Add(meta);
        }
    }
}