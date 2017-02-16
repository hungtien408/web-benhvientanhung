<%@ Page Title="" Language="C#" MasterPageFile="~/en/site-sub.master" AutoEventWireup="true" CodeFile="tim-kiem.aspx.cs" Inherits="tim_kiem" %>
<%@ Register Src="~/en/uc/cap-cuu.ascx" TagPrefix="uc1" TagName="capcuu" %>
<%@ Register Src="~/en/uc/cau-hoi-truc-tuyen.ascx" TagPrefix="uc1" TagName="cauhoitructuyen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="page_img" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="page_aside" Runat="Server">
    <uc1:capcuu runat="server" ID="capcuu" />
    <uc1:cauhoitructuyen runat="server" ID="cauhoitructuyen" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="page_main" Runat="Server">
    <div class="head lineh">
        <h2 class="title-2">
            <asp:Label ID="lbName" runat="server" Text="Tìm kiếm"></asp:Label></h2>
    </div>
    <asp:HiddenField ID="hdnKeyword" runat="server" />
 <script>
     (function () {
         var me = getUrlVars()["kw"];
         var strd = urldecode(me);
         window.__gcse = {
             callback: searchCallback
         };
         function searchCallback() {
             $('#gsc-i-id1').focus();
             $('#gsc-i-id1').val(strd);
             $(".gsc-search-button").trigger('click');
         }
         
         var cx = '011728731253211755245:m4wnj_ljldi';
         var gcse = document.createElement('script');
         gcse.type = 'text/javascript';
         gcse.async = true;
         gcse.src = 'https://cse.google.com/cse.js?cx=' + cx;
         var s = document.getElementsByTagName('script')[0];
         s.parentNode.insertBefore(gcse, s);

     })();

     function getUrlVars() {
         var vars = [], hash;
         var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
         for (var i = 0; i < hashes.length; i++) {
             hash = hashes[i].split('=');
             vars.push(hash[0]);
             vars[hash[0]] = hash[1];
         }
         return vars;
     }
     function urldecode(str) {
         return decodeURIComponent((str + '').replace(/\+/g, '%20'));
     }
</script>
</asp:Content>

