<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="tin-tuc-chi-tiet.aspx.cs" Inherits="tin_tuc_chi_tiet" %>

<%@ Register Src="~/uc/cam-nhan-benh-nhan.ascx" TagPrefix="uc1" TagName="camnhanbenhnhan" %>
<%@ Register Src="~/uc/cap-cuu.ascx" TagPrefix="uc1" TagName="capcuu" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Bệnh viện Tân Hưng</title>
    <meta name="description" content="Bệnh viện Tân Hưng" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_img" runat="Server">
    <img src="assets/images/tintuc.jpg" alt="Alternate Text" />
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
                <li><a href="chuan-doan.aspx">Chuẩn đoán hình ảnh</a></li>
                <li><a href="goi-kham.aspx">Gói khám sức khỏe</a></li>
            </ul>
        </div>
    </section>
    <uc1:camnhanbenhnhan runat="server" ID="camnhanbenhnhan" />
    <uc1:capcuu runat="server" ID="capcuu" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="page_main" runat="Server">
    <div class="abou-us-content">
        noi dung
    </div>
    <div class="tin-lienquan">
        <h1>Bài viết liên quan</h1>
        <div class="news-carousel owl-carousel">
            <div class="item">
                <img src="assets/images/tt1.jpg" alt="Alternate Text" />
                <div class="content">
                    <a href="#">Ngăn ngừa cận thị như thế nào?</a>
                    <p>Cần phải đi khám bác sỹ nhãn khoa mỗi 3 – 6 tháng để phát hiện sớm các dấu hiệu cận thị.</p>
                    <div class="read-more"><a href="#">Xem thêm</a></div>
                </div>
            </div>
            <div class="item">
                <img src="assets/images/tt1.jpg" alt="Alternate Text" />
                <div class="content">
                    <a href="#">Ngăn ngừa cận thị như thế nào?</a>
                    <p>Cần phải đi khám bác sỹ nhãn khoa mỗi 3 – 6 tháng để phát hiện sớm các dấu hiệu cận thị.</p>
                    <div class="read-more"><a href="#">Xem thêm</a></div>
                </div>
            </div>
            <div class="item">
                <img src="assets/images/tt1.jpg" alt="Alternate Text" />
                <div class="content">
                    <a href="#">Ngăn ngừa cận thị như thế nào?</a>
                    <p>Cần phải đi khám bác sỹ nhãn khoa mỗi 3 – 6 tháng để phát hiện sớm các dấu hiệu cận thị.</p>
                    <div class="read-more"><a href="#">Xem thêm</a></div>
                </div>
            </div>
            <div class="item">
                <img src="assets/images/tt1.jpg" alt="Alternate Text" />
                <div class="content">
                    <a href="#">Ngăn ngừa cận thị như thế nào?</a>
                    <p>Cần phải đi khám bác sỹ nhãn khoa mỗi 3 – 6 tháng để phát hiện sớm các dấu hiệu cận thị.</p>
                    <div class="read-more"><a href="#">Xem thêm</a></div>
                </div>
            </div>
            <div class="item">
                <img src="assets/images/tt1.jpg" alt="Alternate Text" />
                <div class="content">
                    <a href="#">Ngăn ngừa cận thị như thế nào?</a>
                    <p>Cần phải đi khám bác sỹ nhãn khoa mỗi 3 – 6 tháng để phát hiện sớm các dấu hiệu cận thị.</p>
                    <div class="read-more"><a href="#">Xem thêm</a></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

