<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="goi-kham.aspx.cs" Inherits="goi_kham" %>

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
                <li><a href="kham-benh.aspx">Khám chữa bệnh</a></li>
                <li class="active"><a href="chuan-doan.aspx">Chuẩn đoán hình ảnh</a></li>
                <li><a href="goi-kham.aspx">Gói khám sức khỏe</a></li>
            </ul>
        </div>
    </section>
    <uc1:camnhanbenhnhan runat="server" ID="camnhanbenhnhan" />
    <uc1:capcuu runat="server" ID="capcuu" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="page_main" Runat="Server">
    <div class="abou-us-content">
        <h1 class="content-tit">gói khám sức khỏe</h1>
        <p>Gói khám sức khỏe dành cho doanh nghiệp</p>
        <p>Bệnh viện đa khoa Tân Hưng tự hào là phòng khám được nhiều doanh nghiệp và tổ chức lựa chọn là điểm đến khám sức khỏe định kỳ cho cán bộ nhân viên bao gồm cả công ty trong nước và nước ngoài. </p>
        <p>Đối với một doanh nghiệp, tài sản quan trọng nhất chính là đội ngũ nhân viên. Chính vì thế, sức khỏe của họ cần được quan tâm đúng mức, bởi nó ảnh hưởng trực tiếp đến hiệu quả hoạt động của doanh nghiệp. Vì vậy, Bệnh viện đa khoa Tân Hưng đã xây dựng dịch vụ khám sức khỏe định kỳ để giúp cho các cho cơ quan/doanh nghiệp có thể nắm rõ tình hình sức khỏe cán bộ nhân viên của mình, đảm bảo nguồn lực lao động cũng như kế hoạch kinh doanh.</p>
        <img src="assets/images/7.jpg" alt="Alternate Text" />
        <p>Gói khám sức khỏe dành cho cá nhân</p>
        <p>Với tiêu chí chăm sóc sức khỏe toàn diện cho khách hàng, Bệnh viện đa khoa Tân Hưng hiện cung cấp dịch vụ khám sức khỏe định kỳ cá nhân với các gói khám đa dạng. Nội dung của các gói khám đều được lựa chọn khoa học nhằm đánh giá chính xác nhất tình trạng sức khỏe của bạn. Tùy theo giới tính, lứa tuổi và nghề nghiệp bạn có thể dễ dàng lựa chọn gói khám phù hợp nhất với chi phí hợp lý.</p>
        <img src="assets/images/8.jpg" alt="Alternate Text" />
        <p>Để biết thêm thông tin chi tiết từng gói khám vui lòng gọi Tổng đài (+84) 8 3776 0648 để được tư vấn.</p>
        <img src="assets/images/9.jpg" alt="Alternate Text" />
    </div>
</asp:Content>

