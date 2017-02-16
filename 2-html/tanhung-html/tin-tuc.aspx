<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="tin-tuc.aspx.cs" Inherits="tintuc" %>

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
    <h1 class="content-tit">tin tức</h1>
    <div class="skin1" role="tabpanel">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation">
                <a href="#tab" aria-controls="tab" role="tab" data-toggle="tab">Thông tin y khoa</a>
            </li>
            <li role="presentation">
                <a href="#tab1" aria-controls="tab" role="tab" data-toggle="tab">Hoạt động xã hội</a>
            </li>
            <li role="presentation">
                <a href="#tab2" aria-controls="tab" role="tab" data-toggle="tab">Thông tin từ bệnh viện</a>
            </li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane" id="tab">
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
            <div role="tabpanel" class="tab-pane" id="tab1">
                1
            </div>
            <div role="tabpanel" class="tab-pane" id="tab2">
                2
            </div>
        </div>
    </div>
    <h1 class="content-tit">hỏi bác sĩ</h1>
    <div class="list-question">
        <div class="top-ques">
            <p>Nếu bạn có thắc mắc vui lòng gửi câu hỏi cho chúng tôi</p>
            <a href="#">Gửi câu hỏi</a>
        </div>
        <div class="item">
            <div class="header">
                <ul>
                    <li>Người gửi: Đỗ Nguyễn Linh Đan</li>
                    <li>Email: linhdan****@gmail.com</li>
                </ul>
            </div>
            <div class="content">
                <h1>Viêm dạ dày có dễ chuyển thành ung thư?</h1>
                <p>Em đi khám nội soi bị viêm dạ dày tá tràng do vi khuẩn HP, được kê đơn thuốc. Xin hỏi bệnh này nếu điều trị không khỏi có bị ung thư dạ dày không ạ? Bác sĩ kê đơn cho em gồm Cefpodoxime Proxetil 200 mg, Doxycylin, Rabeprazole Sodium 20 mg, Sucralfat. Xin hỏi đơn thuốc này uống như thế nào là hiệu quả tốt nhất và cần bổ sung gì để bệnh mau khỏi hơn?</p>
                <div class="traloi">
                    <p>Xem trả lời</p>
                </div>
            </div>
        </div>
        <div class="clr"></div>
        <div class="item">
            <div class="header">
                <ul>
                    <li>Người gửi: Đỗ Nguyễn Linh Đan</li>
                    <li>Email: linhdan****@gmail.com</li>
                </ul>
            </div>
            <div class="content">
                <h1>Viêm dạ dày có dễ chuyển thành ung thư?</h1>
                <p>Em đi khám nội soi bị viêm dạ dày tá tràng do vi khuẩn HP, được kê đơn thuốc. Xin hỏi bệnh này nếu điều trị không khỏi có bị ung thư dạ dày không ạ? Bác sĩ kê đơn cho em gồm Cefpodoxime Proxetil 200 mg, Doxycylin, Rabeprazole Sodium 20 mg, Sucralfat. Xin hỏi đơn thuốc này uống như thế nào là hiệu quả tốt nhất và cần bổ sung gì để bệnh mau khỏi hơn?</p>
                <div class="traloi">
                    <p>Xem trả lời</p>
                </div>
            </div>
        </div>
        <div class="clr"></div>
        <div class="item">
            <div class="header">
                <ul>
                    <li>Người gửi: Đỗ Nguyễn Linh Đan</li>
                    <li>Email: linhdan****@gmail.com</li>
                </ul>
            </div>
            <div class="content">
                <h1>Viêm dạ dày có dễ chuyển thành ung thư?</h1>
                <p>Em đi khám nội soi bị viêm dạ dày tá tràng do vi khuẩn HP, được kê đơn thuốc. Xin hỏi bệnh này nếu điều trị không khỏi có bị ung thư dạ dày không ạ? Bác sĩ kê đơn cho em gồm Cefpodoxime Proxetil 200 mg, Doxycylin, Rabeprazole Sodium 20 mg, Sucralfat. Xin hỏi đơn thuốc này uống như thế nào là hiệu quả tốt nhất và cần bổ sung gì để bệnh mau khỏi hơn?</p>
                <div class="traloi">
                    <p>Xem trả lời</p>
                </div>
            </div>
        </div>
        <div class="clr"></div>
        <div class="item">
            <div class="header">
                <ul>
                    <li>Người gửi: Đỗ Nguyễn Linh Đan</li>
                    <li>Email: linhdan****@gmail.com</li>
                </ul>
            </div>
            <div class="content">
                <h1>Viêm dạ dày có dễ chuyển thành ung thư?</h1>
                <p>Em đi khám nội soi bị viêm dạ dày tá tràng do vi khuẩn HP, được kê đơn thuốc. Xin hỏi bệnh này nếu điều trị không khỏi có bị ung thư dạ dày không ạ? Bác sĩ kê đơn cho em gồm Cefpodoxime Proxetil 200 mg, Doxycylin, Rabeprazole Sodium 20 mg, Sucralfat. Xin hỏi đơn thuốc này uống như thế nào là hiệu quả tốt nhất và cần bổ sung gì để bệnh mau khỏi hơn?</p>
                <div class="traloi">
                    <p>Xem trả lời</p>
                </div>
            </div>
        </div>
        <div class="clr"></div>
        <div class="item">
            <div class="header">
                <ul>
                    <li>Người gửi: Đỗ Nguyễn Linh Đan</li>
                    <li>Email: linhdan****@gmail.com</li>
                </ul>
            </div>
            <div class="content">
                <h1>Viêm dạ dày có dễ chuyển thành ung thư?</h1>
                <p>Em đi khám nội soi bị viêm dạ dày tá tràng do vi khuẩn HP, được kê đơn thuốc. Xin hỏi bệnh này nếu điều trị không khỏi có bị ung thư dạ dày không ạ? Bác sĩ kê đơn cho em gồm Cefpodoxime Proxetil 200 mg, Doxycylin, Rabeprazole Sodium 20 mg, Sucralfat. Xin hỏi đơn thuốc này uống như thế nào là hiệu quả tốt nhất và cần bổ sung gì để bệnh mau khỏi hơn?</p>
                <div class="traloi">
                    <p>Xem trả lời</p>
                </div>
            </div>
        </div>
        <div class="clr"></div>
    </div>
    <div class="pager">
        <a href="#" class="current">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#" class="next fa fa-angle-right"></a>
    </div>
</asp:Content>

