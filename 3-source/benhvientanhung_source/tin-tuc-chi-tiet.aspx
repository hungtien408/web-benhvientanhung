<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="tin-tuc-chi-tiet.aspx.cs" Inherits="tin_tuc_chi_tiet" %>

<%@ Register Src="~/uc/cam-nhan-benh-nhan.ascx" TagPrefix="uc1" TagName="camnhanbenhnhan" %>
<%@ Register Src="~/uc/cap-cuu.ascx" TagPrefix="uc1" TagName="capcuu" %>
<%@ Register Src="~/uc/banner-news.ascx" TagPrefix="uc4" TagName="bannernews" %>
<%@ Register Src="~/uc/list-category-service.ascx" TagPrefix="uc5" TagName="listcategoryservice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta property="og:type" content="article" />
    <%--đường link muốn share--%>
    <meta property="og:url" content='<%= Request.Url.Scheme + "://" + Page.Request.Url.Host.ToString() + "/" + Request.Url.AbsolutePath.Substring(Request.Url.AbsolutePath.LastIndexOf("/") + 1) %>' />
    <%--tiêu đề muốn share--%>
    <meta property="og:title" content='<%= hdnTitle.Value %>' />
    <%--hình ảnh muốn share--%>
    <%--mô tả muốn share--%>
    <meta property="og:description" content='<%= hdnDescription.Value %>' />
     <meta name="thumbnail" content='<%= Request.Url.Scheme + "://" + Page.Request.Url.Host.ToString() + "/" + ("res/project/"+ hdnImageName.Value)  %>' />
    <meta property="og:image" content='<%= Request.Url.Scheme + "://" + Page.Request.Url.Host.ToString() + "/" + ("res/project/"+ hdnImageName.Value)  %>' />
    <%--tên website muốn share--%>
    <meta property="og:site_name" content='<%= Request.Url.Scheme + "://" + Page.Request.Url.Host.ToString() + "/" + Request.Url.AbsolutePath.Substring(Request.Url.AbsolutePath.LastIndexOf("/") + 1) %>' />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_img" runat="Server">
    <uc4:bannernews ID="bannernews1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="page_aside" runat="Server">
    <uc5:listcategoryservice runat="server" ID="listcategoryservice1" />
    <uc1:camnhanbenhnhan runat="server" ID="camnhanbenhnhan" />
    <uc1:capcuu runat="server" ID="capcuu" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="page_main" runat="Server">
    <asp:HiddenField ID="hdnDescription" runat="server" />
    <asp:HiddenField ID="hdnImageName" runat="server" />
    <asp:HiddenField ID="hdnTitle" runat="server" />
    <asp:ListView ID="lstNewDetails" runat="server" DataSourceID="odsNewDetails"
        EnableModelValidation="True">
        <ItemTemplate>
            <div class="abou-us-content">
                <div class="title-main">
                    <h1><%# Eval("ProjectTitle") %></h1>
                </div>
                <div class="description">
                    <%# Eval("Content") %>
                </div>
                <div class="fb-like" data-href='<%= "http://www.diendancuoi.com/" + Request.Url.AbsolutePath.Substring(Request.Url.AbsolutePath.LastIndexOf("/") + 1) %>'
                    data-send="false" data-layout="button_count" data-width="50" data-show-faces="true">
                </div>
                <div class="fb-share-button"
                    data-href='<%= "http://www.diendancuoi.com/" + Request.Url.AbsolutePath.Substring(Request.Url.AbsolutePath.LastIndexOf("/") + 1) %>'
                    data-layout="button_count">
                </div>
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <span runat="server" id="itemPlaceholder" />
        </LayoutTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsNewDetails" runat="server" SelectMethod="ProjectSelectOne" TypeName="TLLib.Project">
        <SelectParameters>
            <asp:QueryStringParameter Name="ProjectID" QueryStringField="tt" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <div class="tin-lienquan">
        <h1>Bài viết liên quan</h1>
        <div class="news-carousel owl-carousel">
            <asp:ListView ID="lstTinTucLienQuan" runat="server" DataSourceID="odsTinTucLienQuan"
                EnableModelValidation="True">
                <ItemTemplate>
                    <div class="item">
                        <img alt='<%# Eval("ImageName") %>' src='<%# "~/res/project/" + Eval("ImageName") %>'
                            visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                            runat="server" />
                        <div class="content">
                            <a href='<%# "/tintuc/" + progressTitle(Eval("ProjectTitle")) + "-" + Eval("ProjectID") + ".aspx" %>'><%# Eval("ProjectTitle") %></a>
                            <p><%# TLLib.Common.SplitSummary(Eval("Description").ToString(), 80) %></p>
                            <div class="read-more"><a href='<%# "/tintuc/" + progressTitle(Eval("ProjectTitle")) + "-" + Eval("ProjectID") + ".aspx" %>'>Xem thêm</a></div>
                        </div>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <span runat="server" id="itemPlaceholder" />
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsTinTucLienQuan" runat="server" SelectMethod="ProjectSameSelectAll" TypeName="TLLib.Project">
                <SelectParameters>
                    <asp:Parameter DefaultValue="10" Name="RerultCount" Type="String"></asp:Parameter>
                    <asp:QueryStringParameter QueryStringField="tt" DefaultValue="" Name="ProjectID" Type="String"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>

