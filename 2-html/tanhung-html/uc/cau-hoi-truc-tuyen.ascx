<%@ Control Language="C#" AutoEventWireup="true" CodeFile="cau-hoi-truc-tuyen.ascx.cs" Inherits="uc_cau_hoi_truc_tuyen" %>
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
                        <asp:TextBox ID="TextBox1" runat="server" placeholder="Họ tên(*)"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="TextBox2" runat="server" placeholder="Email(*)"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="TextBox3" runat="server" placeholder="Điện thoại"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="TextBox4" runat="server" placeholder="Câu hỏi muốn đặt" TextMode="MultiLine"></asp:TextBox>
                    </div>
                    <div class="btn-gui">
                    <asp:Button ID="Button1" runat="server" Text="Gửi câu hỏi" /></div>
                </div>
            </div>
            <a href="javascript:void(0);" class="close-modal"></a>
        </div>
    </div>