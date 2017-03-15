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


public partial class ad_single_photoalbum : System.Web.UI.Page
{
    #region Common Method

    protected void DropDownList_DataBound(object sender, EventArgs e)
    {
        var cbo = (RadComboBox)sender;
        cbo.Items.Insert(0, new RadComboBoxItem(""));
    }

    void DeleteImage(string strImageName)
    {
        if (!string.IsNullOrEmpty(strImageName))
        {
            string strOldImagePath = Server.MapPath("~/res/PhotoCategory/" + strImageName);
            if (File.Exists(strOldImagePath))
                File.Delete(strOldImagePath);
        }
    }

    void DeletePhotoAlbum(string strImageName)
    {
        if (!string.IsNullOrEmpty(strImageName))
        {
            var strImagePath = Server.MapPath("~/res/photoalbum/" + strImageName);
            var strThumbImagePath = Server.MapPath("~/res/photoalbum/thumbs/" + strImageName);

            if (File.Exists(strImagePath))
                File.Delete(strImagePath);
            if (File.Exists(strThumbImagePath))
                File.Delete(strThumbImagePath);
        }
    }

    #endregion

    #region Event

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!HttpContext.Current.User.IsInRole("Giới Thiệu"))
                Response.Redirect("~/ad/bilingual/");

            TempImage = new DataTable();
            TempImage.Columns.Add("ImageName");
        }
    }

    protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
    {
        if (e.CommandName == "QuickUpdate")
        {
            string PhotoCategoryID, Priority, IsShowOnMenu, IsShowOnHomePage, IsAvailable;
            var oPhotoCategory = new PhotoCategory();

            foreach (GridDataItem item in RadGrid1.Items)
            {
                PhotoCategoryID = item.GetDataKeyValue("PhotoCategoryID").ToString();
                Priority = ((RadNumericTextBox)item.FindControl("txtPriority")).Text.Trim();
                IsShowOnMenu = ((CheckBox)item.FindControl("chkIsShowOnMenu")).Checked.ToString();
                IsShowOnHomePage = ((CheckBox)item.FindControl("chkIsShowOnHomePage")).Checked.ToString();
                IsAvailable = ((CheckBox)item.FindControl("chkIsAvailable")).Checked.ToString();

                oPhotoCategory.PhotoCategoryQuickUpdate(
                    PhotoCategoryID,
                    IsShowOnMenu,
                    IsShowOnHomePage,
                    IsAvailable,
                    Priority
                );
            }
        }
        else if (e.CommandName == "DeleteSelected")
        {
            var oPhotoAlbum = new PhotoAlbum();

            foreach (GridDataItem item in RadGrid1.SelectedItems)
            {
                string strImageName = ((HiddenField)item.FindControl("hdnImageName")).Value;

                DeleteImage(strImageName);

                var PhotoCategoryID = item["PhotoCategoryID"].Text;

                var dtPhotoAlbum = oPhotoAlbum.PhotoAlbumSelectAll("", "", "", PhotoCategoryID, "", "", "");

                if (dtPhotoAlbum.Rows.Count > 0)
                {
                    foreach (DataRow dr in dtPhotoAlbum.Rows)
                    {
                        strImageName = dr["ImageName"].ToString();
                        DeletePhotoAlbum(strImageName);
                    }
                }
            }
        }
        else if (e.CommandName == "InitInsert" || e.CommandName == "EditSelected" || e.CommandName == "Edit")
        {
            TempImage.Rows.Clear();
        }
        else if (e.CommandName == "PerformInsert" || e.CommandName == "Update")
        {
            var command = e.CommandName;
            var row = command == "PerformInsert" ? (GridEditFormInsertItem)e.Item : (GridEditFormItem)e.Item;
            var FileImageName = (RadUpload)row.FindControl("FileImageName");

            string PhotoCategoryID = ((HiddenField)row.FindControl("hdnPhotoCategoryID")).Value;
            string strPhotoCategoryName = ((RadTextBox)row.FindControl("txtPhotoCategoryName")).Text.Trim();
            string strPhotoCategoryNameEn = ((RadTextBox)row.FindControl("txtPhotoCategoryNameEn")).Text.Trim();
            string strConvertedPhotoCategoryName = Common.ConvertTitle(strPhotoCategoryName);
            string strImageName = FileImageName.UploadedFiles.Count > 0 ? FileImageName.UploadedFiles[0].GetName() : "";
            string strIsAvailable = ((CheckBox)row.FindControl("chkIsAvailable")).Checked.ToString();
            string strIsShowOnMenu = ((CheckBox)row.FindControl("chkIsShowOnMenu")).Checked.ToString();
            string strIsShowOnHomePage = ((CheckBox)row.FindControl("chkIsShowOnHomePage")).Checked.ToString();
            string strPriority = ((RadNumericTextBox)row.FindControl("txtPriority")).Text.Trim();

            var oPhotoCategory = new PhotoCategory();

            if (e.CommandName == "PerformInsert")
            {
                strImageName = oPhotoCategory.PhotoCategoryInsert(
                    strImageName,
                    strPhotoCategoryName,
                    strPhotoCategoryNameEn,
                    strConvertedPhotoCategoryName,
                    strIsShowOnMenu,
                    strIsShowOnHomePage,
                    strIsAvailable,
                    strPriority
                    );
                string strFullPath = "~/res/PhotoCategory/" + strImageName;

                if (!string.IsNullOrEmpty(strImageName))
                {
                    FileImageName.UploadedFiles[0].SaveAs(Server.MapPath(strFullPath));
                    //ResizeCropImage.ResizeByCondition(strFullPath, 200, 200);
                }

                PhotoCategoryID = oPhotoCategory.PhotoCategoryID;

                //Insert Album's Images
                if (TempImage.Rows.Count > 0)
                {
                    var oPhotoAlbum = new PhotoAlbum();

                    foreach (DataRow dr in TempImage.Rows)
                        oPhotoAlbum.PhotoAlbumInsert(dr["ImageName"].ToString(), "", "", "", "", "", PhotoCategoryID, "True", "");
                }

                RadGrid1.Rebind();
            }
            else
            {
                var dsUpdateParam = ObjectDataSource1.UpdateParameters;
                var strPhotoCategoryID = row.GetDataKeyValue("PhotoCategoryID").ToString();
                var strOldImageName = ((HiddenField)row.FindControl("hdnImageName")).Value;
                var strOldImagePath = Server.MapPath("~/res/PhotoCategory/" + strOldImageName);

                dsUpdateParam["PhotoCategoryName"].DefaultValue = strPhotoCategoryName;
                dsUpdateParam["ConvertedPhotoCategoryName"].DefaultValue = strConvertedPhotoCategoryName;
                dsUpdateParam["ImageName"].DefaultValue = strImageName;
                dsUpdateParam["IsShowOnMenu"].DefaultValue = strIsShowOnMenu;
                dsUpdateParam["IsShowOnHomePage"].DefaultValue = strIsShowOnHomePage;
                dsUpdateParam["IsAvailable"].DefaultValue = strIsAvailable;

                if (!string.IsNullOrEmpty(strImageName))
                {
                    var strFullPath = "~/res/PhotoCategory/" + strConvertedPhotoCategoryName + "-" + strPhotoCategoryID + strImageName.Substring(strImageName.LastIndexOf('.'));

                    if (File.Exists(strOldImagePath))
                        File.Delete(strOldImagePath);

                    FileImageName.UploadedFiles[0].SaveAs(Server.MapPath(strFullPath));
                    //ResizeCropImage.ResizeByCondition(strFullPath, 200, 200);
                }
            }
        }
        else if (e.CommandName == "Cancel")
        {
            if (TempImage.Rows.Count > 0)
            {
                foreach (DataRow row in TempImage.Rows)
                {
                    DeletePhotoAlbum(row["ImageName"].ToString());
                }
                TempImage.Rows.Clear();
            }
        }
        else if (e.CommandName == "DeleteImage")
        {
            var oPhotoCategory = new PhotoCategory();
            var lnkDeleteImage = (LinkButton)e.CommandSource;
            var s = lnkDeleteImage.Attributes["rel"].ToString().Split('#');
            var strPhotoCategoryID = s[0];
            var strImageName = s[1];

            oPhotoCategory.PhotoCategoryImageDelete(strPhotoCategoryID);
            DeleteImage(strImageName);
            RadGrid1.Rebind();
        }
    }
    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridEditableItem && e.Item.IsInEditMode)
        {
            var itemtype = e.Item.ItemType;
            var row = itemtype == GridItemType.EditFormItem ? (GridEditFormItem)e.Item : (GridEditFormInsertItem)e.Item;
            var FileImageName = (RadUpload)row.FindControl("FileImageName");

            RadAjaxPanel1.ResponseScripts.Add(string.Format("window['UploadId'] = '{0}';", FileImageName.ClientID));
        }
    }

    protected void RadListView1_ItemCommand(object sender, RadListViewCommandEventArgs e)
    {
        try
        {
            var RadListView1 = (RadListView)sender;
            var Parent = RadListView1.NamingContainer;
            var OdsPhotoAlbum = (ObjectDataSource)Parent.FindControl("OdsPhotoAlbum");

            if (e.CommandName == "Update")
            {
                var item = e.ListViewItem;
                var dsUpdateParam = OdsPhotoAlbum.UpdateParameters;

                var strOldImageName = ((HiddenField)e.ListViewItem.FindControl("hdnImageName")).Value;
                var strIsAvailable = ((CheckBox)item.FindControl("chkAddIsAvailable")).Checked.ToString();

                dsUpdateParam["ImageName"].DefaultValue = strOldImageName;
                dsUpdateParam["IsAvailable"].DefaultValue = strIsAvailable;
            }
            else if (e.CommandName == "Delete")
            {
                var strOldImageName = ((HiddenField)e.ListViewItem.FindControl("hdnImageName")).Value;
                DeletePhotoAlbum(strOldImageName);
            }
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void RadListView2_ItemCommand(object sender, RadListViewCommandEventArgs e)
    {
        try
        {
            var RadListView2 = (RadListView)sender;
            if (e.CommandName == "Delete")
            {
                var Parent = RadListView2.NamingContainer;
                var strOldImageName = ((HiddenField)e.ListViewItem.FindControl("hdnImageName")).Value;
                DeletePhotoAlbum(strOldImageName);

                TempImage.Rows.Cast<DataRow>().Where(c => c["ImageName"].ToString() == strOldImageName).Single().Delete();
                RadListView2.DataSource = TempImage;
                RadListView2.DataBind();
            }
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }
    #endregion

    #region Properties

    private DataTable TempImage
    {
        get { return (DataTable)ViewState["TempImage"]; }
        set { ViewState["TempImage"] = value; }
    }

    #endregion
}