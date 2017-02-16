<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="lien-he.aspx.cs" Inherits="lien_he" %>

<%@ Register Src="~/uc/cap-cuu.ascx" TagPrefix="uc1" TagName="capcuu" %>
<%@ Register Src="~/uc/cau-hoi-truc-tuyen.ascx" TagPrefix="uc1" TagName="cauhoitructuyen" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Bệnh viện Tân Hưng</title>
    <meta name="description" content="Bệnh viện Tân Hưng" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_img" Runat="Server">
    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.78393766454!2d106.69418681518609!3d10.751128462599109!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f0952bc150f%3A0xb0b097cad42d2a08!2zQuG7h25oIHZp4buHbiDEkGEga2hvYSBUw6JuIEjGsG5n!5e0!3m2!1svi!2s!4v1487057674415" width="100%" height="230" frameborder="0" style="border:0" allowfullscreen></iframe>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="page_aside" Runat="Server">
    <uc1:capcuu runat="server" ID="capcuu" />
    <uc1:cauhoitructuyen runat="server" ID="cauhoitructuyen" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="page_main" Runat="Server">
    <h1 class="content-tit">liên hệ</h1>
    <div class="lien-he-wrap">
        <div class="left">
            <h3>Liên hệ với chúng tôi</h3>
            <p><span>Địa chỉ:</span> 871 Trần Xuân Soạn, Phường Tân Hưng, Quận 7, Tp.HCM</p>
            <p><span>Hotline:</span> (+84) 8 3776 0648 (6 line) - Fax: (+84) 8 37760722</p>
            <p><span>Website:</span> <a href="#">www.benhvientanhung.com</a> - <a href="#">www.benhvientanhung.vn</a></p>
            <p><span>Email:</span> info@benhvientanhung.com</p>
            <h3>Giờ làm việc</h3>
            <p>Các ngày trong tuần từ Thứ 2 đến Chủ nhật</p>
            <p><span>Thời gian:</span> 8:00 đến 17:00</p>
            <p><span>Trực cấp cứu:</span> 24/7</p>
        </div>
        <div class="right">
            <p>Hãy liên hệ chúng tôi theo địa chỉ trên hoặc gửi tin nhắn cho chúng tôi theo mẫu form sau đây, chúng tôi sẽ trả lời sớm nhất ngay khi nhận được email của quý khách.</p>
            <div class="wrap-send">
                <h4 class="text-uppercase">Chúng tôi có thể giúp gì cho bạn ?</h4>
                <div class="row">
                    <div class="col-xs-6">
                        <div class="contact-w">
                            <%--<label class="contact-lb">Họ &amp; Tên</label>--%>
                            <div class="contact-input">
                                <asp:TextBox ID="txtFullName" CssClass="contact-textbox" runat="server" placeholder="Họ &amp; Tên"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <div class="contact-w">
                            <%--<label class="contact-lb">Email</label>--%>
                            <div class="contact-input">
                                <asp:TextBox ID="TextBox1" CssClass="contact-textbox" runat="server" placeholder="Email"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="contact-w">
                    <%--<label class="contact-lb">Lời nhắn</label>--%>
                    <div class="contact-input">
                        <asp:TextBox ID="TextBox2" CssClass="contact-area" runat="server" TextMode="MultiLine" placeholder="Lời nhắn"></asp:TextBox>
                    </div>
                </div>
                <div class="contact-w">
                    <div class="contact-btn">
                        <asp:Button ID="Button1" CssClass="button-btn" runat="server" Text="Gởi lời nhắn" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

