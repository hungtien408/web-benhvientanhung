<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="tuyen-dung.aspx.cs" Inherits="tuyen_dung" %>

<%@ Register Src="~/uc/cap-cuu.ascx" TagPrefix="uc1" TagName="capcuu" %>
<%@ Register Src="~/uc/cau-hoi-truc-tuyen.ascx" TagPrefix="uc1" TagName="cauhoitructuyen" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Bệnh viện Tân Hưng</title>
    <meta name="description" content="Bệnh viện Tân Hưng" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_img" runat="Server">
    <img src="assets/images/tuyendung.jpg" alt="" />
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
    <h1 class="content-tit">Tuyển dụng</h1>
    <div class="tuyendung-wrap">
        <h3>Hồ sơ xin việc gồm:</h3>
        <p>
            – Đơn xin việc, sơ yếu lý lịch, giấy khám sức khỏe, CMND & hộ khẩu sao y. Bằng cấp liên quan, bảng điểm học tập, quyết định nghỉ việc (nếu có),     02 tấm hình (3x4).
        </p>
        <p>– Tất cả hồ sơ sao y chứng thực trong vòng 6 tháng.</p>
        <h3>Địa điểm nộp hồ sơ:</h3>
        <p>– Trực tiếp tại Bệnh viện đa khoa Tân Hưng – 871 Trần Xuân Soạn, Phường Tân Hưng, Quận 7, Tp.HCM.</p>
        <p>– Điện thoại liên hệ: 0837.760.648 (line 138) hoặc 0126.760.4192 (gặp Ms.Dung).</p>
        <p>– Email: <span>info@benhvientanhung.com</span> hoặc <span>tuyendung@benhvientanhung.com</span></p>
        <div class="luu-y">
            <p><span>Lưu ý:</span> có thể nộp hồ sơ qua đường bưu điện, bên ngoài ghi rõ thông tin cá nhân, vị trí tuyển dụng, số điện thoại liên lạc.</p>
        </div>

        <div class="bor-acc">
            <div class="tin-accodion">
                <div class="accodion-head">
                    <div class="td-location">Vị trí đang tuyển</div>
                    <div class="td-number">Số lượng</div>
                    <div class="td-time">Thời gian đăng tuyển</div>
                </div>
                <div class="accodion-content">
                    <div class="faq">
                        <div class="tin-title">
                            <div class="td-location">Lập trình viên chuyên về android</div>
                            <div class="td-number">1</div>
                            <div class="td-time">01/09 - 30/09/2016</div>
                        </div>
                        <div class="tin-content">
                            <div class="content-wrap">
                                <h3>1. Mô tả công việc:</h3>
                                <p>Viết và bảo trì các ứng dụng chạy trên các thiết bị smart phone, pda, tablet... nền tảng Android.</p>
                                <h3>2. Yêu cầu:</h3>
                                <p>Có kinh nghiệm về lập trình Android, xử lý đồ hoạc, GPS, SMS, web service... trên Android.</p>
                                <h3>3. Phúc lợi:</h3>
                                <p>Lương thưởng cạnh tranh, có nhiều cơ hội thăng tiến.</p>
                            </div>
                        </div>
                    </div>
                    <div class="faq">
                        <div class="tin-title">
                            <div class="td-location">Lập trình viên chuyên về android</div>
                            <div class="td-number">1</div>
                            <div class="td-time">01/09 - 30/09/2016</div>
                        </div>
                        <div class="tin-content">
                            <div class="content-wrap">
                                <h3>1. Mô tả công việc:</h3>
                                <p>Viết và bảo trì các ứng dụng chạy trên các thiết bị smart phone, pda, tablet... nền tảng Android.</p>
                                <h3>2. Yêu cầu:</h3>
                                <p>Có kinh nghiệm về lập trình Android, xử lý đồ hoạc, GPS, SMS, web service... trên Android.</p>
                                <h3>3. Phúc lợi:</h3>
                                <p>Lương thưởng cạnh tranh, có nhiều cơ hội thăng tiến.</p>
                            </div>
                        </div>
                    </div>
                    <div class="faq">
                        <div class="tin-title">
                            <div class="td-location">Lập trình viên chuyên về android</div>
                            <div class="td-number">1</div>
                            <div class="td-time">01/09 - 30/09/2016</div>
                        </div>
                        <div class="tin-content">
                            <div class="content-wrap">
                                <h3>1. Mô tả công việc:</h3>
                                <p>Viết và bảo trì các ứng dụng chạy trên các thiết bị smart phone, pda, tablet... nền tảng Android.</p>
                                <h3>2. Yêu cầu:</h3>
                                <p>Có kinh nghiệm về lập trình Android, xử lý đồ hoạc, GPS, SMS, web service... trên Android.</p>
                                <h3>3. Phúc lợi:</h3>
                                <p>Lương thưởng cạnh tranh, có nhiều cơ hội thăng tiến.</p>
                            </div>
                        </div>
                    </div>
                    <div class="faq">
                        <div class="tin-title">
                            <div class="td-location">Lập trình viên chuyên về android</div>
                            <div class="td-number">1</div>
                            <div class="td-time">01/09 - 30/09/2016</div>
                        </div>
                        <div class="tin-content">
                            <div class="content-wrap">
                                <h3>1. Mô tả công việc:</h3>
                                <p>Viết và bảo trì các ứng dụng chạy trên các thiết bị smart phone, pda, tablet... nền tảng Android.</p>
                                <h3>2. Yêu cầu:</h3>
                                <p>Có kinh nghiệm về lập trình Android, xử lý đồ hoạc, GPS, SMS, web service... trên Android.</p>
                                <h3>3. Phúc lợi:</h3>
                                <p>Lương thưởng cạnh tranh, có nhiều cơ hội thăng tiến.</p>
                            </div>
                        </div>
                    </div>
                    <div class="faq">
                        <div class="tin-title">
                            <div class="td-location">Lập trình viên chuyên về android</div>
                            <div class="td-number">1</div>
                            <div class="td-time">01/09 - 30/09/2016</div>
                        </div>
                        <div class="tin-content">
                            <div class="content-wrap">
                                <h3>1. Mô tả công việc:</h3>
                                <p>Viết và bảo trì các ứng dụng chạy trên các thiết bị smart phone, pda, tablet... nền tảng Android.</p>
                                <h3>2. Yêu cầu:</h3>
                                <p>Có kinh nghiệm về lập trình Android, xử lý đồ hoạc, GPS, SMS, web service... trên Android.</p>
                                <h3>3. Phúc lợi:</h3>
                                <p>Lương thưởng cạnh tranh, có nhiều cơ hội thăng tiến.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

