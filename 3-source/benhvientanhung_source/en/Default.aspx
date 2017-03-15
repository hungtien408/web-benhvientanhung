<%@ Page Title="" Language="C#" MasterPageFile="~/en/site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="asp" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="df-slider">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <asp:ListView ID="lstBanner1" runat="server"
                    DataSourceID="odsBanner" EnableModelValidation="True">
                    <ItemTemplate>
                        <li data-target="#carousel-example-generic" data-slide-to='<%# Container.DataItemIndex %>' class='<%# (Container.DataItemIndex) == 0 ? "active" : "" %>'></li>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <span runat="server" id="itemPlaceholder" />
                    </LayoutTemplate>
                </asp:ListView>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <asp:ListView ID="lstBanner2" runat="server"
                    DataSourceID="odsBanner" EnableModelValidation="True">
                    <ItemTemplate>
                        <div class='<%# (Container.DataItemIndex) == 0 ? "item active" : "item" %>'>
                            <img alt='<%# Eval("FileName") %>' src='<%# "~/res/advertisement/" + Eval("FileName") %>'
                                visible='<%# string.IsNullOrEmpty(Eval("FileName").ToString()) ? false : true %>' runat="server" />
                            <div class="carousel-caption">
                            </div>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <span runat="server" id="itemPlaceholder" />
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsBanner" runat="server"
                    SelectMethod="AdsBannerSelectAll"
                    TypeName="TLLib.AdsBanner">
                    <SelectParameters>
                        <asp:Parameter Name="StartRowIndex" Type="String" />
                        <asp:Parameter Name="EndRowIndex" Type="String" />
                        <asp:Parameter DefaultValue="5" Name="AdsCategoryID" Type="String" />
                        <asp:Parameter Name="CompanyName" Type="String" />
                        <asp:Parameter Name="Website" Type="String" />
                        <asp:Parameter Name="FromDate" Type="String" />
                        <asp:Parameter Name="ToDate" Type="String" />
                        <asp:Parameter DefaultValue="True"
                            Name="IsAvailable" Type="String" />
                        <asp:Parameter Name="Priority" Type="String" />
                        <asp:Parameter DefaultValue="True"
                            Name="SortByPriority" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
            <!-- Controls -->
        </div>
    </div>
    <div class="df-site">
        <section class="pc">
            <div class="container">
                <div class="id-sec">
                    <h1>Thông tin y khoa</h1>
                </div>
                <div class="pc-left">
                    <%--<asp:ListView ID="lstAbout" runat="server" DataSourceID="odsAbout"
                        EnableModelValidation="True">
                        <ItemTemplate>
                            <div class="id-cont">
                                <span><%# Eval("ProjectCategoryNameEn") %></span>
                                <h1><%# Eval("ProjectTitleEn") %></h1>
                            </div>
                            <p><%# Eval("DescriptionEn") %></p>
                            <div class="read-more">
                                <a href='<%# "/en/tintuc/" + progressTitle(Eval("ProjectTitleEn")) + "-" + Eval("ProjectID") + ".aspx" %>'>Xem thêm</a>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>--%>
                    <asp:ListView ID="lstAbout" runat="server" DataSourceID="odsAbout"
                        EnableModelValidation="True">
                        <ItemTemplate>
                            <li><span><%# Container.DataItemIndex + 1 %></span><a class="text-uppercase" href='<%# "/en/tintuc/" + progressTitle(Eval("ProjectTitleEn")) + "-" + Eval("ProjectID") + ".aspx" %>'><%# Eval("ProjectTitleEn") %></a></li>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <ul>
                                <li runat="server" id="itemPlaceholder"></li>
                            </ul>
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsAbout" runat="server" SelectMethod="ProjectSelectAll" TypeName="TLLib.Project">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="StartRowIndex" Type="String" />
                            <asp:Parameter DefaultValue="1" Name="EndRowIndex" Type="String" />
                            <asp:Parameter Name="Keyword" Type="String" />
                            <asp:Parameter Name="ProjectTitle" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter DefaultValue="5" Name="ProjectCategoryID" Type="String" />
                            <asp:Parameter Name="Tag" Type="String" />
                            <asp:Parameter Name="IsHot" Type="String" />
                            <asp:Parameter Name="IsNew" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="IsShowOnHomePage" Type="String" />
                            <asp:Parameter Name="FromDate" Type="String" />
                            <asp:Parameter Name="ToDate" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                            <asp:Parameter Name="Priority" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
                <div class="pc-right">
                    <div class="wrapper-video">
                        <asp:ListView ID="lstVideoHot" runat="server" DataSourceID="odsVideoHot"
                            EnableModelValidation="True">
                            <ItemTemplate>
                                <div class="video-details">
                                    <div id='<%# "jwplayer" + Eval("VideoID") %>'></div>
                                    <script type="text/javascript">
                                        $(document).ready(function () {
                                            jwplayer('<%# "jwplayer" + Eval("VideoID") %>').setup({
                                                image: '<%# "../res/video/thumbs/" + Eval("ImagePath") %>',
                                                file: '<%# string.IsNullOrEmpty(Eval("VideoPath").ToString()) ? Eval("GLobalEmbedScript") : "../res/video/" + Eval("VideoPath") %>',
                                                flashplayer: "../assets/js/jwplayer.flash.swf",
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
                                            $('.video-details').addClass('wrap-video');
                                        });
                                    </script>
                                </div>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <span runat="server" id="itemPlaceholder" />
                            </LayoutTemplate>
                        </asp:ListView>
                        <asp:ObjectDataSource ID="odsVideoHot" runat="server" SelectMethod="VideoSelectAll" TypeName="TLLib.Video">
                            <SelectParameters>
                                <asp:Parameter Name="Title" Type="String" />
                                <asp:Parameter Name="Description" Type="String" />
                                <asp:Parameter Name="VideoCategoryID" Type="String" />
                                <asp:Parameter Name="PhotoCategoryID" Type="String" />
                                <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                <asp:Parameter Name="IsHot" Type="String" />
                                <asp:Parameter DefaultValue="True" Name="IsNew" Type="String" />
                                <asp:Parameter Name="Priority" Type="String" />
                                <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <asp:ListView ID="lstPhotoAlbumCategory" runat="server" DataSourceID="odsPhotoAlbumCategory"
                            EnableModelValidation="True">
                            <ItemTemplate>
                                <div class="img-details">
                                    <a href="thu-vien-anh-video.aspx">
                                        <img alt='<%# Eval("ImageName") %>' src='<%# "~/res/photoalbumcategory/" + Eval("ImageName") %>' runat="server"
                                            visible='<%# string.IsNullOrEmpty(Eval("ImageName").ToString()) ? false : true %>' /></a>
                                </div>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <span runat="server" id="itemPlaceholder" />

                            </LayoutTemplate>
                        </asp:ListView>
                        <asp:ObjectDataSource ID="odsPhotoAlbumCategory" runat="server" SelectMethod="PhotoAlbumCategorySelectAll"
                            TypeName="TLLib.PhotoAlbumCategory">
                            <SelectParameters>
                                <asp:Parameter Name="PhotoAlbumCategoryName" Type="String" />
                                <asp:Parameter Name="IsShowOnMenu" Type="String" />
                                <asp:Parameter DefaultValue="True" Name="IsShowOnHomePage" Type="String" />
                                <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                <asp:Parameter Name="PhotoCategoryID" Type="String" />
                                <asp:Parameter Name="Priority" Type="String" />
                                <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </div>
                </div>
            </div>
        </section>
        <section class="lichhen">
            <div class="container">
                <div class="lich-right">
                    <img src="/assets/images/hoi.png" alt="" />
                    <div class="content">
                        <span>đặt lịch hẹn</span>
                        <h1>trực tuyến</h1>
                    </div>
                </div>
                <div class="datcauhoi popup scroll-popup">
                    <div class="popup-content">
                        <div class="form-popup">
                            <h3>Đặt câu hỏi</h3>
                            <div class="wrap-dch">
                                <div class="form-group">
                                    <asp:TextBox ID="txtFullNameQuestion" runat="server"></asp:TextBox>
                                    <asp:TextBoxWatermarkExtender ID="txtFullNameQuestion_WatermarkExtender" runat="server" Enabled="True"
                                        WatermarkText="Họ tên (*)" TargetControlID="txtFullNameQuestion">
                                    </asp:TextBoxWatermarkExtender>
                                    <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator5" runat="server"
                                        Display="Dynamic" ValidationGroup="DatCauHoi" ControlToValidate="txtFullNameQuestion"
                                        ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="txtEmailQuestion" runat="server"></asp:TextBox>
                                    <asp:TextBoxWatermarkExtender ID="txtEmailQuestion_WatermarkExtender" runat="server" Enabled="True"
                                        WatermarkText="Email(*)" TargetControlID="txtEmailQuestion">
                                    </asp:TextBoxWatermarkExtender>
                                    <asp:RegularExpressionValidator CssClass="lb-error" ID="RegularExpressionValidator1"
                                        runat="server" ValidationGroup="DatCauHoi" ControlToValidate="txtEmailQuestion" ErrorMessage="Email is error!"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"
                                        ForeColor="Red"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator7" runat="server"
                                        ValidationGroup="DatCauHoi" ControlToValidate="txtEmailQuestion" ErrorMessage="Thông tin bắt buộc!"
                                        Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="txtPhoneQuestion" runat="server" placeholder="Điện thoại"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="txtQuestion" runat="server" placeholder="Câu hỏi muốn đặt" TextMode="MultiLine"></asp:TextBox>
                                </div>
                                <div class="btn-gui">
                                    <asp:Button ID="btnGuiCauHoi" runat="server" Text="Send question" OnClick="btnGuiCauHoi_Click" ValidationGroup="DatCauHoi" />
                                </div>
                            </div>
                        </div>
                        <a href="javascript:void(0);" class="close-modal"></a>
                    </div>
                </div>
                <div class="lich-left">
                    <div class="form-group">
                        <asp:TextBox ID="txtFullName" runat="server"></asp:TextBox>
                        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" Enabled="True"
                            WatermarkText="Họ tên (*)" TargetControlID="txtFullName">
                        </asp:TextBoxWatermarkExtender>
                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator2" runat="server"
                            Display="Dynamic" ValidationGroup="DatHen" ControlToValidate="txtFullName"
                            ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <div class="ngaysinh">
                            <asp:RadDatePicker ShowPopupOnFocus="True" ID="dpNgaySinh" runat="server" Culture="vi-VN"
                                Calendar-CultureInfo="vi-VN" Width="65%" Height="30px" CssClass="drop-ngaysinh">
                                <Calendar ID="Calendar1" runat="server">
                                    <SpecialDays>
                                        <asp:RadCalendarDay Repeatable="Today">
                                            <ItemStyle CssClass="rcToday" />
                                        </asp:RadCalendarDay>
                                    </SpecialDays>
                                </Calendar>
                                <DateInput ID="DateInput1" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy"
                                    runat="server" Height="32px">
                                </DateInput>
                                <DatePopupButton HoverImageUrl="" ImageUrl="" />
                            </asp:RadDatePicker>
                            <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator1" runat="server"
                                Display="Dynamic" ValidationGroup="DatHen" ControlToValidate="dpNgaySinh"
                                ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="gioitinh">
                            <asp:DropDownList ID="dropListGender" runat="server">
                                <asp:ListItem Value="0">Nam</asp:ListItem>
                                <asp:ListItem Value="1">Nữ</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                        <asp:TextBoxWatermarkExtender ID="txtPhone_WatermarkExtender" runat="server"
                            Enabled="True" WatermarkText="Điện thoại(*)" TargetControlID="txtPhone">
                        </asp:TextBoxWatermarkExtender>
                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator3" runat="server"
                            Display="Dynamic" ValidationGroup="DatHen" ControlToValidate="txtPhone"
                            ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="form-group">
                                <asp:DropDownList ID="dropListChuyenKhoa" runat="server" DataSourceID="odsPhongBanDrop" DataTextField="ProjectCategoryNameEn" DataValueField="ProjectCategoryID" AutoPostBack="true"></asp:DropDownList>
                                <asp:ObjectDataSource ID="odsPhongBanDrop" runat="server" SelectMethod="ProjectCategorySelectAll" TypeName="TLLib.ProjectCategory">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="17" Name="parentID" Type="Int32" />
                                        <asp:Parameter DefaultValue="1" Name="increaseLevelCount" Type="Int32" />
                                        <asp:Parameter Name="IsShowOnMenu" Type="String" />
                                        <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </div>
                            <div class="form-group">
                                <asp:DropDownList ID="dropListBacSi" runat="server" DataSourceID="odsBacSiDrop" DataTextField="ProjectTitleEn" DataValueField="ProjectID" AutoPostBack="true"></asp:DropDownList>
                                <asp:ObjectDataSource ID="odsBacSiDrop" runat="server" SelectMethod="ProjectSelectAll" TypeName="TLLib.Project">
                                    <SelectParameters>
                                        <asp:Parameter Name="StartRowIndex" Type="String" />
                                        <asp:Parameter Name="EndRowIndex" Type="String" />
                                        <asp:Parameter Name="Keyword" Type="String" />
                                        <asp:Parameter Name="ProjectTitle" Type="String" />
                                        <asp:Parameter Name="Description" Type="String" />
                                        <asp:ControlParameter ControlID="dropListChuyenKhoa" Name="ProjectCategoryID" PropertyName="SelectedValue" Type="String" />
                                        <asp:Parameter Name="Tag" Type="String" />
                                        <asp:Parameter Name="IsHot" Type="String" />
                                        <asp:Parameter Name="IsNew" Type="String" />
                                        <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                                        <asp:Parameter Name="FromDate" Type="String" />
                                        <asp:Parameter Name="ToDate" Type="String" />
                                        <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                        <asp:Parameter Name="Priority" Type="String" />
                                        <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="form-group">
                        <asp:RadDatePicker ShowPopupOnFocus="True" ID="dpNgayKham" runat="server" Culture="vi-VN"
                            Calendar-CultureInfo="vi-VN" Width="60%" Height="32px" CssClass="drop-ngaysinh">
                            <Calendar ID="Calendar2" runat="server">
                                <SpecialDays>
                                    <asp:RadCalendarDay Repeatable="Today">
                                        <ItemStyle CssClass="rcToday" />
                                    </asp:RadCalendarDay>
                                </SpecialDays>
                            </Calendar>
                            <DateInput ID="DateInput2" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy"
                                runat="server" Height="32px">
                            </DateInput>
                            <DatePopupButton HoverImageUrl="" ImageUrl="" />
                        </asp:RadDatePicker>
                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator4" runat="server"
                            Display="Dynamic" ValidationGroup="DatHen" ControlToValidate="dpNgayKham"
                            ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RadTimePicker ID="dpGioKham" runat="server" Width="40%" Height="32px" ShowPopupOnFocus="true"
                            TimeView-StartTime="07:00:00" TimeView-Interval="00:30:00" TimeView-EndTime="18:00:01" Culture="en-US" CssClass="drop-ngaysinh">
                        </asp:RadTimePicker>
                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator6" runat="server"
                            Display="Dynamic" ValidationGroup="DatHen" ControlToValidate="dpGioKham"
                            ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <p>(*) là thông tin bắt buộc nhập</p>
                    <asp:Button ID="btnDatHen" runat="server" Text="Đặt lịch hẹn" OnClick="btnDatHen_Click" ValidationGroup="DatHen" />
                </div>
            </div>
        </section>
        <%--<section class="team-of-doctors">
            <div class="container">
                <div class="id-sec">
                    <h1>Đội ngũ bác sĩ</h1>
                </div>
                <div class="doctors-team owl-carousel">
                    <asp:ListView ID="lstDoiNguBacSi" runat="server" DataSourceID="odsDoiNguBacSi"
                        EnableModelValidation="True">
                        <ItemTemplate>
                            <div class="item">
                                <img alt='<%# Eval("ImageName") %>' src='<%# "~/res/project/" + Eval("ImageName") %>'
                                    visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                    runat="server" />
                                <div class="wrap-item">
                                    <div class="content">
                                        <a href="javascript:void(0);">
                                            <p><%# Eval("ProjectTitleEn") %></p>
                                            <span><%# Eval("MetaTittleEn") %></span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsDoiNguBacSi" runat="server" SelectMethod="ProjectSelectAll" TypeName="TLLib.Project">
                        <SelectParameters>
                            <asp:Parameter Name="StartRowIndex" Type="String" />
                            <asp:Parameter Name="EndRowIndex" Type="String" />
                            <asp:Parameter Name="Keyword" Type="String" />
                            <asp:Parameter Name="ProjectTitle" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter DefaultValue="17" Name="ProjectCategoryID" Type="String" />
                            <asp:Parameter Name="Tag" Type="String" />
                            <asp:Parameter Name="IsHot" Type="String" />
                            <asp:Parameter Name="IsNew" Type="String" />
                            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                            <asp:Parameter Name="FromDate" Type="String" />
                            <asp:Parameter Name="ToDate" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                            <asp:Parameter Name="Priority" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
            </div>
        </section>--%>
        <section class="team-of-doctors">
            <div class="container">
                <div class="id-sec">
                    <h1>Đội ngũ bác sĩ</h1>
                </div>
                <div class="doctors-team owl-carousel">
                    <asp:ListView ID="lstDoiNguBacSi" runat="server" DataSourceID="odsDoiNguBacSi"
                        EnableModelValidation="True">
                        <ItemTemplate>
                            <div class="item" id='<%# "it-" + Eval("ProjectID") %>'>
                                <img alt='<%# Eval("ImageName") %>' src='<%# "~/res/project/" + Eval("ImageName") %>'
                                    visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                    runat="server" />
                                <div class="wrap-item">
                                    <div class="content">
                                        <p><%# Eval("ProjectTitleEn") %></p>
                                        <span><%# Eval("ProjectCategoryNameEn") %></span>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsDoiNguBacSi" runat="server" SelectMethod="ProjectSelectAll" TypeName="TLLib.Project">
                        <SelectParameters>
                            <asp:Parameter Name="StartRowIndex" Type="String" />
                            <asp:Parameter Name="EndRowIndex" Type="String" />
                            <asp:Parameter Name="Keyword" Type="String" />
                            <asp:Parameter Name="ProjectTitle" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter DefaultValue="17" Name="ProjectCategoryID" Type="String" />
                            <asp:Parameter Name="Tag" Type="String" />
                            <asp:Parameter Name="IsHot" Type="String" />
                            <asp:Parameter Name="IsNew" Type="String" />
                            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                            <asp:Parameter Name="FromDate" Type="String" />
                            <asp:Parameter Name="ToDate" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                            <asp:Parameter Name="Priority" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
            </div>
            <div class="list-doingu">
                <asp:ListView ID="lstDoiNguBacSi2" runat="server" DataSourceID="odsDoiNguBacSi"
                    EnableModelValidation="True">
                    <ItemTemplate>
                        <div class="popup scroll-popup" data-id='<%# "it-" + Eval("ProjectID") %>'>
                            <div class="popup-content">
                                <div class="modaltitle"><%# Eval("ProjectCategoryNameEn") %></div>
                                <div class="modal-main">
                                    <div class="info-main">
                                        <div class="info-img">
                                            <img alt='<%# Eval("ImageName") %>' src='<%# "~/res/project/" + Eval("ImageName") %>'
                                                visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                                runat="server" />
                                        </div>
                                        <div class="info-box">
                                            <ul>
                                                <li>
                                                    <div class="info-title">Họ Tên:</div>
                                                    <%# Eval("ProjectTitleEn") %></li>
                                                <li>
                                                    <div class="info-title">Chức vụ:</div>
                                                    <%# Eval("TagEn") %></li>
                                                <li>
                                                    <div class="info-title">Chuyên ngành:</div>
                                                    <%# Eval("MetaTittleEn") %></li>
                                                <li>
                                                    <div class="info-title">Kinh nghiệm:</div>
                                                    <%# Eval("MetaDescriptionEn") %></li>
                                                <li>
                                                    <div class="info-title">Ngôn ngữ giao tiếp:</div>
                                                    <%# Eval("DescriptionEn") %></li>
                                                <div class="popup-datlich"><span class="btn-pop-dl">Đặt lịch</span></div>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="info-content">
                                        <%# Eval("ContentEn") %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <span runat="server" id="itemPlaceholder" />
                    </LayoutTemplate>
                </asp:ListView>
            </div>
        </section>
        <section class="chuyenkhoa">
            <div class="container">
                <div class="id-sec">
                    <h1>Chuyên khoa</h1>
                </div>
                <div class="chuyenkhoa-carousel owl-carousel">
                    <asp:ListView ID="lstChuyenKhoa" runat="server" DataSourceID="odsChuyenKhoa"
                        EnableModelValidation="True">
                        <ItemTemplate>
                            <div class="item">
                                <div class="content">
                                    <a href='<%# "/en/chuyen-khoa/" + progressTitle(Eval("ProjectCategoryNameEn")) + "-" + Eval("ProjectCategoryID") + ".aspx" %>'>
                                        <div class="wrap-content">
                                            <img alt='<%# Eval("ImageNameIcon") %>' src='<%# "~/res/projectcategory/icon/" + Eval("ImageNameIcon") %>'
                                                visible='<%# string.IsNullOrEmpty( Eval("ImageNameIcon").ToString()) ? false : true %>'
                                                runat="server" />
                                            <p><%# Eval("ProjectCategoryNameEn") %></p>
                                        </div>
                                    </a>
                                </div>
                                <div class="img">
                                    <a href='<%# "/en/chuyen-khoa/" + progressTitle(Eval("ProjectCategoryNameEn")) + "-" + Eval("ProjectCategoryID") + ".aspx" %>'>
                                        <img alt='<%# Eval("ImageName2") %>' src='<%# "~/res/projectcategory/image2/" + Eval("ImageName2") %>'
                                            visible='<%# string.IsNullOrEmpty( Eval("ImageName2").ToString()) ? false : true %>'
                                            runat="server" /></a>
                                </div>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsChuyenKhoa" runat="server" SelectMethod="ProjectCategorySelectAll" TypeName="TLLib.ProjectCategory">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="14" Name="parentID" Type="Int32" />
                            <asp:Parameter DefaultValue="1" Name="increaseLevelCount" Type="Int32" />
                            <asp:Parameter Name="IsShowOnMenu" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="IsShowOnHomePage" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
            </div>
        </section>
        <section>
            <div class="container">
                <div class="id-sec">
                    <h1>Cơ sở vật chất</h1>
                </div>
                <div class="thietbi-carousel owl-carousel">
                    <asp:ListView ID="lstMayMoc" runat="server" DataSourceID="odsMayMoc"
                        EnableModelValidation="True">
                        <ItemTemplate>
                            <div class="item">
                                <a href='<%# "/en/co-so-vat-chat/" + progressTitle(Eval("ProjectTitleEn")) + "-" + Eval("ProjectID") + ".aspx" %>'>
                                    <img alt='<%# Eval("ImageName") %>' src='<%# "~/res/project/" + Eval("ImageName") %>'
                                        visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                        runat="server" /></a>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsMayMoc" runat="server" SelectMethod="ProjectSelectAll" TypeName="TLLib.Project">
                        <SelectParameters>
                            <asp:Parameter Name="StartRowIndex" Type="String" />
                            <asp:Parameter Name="EndRowIndex" Type="String" />
                            <asp:Parameter Name="Keyword" Type="String" />
                            <asp:Parameter Name="ProjectTitle" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter DefaultValue="55" Name="ProjectCategoryID" Type="String" />
                            <asp:Parameter Name="Tag" Type="String" />
                            <asp:Parameter Name="IsHot" Type="String" />
                            <asp:Parameter Name="IsNew" Type="String" />
                            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                            <asp:Parameter Name="FromDate" Type="String" />
                            <asp:Parameter Name="ToDate" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                            <asp:Parameter Name="Priority" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
            </div>
        </section>
        <section class="thietbi">
            <div class="container">
                <div class="id-sec">
                    <h1>Cảm nhận bệnh nhân</h1>
                </div>
                <div class="camnhan-item">
                    <asp:ListView ID="lstCamNhanBenhNhan" runat="server" DataSourceID="odsCamNhanBenhNhan"
                        EnableModelValidation="True">
                        <ItemTemplate>
                            <div class="item">
                                <div class="img">
                                    <img alt='<%# Eval("ImageName") %>' src='<%# "~/res/project/" + Eval("ImageName") %>'
                                        visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                        runat="server" />
                                </div>
                                <div class="content">
                                    <p><%# Eval("ContentEn") %></p>
                                    <span><%# Eval("ProjectTitleEn") %></span>
                                    <div style="width: 100%; margin-top: 10px;">
                                        <div class="fb-like" data-href='<%= "http://www.diendancuoi.com/" + Request.Url.AbsolutePath.Substring(Request.Url.AbsolutePath.LastIndexOf("/") + 1) %>'
                                            data-send="false" data-layout="button_count" data-width="50" data-show-faces="true">
                                        </div>
                                        <div class="fb-share-button"
                                            data-href='<%= "http://www.diendancuoi.com/" + Request.Url.AbsolutePath.Substring(Request.Url.AbsolutePath.LastIndexOf("/") + 1) %>'
                                            data-layout="button_count">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsCamNhanBenhNhan" runat="server" SelectMethod="ProjectSelectAll" TypeName="TLLib.Project">
                        <SelectParameters>
                            <asp:Parameter Name="StartRowIndex" Type="String" />
                            <asp:Parameter Name="EndRowIndex" Type="String" />
                            <asp:Parameter Name="Keyword" Type="String" />
                            <asp:Parameter Name="ProjectTitle" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter DefaultValue="13" Name="ProjectCategoryID" Type="String" />
                            <asp:Parameter Name="Tag" Type="String" />
                            <asp:Parameter Name="IsHot" Type="String" />
                            <asp:Parameter Name="IsNew" Type="String" />
                            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                            <asp:Parameter Name="FromDate" Type="String" />
                            <asp:Parameter Name="ToDate" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                            <asp:Parameter Name="Priority" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <div class="clr"></div>
                    <div class="btn-camnhan"><a href="#">Viết cảm nhận</a></div>
                    <div class="vietcamnhan popup scroll-popup">
                        <div class="popup-content">
                            <div class="form-popup">
                                <h3>Viết cảm nhận</h3>
                                <div class="wrap-dch">
                                    <div class="form-group">
                                        <asp:RadUpload ID="FileImageName" runat="server" ControlObjectsVisibility="None"
                                            Culture="vi-VN" Language="vi-VN" InputSize="69" AllowedFileExtensions=".jpg,.jpeg,.gif,.png">
                                            <Localization Select="Ảnh đại diện" />
                                        </asp:RadUpload>
                                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Sai định dạng ảnh (*.jpg, *.jpeg, *.gif, *.png)"
                                            ClientValidationFunction="validateRadUpload" Display="Dynamic"></asp:CustomValidator>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtFullNameCamNhan" runat="server"></asp:TextBox>
                                        <asp:TextBoxWatermarkExtender ID="txtFullNameCamNhan_WatermarkExtender" runat="server" Enabled="True"
                                            WatermarkText="Họ tên (*)" TargetControlID="txtFullNameCamNhan">
                                        </asp:TextBoxWatermarkExtender>
                                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator8" runat="server"
                                            Display="Dynamic" ValidationGroup="CamNhan" ControlToValidate="txtFullNameCamNhan"
                                            ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                    <%--<div class="form-group">
                                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender3" runat="server" Enabled="True"
                                            WatermarkText="Email(*)" TargetControlID="txtEmailQuestion">
                                        </asp:TextBoxWatermarkExtender>
                                        <asp:RegularExpressionValidator CssClass="lb-error" ID="RegularExpressionValidator2"
                                            runat="server" ValidationGroup="DatCauHoi" ControlToValidate="txtEmailQuestion" ErrorMessage="Email is error!"
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"
                                            ForeColor="Red"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator9" runat="server"
                                            ValidationGroup="DatCauHoi" ControlToValidate="txtEmailQuestion" ErrorMessage="Thông tin bắt buộc!"
                                            Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="TextBox3" runat="server" placeholder="Điện thoại"></asp:TextBox>
                                    </div>--%>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtContentCamNhan" runat="server" TextMode="MultiLine"></asp:TextBox>
                                        <asp:TextBoxWatermarkExtender ID="txtContentCamNhan_WatermarkExtender" runat="server" Enabled="True"
                                            WatermarkText="Cảm nhận (*)" TargetControlID="txtContentCamNhan">
                                        </asp:TextBoxWatermarkExtender>
                                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator9" runat="server"
                                            Display="Dynamic" ValidationGroup="CamNhan" ControlToValidate="txtContentCamNhan"
                                            ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="btn-gui">
                                        <asp:Button ID="btnGuiCamNhan" runat="server" Text="Gửi cảm nhận" OnClick="btnGuiCamNhan_Click" ValidationGroup="CamNhan" />
                                    </div>
                                </div>
                            </div>
                            <a href="javascript:void(0);" class="close-modal"></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <div class="datlich-kham lichhen popup scroll-popup">
        <div class="popup-content">
            <div class="form-popup">
                <h3>Đặt lịch khám</h3>
                <div class="wrap-datlich">
                    <div class="lich-left">
                    <div class="form-group">
                        <asp:TextBox ID="txtFullNamePopup" runat="server"></asp:TextBox>
                        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server" Enabled="True"
                            WatermarkText="Họ tên (*)" TargetControlID="txtFullNamePopUp">
                        </asp:TextBoxWatermarkExtender>
                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator10" runat="server"
                            Display="Dynamic" ValidationGroup="DatHenPopup" ControlToValidate="txtFullNamePopUp"
                            ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <div class="ngaysinh">
                            <asp:RadDatePicker ShowPopupOnFocus="True" ID="dpNgaySinhPopup" runat="server" Culture="vi-VN"
                                Calendar-CultureInfo="vi-VN" Width="65%" Height="30px" CssClass="drop-ngaysinh">
                                <Calendar ID="Calendar3" runat="server">
                                    <SpecialDays>
                                        <asp:RadCalendarDay Repeatable="Today">
                                            <ItemStyle CssClass="rcToday" />
                                        </asp:RadCalendarDay>
                                    </SpecialDays>
                                </Calendar>
                                <DateInput ID="DateInput3" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy"
                                    runat="server" Height="32px">
                                </DateInput>
                                <DatePopupButton HoverImageUrl="" ImageUrl="" />
                            </asp:RadDatePicker>
                            <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator11" runat="server"
                                Display="Dynamic" ValidationGroup="DatHenPopup" ControlToValidate="dpNgaySinhPopup"
                                ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="gioitinh">
                            <asp:DropDownList ID="dropListGenderPopup" runat="server">
                                <asp:ListItem Value="0">Nam</asp:ListItem>
                                <asp:ListItem Value="1">Nữ</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtPhonePopup" runat="server"></asp:TextBox>
                        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender3" runat="server"
                            Enabled="True" WatermarkText="Điện thoại(*)" TargetControlID="txtPhonePopup">
                        </asp:TextBoxWatermarkExtender>
                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator12" runat="server"
                            Display="Dynamic" ValidationGroup="DatHenPopup" ControlToValidate="txtPhonePopup"
                            ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div class="form-group">
                                <asp:DropDownList ID="dropListChuyenKhoaPopup" runat="server" DataSourceID="odsPhongBanDrop" DataTextField="ProjectCategoryNameEn" DataValueField="ProjectCategoryID" AutoPostBack="true"></asp:DropDownList>
                                <asp:ObjectDataSource ID="odsPhongBanDropPopup" runat="server" SelectMethod="ProjectCategorySelectAll" TypeName="TLLib.ProjectCategory">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="17" Name="parentID" Type="Int32" />
                                        <asp:Parameter DefaultValue="1" Name="increaseLevelCount" Type="Int32" />
                                        <asp:Parameter Name="IsShowOnMenu" Type="String" />
                                        <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </div>
                            <div class="form-group">
                                <asp:DropDownList ID="dropListBacSiPopup" runat="server" DataSourceID="odsBacSiDropPopup" DataTextField="ProjectTitleEn" DataValueField="ProjectID" AutoPostBack="true"></asp:DropDownList>
                                <asp:ObjectDataSource ID="odsBacSiDropPopup" runat="server" SelectMethod="ProjectSelectAll" TypeName="TLLib.Project">
                                    <SelectParameters>
                                        <asp:Parameter Name="StartRowIndex" Type="String" />
                                        <asp:Parameter Name="EndRowIndex" Type="String" />
                                        <asp:Parameter Name="Keyword" Type="String" />
                                        <asp:Parameter Name="ProjectTitle" Type="String" />
                                        <asp:Parameter Name="Description" Type="String" />
                                        <asp:ControlParameter ControlID="dropListChuyenKhoaPopup" Name="ProjectCategoryID" PropertyName="SelectedValue" Type="String" />
                                        <asp:Parameter Name="Tag" Type="String" />
                                        <asp:Parameter Name="IsHot" Type="String" />
                                        <asp:Parameter Name="IsNew" Type="String" />
                                        <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                                        <asp:Parameter Name="FromDate" Type="String" />
                                        <asp:Parameter Name="ToDate" Type="String" />
                                        <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                        <asp:Parameter Name="Priority" Type="String" />
                                        <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="form-group">
                        <asp:RadDatePicker ShowPopupOnFocus="True" ID="dpNgayKhamPopup" runat="server" Culture="vi-VN"
                            Calendar-CultureInfo="vi-VN" Width="60%" Height="32px" CssClass="drop-ngaysinh">
                            <Calendar ID="Calendar4" runat="server">
                                <SpecialDays>
                                    <asp:RadCalendarDay Repeatable="Today">
                                        <ItemStyle CssClass="rcToday" />
                                    </asp:RadCalendarDay>
                                </SpecialDays>
                            </Calendar>
                            <DateInput ID="DateInput4" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy"
                                runat="server" Height="32px">
                            </DateInput>
                            <DatePopupButton HoverImageUrl="" ImageUrl="" />
                        </asp:RadDatePicker>
                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator13" runat="server"
                            Display="Dynamic" ValidationGroup="DatHenPopup" ControlToValidate="dpNgayKhamPopup"
                            ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RadTimePicker ID="dpGioKhamPopup" runat="server" Width="40%" Height="32px" ShowPopupOnFocus="true"
                            TimeView-StartTime="07:00:00" TimeView-Interval="00:30:00" TimeView-EndTime="18:00:01" Culture="en-US" CssClass="drop-ngaysinh">
                        </asp:RadTimePicker>
                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator14" runat="server"
                            Display="Dynamic" ValidationGroup="DatHenPopup" ControlToValidate="dpGioKhamPopup"
                            ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <p>(*) là thông tin bắt buộc nhập</p>
                    <asp:Button ID="btnDatHen2" runat="server" Text="Đặt lịch hẹn" OnClick="btnDatHen2_Click" ValidationGroup="DatHenPopup" />
                </div>
                </div>
            </div>
            <a href="javascript:void(0);" class="close-modal"></a>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $(".ruFakeInput").attr("value", "Hình đại diện");
        });
    </script>
</asp:Content>

