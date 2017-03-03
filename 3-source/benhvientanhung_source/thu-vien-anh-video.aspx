<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="thu-vien-anh-video.aspx.cs" Inherits="thu_vien_anh" %>

<%@ Register Src="~/uc/cap-cuu.ascx" TagPrefix="uc1" TagName="capcuu" %>
<%@ Register Src="~/uc/cau-hoi-truc-tuyen.ascx" TagPrefix="uc1" TagName="cauhoitructuyen" %>
<%@ Register Src="~/uc/banner-about.ascx" TagPrefix="uc4" TagName="bannerabout" %>
<%@ Register Src="~/uc/list-category-about.ascx" TagPrefix="uc5" TagName="listcategoryabout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_img" runat="Server">
    <uc4:bannerabout ID="bannerabout1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="page_aside" runat="Server">
    <uc5:listcategoryabout runat="server" ID="listcategoryabout1" />
    <uc1:capcuu runat="server" ID="capcuu" />
    <uc1:cauhoitructuyen runat="server" ID="cauhoitructuyen" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="page_main" runat="Server">
    <h1 class="content-tit">Thư viện ảnh</h1>
    <h2 style="display:none;"><a href='<%= HttpContext.Current.Request.Url.Host + "" + HttpContext.Current.Request.Url.AbsolutePath %>' title='Thư viện ảnh'>Thư viện ảnh</a></h2>
    <div class="skin1" role="tabpanel">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <asp:ListView ID="lstPhotoCategory1" runat="server" DataSourceID="odsPhotoCategory"
                EnableModelValidation="True">
                <ItemTemplate>
                    <li role="presentation">
                        <a href='<%# "#tab" + Eval("PhotoCategoryID") %>' aria-controls="tab" role="tab" data-toggle="tab"><%# Eval("PhotoCategoryName") %></a>
                    </li>
                </ItemTemplate>
                <LayoutTemplate>
                    <span runat="server" id="itemPlaceholder" />
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsPhotoCategory" runat="server" SelectMethod="PhotoCategorySelectAll"
                TypeName="TLLib.PhotoCategory">
                <SelectParameters>
                    <asp:Parameter Name="PhotoCategoryName" Type="String" />
                    <asp:Parameter Name="IsShowOnMenu" Type="String" />
                    <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                    <asp:Parameter Name="Priority" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <asp:ListView ID="lstPhotoCategory2" runat="server" DataSourceID="odsPhotoCategory"
                EnableModelValidation="True" OnItemDataBound="lstPhotoCategory2_ItemDataBound">
                <ItemTemplate>
                    <div role="tabpanel" class="tab-pane" id='<%# "tab" + Eval("PhotoCategoryID") %>'>
                        <asp:HiddenField ID="hdnPhotoCategoryID" runat="server" Value='<%# Eval("PhotoCategoryID") %>' />
                        <div class="library-content">
                            <asp:ListView ID="lstThuVienAnh" runat="server" DataSourceID="odsPhotoAlbumCategory"
                                EnableModelValidation="True">
                                <ItemTemplate>
                                    <div class="library-box">
                                        <a href="javascript:void(0);">
                                            <div class="library-img">
                                                <img alt='<%# Eval("ImageName") %>' src='<%# "~/res/photoalbumcategory/" + Eval("ImageName") %>' runat="server"
                                                    visible='<%# string.IsNullOrEmpty(Eval("ImageName").ToString()) ? false : true %>' />
                                            </div>
                                            <div class="library-name">
                                                <%# Eval("PhotoAlbumCategoryName")%>
                                            </div>
                                        </a>
                                        <div class="popup-1">
                                            <div class="popup-content">
                                                <asp:HiddenField ID="hdnPhotoAlbumCategoryID" runat="server" Value='<%# Eval("PhotoAlbumCategoryID") %>' />
                                                <div class="slider-for">
                                                    <asp:ListView ID="lstPhotoAlbumBig" runat="server" DataSourceID="odsPhotoAlbum"
                                                        EnableModelValidation="True">
                                                        <ItemTemplate>
                                                            <div class="item">
                                                                <img alt='<%# Eval("ImageName") %>' src='<%# "~/res/photoalbum/" + Eval("ImageName") %>' runat="server" visible='<%# string.IsNullOrEmpty(Eval("ImageName").ToString()) ? false : true %>' />
                                                                <p><%# Eval("Title") %></p>
                                                            </div>
                                                        </ItemTemplate>
                                                        <LayoutTemplate>
                                                            <span runat="server" id="itemPlaceholder" />
                                                        </LayoutTemplate>
                                                    </asp:ListView>
                                                    <asp:ObjectDataSource ID="odsPhotoAlbum" runat="server" SelectMethod="PhotoAlbumSelectAll" TypeName="TLLib.PhotoAlbum">
                                                        <SelectParameters>
                                                            <asp:Parameter Name="Keyword" Type="String" />
                                                            <asp:Parameter Name="Title" Type="String" />
                                                            <asp:Parameter Name="Descripttion" Type="String" />
                                                            <asp:ControlParameter ControlID="hdnPhotoAlbumCategoryID" Name="PhotoAlbumCategoryID" PropertyName="Value" Type="String" />
                                                            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                                            <asp:Parameter Name="Priority" Type="String" />
                                                            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                                        </SelectParameters>
                                                    </asp:ObjectDataSource>
                                                </div>
                                                <div class="slider-nav">
                                                    <asp:ListView ID="lstPhotoAlbumSmall" runat="server" DataSourceID="odsPhotoAlbum"
                                                        EnableModelValidation="True">
                                                        <ItemTemplate>
                                                            <div class="item">
                                                                <img alt='<%# Eval("ImageName") %>' src='<%# "~/res/photoalbum/thumbs/" + Eval("ImageName") %>' runat="server" visible='<%# string.IsNullOrEmpty(Eval("ImageName").ToString()) ? false : true %>' />
                                                            </div>
                                                        </ItemTemplate>
                                                        <LayoutTemplate>
                                                            <span runat="server" id="itemPlaceholder" />
                                                        </LayoutTemplate>
                                                    </asp:ListView>
                                                </div>
                                                <a href="javascript:void(0);" class="close-modal"></a>
                                            </div>
                                        </div>
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
                                    <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                                    <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                    <asp:ControlParameter ControlID="hdnPhotoCategoryID" Name="PhotoCategoryID" PropertyName="Value" Type="String" />
                                    <asp:Parameter Name="Priority" Type="String" />
                                    <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </div>
                        <div class="pager">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="8" PagedControlID="lstThuVienAnh">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false"
                                        ShowNextPageButton="false" ShowPreviousPageButton="true" ButtonCssClass="prev fa fa-angle-left"
                                        RenderDisabledButtonsAsLabels="true" PreviousPageText="" />
                                    <asp:NumericPagerField ButtonCount="5" NumericButtonCssClass="numer-paging"
                                        CurrentPageLabelCssClass="current" />
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="false"
                                        ButtonCssClass="next fa fa-angle-right" ShowNextPageButton="true" ShowPreviousPageButton="false"
                                        RenderDisabledButtonsAsLabels="true" NextPageText="" />
                                </Fields>
                            </asp:DataPager>
                        </div>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <span runat="server" id="itemPlaceholder" />
                </LayoutTemplate>
            </asp:ListView>
        </div>
        <div class="video-main">
            <h1 class="content-tit">Video</h1>
            <div class="video-left">
                <div class="wrapper-video">
                    <asp:ListView ID="lstVideoHot" runat="server" DataSourceID="odsVideoHot"
                        EnableModelValidation="True">
                        <ItemTemplate>
                            <div class="video-details">
                                <div id="jwplayer3"></div>
                                <script type="text/javascript">
                                    $(document).ready(function () {
                                        jwplayer('jwplayer3').setup({
                                            image: '<%# "res/video/thumbs/" + Eval("ImagePath") %>',
                                            file: '<%# string.IsNullOrEmpty(Eval("VideoPath").ToString()) ? Eval("GLobalEmbedScript") : "res/video/" + Eval("VideoPath") %>',
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
                            <asp:Parameter DefaultValue="True" Name="IsHot" Type="String" />
                            <asp:Parameter Name="IsNew" Type="String" />
                            <asp:Parameter Name="Priority" Type="String" />
                            <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
            </div>
            <div class="video-right">
                <div class="title-box">
                    <h1>VIDEO NỔI BẬT</h1>
                </div>
                <div class="">
                    <div id="sliderProject" class="slider">
                        <asp:ListView ID="lstVideo" runat="server" DataSourceID="odsVideo"
                            EnableModelValidation="True">
                            <ItemTemplate>
                                <div class="slide-box">
                                    <a data-src='<%# string.IsNullOrEmpty(Eval("VideoPath").ToString()) ? Eval("GLobalEmbedScript") : "res/video/" + Eval("VideoPath") %>'>
                                        <div class="slide-img">
                                            <img alt='<%# Eval("ImagePath") %>' src='<%# !string.IsNullOrEmpty(Eval("ImagePath").ToString()) ? "~/res/video/thumbs/" + Eval("ImagePath") : "~/assets/images/video-img.jpg" %>'
                                                runat="server" />
                                        </div>
                                    </a>
                                </div>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <span runat="server" id="itemPlaceholder" />
                            </LayoutTemplate>
                        </asp:ListView>
                        <asp:ObjectDataSource ID="odsVideo" runat="server" SelectMethod="VideoSelectAll" TypeName="TLLib.Video">
                            <SelectParameters>
                                <asp:Parameter Name="Title" Type="String" />
                                <asp:Parameter Name="Description" Type="String" />
                                <asp:Parameter Name="VideoCategoryID" Type="String" />
                                <asp:Parameter Name="PhotoCategoryID" Type="String" />
                                <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                <asp:Parameter Name="IsHot" Type="String" />
                                <asp:Parameter Name="IsNew" Type="String" />
                                <asp:Parameter Name="Priority" Type="String" />
                                <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

