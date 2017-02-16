<%@ Page Title="" Language="C#" MasterPageFile="~/en/site-sub.master" AutoEventWireup="true" CodeFile="danh-muc-kt.aspx.cs" Inherits="danh_muc_kt" %>

<%@ Register Src="~/en/uc/cap-cuu.ascx" TagPrefix="uc1" TagName="capcuu" %>
<%@ Register Src="~/en/uc/cau-hoi-truc-tuyen.ascx" TagPrefix="uc1" TagName="cauhoitructuyen" %>
<%@ Register Src="~/en/uc/banner-danhmuckt.ascx" TagPrefix="uc4" TagName="bannerdanhmuckt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_img" runat="Server">
    <uc4:bannerdanhmuckt ID="bannerdanhmuckt1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="page_aside" runat="Server">
    <uc1:capcuu runat="server" ID="capcuu" />
    <uc1:cauhoitructuyen runat="server" ID="cauhoitructuyen" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="page_main" runat="Server">
    <asp:ListView ID="lstDanhMucKT" runat="server" DataSourceID="odsDanhMucKT"
        EnableModelValidation="True">
        <ItemTemplate>
            <h1 class="content-tit"><%# Eval("ProjectTitleEn") %></h1>
            <asp:HiddenField ID="hdnProjectID" Value='<%# Eval("ProjectID") %>' runat="server" />
            <asp:ListView ID="lstFile" runat="server" DataSourceID="odsFile"
                EnableModelValidation="True">
                <ItemTemplate>
                    <iframe src='<%# "../res/project/download/" + Eval("LinkDownload") %>' style="width: 100%; height: 500px;" frameborder="0"></iframe>
                </ItemTemplate>
                <LayoutTemplate>
                    <span runat="server" id="itemPlaceholder" />
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsFile" runat="server" SelectMethod="ProjectDownloadSelectAll"
            TypeName="TLLib.ProjectDownload">
            <SelectParameters>
                <asp:ControlParameter ControlID="hdnProjectID" Name="ProjectID" PropertyName="Value" Type="String" />
                <asp:Parameter Name="IsAvailable" Type="String" />
                <asp:Parameter Name="Priority" Type="String" />
                <asp:Parameter Name="SortByPriority" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        </ItemTemplate>
        <LayoutTemplate>
            <span runat="server" id="itemPlaceholder" />
        </LayoutTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsDanhMucKT" runat="server" SelectMethod="ProjectSelectAll" TypeName="TLLib.Project">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="StartRowIndex" Type="String" />
            <asp:Parameter DefaultValue="1" Name="EndRowIndex" Type="String" />
            <asp:Parameter Name="Keyword" Type="String" />
            <asp:Parameter Name="ProjectTitle" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter DefaultValue="50" Name="ProjectCategoryID" Type="String" />
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
</asp:Content>

