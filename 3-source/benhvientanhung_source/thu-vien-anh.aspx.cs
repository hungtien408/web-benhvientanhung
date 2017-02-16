using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class thu_vien_anh : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Page.Title = "Thư Viện Ảnh";
            var meta = new HtmlMeta() { Name = "description", Content = "Thư Viện Ảnh" };
            Header.Controls.Add(meta);
        }
    }
    protected void lstPhotoCategory2_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        var DataPager1 = (DataPager)e.Item.FindControl("DataPager1");
        var odsPhotoAlbumCategory = (ObjectDataSource)e.Item.FindControl("odsPhotoAlbumCategory");

        if (((DataView)odsPhotoAlbumCategory.Select()).Count <= DataPager1.PageSize)
        {
            DataPager1.Visible = false;
        }
    }
}