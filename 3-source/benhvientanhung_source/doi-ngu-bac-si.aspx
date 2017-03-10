<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true" CodeFile="doi-ngu-bac-si.aspx.cs" Inherits="doi_ngu_bs" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="asp" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
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
    <h1 class="content-tit">đội ngũ bác sĩ</h1>
    <h2 style="display:none;"><a href='<%= HttpContext.Current.Request.Url.Host + "" + HttpContext.Current.Request.Url.AbsolutePath %>' title='Đội ngũ bác sĩ'>Đội ngũ bác sĩ</a></h2>
    <div class="doingu-search">
        <p>Nhập tên bác sĩ hoặc chọn chuyên khoa để tìm kiếm</p>
        <asp:TextBox ID="txtSearchKhoa" runat="server"></asp:TextBox>
        <asp:TextBoxWatermarkExtender ID="txtSearchKhoa_WatermarkExtender" runat="server" Enabled="True"
            WatermarkText="Tìm theo tên bác sĩ" TargetControlID="txtSearchKhoa">
        </asp:TextBoxWatermarkExtender>
        <%--<select>
            <option value="value" disabled="disabled" selected="selected">Chọn khoa</option>
            <option value="value">Khoa 1</option>
            <option value="value">Khoa 2</option>
            <option value="value">Khoa 3</option>
            <option value="value">Khoa 4</option>
        </select>--%>
        <asp:DropDownList ID="dropListKhoa" runat="server" DataSourceID="odsPhongBan" DataTextField="ProjectCategoryName" DataValueField="ProjectCategoryID" OnDataBound="DropDownList_DataBound"></asp:DropDownList>
        <asp:ObjectDataSource ID="odsPhongBan" runat="server" SelectMethod="ProjectCategorySelectAll" TypeName="TLLib.ProjectCategory">
            <SelectParameters>
                <asp:Parameter DefaultValue="17" Name="parentID" Type="Int32" />
                <asp:Parameter DefaultValue="1" Name="increaseLevelCount" Type="Int32" />
                <asp:Parameter Name="IsShowOnMenu" Type="String" />
                <asp:Parameter Name="IsShowOnHomePage" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:Button ID="btnSearchKhoa" runat="server" Text="Tìm kiếm" OnClick="btnSearchKhoa_Click" />
    </div>
    <div class="clr"></div>
    <div class="list-doingu">
        <asp:ListView ID="lstDoiNguBacSi" runat="server" DataSourceID="odsDoiNguBacSi"
            EnableModelValidation="True">
            <ItemTemplate>
                <div class="item">
                    <div class="relative-item">
                        <img alt='<%# Eval("ImageName") %>' src='<%# "~/res/project/" + Eval("ImageName") %>'
                            visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                            runat="server" />
                        <div class="wrap-item">
                            <div class="content">
                                <a href="javascript:void(0);">
                                    <p><%# Eval("ProjectTitle") %></p>
                                    <span><%# Eval("ProjectCategoryName") %></span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="popup scroll-popup">
                        <div class="popup-content">
                            <div class="modaltitle"><%# Eval("ProjectCategoryName") %></div>
                            <div class="modal-main">
                                <div class="info-main">
                                    <div class="info-img">
                                        <img alt='<%# Eval("ImageName") %>' src='<%# "~/res/project/" + Eval("ImageName") %>'
                                            visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                            runat="server" />
                                    </div>
                                    <div class="info-box">
                                        <ul>
                                            <li>
                                                <div class="info-title">Họ Tên:</div>
                                                <%# Eval("ProjectTitle") %></li>
                                            <li>
                                                <div class="info-title">Chức vụ:</div>
                                                <%# Eval("Tag") %></li>
                                            <li>
                                                <div class="info-title">Chuyên ngành:</div>
                                                <%# Eval("MetaTittle") %></li>
                                            <li>
                                                <div class="info-title">Kinh nghiệm:</div>
                                                <%# Eval("MetaDescription") %></li>
                                            <li>
                                                <div class="info-title">Ngôn ngữ giao tiếp:</div>
                                                <%# Eval("Description") %></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="info-content">
                                    <%# Eval("Content") %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <span runat="server" id="itemPlaceholder" />
            </LayoutTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="odsDoiNguBacSi" runat="server" SelectMethod="ProjectSelectAll" TypeName="TLLib.Project">
            <SelectParameters>
                <asp:Parameter Name="StartRowIndex" Type="String" />
                <asp:Parameter Name="EndRowIndex" Type="String" />
                <asp:Parameter Name="Keyword" Type="String" />
                <asp:Parameter Name="ProjectTitle" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter DefaultValue="17" Name="ProjectCategoryID" Type="String" />
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
    <div class="clr"></div>
    <div class="pager">
        <asp:DataPager ID="DataPager1" runat="server" PageSize="9" PagedControlID="lstDoiNguBacSi">
            <Fields>
                <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false"
                    ShowNextPageButton="false" ShowPreviousPageButton="true" ButtonCssClass="prev fa fa-angle-left"
                    RenderDisabledButtonsAsLabels="true" PreviousPageText="" />
                <asp:NumericPagerField ButtonCount="5" NumericButtonCssClass="numer-paging"
                    CurrentPageLabelCssClass="current" />
                <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="false"
                    ButtonCssClass="next fa fa-angle-right" ShowNextPageButton="true" ShowPreviousPageButton="false"
                    RenderDisabledButtonsAsLabels="true" NextPageText="" />
            </Fields>
        </asp:DataPager>
    </div>
</asp:Content>

