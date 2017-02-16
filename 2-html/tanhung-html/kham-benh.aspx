<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="kham-benh.aspx.cs" Inherits="kham_benh" %>

<%@ Register Src="~/uc/cam-nhan-benh-nhan.ascx" TagPrefix="uc1" TagName="camnhanbenhnhan" %>
<%@ Register Src="~/uc/cap-cuu.ascx" TagPrefix="uc1" TagName="capcuu" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Bệnh viện Tân Hưng</title>
    <meta name="description" content="Bệnh viện Tân Hưng" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_img" Runat="Server">
    <img src="assets/images/ck.jpg" alt="Alternate Text" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="page_aside" Runat="Server">
    <section class="aside-list">
        <div class="icon-list">
            <img src="assets/images/logo-list.png" alt="">
        </div>
        <div class="list-ul">
            <ul>
                <li><a href="chuyen-khoa.aspx">Các phòng khoa</a></li>
                <li><a href="hoi-suc.aspx">Hồi sức cấp cứu</a></li>
                <li class="active"><a href="kham-benh.aspx">Khám chữa bệnh</a></li>
                <li><a href="chuan-doan.aspx">Chuẩn đoán hình ảnh</a></li>
                <li><a href="goi-kham.aspx">Gói khám sức khỏe</a></li>
            </ul>
        </div>
    </section>
    <uc1:camnhanbenhnhan runat="server" ID="camnhanbenhnhan" />
    <uc1:capcuu runat="server" ID="capcuu" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="page_main" Runat="Server">
    <div class="abou-us-content">
        <h1 class="content-tit">khám chữa bệnh</h1>
        <p>Dịch vụ khám chữa bệnh của Bệnh viện đa khoa Tân Hưng với đội ngũ y bác sĩ giàu kinh nghiệm, phục vụ tận tình và trang thiết bị sẵn sàng, luôn túc trực 24/7. </p>
        <p>Quy trình khám bệnh đơn giản, khoa học, thủ tục nhanh gọn, không để bệnh nhân phải chờ lâu, phần lớn kết thúc quy trình khám bệnh ngoại trú trong ngày. Khoa Khám bệnh tổ chức lịch khám liên tục các ngày trong tuần từ thứ 2 đến thứ 7, do các  Bác sĩ CKII, CKI, Thạc sĩ chuyên môn… phụ trách, đảm bảo công tác khám, chẩn đoán, điều trị bệnh lý kịp thời và tư vấn chăm sóc sức khỏe nhân dân.</p>
        <img src="assets/images/4.jpg" alt="Alternate Text" />
    </div>
</asp:Content>

