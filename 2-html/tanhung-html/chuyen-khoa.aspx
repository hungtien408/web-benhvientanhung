<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="chuyen-khoa.aspx.cs" Inherits="chuyen_khoa" %>

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
                <li class="active"><a href="chuyen-khoa.aspx">Các phòng khoa</a></li>
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
    <div class="service">
        <h1 class="content-tit">các phòng khoa</h1>
        <div class="row service-main">
            <div class="col-md-4">
                <div class="service-box">
                    <div class="service-name">
                        <a href="#">KHOA NHI</a>
                    </div>
                    <div class="service-img">
                        <a href="#">
                            <img src="assets/images/hinh1.jpg" alt="" /></a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="service-box">
                    <div class="service-name">
                        <a href="#">KHOA TIÊU HÓA, GAN MẬT</a>
                    </div>
                    <div class="service-img">
                        <a href="#">
                            <img src="assets/images/hinh2.jpg" alt="" /></a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="service-box">
                    <div class="service-name">
                        <a href="#">NHA KHOA</a>
                    </div>
                    <div class="service-img">
                        <a href="#">
                            <img src="assets/images/hinh3.jpg" alt="" /></a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="service-box">
                    <div class="service-name">
                        <a href="#">KHOA TIM MẠCH</a>
                    </div>
                    <div class="service-img">
                        <a href="#">
                            <img src="assets/images/hinh4.jpg" alt="" /></a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="service-box">
                    <div class="service-name">
                        <a href="#">KHOA TIẾT NIỆU NAM KHOA</a>
                    </div>
                    <div class="service-img">
                        <a href="#">
                            <img src="assets/images/hinh5.jpg" alt="" /></a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="service-box">
                    <div class="service-name">
                        <a href="#">KHOA PHỤ SẢN</a>
                    </div>
                    <div class="service-img">
                        <a href="#">
                            <img src="assets/images/hinh6.jpg" alt="" /></a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="service-box">
                    <div class="service-name">
                        <a href="#">KHOA TAI MŨI HỌNG</a>
                    </div>
                    <div class="service-img">
                        <a href="#">
                            <img src="assets/images/hinh7.jpg" alt="" /></a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="service-box">
                    <div class="service-name">
                        <a href="#">KHOA NỘI TỔNG QUÁT</a>
                    </div>
                    <div class="service-img">
                        <a href="#">
                            <img src="assets/images/hinh8.jpg" alt="" /></a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="service-box">
                    <div class="service-name">
                        <a href="#">KHOA NỘI THẦN KINH</a>
                    </div>
                    <div class="service-img">
                        <a href="#">
                            <img src="assets/images/hinh9.jpg" alt="" /></a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="service-box">
                    <div class="service-name">
                        <a href="#">KHOA DA LIỄU</a>
                    </div>
                    <div class="service-img">
                        <a href="#">
                            <img src="assets/images/hinh10.jpg" alt="" /></a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="service-box">
                    <div class="service-name">
                        <a href="#">KHOA XƯƠNG KHỚP</a>
                    </div>
                    <div class="service-img">
                        <a href="#">
                            <img src="assets/images/hinh11.jpg" alt="" /></a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="service-box">
                    <div class="service-name">
                        <a href="#">BÁC SĨ GIA ĐÌNH</a>
                    </div>
                    <div class="service-img">
                        <a href="#">
                            <img src="assets/images/hinh12.jpg" alt="" /></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

