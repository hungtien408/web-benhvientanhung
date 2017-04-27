<%@ Page Title="" Language="C#" MasterPageFile="~/en/site-sub.master" AutoEventWireup="true" CodeFile="tin-tuc.aspx.cs" Inherits="tintuc" %>

<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="asp" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="~/en/uc/cam-nhan-benh-nhan.ascx" TagPrefix="uc1" TagName="camnhanbenhnhan" %>
<%@ Register Src="~/en/uc/cap-cuu.ascx" TagPrefix="uc1" TagName="capcuu" %>
<%@ Register Src="~/en/uc/banner-news.ascx" TagPrefix="uc4" TagName="bannernews" %>
<%@ Register Src="~/en/uc/list-category-service.ascx" TagPrefix="uc5" TagName="listcategoryservice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_img" runat="Server">
    <uc4:bannernews ID="bannernews1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="page_aside" runat="Server">
    <uc5:listcategoryservice runat="server" ID="listcategoryservice1" />
    <uc1:camnhanbenhnhan runat="server" ID="camnhanbenhnhan" />
    <uc1:capcuu runat="server" ID="capcuu" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="page_main" runat="Server">
    <h1 class="content-tit">news</h1>
    <h2 style="display: none;"><a href='<%= HttpContext.Current.Request.Url.Host + "" + HttpContext.Current.Request.Url.AbsolutePath %>' title='News'>News</a></h2>
    <div class="skin1" role="tabpanel">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <asp:ListView ID="lstDanhMucTinTuc" runat="server" DataSourceID="odsDanhMucTinTuc"
                EnableModelValidation="True">
                <ItemTemplate>
                    <li role="presentation">
                        <a href='<%# "#tab" + Eval("ProjectCategoryID") %>' aria-controls="tab" role="tab" data-toggle="tab"><%# Eval("ProjectCategoryNameEn") %></a>
                    </li>
                </ItemTemplate>
                <LayoutTemplate>
                    <span runat="server" id="itemPlaceholder" />
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsDanhMucTinTuc" runat="server" SelectMethod="ProjectCategorySelectAll" TypeName="TLLib.ProjectCategory">
                <SelectParameters>
                    <asp:Parameter DefaultValue="2" Name="parentID" Type="Int32" />
                    <asp:Parameter DefaultValue="1" Name="increaseLevelCount" Type="Int32" />
                    <asp:Parameter Name="IsShowOnMenu" Type="String" />
                    <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <asp:ListView ID="lstDanhMucTinTuc2" runat="server" DataSourceID="odsDanhMucTinTuc"
                EnableModelValidation="True">
                <ItemTemplate>
                    <div role="tabpanel" class="tab-pane" id='<%# "tab" + Eval("ProjectCategoryID") %>'>
                        <asp:HiddenField ID="hdnProjectCategoryID" Value='<%# Eval("ProjectCategoryID") %>' runat="server" />
                        <div class="news-carousel">
                            <asp:ListView ID="lstTinTuc" runat="server" DataSourceID="odsTinTuc"
                                EnableModelValidation="True">
                                <ItemTemplate>
                                    <div class="item">
                                        <img alt='<%# Eval("ImageName") %>' src='<%# "~/res/project/" + Eval("ImageName") %>'
                                            visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>'
                                            runat="server" />
                                        <div class="content">
                                            <a href='<%# "/en/tin-tuc/" + progressTitle(Eval("ProjectTitleEn")) + "-" + Eval("ProjectID") + ".aspx" %>'><%# Eval("ProjectTitleEn") %></a>
                                            <p><%# TLLib.Common.SplitSummary(Eval("DescriptionEn").ToString(), 80) %></p>
                                            <div class="read-more"><a href='<%# "/en/tin-tuc/" + progressTitle(Eval("ProjectTitleEn")) + "-" + Eval("ProjectID") + ".aspx" %>'>See more</a></div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <span runat="server" id="itemPlaceholder" />
                                </LayoutTemplate>
                            </asp:ListView>
                            <asp:ObjectDataSource ID="odsTinTuc" runat="server" SelectMethod="ProjectSelectAll" TypeName="TLLib.Project">
                                <SelectParameters>
                                    <asp:Parameter Name="StartRowIndex" Type="String" />
                                    <asp:Parameter Name="EndRowIndex" Type="String" />
                                    <asp:Parameter Name="Keyword" Type="String" />
                                    <asp:Parameter Name="ProjectTitle" Type="String" />
                                    <asp:Parameter Name="Description" Type="String" />
                                    <asp:ControlParameter ControlID="hdnProjectCategoryID" Name="ProjectCategoryID" PropertyName="Value" Type="String" />
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
                        <div class="pager">
                            <asp:DataPager ID="DataPager2" runat="server" PageSize="10" PagedControlID="lstTinTuc">
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
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <span runat="server" id="itemPlaceholder" />
                </LayoutTemplate>
            </asp:ListView>
        </div>
    </div>
    <asp:Panel ID="Panel1" runat="server" Visible="false">
        <h1 class="content-tit">hỏi bác sĩ</h1>
        <div class="list-question">
            <div class="top-ques">
                <p>Nếu bạn có thắc mắc vui lòng gửi câu hỏi cho chúng tôi</p>
                <a href="#">Gửi câu hỏi</a>
            </div>
            <asp:ListView ID="lstHoiBacSi" runat="server" DataSourceID="odsHoiBacSi"
                EnableModelValidation="True">
                <ItemTemplate>
                    <div class="item">
                        <div class="header">
                            <ul>
                                <li>Người gửi: <%# Eval("Tag") %></li>
                                <li>Email: <%# Eval("TagEn") %></li>
                            </ul>
                        </div>
                        <div class="content">
                            <h3><%# Eval("ProjectTitleEn") %></h3>
                            <p><%# Eval("DescriptionEn") %></p>
                            <div class="traloi">
                                <p>Xem trả lời</p>
                            </div>
                            <div class="clr"></div>
                            <div class="cautraloi">
                                <h3>Câu trả lời của bác sĩ:</h3>
                                <p><%# Eval("ContentEn") %></p>
                            </div>
                        </div>
                    </div>
                    <div class="clr"></div>
                </ItemTemplate>
                <LayoutTemplate>
                    <span runat="server" id="itemPlaceholder" />
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsHoiBacSi" runat="server" SelectMethod="ProjectSelectAll" TypeName="TLLib.Project">
                <SelectParameters>
                    <asp:Parameter Name="StartRowIndex" Type="String" />
                    <asp:Parameter Name="EndRowIndex" Type="String" />
                    <asp:Parameter Name="Keyword" Type="String" />
                    <asp:Parameter Name="ProjectTitle" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter DefaultValue="53" Name="ProjectCategoryID" Type="String" />
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
        <div class="pager">
            <asp:DataPager ID="DataPager1" runat="server" PageSize="5" PagedControlID="lstHoiBacSi">
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
        <div class="datcauhoi popup scroll-popup">
            <div class="popup-content">
                <div class="form-popup">
                    <h3>Đặt câu hỏi</h3>
                    <div class="wrap-dch">
                        <div class="form-group">
                            <asp:TextBox ID="txtFullNameQuestion" runat="server"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="txtFullNameQuestion_WatermarkExtender" runat="server" Enabled="True"
                                WatermarkText="Họ tên (*)" TargetControlID="txtFullNameQuestion">
                            </asp:TextBoxWatermarkExtender>
                            <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator5" runat="server"
                                Display="Dynamic" ValidationGroup="DatCauHoi" ControlToValidate="txtFullNameQuestion"
                                ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtEmailQuestion" runat="server"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="txtEmailQuestion_WatermarkExtender" runat="server" Enabled="True"
                                WatermarkText="Email(*)" TargetControlID="txtEmailQuestion">
                            </asp:TextBoxWatermarkExtender>
                            <asp:RegularExpressionValidator CssClass="lb-error" ID="RegularExpressionValidator1"
                                runat="server" ValidationGroup="DatCauHoi" ControlToValidate="txtEmailQuestion" ErrorMessage="Email is error!"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"
                                ForeColor="Red"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator7" runat="server"
                                ValidationGroup="DatCauHoi" ControlToValidate="txtEmailQuestion" ErrorMessage="Thông tin bắt buộc!"
                                Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtPhoneQuestion" runat="server" placeholder="Điện thoại"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtQuestion" runat="server" placeholder="Câu hỏi muốn đặt" TextMode="MultiLine"></asp:TextBox>
                        </div>
                        <div class="btn-gui">
                            <asp:Button ID="btnGuiCauHoi" runat="server" Text="Gửi câu hỏi" OnClick="btnGuiCauHoi_Click" ValidationGroup="DatCauHoi" />
                        </div>
                    </div>
                </div>
                <a href="javascript:void(0);" class="close-modal"></a>
            </div>
        </div>
    </asp:Panel>
</asp:Content>

