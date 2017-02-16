<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="about-us.aspx.cs" Inherits="about_us" %>

<%@ Register Src="~/uc/cap-cuu.ascx" TagPrefix="uc1" TagName="capcuu" %>
<%@ Register Src="~/uc/cau-hoi-truc-tuyen.ascx" TagPrefix="uc1" TagName="cauhoitructuyen" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Bệnh viện Tân Hưng</title>
    <meta name="description" content="Bệnh viện Tân Hưng" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_img" runat="Server">
    <img src="assets/images/about-us.jpg" alt="" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="page_aside" runat="Server">
    <section class="aside-list">
        <div class="icon-list">
            <img src="assets/images/logo-list.png" alt="">
        </div>
        <div class="list-ul">
            <ul>
                <li class="active"><a href="about-us.aspx">Về chúng tôi</a></li>
                <li><a href="doi-ngu-bs.aspx">Đội ngũ bác sĩ</a></li>
                <li><a href="thu-vien-anh.aspx">Thư viện ảnh - Video</a></li>
            </ul>
        </div>
    </section>
    <uc1:capcuu runat="server" ID="capcuu" />
    <uc1:cauhoitructuyen runat="server" ID="cauhoitructuyen" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="page_main" runat="Server">
    <div class="abou-us-content">
        <h1 class="content-tit">về chúng tôi</h1>
        <p>Bệnh Viện Đa Khoa Tân Hưng hội tụ đội ngũ y bác sĩ giàu kinh nghiệm, phục vụ tận tình bệnh nhân. Cơ sở vật chất, máy móc công nghệ hiện đại nhất Việt Nam hiện nay như:</p>
        <p>
            – Máy chụp cộng hưởng từ MRI 3.0 Tesla chạy được những phần mềm hiện đại nhất như: Perffulsion toàn thân (hỗ trợ PET-MRI toàn thân),Function MRI, MRI bó sợi thần kinh…
            <br />
            – Máy CT Scan 256 lát cắt 2 mức năng lượng – là hệ thống CT có độ nhiễm xạ thấp nhất thế giới hiện nay.
            <br />
            – Có phòng mổ Hybrid và trang thiết bị hiện đại nhất:
        </p>
        <p>
            Có 6 máy gây mê hiện đại nhất hiện nay ở Việt Nam Aisys CS2 với bình bốc hơi mê điện tử và nhiều chức năng nổi bật tích hợp như theo dõi độ giãn cơ, đánh giá độ mê, đánh giá mức độ đau, dò rễ thần kinh…
            <br />
            Có 4 máy thở hiện đại CARESCAPE R860 và 14 Monitor B850 – B450 theo dõi bệnh nhân. Các máy thở hiện đại này bên cạnh đầy đủ các mode thở còn có chức năng đo cơ học phổi, đo chuyển hóa, phun khí dung và dự đoán khuynh hướng diễn tiến của bệnh nhân.
            <br />
            4 Hệ thống máy phẫu thuật nội soi hiện đại Full HD và 1 hệ thống phẫu thuật nội soi 3D của hãng Aesculap® (Đức)… có thể truyền dữ liệu để hội chẩn hay phục vụ báo cáo, nghiên cứu khoa học…
            <br />
            6 dao điện ForceTriad (Ligasure) hiện đại.
            <br />
            Hệ thống đèn mổ hiện đại Trumpf 2 coupon (iLed 3 và iLed 5) của Đức có hệ thống Camera , tự động điều chỉnh tiêu cự…
            <br />
            Các bàn mổ Trumpf hiện đại thích hợp cho tất cả các phẫu thuật khó khăn nhất như thay khớp hang, cột sống cổ …, chụp C-arm tại bàn mổ.
            <br />
            Hệ thống khí trung tâm hiện đại trong các phòng mổ tích hợp đầy đủ các chức năng như cung cấp khí sạch, cung cấp Oxy, cung cấp khí CO2 hút áp lực, hút khí thải AGSS…
            <br />
            Hệ thống thông khí AHU trong phòng mổ có thể lọc được vi khuẩn và tạo áp suất dương liên tục… Kết hợp với máy phun sát khuẩn phòng mổ với dung dịch Anios đảm bảo một phòng mổ vô trùng tuyệt đối.
            Hệ thống báo gọi y tá từ mỗi đầu giường bệnh , người bệnh có thể nhấn chuông gọi y bác sĩ bất cứ lúc nào.
            <br />
            Các phòng mổ đều được sơn bằng sơn kháng khuẩn và nền được lót bằng vật liệu vinyl đặc biệt: kháng khuẩn, không thấm nước… tiêu chuẩn như các phòng mổ nước ngoài.
            <br />
            Có phòng Xét nghiệm theo tiêu chuẩn FDA của Mỹ
            <br />
            Đội ngũ Y Bác sĩ và đội ngũ chăm sóc sức khỏe tay nghề cao, chuyên nghiệp và tận tâm trang thiết bị tân tiến, hiện đại.
        </p>
    </div>
</asp:Content>

