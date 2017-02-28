﻿<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="cac-chuyen-khoa.aspx.cs" Inherits="chuyen_khoa" %>

<%@ Register Src="~/uc/cam-nhan-benh-nhan.ascx" TagPrefix="uc1" TagName="camnhanbenhnhan" %>
<%@ Register Src="~/uc/cap-cuu.ascx" TagPrefix="uc1" TagName="capcuu" %>
<%@ Register Src="~/uc/banner-chuyenkhoa.ascx" TagPrefix="uc4" TagName="bannerchuyenkhoa" %>
<%@ Register Src="~/uc/list-category-chuyen-khoa.ascx" TagPrefix="uc5" TagName="listcategorychuyenkhoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_img" runat="Server">
    <uc4:bannerchuyenkhoa ID="bannerchuyenkhoa1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="page_aside" runat="Server">
    <uc5:listcategorychuyenkhoa runat="server" ID="listcategorychuyenkhoa1" />
    <uc1:camnhanbenhnhan runat="server" ID="camnhanbenhnhan" />
    <uc1:capcuu runat="server" ID="capcuu" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="page_main" runat="Server">
    <div class="service">
        <h1 class="content-tit">các chuyên khoa</h1>
        <h2 style="display:none;"><%= HttpContext.Current.Request.Url.Host + "" + HttpContext.Current.Request.Url.AbsolutePath %></h2>
        <div class="row service-main">
            <asp:ListView ID="lstCacChuyenKhoa" runat="server" DataSourceID="odsCacChuyenKhoa"
                EnableModelValidation="True">
                <ItemTemplate>
                    <div class="col-md-4">
                        <div class="service-box">
                            <div class="service-name text-uppercase">
                                <a href='<%# "/chuyen-khoa/" + progressTitle(Eval("ProjectCategoryName")) + "-" + Eval("ProjectCategoryID") + ".aspx" %>'><%# Eval("ProjectCategoryName") %></a>
                            </div>
                            <div class="service-img">
                                <a href='<%# "/chuyen-khoa/" + progressTitle(Eval("ProjectCategoryName")) + "-" + Eval("ProjectCategoryID") + ".aspx" %>'>
                                    <img alt='<%# Eval("ImageName") %>' src='<%# "~/res/projectcategory/" + Eval("ImageName") %>'
                                        visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                        runat="server" /></a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <span runat="server" id="itemPlaceholder" />
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsCacChuyenKhoa" runat="server" SelectMethod="ProjectCategorySelectAll" TypeName="TLLib.ProjectCategory">
                <SelectParameters>
                    <asp:Parameter DefaultValue="14" Name="parentID" Type="Int32" />
                    <asp:Parameter DefaultValue="1" Name="increaseLevelCount" Type="Int32" />
                    <asp:Parameter Name="IsShowOnMenu" Type="String" />
                    <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>

