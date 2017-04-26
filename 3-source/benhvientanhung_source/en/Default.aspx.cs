using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TLLib;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Page.Title = "Bệnh Viện Đa Khoa Tân Hưng - Tan Hung Hospital";
            var meta = new HtmlMeta() { Name = "description", Content = "Bệnh Viện Đa Khoa Tân Hưng - Tan Hung Hospital hội tụ đội ngũ y bác sĩ giàu kinh nghiệm, cơ sở vật chất, máy móc công nghệ hiện đại nhất Việt Nam." };
            var metaKeyword = new HtmlMeta() { Name = "keywords", Content = "Bệnh Viện Đa Khoa Tân Hưng, Tan Hung Hospital" };
            Header.Controls.Add(meta);
            Header.Controls.Add(metaKeyword);

            dpNgaySinh.DateInput.EmptyMessage = "Ngày sinh (*)";
            dpNgayKham.DateInput.EmptyMessage = "Ngày đặt hẹn (*)";
            dpGioKham.DateInput.EmptyMessage = "Giờ hẹn (*)";

            dpNgaySinhPopup.DateInput.EmptyMessage = "Ngày sinh (*)";
            dpNgayKhamPopup.DateInput.EmptyMessage = "Ngày đặt hẹn (*)";
            dpGioKhamPopup.DateInput.EmptyMessage = "Giờ hẹn (*)";
        }
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
        msg += "<b>Chuyên khoa: </b>" + dropListChuyenKhoa.SelectedItem.Text + "<br /><br />";
        msg += "<b>Bác sĩ: </b>" + dropListBacSi.SelectedItem.Text + "<br /><br />";
        msg += "<b>Thời gian hẹn: </b>" + strThoiGianKham;
        TLLib.Common.SendMail("smtp.gmail.com", 587, "webmastersendmail0401@gmail.com", "web123master", "hungtien408@gmail.com", "", "ĐẶT LỊCH HẸN BỆNH VIỆN ĐA KHOA TÂN HƯNG", msg, true);
    }
    private void sendEmail2()
    {
        var strNgayKham = dpNgayKhamPopup.SelectedDate.HasValue ? dpNgayKhamPopup.SelectedDate.Value.ToShortDateString() : "";
        var strGioKham = dpGioKhamPopup.SelectedDate.HasValue ? dpGioKhamPopup.SelectedDate.Value.ToShortTimeString() : "";
        string strThoiGianKham = string.IsNullOrEmpty(strNgayKham) ? "" : strNgayKham + " " + strGioKham;
        string strNgaySinh = dpNgaySinhPopup.SelectedDate.HasValue ? dpNgaySinhPopup.SelectedDate.Value.ToShortDateString() : "";

        string msg = "<h3 style='font-size: 18px'>BỆNH VIỆN ĐA KHOA TÂN HƯNG: ĐẶT LỊCH HẸN</h3><br/>";
        msg += "<b>Họ tên: </b>" + txtFullNamePopup.Text.Trim().ToString() + "<br /><br />";
        msg += "<b>Ngày sinh: </b>" + strNgaySinh + "<br /><br />";
        msg += "<b>Giới tính: </b>" + dropListGenderPopup.SelectedItem.Text + "<br /><br />";
        msg += "<b>Điện thoại: </b>" + txtPhonePopup.Text.Trim().ToString() + "<br /><br />";
        msg += "<b>Chuyên khoa: </b>" + dropListChuyenKhoaPopup.SelectedItem.Text + "<br /><br />";
        msg += "<b>Bác sĩ: </b>" + dropListBacSiPopup.SelectedItem.Text + "<br /><br />";
        msg += "<b>Thời gian hẹn: </b>" + strThoiGianKham;
        TLLib.Common.SendMail("smtp.gmail.com", 587, "webmastersendmail0401@gmail.com", "web123master", "hungtien408@gmail.com", "", "ĐẶT LỊCH HẸN BỆNH VIỆN ĐA KHOA TÂN HƯNG", msg, true);
    }
    protected void btnDatHen_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            var oDatLichKham = new TLLib.DatLichKham();
            var strNgayKham = dpNgayKham.SelectedDate.HasValue ? dpNgayKham.SelectedDate.Value.ToShortDateString() : "";
            var strGioKham = dpGioKham.SelectedDate.HasValue ? dpGioKham.SelectedDate.Value.ToShortTimeString() : "";
            string strThoiGianKham = string.IsNullOrEmpty(strNgayKham) ? "" : strNgayKham + " " + strGioKham;
            string strNgaySinh = dpNgaySinh.SelectedDate.HasValue ? dpNgaySinh.SelectedDate.Value.ToShortDateString() : "";

            //var dataDatHen = oDatLichKham.DatLichKhamSelectAll("", "", "", dropListChuyenKhoa.SelectedValue, dropListBacSi.SelectedValue, strThoiGianKham, "", "", "", "").DefaultView;
            //if (dataDatHen.Count > 0)
            //{
            //    ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", " $(document).ready(function () {alert('Ngày và giờ khám của bác sĩ đã có hẹn, vui lòng đặt hẹn ngày và giờ khác!')});", true);
            //}
            var dataDatHen = oDatLichKham.DatLichKhamSelectAll("", "", "", dropListChuyenKhoa.SelectedValue, dropListBacSi.SelectedValue, "", "", "", "", "", "", "").DefaultView;
            if (dataDatHen.Count > 0)
            {
                DateTime dateNgayKham1 = Convert.ToDateTime(strThoiGianKham);
                DateTime dateNgayKham2 = Convert.ToDateTime(dataDatHen[0]["NgayKham"]);
                if (dateNgayKham1 == dateNgayKham2)
                {
                    ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", " $(document).ready(function () {alert('Ngày và giờ khám của bác sĩ đã có hẹn, vui lòng đặt hẹn ngày và giờ khác!')});", true);
                }
                else
                {
                    int success = oDatLichKham.DatLichKhamInsert(
                        "",
                        txtFullName.Text.Trim().ToString(),
                        strNgaySinh,
                        dropListGender.SelectedValue,
                        txtPhone.Text.Trim().ToString(),
                        "",
                        dropListChuyenKhoa.SelectedValue,
                        dropListBacSi.SelectedValue,
                        "",
                        strThoiGianKham,
                        "",
                        "True",
                        ""
                        );
                    if (success > 0)
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
            }
            else
            {
                int success = oDatLichKham.DatLichKhamInsert(
                            "",
                            txtFullName.Text.Trim().ToString(),
                            strNgaySinh,
                            dropListGender.SelectedValue,
                            txtPhone.Text.Trim().ToString(),
                            "",
                            dropListChuyenKhoa.SelectedValue,
                            dropListBacSi.SelectedValue,
                            "",
                            strThoiGianKham,
                            "",
                            "True",
                            ""
                            );
                if (success > 0)
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
        }
    }
    protected void btnDatHen2_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            var oDatLichKham = new TLLib.DatLichKham();
            var strNgayKham = dpNgayKhamPopup.SelectedDate.HasValue ? dpNgayKhamPopup.SelectedDate.Value.ToShortDateString() : "";
            var strGioKham = dpGioKhamPopup.SelectedDate.HasValue ? dpGioKhamPopup.SelectedDate.Value.ToShortTimeString() : "";
            string strThoiGianKham = string.IsNullOrEmpty(strNgayKham) ? "" : strNgayKham + " " + strGioKham;
            string strNgaySinh = dpNgaySinhPopup.SelectedDate.HasValue ? dpNgaySinhPopup.SelectedDate.Value.ToShortDateString() : "";

            //var dataDatHen = oDatLichKham.DatLichKhamSelectAll("", "", "", dropListChuyenKhoa.SelectedValue, dropListBacSi.SelectedValue, strThoiGianKham, "", "", "", "").DefaultView;
            //if (dataDatHen.Count > 0)
            //{
            //    ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", " $(document).ready(function () {alert('Ngày và giờ khám của bác sĩ đã có hẹn, vui lòng đặt hẹn ngày và giờ khác!')});", true);
            //}
            var dataDatHen = oDatLichKham.DatLichKhamSelectAll("", "", "", dropListChuyenKhoaPopup.SelectedValue, dropListBacSiPopup.SelectedValue, "", "", "", "", "", "", "").DefaultView;
            if (dataDatHen.Count > 0)
            {
                DateTime dateNgayKham1 = Convert.ToDateTime(strThoiGianKham);
                DateTime dateNgayKham2 = Convert.ToDateTime(dataDatHen[0]["NgayKham"]);
                if (dateNgayKham1 == dateNgayKham2)
                {
                    ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", " $(document).ready(function () {alert('Ngày và giờ khám của bác sĩ đã có hẹn, vui lòng đặt hẹn ngày và giờ khác!')});", true);
                }
                else
                {
                    int success = oDatLichKham.DatLichKhamInsert(
                        "",
                        txtFullNamePopup.Text.Trim().ToString(),
                        strNgaySinh,
                        dropListGenderPopup.SelectedValue,
                        txtPhonePopup.Text.Trim().ToString(),
                        "",
                        dropListChuyenKhoaPopup.SelectedValue,
                        dropListBacSiPopup.SelectedValue,
                        "",
                        strThoiGianKham,
                        "",
                        "True",
                        ""
                        );
                    if (success > 0)
                    {
                        //if (RadCaptcha1.IsValid)
                        //{
                        //send email         
                        sendEmail2();
                        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", " $(document).ready(function () {alert('Cám ơn bạn đã đặt lịch hẹn. Thông báo của bạn đã được gửi đi. Chúng tôi sẽ liên lạc với bạn trong thời gian sớm nhất!')});", true);
                        txtFullNamePopup.Text = "";
                        txtPhonePopup.Text = "";

                        //}
                    }
                }
            }
            else
            {
                int success = oDatLichKham.DatLichKhamInsert(
                            "",
                            txtFullNamePopup.Text.Trim().ToString(),
                            strNgaySinh,
                            dropListGenderPopup.SelectedValue,
                            txtPhonePopup.Text.Trim().ToString(),
                            "",
                            dropListChuyenKhoaPopup.SelectedValue,
                            dropListBacSiPopup.SelectedValue,
                            "",
                            strThoiGianKham,
                            "",
                            "True",
                            ""
                            );
                if (success > 0)
                {
                    //if (RadCaptcha1.IsValid)
                    //{
                    //send email         
                    sendEmail2();
                    ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", " $(document).ready(function () {alert('Cám ơn bạn đã đặt lịch hẹn. Thông báo của bạn đã được gửi đi. Chúng tôi sẽ liên lạc với bạn trong thời gian sớm nhất!')});", true);
                    txtFullNamePopup.Text = "";
                    txtPhonePopup.Text = "";

                    //}
                }
            }
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
    protected void btnGuiCamNhan_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string ImageName = FileImageName.UploadedFiles.Count > 0 ? FileImageName.UploadedFiles[0].GetName() : "";
            string ProjectTitle = txtFullNameCamNhan.Text.Trim();
            string ConvertedProjectTitle = Common.ConvertTitle(ProjectTitle);
            var oProject = new TLLib.Project();
            ImageName = oProject.ProjectInsert(ImageName, txtFullNameCamNhan.Text.Trim().ToString(), txtFullNameCamNhan.Text.Trim().ToString(), txtFullNameCamNhan.Text.Trim().ToString(), ConvertedProjectTitle, "", txtContentCamNhan.Text, "", "", "", "", "", "", "", "13", "False", "False", "False", "False", "");
            string strFullPath = "~/res/project/" + ImageName;
            if (!string.IsNullOrEmpty(ImageName))
            {
                FileImageName.UploadedFiles[0].SaveAs(Server.MapPath(strFullPath));
                ResizeCropImage.ResizeByCondition(strFullPath, 89, 89);
                ResizeCropImage.CreateThumbNailByCondition("~/res/project/", "~/res/project/thumbs/", ImageName, 120, 120);
            }
            //if (RadCaptcha1.IsValid)
            //{
            //send email         
            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", " $(document).ready(function () {alert('Cám ơn bạn gửi cảm nhận!')});", true);
            txtFullNameCamNhan.Text = "";
            txtContentCamNhan.Text = "";
            //}
        }
    }
}