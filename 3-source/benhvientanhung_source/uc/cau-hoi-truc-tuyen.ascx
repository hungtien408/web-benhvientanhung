<%@ Control Language="C#" AutoEventWireup="true" CodeFile="cau-hoi-truc-tuyen.ascx.cs" Inherits="uc_cau_hoi_truc_tuyen" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="asp" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<section class="cauhoi-tt">
    <a href="#">
        <img src="assets/images/cauhoi.jpg" alt="" />
    </a>
</section>
<div class="datcauhoi popup scroll-popup">
    <div class="popup-content">
        <div class="form-popup">
            <h1>Đặt câu hỏi</h1>
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
