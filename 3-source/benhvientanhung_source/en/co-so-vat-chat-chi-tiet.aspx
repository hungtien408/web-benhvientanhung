﻿<%@ Page Title="" Language="C#" MasterPageFile="~/en/site-sub.master" AutoEventWireup="true" CodeFile="co-so-vat-chat-chi-tiet.aspx.cs" Inherits="about_us" %>

<%@ Register Src="~/en/uc/cap-cuu.ascx" TagPrefix="uc1" TagName="capcuu" %>
<%@ Register Src="~/en/uc/cau-hoi-truc-tuyen.ascx" TagPrefix="uc1" TagName="cauhoitructuyen" %>
<%@ Register Src="~/en/uc/banner-about.ascx" TagPrefix="uc4" TagName="bannerabout" %>
<%@ Register Src="~/en/uc/list-category-about.ascx" TagPrefix="uc5" TagName="listcategoryabout" %>
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
    <asp:ListView ID="lstCoSoVatChat" runat="server" DataSourceID="odsCoSoVatChat"
        EnableModelValidation="True">
        <ItemTemplate>
            <div class="abou-us-content">
                <h1 class="content-tit"><%# Eval("ProjectTitleEn") %></h1>
                <h2 style="display:none;"><%= HttpContext.Current.Request.Url.Host + "" + HttpContext.Current.Request.Url.AbsolutePath %></h2>
                <div class="description">
                    <%# Eval("ContentEn") %>
                </div>
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <span runat="server" id="itemPlaceholder" />
        </LayoutTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsCoSoVatChat" runat="server" SelectMethod="ProjectSelectOne" TypeName="TLLib.Project">
        <SelectParameters>
            <asp:QueryStringParameter Name="ProjectID" QueryStringField="cs" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
