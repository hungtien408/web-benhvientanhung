using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class doi_ngu_bs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (((DataView)odsDoiNguBacSi.Select()).Count <= DataPager1.PageSize)
            {
                DataPager1.Visible = false;
            }

            Page.Title = "Đội Ngũ Bác Sĩ";
            var meta = new HtmlMeta() { Name = "description", Content = "Đội Ngũ Bác Sĩ" };
            Header.Controls.Add(meta);
        }
    }
    protected void DropDownList_DataBound(object sender, EventArgs e)
    {
        var cbo = (DropDownList)sender;
        cbo.Items.Insert(0, new ListItem("Chọn Khoa"));
    }
    protected void btnSearchKhoa_Click(object sender, EventArgs e)
    {
        var dsSelectParam = odsDoiNguBacSi.SelectParameters;

        if (dropListKhoa.SelectedIndex != 0)
        {
            dsSelectParam["Keyword"].DefaultValue = txtSearchKhoa.Text;
            dsSelectParam["ProjectCategoryID"].DefaultValue = dropListKhoa.SelectedValue;
        }
        else
        {
            dsSelectParam["Keyword"].DefaultValue = txtSearchKhoa.Text;
            dsSelectParam["ProjectCategoryID"].DefaultValue = "17";
        }

        if (((DataView)odsDoiNguBacSi.Select()).Count <= DataPager1.PageSize)
        {
            DataPager1.Visible = false;
        }
        else
        {
            DataPager1.Visible = true;
        }
    }
}