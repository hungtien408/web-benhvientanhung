using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using TLLib;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Data;


public partial class ad_single_partner : System.Web.UI.Page
{
    #region Common Method

    protected void DropDownList_DataBound(object sender, EventArgs e)
    {
        var cbo = (RadComboBox)sender;
        cbo.Items.Insert(0, new RadComboBoxItem(""));
    }

    void DeleteImage(string strDatLichKhamImage)
    {
        if (!string.IsNullOrEmpty(strDatLichKhamImage))
        {
            string strOldImagePath = Server.MapPath("~/res/DatLichKham/" + strDatLichKhamImage);
            if (File.Exists(strOldImagePath))
                File.Delete(strOldImagePath);
        }
    }

    #endregion

    #region Event

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!Page.IsPostBack)
        //{
            //lblTongSoDatHen.Text = ((DataView)ObjectDataSource1.Select()).Count.ToString();
        //}
        if (!IsPostBack)
        {
            if (!HttpContext.Current.User.IsInRole("Đặt Lịch Khám"))
                Response.Redirect("~/ad/bilingual/");
        }
    }
    public void RadGrid1_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {
        if (e.Item is GridCommandItem)
        {
            GridCommandItem commandItem = (e.Item as GridCommandItem);
            PlaceHolder container = (PlaceHolder)commandItem.FindControl("PlaceHolder1");
            Label label = new Label();
            label.Text = "&nbsp;&nbsp;";

            container.Controls.Add(label);

            for (int i = 65; i <= 65 + 25; i++)
            {
                LinkButton linkButton1 = new LinkButton();

                LiteralControl lc = new LiteralControl("&nbsp;&nbsp;");

                linkButton1.Text = "" + (char)i;

                linkButton1.CommandName = "alpha";
                linkButton1.CommandArgument = "" + (char)i;

                container.Controls.Add(linkButton1);
                container.Controls.Add(lc);
            }

            LiteralControl lcLast = new LiteralControl("&nbsp;");
            container.Controls.Add(lcLast);

            LinkButton linkButtonAll = new LinkButton();
            linkButtonAll.Text = "Tất cả";
            linkButtonAll.CommandName = "NoFilter";
            container.Controls.Add(linkButtonAll);
        }
    }
    protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
    {
        if (e.CommandName == "alpha" || e.CommandName == "NoFilter")
        {
            String value = null;
            switch (e.CommandName)
            {
                case ("alpha"):
                    {
                        value = string.Format("{0}%", e.CommandArgument);
                        break;
                    }
                case ("NoFilter"):
                    {
                        value = "%";
                        break;
                    }
            }
            ObjectDataSource1.SelectParameters["HoTen"].DefaultValue = value;
            ObjectDataSource1.DataBind();
            RadGrid1.Rebind();
        }
        else if (e.CommandName == "QuickUpdate")
        {
            string DatLichKhamID, Priority, IsAvailable;
            var oDatLichKham = new DatLichKham();

            foreach (GridDataItem item in RadGrid1.Items)
            {
                DatLichKhamID = item.GetDataKeyValue("DatLichKhamID").ToString();
                Priority = ((RadNumericTextBox)item.FindControl("txtPriority")).Text.Trim();
                IsAvailable = ((CheckBox)item.FindControl("chkIsAvailable")).Checked.ToString();

                oDatLichKham.DatLichKhamQuickUpdate(
                    DatLichKhamID,
                    IsAvailable,
                    Priority
                );
            }
        }
        //else if (e.CommandName == "DeleteSelected")
        //{
        //    var oDatLichKham = new DatLichKham();

        //    foreach (GridDataItem item in RadGrid1.SelectedItems)
        //    {
        //        string strDatLichKhamImage = ((HiddenField)item.FindControl("hdnDatLichKhamImage")).Value;

        //        if (!string.IsNullOrEmpty(strDatLichKhamImage))
        //        {
        //            string strSavePath = Server.MapPath("~/res/DatLichKham/" + strDatLichKhamImage);
        //            if (File.Exists(strSavePath))
        //                File.Delete(strSavePath);
        //        }
        //    }
        //}
        else if (e.CommandName == "PerformInsert" || e.CommandName == "Update")
        {
            var command = e.CommandName;
            var row = command == "PerformInsert" ? (GridEditFormInsertItem)e.Item : (GridEditFormItem)e.Item;

            string strDatLich = ((RadioButtonList)row.FindControl("radioDatLich")).SelectedValue;
            string strHoTen = ((TextBox)row.FindControl("txtHoTen")).Text.Trim();
            var dpNgaySinh = (RadDatePicker)row.FindControl("dpNgaySinh");
            string strNgaySinh = dpNgaySinh.SelectedDate.HasValue ? dpNgaySinh.SelectedDate.Value.ToShortDateString() : "";
            string strGioiTinh = ((RadioButtonList)row.FindControl("radioGioiTinh")).SelectedValue;
            string strDienThoai = ((TextBox)row.FindControl("txtDienThoai")).Text.Trim();
            string strEmail = ((TextBox)row.FindControl("txtEmail")).Text.Trim();
            string strChuyenKhoa = ((DropDownList)row.FindControl("dropChuyenKhoa")).SelectedValue;
            string strBacSi = ((DropDownList)row.FindControl("dropBacSi")).SelectedValue;
            string strMoTa = ((TextBox)row.FindControl("txtMoTa")).Text.Trim();
            
            var dpNgayKham = (RadDatePicker)row.FindControl("dpNgayKham");
            var dpGioKham = (RadTimePicker)row.FindControl("dpGioKham");
            var strNgayKham = dpNgayKham.SelectedDate.HasValue ? dpNgayKham.SelectedDate.Value.ToShortDateString() : "";
            var strGioKham = dpGioKham.SelectedDate.HasValue ? dpGioKham.SelectedDate.Value.ToShortTimeString() : "";
            strNgayKham = string.IsNullOrEmpty(strNgayKham) ? "" : strNgayKham + " " + strGioKham;
            string strIsAvailable = ((CheckBox)row.FindControl("chkIsAvailable")).Checked.ToString();
            string strPriority = ((RadNumericTextBox)row.FindControl("txtPriority")).Text.Trim();

            var oDatLichKham = new DatLichKham();

            if (e.CommandName == "PerformInsert")
            {
                oDatLichKham.DatLichKhamInsert(
                    strDatLich,
                    strHoTen,
                    strNgaySinh,
                    strGioiTinh,
                    strDienThoai,
                    strEmail,
                    strChuyenKhoa,
                    strBacSi,
                    strMoTa,
                    strNgayKham,
                    "",
                    strIsAvailable,
                    strPriority
                    );
                RadGrid1.Rebind();

                //var dsInsertParam = ObjectDataSource1.InsertParameters;
                //dsInsertParam["DatLichCho"].DefaultValue = strDatLich;
                //dsInsertParam["HoTen"].DefaultValue = strHoTen;
                //dsInsertParam["NgaySinh"].DefaultValue = strNgaySinh;
                //dsInsertParam["GioiTinh"].DefaultValue = strGioiTinh;
                //dsInsertParam["DienThoai"].DefaultValue = strDienThoai;
                //dsInsertParam["Email"].DefaultValue = strEmail;
                //dsInsertParam["ProjectCategoryID"].DefaultValue = strChuyenKhoa;
                //dsInsertParam["ProjectID"].DefaultValue = strBacSi;
                //dsInsertParam["MoTa"].DefaultValue = strMoTa;
                //dsInsertParam["NgayKham"].DefaultValue = strNgayKham;
                //dsInsertParam["IsAvailable"].DefaultValue = strIsAvailable;
                //dsInsertParam["Priority"].DefaultValue = strPriority;
            }
            else
            {
                var dsUpdateParam = ObjectDataSource1.UpdateParameters;
                var strDatLichKhamID = row.GetDataKeyValue("DatLichKhamID").ToString();
                //var strOldDatLichKhamImage = ((HiddenField)row.FindControl("hdnDatLichKhamImage")).Value;
                //var strOldImagePath = Server.MapPath("~/res/DatLichKham/" + strOldDatLichKhamImage);

                dsUpdateParam["DatLichCho"].DefaultValue = strDatLich;
                dsUpdateParam["HoTen"].DefaultValue = strHoTen;
                dsUpdateParam["NgaySinh"].DefaultValue = strNgaySinh;
                dsUpdateParam["GioiTinh"].DefaultValue = strGioiTinh;
                dsUpdateParam["DienThoai"].DefaultValue = strDienThoai;
                dsUpdateParam["Email"].DefaultValue = strEmail;
                dsUpdateParam["ProjectCategoryID"].DefaultValue = strChuyenKhoa;
                dsUpdateParam["ProjectID"].DefaultValue = strBacSi;
                dsUpdateParam["MoTa"].DefaultValue = strMoTa;
                dsUpdateParam["NgayKham"].DefaultValue = strNgayKham;
                dsUpdateParam["IsAvailable"].DefaultValue = strIsAvailable;
                dsUpdateParam["Priority"].DefaultValue = strPriority;
            }
        }
        //if (e.CommandName == "DeleteImage")
        //{
        //    var oDatLichKham = new DatLichKham();
        //    var lnkDeleteImage = (LinkButton)e.CommandSource;
        //    var s = lnkDeleteImage.Attributes["rel"].ToString().Split('#');
        //    var strDatLichKhamID = s[0];
        //    var strDatLichKhamImage = s[1];

        //    oDatLichKham.DatLichKhamImageDelete(strDatLichKhamID);
        //    DeleteImage(strDatLichKhamImage);
        //    RadGrid1.Rebind();
        //}
    }
    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {
        lblTongSoDatHen.Text = ((DataView)ObjectDataSource1.Select()).Count.ToString();
        if (e.Item is GridEditableItem && e.Item.IsInEditMode)
        {
            var itemtype = e.Item.ItemType;
            var row = itemtype == GridItemType.EditFormItem ? (GridEditFormItem)e.Item : (GridEditFormInsertItem)e.Item;
            //var FileDatLichKhamImage = (RadUpload)row.FindControl("FileDatLichKhamImage");

            var dv = (DataView)ObjectDataSource1.Select();
            var DatLichKhamID = ((HiddenField)row.FindControl("hdnDatLichKhamID")).Value;
            var hdnNgaySinh = ((HiddenField)row.FindControl("hdnNgaySinh")).Value;
            var hdnNgayKham = ((HiddenField)row.FindControl("hdnNgayKham")).Value;

            var dpNgaySinh = (RadDatePicker)row.FindControl("dpNgaySinh");
            var dpNgayKham = (RadDatePicker)row.FindControl("dpNgayKham");
            var dpGioKham = (RadTimePicker)row.FindControl("dpGioKham");

            var dropChuyenKhoa = (DropDownList)row.FindControl("dropChuyenKhoa");
            var dropBacSi = (DropDownList)row.FindControl("dropBacSi");

            var radioDatLich = (RadioButtonList)row.FindControl("radioDatLich");
            var radioGioiTinh = (RadioButtonList)row.FindControl("radioGioiTinh");

            if (!string.IsNullOrEmpty(DatLichKhamID))
            {
                dv.RowFilter = "DatLichKhamID = " + DatLichKhamID;

                if (!string.IsNullOrEmpty(dv[0]["ProjectCategoryID"].ToString()))
                    dropChuyenKhoa.SelectedValue = dv[0]["ProjectCategoryID"].ToString();
                if (!string.IsNullOrEmpty(dv[0]["ProjectID"].ToString()))
                    dropBacSi.SelectedValue = dv[0]["ProjectID"].ToString();

                if (!string.IsNullOrEmpty(dv[0]["NgaySinh"].ToString()))
                {
                    var date = DateTime.Parse(dv[0]["NgaySinh"].ToString());
                    dpNgaySinh.SelectedDate = date;
                }
                if (!string.IsNullOrEmpty(dv[0]["NgayKham"].ToString()))
                {
                    var edate = DateTime.Parse(dv[0]["NgayKham"].ToString());
                    dpNgayKham.SelectedDate = edate;
                    dpGioKham.SelectedDate = edate;
                }
                if (!string.IsNullOrEmpty(dv[0]["DatLichCho"].ToString()))
                {
                    radioDatLich.SelectedValue = dv[0]["DatLichCho"].ToString();
                }
                if (!string.IsNullOrEmpty(dv[0]["GioiTinh"].ToString()))
                {
                    radioGioiTinh.SelectedValue = dv[0]["GioiTinh"].ToString();
                }
            }

            //RadAjaxPanel1.ResponseScripts.Add(string.Format("window['UploadId'] = '{0}';", FileDatLichKhamImage.ClientID));
        }
    }
    #endregion
}