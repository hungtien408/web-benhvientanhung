﻿<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="co-so-vat-chat.aspx.cs" Inherits="co_so_vat_chat" %>

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
    <h1 class="content-tit">Cơ sở vật chất</h1>
    <h2 style="display:none;"><a href='<%= HttpContext.Current.Request.Url.Host + "" + HttpContext.Current.Request.Url.AbsolutePath %>' title='Cơ sở vật chất'>Cơ sở vật chất</a></h2>
    <div class="csvc-cate">
        <asp:ListView ID="lstMayMoc" runat="server" DataSourceID="odsMayMoc"
            EnableModelValidation="True">
            <ItemTemplate>
                <div class="item">
                    <div class="wrap-item">
                        <div class="img">
                            <a href='<%# "/co-so-vat-chat/" + progressTitle(Eval("ProjectTitle")) + "-" + Eval("ProjectID") + ".aspx" %>'>
                                <img alt='<%# Eval("ImageName") %>' src='<%# "~/res/project/" + Eval("ImageName") %>'
                                    visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                    runat="server" /></a>
                        </div>
                        <div class="content">
                            <a href='<%# "/co-so-vat-chat/" + progressTitle(Eval("ProjectTitle")) + "-" + Eval("ProjectID") + ".aspx" %>'><%# Eval("ProjectTitle") %></a>
                            <p><%# Eval("Description") %></p>
                        </div>
                    </div>
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
</asp:Content>

