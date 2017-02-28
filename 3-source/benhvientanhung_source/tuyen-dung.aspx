<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="tuyen-dung.aspx.cs" Inherits="tuyen_dung" %>

<%@ Register Src="~/uc/cap-cuu.ascx" TagPrefix="uc1" TagName="capcuu" %>
<%@ Register Src="~/uc/cau-hoi-truc-tuyen.ascx" TagPrefix="uc1" TagName="cauhoitructuyen" %>
<%@ Register Src="~/uc/banner-career.ascx" TagPrefix="uc4" TagName="bannercareer" %>
<%@ Register Src="~/uc/list-category-about.ascx" TagPrefix="uc5" TagName="listcategoryabout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_img" runat="Server">
    <uc4:bannercareer ID="bannercareer1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="page_aside" runat="Server">
    <uc5:listcategoryabout runat="server" ID="listcategoryabout1" />
    <uc1:capcuu runat="server" ID="capcuu" />
    <uc1:cauhoitructuyen runat="server" ID="cauhoitructuyen" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="page_main" runat="Server">
    <h1 class="content-tit">Tuyển dụng</h1>
    <h2 style="display:none;"><%= HttpContext.Current.Request.Url.Host + "" + HttpContext.Current.Request.Url.AbsolutePath %></h2>
    <div class="tuyendung-wrap">
        <asp:ListView ID="lstTuyenDungMoTa" runat="server" DataSourceID="odsTuyenDungMoTa"
            EnableModelValidation="True">
            <ItemTemplate>
                <%# Eval("Content") %>
            </ItemTemplate>
            <LayoutTemplate>
                <span runat="server" id="itemPlaceholder" />
            </LayoutTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="odsTuyenDungMoTa" runat="server"
            SelectMethod="ProjectCategorySelectOne" TypeName="TLLib.ProjectCategory">
            <SelectParameters>
                <asp:Parameter DefaultValue="54" Name="ProjectCategoryID" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>

        <div class="bor-acc">
            <div class="tin-accodion">
                <div class="accodion-head">
                    <div class="td-location">Vị trí đang tuyển</div>
                    <div class="td-number">Số lượng</div>
                    <div class="td-time">Thời gian đăng tuyển</div>
                </div>
                <div class="accodion-content">
                    <asp:ListView ID="lstTuyenDung" runat="server" DataSourceID="odsTuyenDung"
                        EnableModelValidation="True">
                        <ItemTemplate>
                            <div class="faq">
                                <div class="tin-title">
                                    <div class="td-location"><%# Eval("ProjectTitle") %></div>
                                    <div class="td-number"><%# Eval("Tag") %></div>
                                    <div class="td-time"><%# Eval("TagEn") %></div>
                                </div>
                                <div class="tin-content">
                                    <div class="content-wrap">
                                        <%# Eval("Content") %>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsTuyenDung" runat="server" SelectMethod="ProjectSelectAll" TypeName="TLLib.Project">
                        <SelectParameters>
                            <asp:Parameter Name="StartRowIndex" Type="String" />
                            <asp:Parameter Name="EndRowIndex" Type="String" />
                            <asp:Parameter Name="Keyword" Type="String" />
                            <asp:Parameter Name="ProjectTitle" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter DefaultValue="54" Name="ProjectCategoryID" Type="String" />
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
        </div>
    </div>
</asp:Content>

