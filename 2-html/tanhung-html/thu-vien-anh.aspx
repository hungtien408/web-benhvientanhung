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
                <li><a href="doi-ngu-bs.aspx">Đội ngũ bác sĩ</a></li>
                <li class="active"><a href="thu-vien-anh.aspx">Thư viện ảnh - Video</a></li>
            </ul>
        </div>
    </section>
    <uc1:capcuu runat="server" ID="capcuu" />
    <uc1:cauhoitructuyen runat="server" ID="cauhoitructuyen" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="page_main" runat="Server">
    <h1 class="content-tit">Thư viện ảnh</h1>
    <div class="skin1" role="tabpanel">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation">
                <a href="#tab" aria-controls="tab" role="tab" data-toggle="tab">Trang thiết bị</a>
            </li>
            <li role="presentation">
                <a href="#tab1" aria-controls="tab" role="tab" data-toggle="tab">Chương trình từ thiện</a>
            </li>
            <li role="presentation">
                <a href="#tab2" aria-controls="tab" role="tab" data-toggle="tab">Hội thảo tư vấn</a>
            </li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane" id="tab">
                <div class="library-content">
                    <div class="library-box">
                        <a href="javascript:void(0);">
                            <div class="library-img">
                                <img src="assets/images/li1.jpg" alt="" />
                            </div>
                            <div class="library-name">
                                Trang thiết bị phòng khám
                            </div>
                        </a>
                        <div class="popup-1">
                            <div class="popup-content">
                                <div class="slider-for">
                                    <div class="item">
                                        <img src="assets/images/2.jpg" alt="" />
                                        <p>trang thiết bị phòng khám</p>
                                    </div>
                                    <div class="item">
                                        <img src="assets/images/2.jpg" alt="" />
                                        <p>trang thiết bị phòng khám</p>
                                    </div>
                                    <div class="item">
                                        <img src="assets/images/2.jpg" alt="" />
                                        <p>trang thiết bị phòng khám</p>
                                    </div>
                                    <div class="item">
                                        <img src="assets/images/2.jpg" alt="" />
                                        <p>trang thiết bị phòng khám</p>
                                    </div>
                                    <div class="item">
                                        <img src="assets/images/2.jpg" alt="" />
                                        <p>trang thiết bị phòng khám</p>
                                    </div>
                                    <div class="item">
                                        <img src="assets/images/2.jpg" alt="" />
                                        <p>trang thiết bị phòng khám</p>
                                    </div>
                                    <div class="item">
                                        <img src="assets/images/2.jpg" alt="" />
                                        <p>trang thiết bị phòng khám</p>
                                    </div>
                                    <div class="item">
                                        <img src="assets/images/2.jpg" alt="" />
                                        <p>trang thiết bị phòng khám</p>
                                    </div>
                                </div>
                                <div class="slider-nav">
                                    <div class="item">
                                        <img src="assets/images/2.jpg" alt="" />
                                    </div>
                                    <div class="item">
                                        <img src="assets/images/2.jpg" alt="" />
                                    </div>
                                    <div class="item">
                                        <img src="assets/images/2.jpg" alt="" />
                                    </div>
                                    <div class="item">
                                        <img src="assets/images/2.jpg" alt="" />
                                    </div>
                                    <div class="item">
                                        <img src="assets/images/2.jpg" alt="" />
                                    </div>
                                    <div class="item">
                                        <img src="assets/images/2.jpg" alt="" />
                                    </div>
                                    <div class="item">
                                        <img src="assets/images/2.jpg" alt="" />
                                    </div>
                                    <div class="item">
                                        <img src="assets/images/2.jpg" alt="" />
                                    </div>
                                </div>
                                <a href="javascript:void(0);" class="close-modal"></a>
                            </div>
                        </div>
                    </div>
                    <div class="library-box">
                        <a href="javascript:void(0);">
                            <div class="library-img">
                                <img src="assets/images/li2.jpg" alt="" />
                            </div>
                            <div class="library-name">
                                Đội ngũ nhân viên - bác sĩ
                            </div>
                        </a>
                    </div>
                    <div class="library-box">
                        <a href="javascript:void(0);">
                            <div class="library-img">
                                <img src="assets/images/li3.jpg" alt="" />
                            </div>
                            <div class="library-name">
                                Chương trình khám bệnh thiện nguyện 2016
                            </div>
                        </a>
                    </div>
                    <div class="library-box">
                        <a href="javascript:void(0);">
                            <div class="library-img">
                                <img src="assets/images/li4.jpg" alt="" />
                            </div>
                            <div class="library-name">
                                Hội thảo tư vấn Bệnh đái tháo đường 2016
                            </div>
                        </a>
                    </div>
                    <div class="library-box">
                        <a href="javascript:void(0);">
                            <div class="library-img">
                                <img src="assets/images/li5.jpg" alt="" />
                            </div>
                            <div class="library-name">
                                Giáng Sinh 2015
                            </div>
                        </a>
                    </div>
                    <div class="library-box">
                        <a href="javascript:void(0);">
                            <div class="library-img">
                                <img src="assets/images/li6.jpg" alt="" />
                            </div>
                            <div class="library-name">
                                Chương chình Hiến máu nhân đạo năm 2013
                            </div>
                        </a>
                    </div>
                    <div class="library-box">
                        <a href="javascript:void(0);">
                            <div class="library-img">
                                <img src="assets/images/li7.jpg" alt="" />
                            </div>
                            <div class="library-name">
                                Ngày hội làm sạch bãi biển 2012
                            </div>
                        </a>
                    </div>
                    <div class="library-box">
                        <a href="javascript:void(0);">
                            <div class="library-img">
                                <img src="assets/images/li8.jpg" alt="" />
                            </div>
                            <div class="library-name">
                                Hoạt động xã hội 2010
                            </div>
                        </a>
                    </div>
                </div>
                <div class="pager">
                    <a href="#" class="current">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#" class="next fa fa-angle-right"></a>
                </div>
                <div class="video-main">
                    <h1 class="content-tit">Thư viện ảnh</h1>
                    <div class="video-left">
                        <div class="wrapper-video">
                            <div class="video-details">
                                <div id="jwplayer3"></div>
                                <script type="text/javascript">
                                    $(document).ready(function () {
                                        jwplayer('jwplayer3').setup({
                                            image: "assets/images/video1.jpg",
                                            //file: "res/project/video/1-1.MP4",
                                            file: "https://youtu.be/PDZH-x2nNRM",
                                            //file: '<%# !string.IsNullOrEmpty( Eval("ProjectVideoPath").ToString()) ? "res/project/video/" + Eval("ProjectVideoPath") : ""%>',
                                    flashplayer: "assets/js/jwplayer.flash.swf",
                                    width: '100%',
                                    aspectratio: '16:9',
                                    primary: "html5",
                                    width: '100%',
                                    autostart: false,
                                });
                            });
                                </script>
                                <script>
                                    $(document).ready(function () {
                                        $(".slide-box a").click(function () {
                                            srcfilm = $(this).attr("data-src");
                                            //imga = $(this).attr("rel-img");
                                            playTrailer(srcfilm, "");
                                            $(".slide-box a").removeClass("active");
                                            $(this).addClass("active");
                                        });
                                    });

                                    function playTrailer(video, images) {
                                        jwplayer().load([{
                                            controlbar: 'none',
                                            file: video,
                                            autostart: false,
                                            //image: "http://www.quyenauto.com/res/product/" + images,
                                        }]);
                                        jwplayer().play();
                                    }
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="video-right">
                        <div class="title-box">
                            <h1>VIDEO NỔI BẬT</h1>
                        </div>
                        <div class="">
                            <div id="sliderProject" class="slider">
                                <div class="slide-box">
                                    <a data-src="https://www.youtube.com/watch?v=jzEvgbipfKk">
                                        <div class="slide-img">
                                            <img src="assets/images/video2.jpg" alt="" />
                                        </div>
                                    </a>
                                </div>
                                <div class="slide-box">
                                    <a data-src="https://www.youtube.com/watch?v=Hzbr4jMxvBk">
                                        <div class="slide-img">
                                            <img src="assets/images/video3.jpg" alt="" />
                                        </div>
                                    </a>
                                </div>
                                <div class="slide-box">
                                    <a data-src="https://www.youtube.com/watch?v=bdvXEHouhiE">
                                        <div class="slide-img">
                                            <img src="assets/images/video4.jpg" alt="" />
                                        </div>
                                    </a>
                                </div>
                                <div class="slide-box">
                                    <a data-src="https://www.youtube.com/watch?v=IuS0Korfb1U">
                                        <div class="slide-img">
                                            <img src="assets/images/video5.jpg" alt="" />
                                        </div>
                                    </a>
                                </div>
                                <div class="slide-box">
                                    <a data-src="https://www.youtube.com/watch?v=jzEvgbipfKk">
                                        <div class="slide-img">
                                            <img src="assets/images/video2.jpg" alt="" />
                                        </div>
                                    </a>
                                </div>
                                <div class="slide-box">
                                    <a data-src="https://www.youtube.com/watch?v=Hzbr4jMxvBk">
                                        <div class="slide-img">
                                            <img src="assets/images/video3.jpg" alt="" />
                                        </div>
                                    </a>
                                </div>
                                <div class="slide-box">
                                    <a data-src="https://www.youtube.com/watch?v=bdvXEHouhiE">
                                        <div class="slide-img">
                                            <img src="assets/images/video4.jpg" alt="" />
                                        </div>
                                    </a>
                                </div>
                                <div class="slide-box">
                                    <a data-src="https://www.youtube.com/watch?v=IuS0Korfb1U">
                                        <div class="slide-img">
                                            <img src="assets/images/video5.jpg" alt="" />
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="tab1">
                2
            </div>
            <div role="tabpanel" class="tab-pane" id="tab2">
                3
            </div>
        </div>
    </div>
</asp:Content>

