﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ad/template/adminEn.master" AutoEventWireup="true"
    CodeFile="datlichkham2.aspx.cs" Inherits="ad_single_province" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <script type="text/javascript">
        var tableView = null;
        function RowDblClick(sender, eventArgs) {
            sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
        }

        function pageLoad(sender, args) {
            tableView = $find("<%= RadGrid1.ClientID %>").get_masterTableView();
        }

        function RadComboBox1_SelectedIndexChanged(sender, args) {
            tableView.set_pageSize(sender.get_value());
        }

        function changePage(argument) {
            tableView.page(argument);
        }

        function RadNumericTextBox1_ValueChanged(sender, args) {
            tableView.page(sender.get_value());
        }

        //On insert and update buttons click temporarily disables ajax to perform upload actions
        function conditionalPostback(sender, eventArgs) {
            if (eventArgs.get_eventTarget().indexOf("ExportToExcelButton") >= 0 || eventArgs.get_eventTarget().indexOf("ExportToWordButton") >= 0 || eventArgs.get_eventTarget().indexOf("ExportToPdfButton") >= 0)
                eventArgs.set_enableAjax(false);
        }
        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="Server">
    <h3 class="mainTitle">
        Đặt Lịch Khám
    </h3>
    <%--<div style="position: absolute; right: 10px; top: 15px">
        <a onclick="history.go(-1)" style="cursor: pointer">&laquo; Quay lại Quốc Gia </a>
    </div>--%>
    <asp:RadAjaxPanel ID="RadAjaxPanel1" runat="server" ClientEvents-OnRequestStart="conditionalPostback">
        <asp:Panel ID="pnlSearch" DefaultButton="btnSearch" runat="server">
            <h4 class="searchTitle">
                Tìm kiếm
            </h4>
            <table class="search">
                <tr>
                    <td class="left">
                        Họ Tên
                    </td>
                    <td>
                        <asp:RadTextBox ID="txtSearchHoTen" runat="server" Width="500px" EmptyMessage="Họ tên ...">
                        </asp:RadTextBox>
                    </td>
                </tr>
            </table>
            <div align="right" style="padding: 5px 0 5px 0; border-bottom: 1px solid #ccc; margin-bottom: 10px">
                <asp:RadButton ID="btnSearch" runat="server" Text="Tìm kiếm">
                    <Icon PrimaryIconUrl="~/ad/assets/images/find.png" />
                </asp:RadButton>
            </div>
        </asp:Panel>
        <asp:Label ID="lblError" ForeColor="Red" runat="server"></asp:Label>
        <asp:RadGrid ID="RadGrid1" AllowMultiRowSelection="True" runat="server" Culture="vi-VN" 
            DataSourceID="ObjectDataSource1" GridLines="Horizontal" AutoGenerateColumns="False"
            ShowStatusBar="True" OnItemCommand="RadGrid1_ItemCommand" CssClass="grid"
            AllowAutomaticUpdates="True" OnItemCreated="RadGrid1_ItemCreated" AllowAutomaticInserts="True"
            AllowPaging="True" AllowSorting="True" CellSpacing="0">
            <ClientSettings EnableRowHoverStyle="true">
                <Selecting AllowRowSelect="True" UseClientSelectColumnOnly="True" />
                <ClientEvents OnRowDblClick="RowDblClick" />
                <Resizing AllowColumnResize="true" ClipCellContentOnResize="False" />
            </ClientSettings>
            <ExportSettings IgnorePaging="true" OpenInNewWindow="true" ExportOnlyData="true"
                Excel-Format="ExcelML" Pdf-AllowCopy="true">
            </ExportSettings>
            <MasterTableView CommandItemDisplay="TopAndBottom" DataSourceID="ObjectDataSource1"
                InsertItemPageIndexAction="ShowItemOnCurrentPage" AllowMultiColumnSorting="True"
                DataKeyNames="DatLichKhamID">
                <PagerTemplate>
                    <asp:Panel ID="PagerPanel" Style="padding: 6px; line-height: 24px" runat="server">
                        <div style="float: left">
                            <span style="margin-right: 3px;" class="vam">Kích thước trang: </span>
                            <asp:RadComboBox ID="RadComboBox1" DataSource="<%# new object[]{ 10 , 20, 50, 100, 200} %>"
                                Style="margin-right: 20px;" Width="40px" SelectedValue='<%# DataBinder.Eval(Container, "Paging.PageSize") %>'
                                runat="server" OnClientSelectedIndexChanged="RadComboBox1_SelectedIndexChanged">
                            </asp:RadComboBox>
                        </div>
                        <div style="margin: 0px; float: right;">
                            <%--Hiển thị trang
              <%# (int)DataBinder.Eval(Container, "Paging.CurrentPageIndex") + 1 %>
              trong
              <%# DataBinder.Eval(Container, "Paging.PageCount")%>
              ,--%>
                            <%# (int)DataBinder.Eval(Container, "Paging.FirstIndexInPage") + 1 %>
                            -
                            <%# (int)DataBinder.Eval(Container, "Paging.LastIndexInPage") + 1 %>
                            trong
                            <%# DataBinder.Eval(Container, "Paging.DataSourceCount")%>
                            kết quả
                        </div>
                        <div style="width: 260px; margin: 0px; padding: 0px; float: left; margin-right: 10px;
                            white-space: nowrap;">
                            <asp:Button ID="Button1" runat="server" OnClientClick="changePage('first'); return false;"
                                CommandName="Page" CommandArgument="First" Text=" " CssClass="PagerButton FirstPage" />
                            <asp:Button ID="Button2" runat="server" OnClientClick="changePage('prev'); return false;"
                                CommandName="Page" CommandArgument="Prev" Text=" " CssClass="PagerButton PrevPage" />
                            <span style="vertical-align: middle;">Trang:</span>
                            <asp:RadNumericTextBox ID="RadNumericTextBox1" Width="25px" Value='<%# (int)DataBinder.Eval(Container, "Paging.CurrentPageIndex") + 1 %>'
                                runat="server">
                                <ClientEvents OnValueChanged="RadNumericTextBox1_ValueChanged" />
                                <NumberFormat DecimalDigits="0" />
                            </asp:RadNumericTextBox>
                            <span style="vertical-align: middle;">trong
                                <%# DataBinder.Eval(Container, "Paging.PageCount")%>
                            </span>
                            <asp:Button ID="Button3" runat="server" OnClientClick="changePage('next'); return false;"
                                CommandName="Page" CommandArgument="Next" Text=" " CssClass="PagerButton NextPage" />
                            <asp:Button ID="Button4" runat="server" OnClientClick="changePage('last'); return false;"
                                CommandName="Page" CommandArgument="Last" Text=" " CssClass="PagerButton LastPage" />
                        </div>
                        <asp:Panel runat="server" ID="NumericPagerPlaceHolder" />
                    </asp:Panel>
                </PagerTemplate>
                <PagerStyle Mode="NumericPages" PageButtonCount="10" AlwaysVisible="true" />
                <CommandItemTemplate>
                    <div class="command">
                        <div style="float: right">
                            <asp:Button ID="ExportToExcelButton" runat="server" CssClass="rgExpXLS" CommandName="ExportToExcel"
                                AlternateText="Excel" ToolTip="Xuất ra Excel" />
                            <asp:Button ID="ExportToPdfButton" runat="server" CssClass="rgExpPDF" CommandName="ExportToPdf"
                                AlternateText="PDF" ToolTip="Xuất ra PDF" />
                            <asp:Button ID="ExportToWordButton" runat="server" CssClass="rgExpDOC" CommandName="ExportToWord"
                                AlternateText="Word" ToolTip="Xuất ra Word" />
                        </div>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="InitInsert" Visible='<%# !RadGrid1.MasterTableView.IsItemInserted %>'
                            CssClass="item">
              <img class="vam" alt="" src="../assets/images/add.png" /> Thêm mới
                        </asp:LinkButton>|
                        <%--<asp:LinkButton ID="LinkButton3" runat="server" CommandName="PerformInsert" Visible='<%# RadGrid1.MasterTableView.IsItemInserted %>'><img class="vam" alt="" src="../assets/images/accept.png" /> Thêm</asp:LinkButton>&nbsp;&nbsp;
            <asp:LinkButton ID="btnCancel" runat="server" CommandName="CancelAll" Visible='<%# RadGrid1.EditIndexes.Count > 0 || RadGrid1.MasterTableView.IsItemInserted %>'><img class="vam" alt="" src="../assets/images/delete-icon.png" /> Hủy</asp:LinkButton>&nbsp;&nbsp;--%>
                        <asp:LinkButton ID="btnEditSelected" runat="server" CommandName="EditSelected" Visible='<%# RadGrid1.EditIndexes.Count == 0 %>'
                            CssClass="item">
              <img width="12px" class="vam" alt="" src="../assets/images/tools.png" /> Sửa
                        </asp:LinkButton>|
                        <%--<asp:LinkButton ID="btnUpdateEdited" runat="server" CommandName="UpdateEdited" Visible='<%# RadGrid1.EditIndexes.Count > 0 %>'><img class="vam" alt="" src="../assets/images/accept.png" /> Cập nhật</asp:LinkButton>&nbsp;&nbsp;--%>
                        <asp:LinkButton ID="LinkButton1" OnClientClick="javascript:return confirm('Xóa tất cả dòng đã chọn?')"
                            runat="server" CommandName="DeleteSelected" CssClass="item">
              <img class="vam" alt="" title="Xóa tất cả dòng được chọn" src="../assets/images/delete-icon.png" /> Xóa
                        </asp:LinkButton>|
                        <asp:LinkButton ID="LinkButton6" runat="server" CommandName="QuickUpdate" Visible='<%# RadGrid1.EditIndexes.Count == 0 %>'
                            CssClass="item">
              <img class="vam" alt="" src="../assets/images/accept.png" /> Sửa nhanh
                        </asp:LinkButton>|
                        <asp:LinkButton ID="LinkButton4" runat="server" CommandName="RebindGrid" CssClass="item">
              <img class="vam" alt="" src="../assets/images/reload.png" /> Làm mới
                        </asp:LinkButton>
                    </div>
                    <div class="clear">
                    </div>
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                </CommandItemTemplate>
                <Columns>
                    <asp:GridClientSelectColumn FooterText="CheckBoxSelect footer" HeaderStyle-Width="1%"
                        UniqueName="CheckboxSelectColumn" />
                    <asp:GridTemplateColumn HeaderStyle-Width="1%" HeaderText="STT">
                        <ItemTemplate>
                            <%# Container.DataSetIndex + 1 %>
                            <asp:HiddenField ID="hdnDatLichKhamID" runat="server" Value='<%# Eval("DatLichKhamID") %>' />
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridBoundColumn HeaderText="ID" DataField="DatLichKhamID" SortExpression="DatLichKhamID">
                    </asp:GridBoundColumn>
                    <asp:GridTemplateColumn HeaderText="Họ Tên" DataField="HoTen" SortExpression="HoTen">
                        <ItemTemplate>
                            <asp:Label ID="lblHoTen" runat="server" Text='<%# Eval("HoTen")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>

                    <asp:GridTemplateColumn HeaderText="Thứ tự" DataField="Priority" SortExpression="Priority">
                        <ItemTemplate>
                            <asp:RadNumericTextBox ID="txtPriority" runat="server" Width="40px" Text='<%# Bind("Priority") %>'
                                EmptyMessage="Thứ tự..." Type="Number">
                                <NumberFormat AllowRounding="false" DecimalDigits="0" GroupSeparator="." />
                            </asp:RadNumericTextBox>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn HeaderText="Hiển thị" DataField="IsAvailable" SortExpression="IsAvailable">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkIsAvailable" runat="server" Checked='<%# Eval("IsAvailable") == DBNull.Value ? false : Convert.ToBoolean(Eval("IsAvailable"))%>'
                                CssClass="checkbox" />
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                </Columns>
                <EditFormSettings EditFormType="Template">
                    <FormTemplate>
                        <asp:Panel ID="Panel1" runat="server" DefaultButton="lnkUpdate">
                            <h3 class="searchTitle">
                                Thông Tin Đặt Lịch Khám
                            </h3>
                            <table class="search">
                                <tr>
                                    <td class="left" valign="top">Đặt lịch cho
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="radioDatLich" runat="server">
                                            <asp:ListItem Value="1" Selected>Bản thân</asp:ListItem>
                                            <asp:ListItem Value="2">Người thân</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" valign="top">Họ tên
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtHoTen" runat="server" Text='<%# Bind("HoTen") %>'
                                            Width="500px"></asp:TextBox>
                                        <asp:HiddenField ID="hdnDatLichKhamID" runat="server" Value='<%# Eval("DatLichKhamID") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left">Ngày sinh
                                    </td>
                                    <td>
                                        <asp:RadDatePicker ShowPopupOnFocus="True" ID="dpNgaySinh" runat="server" Culture="vi-VN"
                                            Calendar-CultureInfo="vi-VN" Width="110px">
                                            <Calendar ID="Calendar1" runat="server">
                                                <SpecialDays>
                                                    <asp:RadCalendarDay Repeatable="Today">
                                                        <ItemStyle CssClass="rcToday" />
                                                    </asp:RadCalendarDay>
                                                </SpecialDays>
                                            </Calendar>
                                            <DateInput ID="DateInput2" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy"
                                                runat="server">
                                            </DateInput>
                                            <DatePopupButton HoverImageUrl="" ImageUrl="" />
                                        </asp:RadDatePicker>
                                        <asp:HiddenField ID="hdnNgaySinh" runat="server" Value='<%# Eval("NgaySinh") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" valign="top">Giới tính
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="radioGioiTinh" runat="server">
                                            <asp:ListItem Value="1" Selected>Nam</asp:ListItem>
                                            <asp:ListItem Value="2">Nữ</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" valign="top">Điện thoại
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDienThoai" runat="server" Text='<%# Bind("DienThoai") %>'
                                            Width="500px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" valign="top">Email
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>'
                                            Width="500px"></asp:TextBox>
                                    </td>
                                </tr>
                                
                                        <tr>
                                            <td class="left" valign="top">Chuyên khoa
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="dropChuyenKhoa" runat="server" DataSourceID="odsChuyenKhoa" DataValueField="ProjectCategoryID" DataTextField="ProjectCategoryName" AutoPostBack="true">
                                                </asp:DropDownList>
                                                <asp:ObjectDataSource ID="odsChuyenKhoa" runat="server" SelectMethod="ProjectCategorySelectAll" TypeName="TLLib.ProjectCategory">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="17" Name="parentID" Type="Int32" />
                                                        <asp:Parameter DefaultValue="1" Name="increaseLevelCount" Type="Int32" />
                                                        <asp:Parameter Name="IsShowOnMenu" Type="String" />
                                                        <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="left" valign="top">Bác sĩ
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="dropBacSi" runat="server" DataSourceID="odsBacSi" DataValueField="ProjectID" DataTextField="ProjectTitle" AutoPostBack="true">
                                                </asp:DropDownList>
                                                <asp:ObjectDataSource ID="odsBacSi" runat="server" SelectMethod="ProjectSelectAll" TypeName="TLLib.Project">
                                                    <SelectParameters>
                                                        <asp:Parameter Name="StartRowIndex" Type="String" />
                                                        <asp:Parameter Name="EndRowIndex" Type="String" />
                                                        <asp:Parameter Name="Keyword" Type="String" />
                                                        <asp:Parameter Name="ProjectTitle" Type="String" />
                                                        <asp:Parameter Name="Description" Type="String" />
                                                        <asp:ControlParameter ControlID="dropChuyenKhoa" Name="ProjectCategoryID" PropertyName="SelectedValue" Type="String" />
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
                                            </td>
                                        </tr>
                                    
                                <tr>
                                    <td class="left" valign="top">Mô tả
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtMoTa" runat="server" Text='<%# Bind("MoTa") %>'
                                            Width="500px" TextMode="MultiLine" Height="200px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left">Ngày khám
                                    </td>
                                    <td>
                                        <asp:RadDatePicker ShowPopupOnFocus="True" ID="dpNgayKham" runat="server" Culture="vi-VN"
                                            Calendar-CultureInfo="vi-VN" Width="110px">
                                            <Calendar ID="Calendar3" runat="server">
                                                <SpecialDays>
                                                    <asp:RadCalendarDay Repeatable="Today">
                                                        <ItemStyle CssClass="rcToday" />
                                                    </asp:RadCalendarDay>
                                                </SpecialDays>
                                            </Calendar>
                                            <DateInput ID="DateInput1" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy"
                                                runat="server">
                                            </DateInput>
                                            <DatePopupButton HoverImageUrl="" ImageUrl="" />
                                        </asp:RadDatePicker>
                                        <asp:RadTimePicker ID="dpGioKham" runat="server" Width="90px" ShowPopupOnFocus="true"
                                            TimeView-StartTime="07:00:00" TimeView-Interval="00:30:00" TimeView-EndTime="18:00:01">
                                        </asp:RadTimePicker>
                                        <asp:HiddenField ID="hdnNgayKham" runat="server" Value='<%# Eval("NgayKham") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left">
                                        Thứ tự
                                    </td>
                                    <td>
                                        <asp:RadNumericTextBox ID="txtPriority" runat="server" Width="500px" Text='<%# Bind("Priority") %>'
                                            EmptyMessage="Thứ tự..." Type="Number">
                                            <NumberFormat AllowRounding="false" DecimalDigits="0" GroupSeparator="." />
                                        </asp:RadNumericTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" colspan="2">
                                        <asp:CheckBox ID="chkIsAvailable" runat="server" CssClass="checkbox" Text=" Hiển thị"
                                            Checked='<%# (Container is GridEditFormInsertItem) ? true : (Eval("IsAvailable") == DBNull.Value ? false : Convert.ToBoolean(Eval("IsAvailable"))) %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="padding-left: 10px">
                                        <hr />
                                        <asp:LinkButton ID="lnkUpdate" runat="server" CausesValidation="True" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'>
                      <img alt="" title="Cập nhật" src="../assets/images/ok.png" class="vam" /> <%# (Container is GridEditFormInsertItem) ? "Thêm" : "Cập nhật" %>
                                        </asp:LinkButton>
                                        &nbsp; &nbsp;
                                        <asp:LinkButton ID="LinkButton5" runat="server" CausesValidation="False" CommandName="Cancel">
                      <img alt="" title="Hủy" src="../assets/images/cancel.png" class="vam" /> &nbsp;&nbsp;Hủy
                                        </asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </FormTemplate>
                </EditFormSettings>
            </MasterTableView>
            <HeaderStyle Font-Bold="True" />
            <HeaderContextMenu EnableImageSprites="True" CssClass="GridContextMenu GridContextMenu_Default">
            </HeaderContextMenu>
        </asp:RadGrid>
    </asp:RadAjaxPanel>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="DatLichKhamDelete"
        SelectMethod="DatLichKhamSelectAll" TypeName="TLLib.DatLichKham" UpdateMethod="DatLichKhamUpdate"
        InsertMethod="DatLichKhamInsert">
        <DeleteParameters>
            <asp:Parameter Name="DatLichKhamID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DatLichCho" Type="String" />
            <asp:Parameter Name="HoTen" Type="String" />
            <asp:Parameter Name="NgaySinh" Type="String" />
            <asp:Parameter Name="GioiTinh" Type="String" />
            <asp:Parameter Name="DienThoai" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="ProjectCategoryID" Type="String" />
            <asp:Parameter Name="ProjectID" Type="String" />
            <asp:Parameter Name="MoTa" Type="String" />
            <asp:Parameter Name="NgayKham" Type="String" />
            <asp:Parameter Name="GioKham" Type="String" />
            <asp:Parameter Name="IsAvailable" Type="String" />
            <asp:Parameter Name="Priority" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtSearchHoTen" Name="HoTen"
                PropertyName="Text" Type="String" />
            <asp:Parameter Name="DienThoai" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="ProjectCategoryID" Type="String" />
            <asp:Parameter Name="ProjectID" Type="String" />
            <asp:Parameter Name="NgayKham" Type="String" />
            <asp:Parameter Name="GioKham" Type="String" />
            <asp:Parameter Name="IsAvailable" Type="String" />
            <asp:Parameter Name="Priority" Type="String" />
            <asp:Parameter Name="SortByPriority" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="DatLichKhamID" Type="String" />
            <asp:Parameter Name="DatLichCho" Type="String" />
            <asp:Parameter Name="HoTen" Type="String" />
            <asp:Parameter Name="NgaySinh" Type="String" />
            <asp:Parameter Name="GioiTinh" Type="String" />
            <asp:Parameter Name="DienThoai" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="ProjectCategoryID" Type="String" />
            <asp:Parameter Name="ProjectID" Type="String" />
            <asp:Parameter Name="MoTa" Type="String" />
            <asp:Parameter Name="NgayKham" Type="String" />
            <asp:Parameter Name="GioKham" Type="String" />
            <asp:Parameter Name="IsAvailable" Type="String" />
            <asp:Parameter Name="Priority" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>