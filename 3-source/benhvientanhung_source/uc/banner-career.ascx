<%@ Control Language="C#" AutoEventWireup="true" CodeFile="banner-career.ascx.cs" Inherits="uc_banner_about" %>
<asp:ListView ID="lstBannerGioiThieu" runat="server"
    DataSourceID="odsBannerGioiThieu" EnableModelValidation="True">
    <ItemTemplate>
        <img alt='<%# Eval("FileName") %>' src='<%# "~/res/advertisement/" + Eval("FileName") %>'
            visible='<%# string.IsNullOrEmpty(Eval("FileName").ToString()) ? false : true %>' runat="server" />
    </ItemTemplate>
    <LayoutTemplate>
        <span runat="server" id="itemPlaceholder" />
    </LayoutTemplate>
</asp:ListView>
<asp:ObjectDataSource ID="odsBannerGioiThieu" runat="server"
    SelectMethod="AdsBannerSelectAll"
    TypeName="TLLib.AdsBanner">
    <SelectParameters>
        <asp:Parameter Name="StartRowIndex" Type="String" />
        <asp:Parameter Name="EndRowIndex" Type="String" />
        <asp:Parameter DefaultValue="10" Name="AdsCategoryID" Type="String" />
        <asp:Parameter Name="CompanyName" Type="String" />
        <asp:Parameter Name="Website" Type="String" />
        <asp:Parameter Name="FromDate" Type="String" />
        <asp:Parameter Name="ToDate" Type="String" />
        <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
        <asp:Parameter Name="Priority" Type="String" />
        <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>
