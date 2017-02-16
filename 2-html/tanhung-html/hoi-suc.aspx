<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="hoi-suc.aspx.cs" Inherits="hoi_suc" %>

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
                <li class="active"><a href="hoi-suc.aspx">Hồi sức cấp cứu</a></li>
                <li><a href="kham-benh.aspx">Khám chữa bệnh</a></li>
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
        <h1 class="content-tit">các phòng khoa</h1>
        <p>Dịch vụ cấp cứu ngoại viện của Bệnh viện đa khoa Tân Hưng với hệ thống xe cấp cứu và trang thiết bị sẵn sàng, luôn túc trực 24/7. </p>
        <p>Đội ngũ nhân viên cấp cứu bao gồm các bác sĩ, kỹ thuật viên, điều dưỡng, lái xe đã được huấn luyện và thực tập kĩ lưỡng về chuyên môn, qui trình sơ cứu, phương pháp vận chuyển, nhằm đảm bảo an toàn cao nhất cho bệnh nhân trên đường nhập viện.</p>
        <img src="assets/images/3.jpg" alt="Alternate Text" />
        <p>Phòng khám cung cấp dịch vụ đưa đón tại nhà, sân bay… bằng xe cấp cứu trong trường hợp cần sự hỗ trợ của bác sĩ hoặc y tá trong quá trình di chuyển từ nhà tới viện hoặc tới các điểm khác.</p>
    </div>
</asp:Content>

