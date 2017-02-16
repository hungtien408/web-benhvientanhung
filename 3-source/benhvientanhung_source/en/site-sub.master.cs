using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class uc_site_sub : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnNewLetter_Click(object sender, EventArgs e)
    {
        if (txtEmailNewLetter.Text != "")
        {
            new TLLib.Newsletter().NewsletterInsert(txtEmailNewLetter.Text.ToString().Trim());
        }
        txtEmailNewLetter.Text = "";
    }
    private void sendEmail()
    {
        var strNgayKham = dpNgayKham.SelectedDate.HasValue ? dpNgayKham.SelectedDate.Value.ToShortDateString() : "";
        var strGioKham = dpGioKham.SelectedDate.HasValue ? dpGioKham.SelectedDate.Value.ToShortTimeString() : "";
        string strThoiGianKham = string.IsNullOrEmpty(strNgayKham) ? "" : strNgayKham + " " + strGioKham;
        string strNgaySinh = dpNgaySinh.SelectedDate.HasValue ? dpNgaySinh.SelectedDate.Value.ToShortDateString() : "";

        string msg = "<h3 style='font-size: 18px'>BỆNH VIỆN ĐA KHOA TÂN HƯNG: ĐẶT LỊCH KHÁM</h3><br/>";
        msg += "<b>Đặt hẹn cho: </b>" + rdbDatHen.SelectedItem.Text + "<br /><br />";
        msg += "<b style='font-size: 16px'>--- THÔNG TIN BỆNH NHÂN ---</b><br /><br />";
        msg += "<b>Họ tên: </b>" + txtFullName.Text.Trim().ToString() + "<br /><br />";
        msg += "<b>Ngày sinh: </b>" + strNgaySinh + "<br /><br />";
        msg += "<b>Giới tính: </b>" + dropListGender.SelectedItem.Text + "<br /><br />";
        msg += "<b>Điện thoại: </b>" + txtPhone.Text.Trim().ToString() + "<br /><br />";
        msg += "<b>Email: </b>" + txtEmail.Text.Trim().ToString() + "<br /><br />";
        msg += "<b style='font-size: 16px'>--- THÔNG TIN ĐẶT HẸN ---</b><br /><br />";
        msg += "<b>Chuyên khoa: </b>" + dropListChuyenKhoa.SelectedItem.Text + "<br /><br />";
        msg += "<b>Bác sĩ: </b>" + dropListBacSi.SelectedItem.Text + "<br /><br />";
        if (chkGoiYBacSi.Checked == true)
            msg += "<b>Gợi ý bác sĩ giúp tôi: </b>" + "Có" + "<br /><br />";
        else
            msg += "<b>Gợi ý bác sĩ giúp tôi: </b>" + "Không" + "<br /><br />";
        msg += "<b>Mô tả triệu chứng: </b>" + txtMoTa.Text.Trim().ToString() + "<br /><br />";
        msg += "<b>Thời gian khám bệnh: </b>" + strThoiGianKham;
        TLLib.Common.SendMail("smtp.gmail.com", 587, "webmastersendmail0401@gmail.com", "web123master", "hungtien408@gmail.com", "", "ĐẶT LỊCH KHÁM BỆNH VIỆN ĐA KHOA TÂN HƯNG", msg, true);
    }
    protected void btnDatLich_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (RadCaptcha1.IsValid)
            {
                //send email         
                sendEmail();
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", " $(document).ready(function () {alert('Cám ơn bạn đã đặt lịch khám bệnh. Thông báo của bạn đã được gửi đi. Chúng tôi sẽ liên lạc với bạn trong thời gian sớm nhất!')});", true);
                txtFullName.Text = "";
                txtPhone.Text = "";
                txtEmail.Text = "";
                txtMoTa.Text = "";
            }
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", " $(document).ready(function () {$('.dat-lich a').trigger('click');});", true);
        }
    }
}
