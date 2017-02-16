<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Bệnh viện Tân Hưng</title>
    <meta name="description" content="Bệnh viện Tân Hưng" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="df-slider">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item">
                    <img src="assets/images/slide.png" alt="" />
                    <div class="carousel-caption">
                    </div>
                </div>
                <div class="item">
                    <img src="assets/images/slide1.png" alt="" />
                    <div class="carousel-caption">
                    </div>
                </div>
            </div>
            <!-- Controls -->
            <%--<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>--%>
        </div>
    </div>
    <div class="df-site">
        <section class="pc">
            <div class="container">
                <div class="pc-left">
                    <div class="id-cont">
                        <span>phương châm của chúng tôi</span>
                        <h1>sức khỏe là vàng</h1>
                    </div>
                    <p>Bệnh Viện Đa Khoa Tân Hưng hội tụ đội ngũ y bác sĩ giàu kinh nghiệm, phục vụ tận tình bệnh nhân. Cơ sở vật chất, máy móc công nghệ hiện đại nhất Việt Nam hiện nay.  Các phòng mổ đều được sơn bằng sơn kháng khuẩn và nền được lót bằng vật liệu vinyl đặc biệt: kháng khuẩn, không thấm nước… tiêu chuẩn như các phòng mổ nước ngoài.</p>
                    <div class="read-more">
                        <a href="#">Xem thêm</a>
                    </div>
                </div>
                <div class="pc-right">
                    <div class="wrapper-video">
                        <div class="video-details">
                            <div id="jwplayer1"></div>
                            <script type="text/javascript">
                                $(document).ready(function () {
                                    jwplayer('jwplayer1').setup({
                                        image: '',
                                        file: 'assets/mov_bbb.mp4',
                                        flashplayer: "assets/js/jwplayer.flash.swf",
                                        height: 190,
                                        width: 280,
                                        dock: true,
                                        autostart: false,
                                        primary: "html5",
                                        aspectratio: '16:9',
                                        stretching: "fill",
                                    });
                                    //jwplayer('jwplayer1').play();
                                });
                                $(window).load(function () {
                                    $('.wrapper-video').addClass('wrap-video');
                                });
                            </script>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="lichhen">
            <div class="container">
                <div class="lich-right">
                    <span>đặt câu hỏi</span>
                    <h1>trực tuyến</h1>
                    <a href="#">Gửi câu hỏi</a>
                </div>
                <div class="lich-left">
                    <h1>đặt lịch hẹn trực tuyến</h1>
                    <div class="form-group">
                        <asp:TextBox ID="TextBox1" runat="server" placeholder="Họ tên (*)"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <div class="ngaysinh">
                            <asp:TextBox ID="TextBox4" runat="server" placeholder="Ngày sinh"></asp:TextBox>
                        </div>
                        <div class="gioitinh">
                            <select>
                                <option>Giới tính</option>
                                <option>Nam</option>
                                <option>Nữ</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="TextBox2" runat="server" placeholder="Điện thoại (*)"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="TextBox3" runat="server" placeholder="Thời gian hẹn (*)"></asp:TextBox>
                    </div>
                    <p>(*) là thông tin bắt buộc nhập</p>
                    <asp:Button ID="Button1" runat="server" Text="Đặt lịch hẹn" />
                </div>
            </div>
        </section>
        <section class="team-of-doctors">
            <div class="container">
                <div class="id-sec">
                    <h1>Đội ngũ bác sĩ</h1>
                </div>
                <div class="doctors-team owl-carousel">
                    <div class="item">
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
                    <div class="item">
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
                    <div class="item">
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
                    <div class="item">
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
                    <div class="item">
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
                    <div class="item">
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
                    <div class="item">
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
                    <div class="item">
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
        </section>
        <section class="chuyenkhoa">
            <div class="container">
                <div class="id-sec">
                    <h1>Chuyên khoa</h1>
                </div>
                <div class="chuyenkhoa-carousel owl-carousel">
                    <div class="item">
                        <div class="content">
                            <a href="#">
                                <div class="wrap-content">
                                    <img src="assets/images/tim.png" alt="" />
                                    <p>Khoa nội</p>
                                </div>
                            </a>
                        </div>
                        <div class="img">
                            <a href="#">
                                <img src="assets/images/ck-1.png" alt="" /></a>
                        </div>
                    </div>
                    <div class="item">
                        <div class="content">
                            <a href="#">
                                <div class="wrap-content">
                                    <img src="assets/images/rang.png" alt="" />
                                    <p>Khoa răng hàm mặt</p>
                                </div>
                            </a>
                        </div>
                        <div class="img">
                            <a href="#">
                                <img src="assets/images/ck-2.png" alt="" /></a>
                        </div>
                    </div>
                    <div class="item">
                        <div class="content">
                            <a href="#">
                                <div class="wrap-content">
                                    <img src="assets/images/vltl.png" alt="" />
                                    <p>Khoa vật lý trị liệu</p>
                                </div>
                            </a>
                        </div>
                        <div class="img">
                            <a href="#">
                                <img src="assets/images/ck-3.png" alt="" /></a>
                        </div>
                    </div>
                    <div class="item">
                        <div class="content">
                            <a href="#">
                                <div class="wrap-content">
                                    <img src="assets/images/rang.png" alt="" />
                                    <p>Khoa răng hàm mặt</p>
                                </div>
                            </a>
                        </div>
                        <div class="img">
                            <a href="#">
                                <img src="assets/images/ck-2.png" alt="" /></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section>
            <div class="container">
                <div class="id-sec">
                    <h1>Cảm nhận bệnh nhân</h1>
                </div>
                <div class="camnhan-item">
                    <div class="item">
                        <div class="img">
                            <img src="assets/images/img-1.png" alt="" />
                        </div>
                        <div class="content">
                            <p>Tôi rất an tâm về đội ngũ y bác sĩ tại bệnh viện Tân Hưng, các bác sĩ đều rất tận tình thăm hỏi và quan tâm rất nhiều đến sức khỏe bệnh nhân.</p>
                            <span>Bệnh nhân Hải Yến</span>
                        </div>
                    </div>
                    <div class="item">
                        <div class="img">
                            <img src="assets/images/img-2.png" alt="" />
                        </div>
                        <div class="content">
                            <p>Tôi rất an tâm về đội ngũ y bác sĩ tại bệnh viện Tân Hưng, các bác sĩ đều rất tận tình thăm hỏi và quan tâm rất nhiều đến sức khỏe bệnh nhân.</p>
                            <span>Bệnh nhân Hoàng Hải</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="thietbi">
            <div class="container">
                <div class="id-sec">
                    <h1>Thiết bị máy móc</h1>
                </div>
                <div class="thietbi-carousel owl-carousel">
                    <div class="item">
                        <a href="#">
                            <img src="assets/images/mm1.png" alt="" /></a>
                    </div>
                    <div class="item">
                        <a href="#">
                            <img src="assets/images/mm2.png" alt="" /></a>
                    </div>
                    <div class="item">
                        <a href="#">
                            <img src="assets/images/mm3.png" alt="" /></a>
                    </div>
                    <div class="item">
                        <a href="#">
                            <img src="assets/images/mm4.png" alt="" /></a>
                    </div>
                    <div class="item">
                        <a href="#">
                            <img src="assets/images/mm5.png" alt="" /></a>
                    </div>
                    <div class="item">
                        <a href="#">
                            <img src="assets/images/mm1.png" alt="" /></a>
                    </div>
                    <div class="item">
                        <a href="#">
                            <img src="assets/images/mm2.png" alt="" /></a>
                    </div>
                    <div class="item">
                        <a href="#">
                            <img src="assets/images/mm3.png" alt="" /></a>
                    </div>
                    <div class="item">
                        <a href="#">
                            <img src="assets/images/mm4.png" alt="" /></a>
                    </div>
                    <div class="item">
                        <a href="#">
                            <img src="assets/images/mm5.png" alt="" /></a>
                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>

