<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="doi-ngu-bs.aspx.cs" Inherits="doi_ngu_bs" %>

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
                <li><a href="about-us.aspx">Về chúng tôi</a></li>
                <li class="active"><a href="doi-ngu-bs.aspx">Đội ngũ bác sĩ</a></li>
                <li><a href="thu-vien-anh.aspx">Thư viện ảnh - Video</a></li>
            </ul>
        </div>
    </section>
    <uc1:capcuu runat="server" ID="capcuu" />
    <uc1:cauhoitructuyen runat="server" ID="cauhoitructuyen" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="page_main" runat="Server">
    <h1 class="content-tit">đội ngũ bác sĩ</h1>
    <div class="doingu-search">
        <p>Nhập tên bác sĩ hoặc chọn chuyên khoa để tìm kiếm</p>
        <asp:TextBox ID="TextBox1" runat="server" placeholder="Tìm theo tên bác sĩ"></asp:TextBox>
        <select>
            <option value="value" disabled="disabled" selected="selected">Chọn khoa</option>
            <option value="value">Khoa 1</option>
            <option value="value">Khoa 2</option>
            <option value="value">Khoa 3</option>
            <option value="value">Khoa 4</option>
        </select>
        <asp:Button ID="Button1" runat="server" Text="Tìm kiếm" />
    </div>
    <div class="clr"></div>
    <div class="list-doingu">
        <div class="item">
            <div class="relative-item">
                <img src="assets/images/bs-1.png" alt="" />
                <div class="wrap-item">
                    <div class="content">
                            <p>DR. HƯNG NGUYỄN</p>
                            <span>khoa tai mũi họng</span>
                    </div>
                </div>
            </div>
            <div class="popup scroll-popup">
                <div class="popup-content">
                    <div class="modaltitle">KHOA TIÊU HÓA - GAN MẬT</div>
                    <div class="modal-main">
                        <div class="info-main">
                            <div class="info-img"><img src="assets/images/info1.jpg" alt="" /></div>
                            <div class="info-box">
                                <ul>
                                    <li>
                                        <div class="info-title">Họ Tên:</div> Nguyễn Trí Đoàn</li>
                                    <li><div class="info-title">Chức vụ:</div> Bác sĩ</li>
                                    <li><div class="info-title">Chuyên ngành:</div> Khoa tiêu hóa - gan mật</li>
                                    <li><div class="info-title">Kinh nghiệm:</div> Hơn 15 năm</li>
                                    <li><div class="info-title">Ngoại ngữ:</div> Tiếng Việt, Tiếng Anh</li>
                                </ul>
                            </div>
                        </div>
                        <div class="info-content">
                            <h1>Bằng cấp chuyên môn:</h1>
                            <ul>
                                <li>Tốt nghiệp trường ĐH Y Dược Tp. Hồ Chí Minh 2006.</li>
                                <li>Chứng chỉ khóa Huấn luyện Xử Trí Bệnh lý và Chăm sóc Trẻ Sơ Sinh và Nhi Khoa sau Đại Học (Cơ bản và Nâng cao, tại bệnh viện Nhi Đồng 1) 2007.</li>
                            </ul>
                            <br />
                                <h1>Kinh nghiệm y khoa:</h1>
                            <ul>
                                <li>Bệnh viện Nhi Đồng 1 (2007-2011).</li>
                                <li>Phòng khám Quốc tế An Phú.</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="relative-item">
                <img src="assets/images/bs-2.png" alt="" />
                <div class="wrap-item">
                    <div class="content">
                        <a href="#">
                            <p>DR. PHÚC KHANG</p>
                            <span>khoa nội</span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="popup scroll-popup">
                <div class="popup-content">
                    <div class="modaltitle">KHOA TIÊU HÓA - GAN MẬT 1</div>
                    <div class="modal-main">
                        <div class="info-main">
                            <div class="info-img"><img src="assets/images/info1.jpg" alt="" /></div>
                            <div class="info-box">
                                <ul>
                                    <li>
                                        <div class="info-title">Họ Tên:</div> Nguyễn Trí Đoàn 1</li>
                                    <li><div class="info-title">Chức vụ:</div> Bác sĩ</li>
                                    <li><div class="info-title">Chuyên ngành:</div> Khoa tiêu hóa - gan mật</li>
                                    <li><div class="info-title">Kinh nghiệm:</div> Hơn 15 năm</li>
                                    <li><div class="info-title">Ngoại ngữ:</div> Tiếng Việt, Tiếng Anh</li>
                                </ul>
                            </div>
                        </div>
                        <div class="info-content">
                            <h1>Bằng cấp chuyên môn:</h1>
                            <ul>
                                <li>Tốt nghiệp trường ĐH Y Dược Tp. Hồ Chí Minh 2006.</li>
                                <li>Chứng chỉ khóa Huấn luyện Xử Trí Bệnh lý và Chăm sóc Trẻ Sơ Sinh và Nhi Khoa sau Đại Học (Cơ bản và Nâng cao, tại bệnh viện Nhi Đồng 1) 2007.</li>
                            </ul>
                            <br />
                                <h1>Kinh nghiệm y khoa:</h1>
                            <ul>
                                <li>Bệnh viện Nhi Đồng 1 (2007-2011).</li>
                                <li>Phòng khám Quốc tế An Phú.</li>
                            </ul>
                        </div>
                    </div>
                    <a href="javascript:void(0);" class="close-modal"></a>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="relative-item">
                <img src="assets/images/bs-3.png" alt="" />
                <div class="wrap-item">
                    <div class="content">
                        <a href="#">
                            <p>DR. BẢO CHÂU</p>
                            <span>khoa chuẩn đoán hình ảnh</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="relative-item">
                <img src="assets/images/bs-4.png" alt="" />
                <div class="wrap-item">
                    <div class="content">
                        <a href="#">
                            <p>DR. THANH HỒNG</p>
                            <span>khoa mắt</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="relative-item">
                <img src="assets/images/bs-1.png" alt="" />
                <div class="wrap-item">
                    <div class="content">
                        <a href="#">
                            <p>DR. HƯNG NGUYỄN</p>
                            <span>khoa tai mũi họng</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="relative-item">
                <img src="assets/images/bs-2.png" alt="" />
                <div class="wrap-item">
                    <div class="content">
                        <a href="#">
                            <p>DR. PHÚC KHANG</p>
                            <span>khoa nội</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="relative-item">
                <img src="assets/images/bs-3.png" alt="" />
                <div class="wrap-item">
                    <div class="content">
                        <a href="#">
                            <p>DR. BẢO CHÂU</p>
                            <span>khoa chuẩn đoán hình ảnh</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="relative-item">
                <img src="assets/images/bs-4.png" alt="" />
                <div class="wrap-item">
                    <div class="content">
                        <a href="#">
                            <p>DR. THANH HỒNG</p>
                            <span>khoa mắt</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="clr"></div>
    <div class="pager">
        <a href="#" class="current">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#" class="next fa fa-caret-right"></a>
    </div>
</asp:Content>

