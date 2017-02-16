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


public partial class ad_single_projectcategory : System.Web.UI.Page
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
            string strOldImagePath = Server.MapPath("~/res/projectcategory/" + strImageName);
            if (File.Exists(strOldImagePath))
                File.Delete(strOldImagePath);
        }
    }

    void DeleteImage2(string strImageName2)
    {
        if (!string.IsNullOrEmpty(strImageName2))
        {
            string strOldImage2Path = Server.MapPath("~/res/projectcategory/image2/" + strImageName2);
            if (File.Exists(strOldImage2Path))
                File.Delete(strOldImage2Path);
        }
    }

    void DeleteImageIcon(string strImageNameIcon)
    {
        if (!string.IsNullOrEmpty(strImageNameIcon))
        {
            string strOldImagePath = Server.MapPath("~/res/projectcategory/icon/" + strImageNameIcon);
            if (File.Exists(strOldImagePath))
                File.Delete(strOldImagePath);
        }
    }

    #endregion

    #region Event

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
    {
        if (e.CommandName == "QuickUpdate")
        {
            string ProjectCategoryID, IsShowOnMenu, IsShowOnHomePage, IsAvailable;
            var oProjectCategory = new ProjectCategory();

            foreach (GridDataItem item in RadGrid1.Items)
            {
                ProjectCategoryID = item.GetDataKeyValue("ProjectCategoryID").ToString();
                IsShowOnMenu = ((CheckBox)item.FindControl("chkIsShowOnMenu")).Checked.ToString();
                IsShowOnHomePage = ((CheckBox)item.FindControl("chkIsShowOnHomePage")).Checked.ToString();
                IsAvailable = ((CheckBox)item.FindControl("chkIsAvailable")).Checked.ToString();

                oProjectCategory.ProjectCategoryQuickUpdate(
                    ProjectCategoryID,
                    IsShowOnMenu,
                    IsShowOnHomePage,
                    IsAvailable
                );
            }
        }
        else if (e.CommandName == "DeleteSelected")
        {
            var oProjectCategory = new ProjectCategory();
            var errorList = "";

            foreach (GridDataItem item in RadGrid1.SelectedItems)
            {
                var isChildCategoryExist = oProjectCategory.ProjectCategoryIsChildrenExist(item.GetDataKeyValue("ProjectCategoryID").ToString());
                var ProjectCategoryName = ((Label)item.FindControl("lblProjectCategoryName")).Text;
                var ProjectCategoryNameEn = ((Label)item.FindControl("lblProjectCategoryNameEn")).Text;
                if (isChildCategoryExist)
                {
                    errorList += ", " + ProjectCategoryName;
                }
                else
                {
                    string strImageName = ((HiddenField)item.FindControl("hdnImageName")).Value;

                    if (!string.IsNullOrEmpty(strImageName))
                    {
                        string strSavePath = Server.MapPath("~/res/projectcategory/" + strImageName);
                        if (File.Exists(strSavePath))
                            File.Delete(strSavePath);
                    }

                    string strImageName2 = ((HiddenField)item.FindControl("hdnImageName2")).Value;

                    if (!string.IsNullOrEmpty(strImageName2))
                    {
                        string strSavePath2 = Server.MapPath("~/res/projectcategory/image2/" + strImageName2);
                        if (File.Exists(strSavePath2))
                            File.Delete(strSavePath2);
                    }

                    string strImageNameIcon = ((HiddenField)item.FindControl("hdnImageNameIcon")).Value;

                    if (!string.IsNullOrEmpty(strImageNameIcon))
                    {
                        string strSavePathIcon = Server.MapPath("~/res/projectcategory/icon/" + strImageNameIcon);
                        if (File.Exists(strSavePathIcon))
                            File.Delete(strSavePathIcon);
                    }
                }
            }
            if (!string.IsNullOrEmpty(errorList))
            {
                e.Canceled = true;
                string strAlertMessage = "Danh mục <b>\"" + errorList.Remove(0, 1).Trim() + "\"</b> đang có danh mục con hoặc sản phẩm.<br /> Xin xóa danh mục con hoặc sản phẩm trong danh mục này hoặc thiết lập hiển thị = \"không\".";
                lblError.Text = strAlertMessage;
            }
        }
        else if (e.CommandName == "PerformInsert" || e.CommandName == "Update")
        {
            var command = e.CommandName;
            var row = command == "PerformInsert" ? (GridEditFormInsertItem)e.Item : (GridEditFormItem)e.Item;
            var FileImageName = (RadUpload)row.FindControl("FileImageName");
            var FileImageName2 = (RadUpload)row.FindControl("FileImageName2");
            var FileImageNameIcon = (RadUpload)row.FindControl("FileImageNameIcon");

            string strProjectCategoryName = ((RadTextBox)row.FindControl("txtProjectCategoryName")).Text.Trim();
            string strProjectCategoryNameEn = ((RadTextBox)row.FindControl("txtProjectCategoryNameEn")).Text.Trim();
            string strProjectCategoryLink = ((RadTextBox)row.FindControl("txtProjectCategoryLink")).Text.Trim();
            string strProjectCategoryLinkEn = ((RadTextBox)row.FindControl("txtProjectCategoryLinkEn")).Text.Trim();
            string strConvertedProjectCategoryName = Common.ConvertTitle(strProjectCategoryName);
            string strDescription = HttpUtility.HtmlDecode(FCKEditorFix.Fix(((RadEditor)row.FindControl("txtDescription")).Content.Trim()));
            string strDescriptionEn = HttpUtility.HtmlDecode(FCKEditorFix.Fix(((RadEditor)row.FindControl("txtDescriptionEn")).Content.Trim()));
            string strContent = HttpUtility.HtmlDecode(FCKEditorFix.Fix(((RadEditor)row.FindControl("txtContent")).Content.Trim()));
            string strContentEn = HttpUtility.HtmlDecode(FCKEditorFix.Fix(((RadEditor)row.FindControl("txtContentEn")).Content.Trim()));
            string strMetaTitle = ((RadTextBox)row.FindControl("txtMetaTitle")).Text.Trim();
            string strMetaTitleEn = ((RadTextBox)row.FindControl("txtMetaTitleEn")).Text.Trim();
            string strMetaDescription = ((RadTextBox)row.FindControl("txtMetaDescription")).Text.Trim();
            string strMetaDescriptionEn = ((RadTextBox)row.FindControl("txtMetaDescriptionEn")).Text.Trim();
            string strImageName = FileImageName.UploadedFiles.Count > 0 ? FileImageName.UploadedFiles[0].GetName() : "";
            string strImageName2 = FileImageName2.UploadedFiles.Count > 0 ? FileImageName2.UploadedFiles[0].GetName() : "";
            string strImageNameIcon = FileImageNameIcon.UploadedFiles.Count > 0 ? FileImageNameIcon.UploadedFiles[0].GetName() : "";
            string strParentID = ((RadComboBox)row.FindControl("ddlParent")).SelectedValue;
            if ("".Equals(strParentID))
                strParentID = "14";
            string strIsAvailable = ((CheckBox)row.FindControl("chkIsAvailable")).Checked.ToString();
            string strIsShowOnMenu = ((CheckBox)row.FindControl("chkIsShowOnMenu")).Checked.ToString();
            string strIsShowOnHomePage = ((CheckBox)row.FindControl("chkIsShowOnHomePage")).Checked.ToString();


            var oProjectCategory = new ProjectCategory();

            if (e.CommandName == "PerformInsert")
            {
                strImageName = oProjectCategory.ProjectCategoryInsert2(
                    strProjectCategoryName,
                    strProjectCategoryNameEn,
                    strProjectCategoryLink,
                    strProjectCategoryLinkEn,
                    strConvertedProjectCategoryName,
                    strDescription,
                    strDescriptionEn,
                    strContent,
                    strContentEn,
                    strMetaTitle,
                    strMetaTitleEn,
                    strMetaDescription,
                    strMetaDescriptionEn,
                    strImageName,
                    strImageName2,
                    strImageNameIcon,
                    strParentID,
                    strIsShowOnMenu,
                    strIsShowOnHomePage,
                    strIsAvailable
                );

                string strFullPath = "~/res/projectcategory/" + strImageName;

                if (!string.IsNullOrEmpty(strImageName))
                {
                    FileImageName.UploadedFiles[0].SaveAs(Server.MapPath(strFullPath));
                    //ResizeCropImage.ResizeByCondition(strFullPath, 40, 40);
                }

                string strFullPath2 = "~/res/projectcategory/image2/" + strImageName;

                if (!string.IsNullOrEmpty(strImageName2))
                {
                    FileImageName2.UploadedFiles[0].SaveAs(Server.MapPath(strFullPath2));
                    //ResizeCropImage.ResizeByCondition(strFullPath, 40, 40);
                }

                string strFullPathIcon = "~/res/projectcategory/icon/" + strImageName;

                if (!string.IsNullOrEmpty(strImageNameIcon))
                {
                    FileImageNameIcon.UploadedFiles[0].SaveAs(Server.MapPath(strFullPathIcon));
                    //ResizeCropImage.ResizeByCondition(strFullPath, 40, 40);
                }
                RadGrid1.Rebind();
            }
            else
            {
                var dsUpdateParam = ObjectDataSource1.UpdateParameters;
                var strProjectCategoryID = row.GetDataKeyValue("ProjectCategoryID").ToString();
                var strOldImageName = ((HiddenField)row.FindControl("hdnImageName")).Value;
                var strOldImageName2 = ((HiddenField)row.FindControl("hdnImageName2")).Value;
                var strOldImageNameIcon = ((HiddenField)row.FindControl("hdnImageNameIcon")).Value;
                var strOldImagePath = Server.MapPath("~/res/projectcategory/" + strOldImageName);
                var strOldImagePath2 = Server.MapPath("~/res/projectcategory/image2/" + strOldImageName2);
                var strOldImagePathIcon = Server.MapPath("~/res/projectcategory/icon/" + strOldImageNameIcon);

                dsUpdateParam["ProjectCategoryName"].DefaultValue = strProjectCategoryName;
                dsUpdateParam["ProjectCategoryNameEn"].DefaultValue = strProjectCategoryNameEn;
                dsUpdateParam["ProjectCategoryLink"].DefaultValue = strProjectCategoryLink;
                dsUpdateParam["ProjectCategoryLinkEn"].DefaultValue = strProjectCategoryLinkEn;
                dsUpdateParam["ConvertedProjectCategoryName"].DefaultValue = strConvertedProjectCategoryName;
                dsUpdateParam["Description"].DefaultValue = strDescription;
                dsUpdateParam["DescriptionEn"].DefaultValue = strDescriptionEn;
                dsUpdateParam["Content"].DefaultValue = strContent;
                dsUpdateParam["ContentEn"].DefaultValue = strContentEn;
                dsUpdateParam["ImageName"].DefaultValue = strImageName;
                dsUpdateParam["ImageName2"].DefaultValue = strImageName2;
                dsUpdateParam["ImageNameIcon"].DefaultValue = strImageNameIcon;
                dsUpdateParam["ParentID"].DefaultValue = strParentID;
                dsUpdateParam["IsShowOnMenu"].DefaultValue = strIsShowOnMenu;
                dsUpdateParam["IsShowOnHomePage"].DefaultValue = strIsShowOnHomePage;
                dsUpdateParam["IsAvailable"].DefaultValue = strIsAvailable;

                if (!string.IsNullOrEmpty(strImageName))
                {
                    var strFullPath = "~/res/projectcategory/" + strConvertedProjectCategoryName + "-" + strProjectCategoryID + strImageName.Substring(strImageName.LastIndexOf('.'));

                    if (File.Exists(strOldImagePath))
                        File.Delete(strOldImagePath);

                    FileImageName.UploadedFiles[0].SaveAs(Server.MapPath(strFullPath));
                    //ResizeCropImage.ResizeByCondition(strFullPath, 40, 40);
                }

                if (!string.IsNullOrEmpty(strImageName2))
                {
                    var strFullPath2 = "~/res/projectcategory/image2/" + strConvertedProjectCategoryName + "-" + strProjectCategoryID + strImageName2.Substring(strImageName2.LastIndexOf('.'));

                    if (File.Exists(strOldImagePath2))
                        File.Delete(strOldImagePath2);

                    FileImageName2.UploadedFiles[0].SaveAs(Server.MapPath(strFullPath2));
                    //ResizeCropImage.ResizeByCondition(strFullPath, 40, 40);
                }

                if (!string.IsNullOrEmpty(strImageNameIcon))
                {
                    var strFullPathIcon = "~/res/projectcategory/icon/" + strConvertedProjectCategoryName + "-" + strProjectCategoryID + strImageNameIcon.Substring(strImageNameIcon.LastIndexOf('.'));

                    if (File.Exists(strOldImagePathIcon))
                        File.Delete(strOldImagePathIcon);

                    FileImageNameIcon.UploadedFiles[0].SaveAs(Server.MapPath(strFullPathIcon));
                    //ResizeCropImage.ResizeByCondition(strFullPath, 40, 40);
                }
            }
        }
        if (e.CommandName == "DeleteImage")
        {
            var oProjectCategory = new ProjectCategory();
            var lnkDeleteImage = (LinkButton)e.CommandSource;
            var s = lnkDeleteImage.Attributes["rel"].ToString().Split('#');
            var strProjectCategoryID = s[0];
            var strImageName = s[1];

            oProjectCategory.ProjectCategoryImageDelete(strProjectCategoryID);
            DeleteImage(strImageName);
            RadGrid1.Rebind();
        }
        if (e.CommandName == "DeleteImage2")
        {
            var oProjectCategory = new ProjectCategory();
            var lnkDeleteImage2 = (LinkButton)e.CommandSource;
            var s = lnkDeleteImage2.Attributes["rel"].ToString().Split('#');
            var strProjectCategoryID = s[0];
            var strImageName2 = s[1];

            oProjectCategory.ProjectCategoryImage2Delete(strProjectCategoryID);
            DeleteImage2(strImageName2);
            RadGrid1.Rebind();
        }
        if (e.CommandName == "DeleteImageIcon")
        {
            var oProjectCategory = new ProjectCategory();
            var lnkDeleteImageIcon = (LinkButton)e.CommandSource;
            var s = lnkDeleteImageIcon.Attributes["rel"].ToString().Split('#');
            var strProjectCategoryID = s[0];
            var strImageNameIcon = s[1];

            oProjectCategory.ProjectCategoryImageIconDelete(strProjectCategoryID);
            DeleteImageIcon(strImageNameIcon);
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
            var FileImageName2 = (RadUpload)row.FindControl("FileImageName2");
            var FileImageNameIcon = (RadUpload)row.FindControl("FileImageNameIcon");
            var ProjectCategoryID = ((HiddenField)row.FindControl("hdnProjectCategoryID")).Value;
            var dv = (DataView)ObjectDataSource1.Select();
            var ddlParent = (RadComboBox)row.FindControl("ddlParent");

            if (!string.IsNullOrEmpty(ProjectCategoryID))
            {
                dv.RowFilter = "ProjectCategoryID = " + ProjectCategoryID;

                if (!string.IsNullOrEmpty(dv[0]["ParentID"].ToString()))
                    ddlParent.SelectedValue = dv[0]["ParentID"].ToString();
            }

            RadAjaxPanel1.ResponseScripts.Add(string.Format("window['UploadId'] = '{0}';", FileImageName.ClientID));
            RadAjaxPanel1.ResponseScripts.Add(string.Format("window['UploadId2'] = '{0}';", FileImageName2.ClientID));
            RadAjaxPanel1.ResponseScripts.Add(string.Format("window['UploadId3'] = '{0}';", FileImageNameIcon.ClientID));
        }
    }

    protected void lnkUpOrder_Click(object sender, EventArgs e)
    {
        var lnkUpOrder = (LinkButton)sender;
        var strProjectCategoryID = lnkUpOrder.Attributes["rel"];
        var oProjectCategory = new ProjectCategory();
        oProjectCategory.ProjectCategoryUpOrder(strProjectCategoryID);
        RadGrid1.Rebind();

    }
    protected void lnkDownOrder_Click(object sender, EventArgs e)
    {
        var lnkDownOrder = (LinkButton)sender;
        var strProjectCategoryID = lnkDownOrder.Attributes["rel"];
        var oProjectCategory = new ProjectCategory();
        oProjectCategory.ProjectCategoryDownOrder(strProjectCategoryID);
        RadGrid1.Rebind();
    }
    #endregion
}