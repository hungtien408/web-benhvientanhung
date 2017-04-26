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
        dpNgaySinh.DateInput.EmptyMessage = "Ngày sinh (*)";
        dpNgayKham.DateInput.EmptyMessage = "Ngày đặt hẹn (*)";
        dpGioKham.DateInput.EmptyMessage = "Giờ hẹn (*)";

    }
    protected void DropDownListKhoa_DataBound(object sender, EventArgs e)
    {
        var cbo = (DropDownList)sender;
        cbo.Items.Insert(0, new ListItem("--Chọn Khoa--", ""));
    }
    protected void DropDownListBacSi_DataBound(object sender, EventArgs e)
    {
        var cbo = (DropDownList)sender;
        cbo.Items.Insert(0, new ListItem("--Chọn Bác Sĩ--", ""));
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
        TLLib.Common.SendMail("smtp.gmail.com", 587, "webmastersendmail0401@gmail.com", "web123master", "info@benhvientanhung.com", "", "ĐẶT LỊCH KHÁM BỆNH VIỆN ĐA KHOA TÂN HƯNG", msg, true);
    }
    protected void btnDatLich_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (RadCaptcha1.IsValid)
            {
                var oDatLichKham = new TLLib.DatLichKham();
                var strNgayKham = dpNgayKham.SelectedDate.HasValue ? dpNgayKham.SelectedDate.Value.ToShortDateString() : "";
                var strGioKham = dpGioKham.SelectedDate.HasValue ? dpGioKham.SelectedDate.Value.ToShortTimeString() : "";
                string strThoiGianKham = string.IsNullOrEmpty(strNgayKham) ? "" : strNgayKham + " " + strGioKham;
                string strNgaySinh = dpNgaySinh.SelectedDate.HasValue ? dpNgaySinh.SelectedDate.Value.ToShortDateString() : "";

                var dataDatHen = oDatLichKham.DatLichKhamSelectAll("", "", "", dropListChuyenKhoa.SelectedValue, dropListBacSi.SelectedValue, strThoiGianKham, "", "", "", "", "", "").DefaultView;
                if (dataDatHen.Count > 0)
                {
                    DateTime dateNgayKham1 = Convert.ToDateTime(strThoiGianKham);
                    DateTime dateNgayKham2 = Convert.ToDateTime(dataDatHen[0]["NgayKham"]);
                    if (dateNgayKham1 == dateNgayKham2)
                    {
                        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", " $(document).ready(function () {alert('Ngày và giờ khám của bác sĩ đã có hẹn, vui lòng đặt hẹn ngày và giờ khác!')});", true);
                        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", " $(document).ready(function () {$('.dat-lich a').trigger('click');});", true);
                    }
                    else
                    {
                        int success = oDatLichKham.DatLichKhamInsert(
                        rdbDatHen.SelectedValue,
                        txtFullName.Text.Trim().ToString(),
                        strNgaySinh,
                        dropListGender.SelectedValue,
                        txtPhone.Text.Trim().ToString(),
                        txtEmail.Text.Trim().ToString(),
                        dropListChuyenKhoa.SelectedValue,
                        dropListBacSi.SelectedValue,
                        txtMoTa.Text.Trim().ToString(),
                        strThoiGianKham,
                        "",
                        "True",
                        ""
                        );
                        if (success > 0)
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
                }
                else
                {
                    int success = oDatLichKham.DatLichKhamInsert(
                        rdbDatHen.SelectedValue,
                        txtFullName.Text.Trim().ToString(),
                        strNgaySinh,
                        dropListGender.SelectedValue,
                        txtPhone.Text.Trim().ToString(),
                        txtEmail.Text.Trim().ToString(),
                        dropListChuyenKhoa.SelectedValue,
                        dropListBacSi.SelectedValue,
                        txtMoTa.Text.Trim().ToString(),
                        strThoiGianKham,
                        "",
                        "True",
                        ""
                        );
                    if (success > 0)
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

            }
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", " $(document).ready(function () {$('.dat-lich a').trigger('click');});", true);
        }
    }
}
