<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

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
                <div class="pc-left">
                    <asp:ListView ID="lstAbout" runat="server" DataSourceID="odsAbout"
                        EnableModelValidation="True">
                        <ItemTemplate>
                            <div class="id-cont">
                                <span><%# Eval("ProjectCategoryName") %></span>
                                <h1><%# Eval("ProjectTitle") %></h1>
                            </div>
                            <p><%# Eval("Description") %></p>
                            <div class="read-more">
                                <a href='<%# "/tintuc/" + progressTitle(Eval("ProjectTitle")) + "-" + Eval("ProjectID") + ".aspx" %>'>Xem thêm</a>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
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
                                    <div id="jwplayer1"></div>
                                    <script type="text/javascript">
                                        $(document).ready(function () {
                                            jwplayer('jwplayer1').setup({
                                                image: '<%# "res/video/thumbs/" + Eval("ImagePath") %>',
                                                file: '<%# string.IsNullOrEmpty(Eval("VideoPath").ToString()) ? Eval("GLobalEmbedScript") : "res/video/" + Eval("VideoPath") %>',
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
                <div class="datcauhoi popup scroll-popup">
                    <div class="popup-content">
                        <div class="form-popup">
                            <h1>Đặt câu hỏi</h1>
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
                                    <asp:Button ID="btnGuiCauHoi" runat="server" Text="Gửi câu hỏi" OnClick="btnGuiCauHoi_Click" ValidationGroup="DatCauHoi" />
                                </div>
                            </div>
                        </div>
                        <a href="javascript:void(0);" class="close-modal"></a>
                    </div>
                </div>
                <div class="lich-left">
                    <h1>đặt lịch hẹn trực tuyến</h1>
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
                                <asp:DropDownList ID="dropListChuyenKhoa" runat="server" DataSourceID="odsPhongBanDrop" DataTextField="ProjectCategoryName" DataValueField="ProjectCategoryID" AutoPostBack="true"></asp:DropDownList>
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
                                <asp:DropDownList ID="dropListBacSi" runat="server" DataSourceID="odsBacSiDrop" DataTextField="ProjectTitle" DataValueField="ProjectID" AutoPostBack="true"></asp:DropDownList>
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
        <section class="team-of-doctors">
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
                                            <p><%# Eval("ProjectTitle") %></p>
                                            <span><%# Eval("MetaTittle") %></span>
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
                                    <a href='<%# "/chuyenkhoa/" + progressTitle(Eval("ProjectCategoryName")) + "-" + Eval("ProjectCategoryID") + ".aspx" %>'>
                                        <div class="wrap-content">
                                            <img alt='<%# Eval("ImageNameIcon") %>' src='<%# "~/res/projectcategory/icon/" + Eval("ImageNameIcon") %>'
                                                visible='<%# string.IsNullOrEmpty( Eval("ImageNameIcon").ToString()) ? false : true %>'
                                                runat="server" />
                                            <p><%# Eval("ProjectCategoryName") %></p>
                                        </div>
                                    </a>
                                </div>
                                <div class="img">
                                    <a href='<%# "/chuyenkhoa/" + progressTitle(Eval("ProjectCategoryName")) + "-" + Eval("ProjectCategoryID") + ".aspx" %>'>
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
                                <a href='<%# "/cosovatchat/" + progressTitle(Eval("ProjectTitle")) + "-" + Eval("ProjectID") + ".aspx" %>'>
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
                                    <p><%# Eval("Content") %></p>
                                    <span><%# Eval("ProjectTitle") %></span>
                                    <div style="width: 100%; margin-top:10px;">
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
                    <div class="wrap-camnhan">
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
            </div>
        </section>
    </div>
</asp:Content>

