using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class chuan_doan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Page.Title = "Chuẩn Đoán Hình Ảnh";
            var meta = new HtmlMeta() { Name = "description", Content = "Chuẩn Đoán Hình Ảnh" };
            Header.Controls.Add(meta);
        }
    }
}