<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="dich-vu-chi-tiet.aspx.cs" Inherits="dich_vu_chi_tiet" %>

<%@ Register Src="~/uc/cam-nhan-benh-nhan.ascx" TagPrefix="uc1" TagName="camnhanbenhnhan" %>
<%@ Register Src="~/uc/cap-cuu.ascx" TagPrefix="uc1" TagName="capcuu" %>
<%@ Register Src="~/uc/banner-chuyenkhoa.ascx" TagPrefix="uc4" TagName="bannerchuyenkhoa" %>
<%@ Register Src="~/uc/list-category-service.ascx" TagPrefix="uc5" TagName="listcategoryservice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_img" runat="Server">
    <uc4:bannerchuyenkhoa ID="bannerchuyenkhoa1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="page_aside" runat="Server">
    <%--<uc5:listcategoryservice runat="server" ID="listcategoryservice1" />--%>
    <section>
        <div class="cam-nhan">
            <h3>thông tin liên quan</h3>
            <div class="thongtin-lienquan">
                <asp:ListView ID="lstThongTinLienQuan" runat="server" DataSourceID="odsThongTinLienQuan"
                    EnableModelValidation="True">
                    <ItemTemplate>
                        <div class="item">
                            <h3><a href='<%# "/tin-tuc/" + progressTitle(Eval("ProjectTitle")) + "-" + Eval("ProjectID") + ".aspx" %>'><%# Eval("ProjectTitle") %></a></h3>
                        </div>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <span>Đang cập nhật</span>
                    </EmptyDataTemplate>
                    <LayoutTemplate>
                        <span runat="server" id="itemPlaceholder" />
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsThongTinLienQuan" runat="server" SelectMethod="ProjectSelectAll2" TypeName="TLLib.Project">
                    <SelectParameters>
                        <asp:Parameter Name="StartRowIndex" Type="String" />
                        <asp:Parameter Name="EndRowIndex" Type="String" />
                        <asp:Parameter Name="Keyword" Type="String" />
                        <asp:Parameter Name="ProjectTitle" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter DefaultValue="5" Name="ProjectCategoryID" Type="String" />
                        <asp:QueryStringParameter QueryStringField="dv" Name="ProjectCategorySameID" Type="String" />
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
    <uc1:camnhanbenhnhan runat="server" ID="camnhanbenhnhan" />
    <uc1:capcuu runat="server" ID="capcuu" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="page_main" runat="Server">
    <div class="service">
        <asp:ListView ID="lstDichVuChiTiet" runat="server" DataSourceID="odsDichVuChiTiet"
            EnableModelValidation="True">
            <ItemTemplate>
                <div class="title-main">
                    <h1><%# Eval("ProjectCategoryName") %></h1>
                    <h2 style="display: none;"><a href='<%= HttpContext.Current.Request.Url.Host + "" + HttpContext.Current.Request.Url.AbsolutePath %>' title='<%# Eval("ProjectCategoryName") %>'><%# Eval("ProjectCategoryName") %></a></h2>
                </div>
                <div class="main-text">
                    <%# Eval("Content") %>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <span runat="server" id="itemPlaceholder" />
            </LayoutTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="odsDichVuChiTiet" runat="server" SelectMethod="ProjectCategorySelectOne" TypeName="TLLib.ProjectCategory">
            <SelectParameters>
                <asp:QueryStringParameter Name="ProjectCategoryID" QueryStringField="dv" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>

