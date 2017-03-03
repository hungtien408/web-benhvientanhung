<%@ Page Title="" Language="C#" MasterPageFile="~/en/site-sub.master" AutoEventWireup="true" CodeFile="lien-he.aspx.cs" Inherits="lien_he" %>

<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="asp" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="~/en/uc/cap-cuu.ascx" TagPrefix="uc1" TagName="capcuu" %>
<%@ Register Src="~/en/uc/cau-hoi-truc-tuyen.ascx" TagPrefix="uc1" TagName="cauhoitructuyen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_img" runat="Server">
    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.78393766454!2d106.69418681518609!3d10.751128462599109!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f0952bc150f%3A0xb0b097cad42d2a08!2zQuG7h25oIHZp4buHbiDEkGEga2hvYSBUw6JuIEjGsG5n!5e0!3m2!1svi!2s!4v1487057674415" width="100%" height="230" frameborder="0" style="border: 0" allowfullscreen></iframe>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="page_aside" runat="Server">
    <uc1:capcuu runat="server" ID="capcuu" />
    <uc1:cauhoitructuyen runat="server" ID="cauhoitructuyen" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="page_main" runat="Server">
    <h1 class="content-tit">Contact Us</h1>
    <h2 style="display:none;"><a href='<%= HttpContext.Current.Request.Url.Host + "" + HttpContext.Current.Request.Url.AbsolutePath %>' title='Contact Us'>Contact Us</a></h2>
    <div class="lien-he-wrap">
        <div class="left">
            <h3>Liên hệ với chúng tôi</h3>
            <asp:ListView ID="lstInfo" runat="server" DataSourceID="odsInfo"
                EnableModelValidation="True">
                <ItemTemplate>
                    <p><span>Địa chỉ:</span> <%# Eval("DescriptionEn") %></p>
                    <p><span>Hotline:</span> <%# Eval("Tag") %> (6 line) - Fax: <%# Eval("MetaTittleEn") %></p>
                    <p><span>Website:</span> <a href="#">www.benhvientanhung.com</a> - <a href="#">www.benhvientanhung.vn</a></p>
                    <p><span>Email:</span> <a href='<%# "mailTo:" + Eval("MetaDescription") %>'><%# Eval("MetaDescription") %></a></p>
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
            <h3>Giờ làm việc</h3>
            <p>Các ngày trong tuần từ Thứ 2 đến Chủ nhật</p>
            <p><span>Thời gian:</span> 8:00 đến 17:00</p>
            <p><span>Trực cấp cứu:</span> 24/7</p>
        </div>
        <div class="right">
            <p>Hãy liên hệ chúng tôi theo địa chỉ trên hoặc gửi tin nhắn cho chúng tôi theo mẫu form sau đây, chúng tôi sẽ trả lời sớm nhất ngay khi nhận được email của quý khách.</p>
            <div class="wrap-send">
                <h4 class="text-uppercase">Chúng tôi có thể giúp gì cho bạn ?</h4>
                <div class="row">
                    <div class="col-xs-6">
                        <div class="contact-w">
                            <div class="contact-input">
                                <asp:TextBox ID="txtFullName" CssClass="contact-textbox" runat="server"></asp:TextBox>
                                <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" Enabled="True"
                                    WatermarkText="Họ &amp; Tên" TargetControlID="txtFullName">
                                </asp:TextBoxWatermarkExtender>
                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator2" runat="server"
                                    Display="Dynamic" ValidationGroup="SendEmail" ControlToValidate="txtFullName"
                                    ErrorMessage="Information required!" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <div class="contact-w">
                            <div class="contact-input">
                                <asp:TextBox ID="txtEmail" CssClass="contact-textbox" runat="server"></asp:TextBox>
                                <asp:TextBoxWatermarkExtender ID="txtEmail_WatermarkExtender" runat="server" Enabled="True"
                                    WatermarkText="Email" TargetControlID="txtEmail">
                                </asp:TextBoxWatermarkExtender>
                                <asp:RegularExpressionValidator CssClass="lb-error" ID="RegularExpressionValidator1"
                                    runat="server" ValidationGroup="SendEmail" ControlToValidate="txtEmail" ErrorMessage="Email is error!"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"
                                    ForeColor="Red"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator3" runat="server"
                                    ValidationGroup="SendEmail" ControlToValidate="txtEmail" ErrorMessage="Information required!"
                                    Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="contact-w">
                    <div class="contact-input">
                        <asp:TextBox ID="txtNoiDung" CssClass="contact-area" runat="server" TextMode="MultiLine" placeholder="Lời nhắn"></asp:TextBox>
                        <asp:TextBoxWatermarkExtender ID="txtNoiDung_WatermarkExtender" runat="server" Enabled="True"
                            WatermarkText="Lời nhắn" TargetControlID="txtNoiDung">
                        </asp:TextBoxWatermarkExtender>
                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator4" runat="server"
                            ValidationGroup="SendEmail" Display="Dynamic" ControlToValidate="txtNoiDung"
                            ErrorMessage="Information required!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="contact-w">
                    <div class="contact-input contact-name">
                        <div class="wcodes">
                            <asp:TextBox ID="txtVerifyCode" CssClass="contact-textbox" runat="server"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="txtVerifyCode_WatermarkExtender" runat="server"
                                Enabled="True" WatermarkText="Code" TargetControlID="txtVerifyCode">
                            </asp:TextBoxWatermarkExtender>
                        </div>
                    </div>
                    <div class="contact-input contact-phone">
                        <div class="wcodes">
                            <asp:RadCaptcha ID="RadCaptcha1" ValidatedTextBoxID="txtVerifyCode" ValidationGroup="SendEmail"
                                runat="server" Display="Dynamic"
                                ErrorMessage="Mã xác nhận: không chính xác." CaptchaLinkButtonText="Refesh"
                                CssClass="capcha" EnableRefreshImage="True">
                                <CaptchaImage RenderImageOnly="True" Width="115" Height="31" BackgroundNoise="High" BackgroundColor="White" TextColor="Black" FontFamily="Tohoma" TextLength="5" ImageCssClass="code-img" />
                            </asp:RadCaptcha>
                        </div>
                    </div>
                </div>
                <div class="contact-w">
                    <div class="contact-btn">
                        <asp:Button ID="btnGui" CssClass="button-btn" runat="server" Text="Gửi lời nhắn" OnClick="btnGui_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

