<%@ Control Language="C#" AutoEventWireup="true" CodeFile="cap-cuu.ascx.cs" Inherits="uc_cap_cuu" %>
<section class="cap-cuu">
    <h3>CẤP CỨU 24/7</h3>
    <asp:ListView ID="lstHotlineCapCuu" runat="server" DataSourceID="odsInfo"
        EnableModelValidation="True">
        <ItemTemplate>
            <div class="hotline-bg">
                <span><%# Eval("TagEn") %></span>
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <span runat="server" id="itemPlaceholder" />
        </LayoutTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsInfo" runat="server" SelectMethod="ProjectSelectAll" TypeName="TLLib.Project">
        <SelectParameters>
            <asp:Parameter Name="StartRowIndex" Type="String" />
            <asp:Parameter Name="EndRowIndex" Type="String" />
            <asp:Parameter Name="Keyword" Type="String" />
            <asp:Parameter Name="ProjectTitle" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter DefaultValue="35" Name="ProjectCategoryID" Type="String" />
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
</section>
