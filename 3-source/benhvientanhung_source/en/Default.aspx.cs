using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Page.Title = "Bệnh viện Tân Hưng";
            var meta = new HtmlMeta() { Name = "description", Content = "Bệnh viện Tân Hưng" };
            Header.Controls.Add(meta);
        }
    }
    private void sendEmail()
    {
        var strNgayKham = dpNgayKham.SelectedDate.HasValue ? dpNgayKham.SelectedDate.Value.ToShortDateString() : "";
        var strGioKham = dpGioKham.SelectedDate.HasValue ? dpGioKham.SelectedDate.Value.ToShortTimeString() : "";
        string strThoiGianKham = string.IsNullOrEmpty(strNgayKham) ? "" : strNgayKham + " " + strGioKham;
        string strNgaySinh = dpNgaySinh.SelectedDate.HasValue ? dpNgaySinh.SelectedDate.Value.ToShortDateString() : "";

        string msg = "<h3 style='font-size: 18px'>BỆNH VIỆN ĐA KHOA TÂN HƯNG: ĐẶT LỊCH HẸN</h3><br/>";
        msg += "<b>Họ tên: </b>" + txtFullName.Text.Trim().ToString() + "<br /><br />";
        msg += "<b>Ngày sinh: </b>" + strNgaySinh + "<br /><br />";
        msg += "<b>Giới tính: </b>" + dropListGender.SelectedItem.Text + "<br /><br />";
        msg += "<b>Điện thoại: </b>" + txtPhone.Text.Trim().ToString() + "<br /><br />";
        msg += "<b>Thời gian hẹn: </b>" + strThoiGianKham;
        TLLib.Common.SendMail("smtp.gmail.com", 587, "webmastersendmail0401@gmail.com", "web123master", "hungtien408@gmail.com", "", "ĐẶT LỊCH HẸN BỆNH VIỆN ĐA KHOA TÂN HƯNG", msg, true);
    }
    protected void btnDatHen_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            //if (RadCaptcha1.IsValid)
            //{
                //send email         
                sendEmail();
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", " $(document).ready(function () {alert('Cám ơn bạn đã đặt lịch hẹn. Thông báo của bạn đã được gửi đi. Chúng tôi sẽ liên lạc với bạn trong thời gian sớm nhất!')});", true);
                txtFullName.Text = "";
                txtPhone.Text = "";
            //}
        }
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
    protected string progressTitle(object input)
    {
        return TLLib.Common.ConvertTitle(input.ToString());
    }
}