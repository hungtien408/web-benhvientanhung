<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="chuan-doan.aspx.cs" Inherits="chuan_doan" %>

<%@ Register Src="~/uc/cam-nhan-benh-nhan.ascx" TagPrefix="uc1" TagName="camnhanbenhnhan" %>
<%@ Register Src="~/uc/cap-cuu.ascx" TagPrefix="uc1" TagName="capcuu" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Bệnh viện Tân Hưng</title>
    <meta name="description" content="Bệnh viện Tân Hưng" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_img" runat="Server">
    <img src="assets/images/ck.jpg" alt="Alternate Text" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="page_aside" runat="Server">
    <section class="aside-list">
        <div class="icon-list">
            <img src="assets/images/logo-list.png" alt="">
        </div>
        <div class="list-ul">
            <ul>
                <li><a href="chuyen-khoa.aspx">Các phòng khoa</a></li>
                <li><a href="hoi-suc.aspx">Hồi sức cấp cứu</a></li>
                <li><a href="kham-benh.aspx">Khám chữa bệnh</a></li>
                <li class="active"><a href="chuan-doan.aspx">Chuẩn đoán hình ảnh</a></li>
                <li><a href="goi-kham.aspx">Gói khám sức khỏe</a></li>
            </ul>
        </div>
    </section>
    <uc1:camnhanbenhnhan runat="server" ID="camnhanbenhnhan" />
    <uc1:capcuu runat="server" ID="capcuu" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="page_main" runat="Server">
    <div class="abou-us-content">
        <h1 class="content-tit">chuẩn đoán hình ảnh</h1>
        <p>Chẩn đoán hình ảnh đã và đang đóng vai trò quan trọng trong y khoa, các phương tiện hiện đại ngày nay cho phép chúng ta phát hiện sớm và chính xác hơn các bệnh lý, chúng cũng cho phép hạn chế các thủ thuật điều trị không cần thiết. Bằng cách đó, Chẩn đoán hình ảnh đã tham gia ở tuyến đầu của công tác chăm sóc sức khỏe cho bạn. </p>
        <img src="assets/images/5.jpg" alt="Alternate Text" />
        <p>Hiểu rõ tầm quan trọng của chẩn đoán hình ảnh trong việc phát hiện sớm và chẩn đoán chính xác bệnh, Bệnh viện đa khoa Tân Hưng đã đầu tư mạnh những trang thiết bị y khoa hiện đại hiếm có ở Việt Nam như:</p>
        <p>
            – Máy chụp cộng hưởng từ MRI 3.0 Tesla chạy được những phần mềm hiện đại nhất như: Perffulsion toàn thân (hỗ trợ PET-MRI toàn thân), Function    MRI, MRI bó sợi thần kinh…
            <br />
            – Máy CT Scan 256 lát cắt 2 mức năng lượng – là hệ thống CT có độ nhiễm xạ thấp nhất thế giới hiện nay
        </p>
        <img src="assets/images/6.jpg" alt="Alternate Text" />
    </div>
</asp:Content>

