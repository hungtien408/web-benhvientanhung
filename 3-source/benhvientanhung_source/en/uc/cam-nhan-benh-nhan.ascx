<%@ Control Language="C#" AutoEventWireup="true" CodeFile="cam-nhan-benh-nhan.ascx.cs" Inherits="uc_cam_nhan_benh_nhan" %>
<section>
    <div class="cam-nhan">
        <h1>cảm nhận bệnh nhân</h1>
        <div class="cam-nhan-carousel owl-carousel">
            <asp:ListView ID="lstCamNhanBenhNhan" runat="server" DataSourceID="odsCamNhanBenhNhan"
                EnableModelValidation="True">
                <ItemTemplate>
                    <div class="item">
                        <h1><%# Eval("ProjectTitleEn") %></h1>
                        <p><%# Eval("ContentEn") %></p>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <span runat="server" id="itemPlaceholder" />
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsCamNhanBenhNhan" runat="server" SelectMethod="ProjectSelectAll" TypeName="TLLib.Project">
                <SelectParameters>
                    <asp:Parameter Name="StartRowIndex" Type="String" />
                    <asp:Parameter Name="EndRowIndex" Type="String" />
                    <asp:Parameter Name="Keyword" Type="String" />
                    <asp:Parameter Name="ProjectTitle" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter DefaultValue="13" Name="ProjectCategoryID" Type="String" />
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
