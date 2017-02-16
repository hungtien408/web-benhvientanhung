using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class bang_gia_dv : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Page.Title = "Bảng Giá Dịch Vụ";
            var meta = new HtmlMeta() { Name = "description", Content = "Bảng Giá Dịch Vụ" };
            Header.Controls.Add(meta);
        }
    }
}