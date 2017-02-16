using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class uc_cau_hoi_truc_tuyen : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

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