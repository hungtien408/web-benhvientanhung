using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TLLib;

public partial class tintuc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (((DataView)odsHoiBacSi.Select()).Count <= DataPager1.PageSize)
            {
                DataPager1.Visible = false;
            }
            string strTitle, strDescription, strMetaTitle, strMetaDescription;
            if (!string.IsNullOrEmpty(Request.QueryString["nci"]))
            {
                var oProjectCategory = new ProjectCategory();
                var dv = oProjectCategory.ProjectCategorySelectOne(Request.QueryString["nci"]).DefaultView;
                if (dv != null && dv.Count <= 0) return;
                var row = dv[0];
                strTitle = Server.HtmlDecode(row["ProjectCategoryName"].ToString());
                strDescription = Server.HtmlDecode(row["Description"].ToString());
                strMetaTitle = Server.HtmlDecode(row["MetaTitle"].ToString());
                strMetaDescription = Server.HtmlDecode(row["MetaDescription"].ToString());
                //hdnSanPhamDetails.Value = progressTitle(dv2[0]["ProductCategoryName"].ToString()) + "-pci-" + dv2[0]["ProductCategoryID"].ToString() + ".aspx";
            }
            else
            {
                strTitle = strMetaTitle = "News";
                strDescription = "";
                strMetaDescription = "";
            }
            Page.Title = !string.IsNullOrEmpty(strMetaTitle) ? strMetaTitle : strTitle;
            var meta = new HtmlMeta()
            {
                Name = "description",
                Content = !string.IsNullOrEmpty(strMetaDescription) ?
                    strMetaDescription : strDescription
            };
            Header.Controls.Add(meta);
            //lblTitle.Text = strTitle;
        }
    }
    protected string progressTitle(object input)
    {
        return TLLib.Common.ConvertTitle(input.ToString());
    }
    protected void btnGuiCauHoi_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            //if (RadCaptcha1.IsValid)
            //{
            //send email         
            string msg = "<h3 style='font-size: 18px'>BỆNH VIỆN ĐA KHOA TÂN HƯNG: ĐẶT CÂU HỎI</h3><br/>";
            msg += "<b>Họ tên: </b>" + txtFullNameQuestion.Text.Trim().ToString() + "<br /><br />";
            msg += "<b>Email: </b>" + txtEmailQuestion.Text.Trim().ToString() + "<br /><br />";
            msg += "<b>Điện thoại: </b>" + txtPhoneQuestion.Text.Trim().ToString() + "<br /><br />";
            msg += "<b>Câu hỏi: </b>" + txtQuestion.Text.Trim().ToString();
            TLLib.Common.SendMail("smtp.gmail.com", 587, "webmastersendmail0401@gmail.com", "web123master", "hungtien408@gmail.com", "", "ĐẶT CÂU HỎI BỆNH VIỆN ĐA KHOA TÂN HƯNG", msg, true);
            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", " $(document).ready(function () {alert('Cám ơn bạn đã đặt câu hỏi. Thông báo của bạn đã được gửi đi. Chúng tôi sẽ trả lời bạn trong thời gian sớm nhất!')});", true);
            txtFullNameQuestion.Text = "";
            txtEmailQuestion.Text = "";
            txtPhoneQuestion.Text = "";
            txtQuestion.Text = "";
            //}
        }
    }
}