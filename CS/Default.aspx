<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dxwtl" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dxm" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ASPxTreeList Header template example</title>
    <script language="javascript" type="text/javascript">
        function OnFocusedNodeChanged(s, e) {
            if (s.GetFocusedNodeKey() >= "parent")
                img.SetImageUrl("Images/red.png");
            else
                img.SetImageUrl("Images/blue.png");
        }

        function CycleImages(s, e) {
            if (s.GetImageUrl().indexOf("red.png") != -1)
                img.SetImageUrl("Images/blue.png");
            else if (s.GetImageUrl().indexOf("blue.png") != -1)
                img.SetImageUrl("Images/empty.png");
            else if (s.GetImageUrl().indexOf("empty.png") != -1)
                img.SetImageUrl("Images/red.png");
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <dxwtl:ASPxTreeList ID="treeList" runat="server" AutoGenerateColumns="False" ClientInstanceName="treeList">
        <SettingsBehavior AllowFocusedNode="True" />
        <ClientSideEvents FocusedNodeChanged="function(s, e) { OnFocusedNodeChanged(s, e); }" />
        <Columns>
            <dxwtl:TreeListTextColumn Caption="Name" VisibleIndex="0" FieldName="Name" 
                AllowSort="False">
                <PropertiesTextEdit EncodeHtml="false" />
                <HeaderCaptionTemplate>
                    <dxe:ASPxImage ID="img" runat="server" ClientInstanceName="img" 
                         ImageUrl="~/Images/empty.png">                        
                         <ClientSideEvents Click="function (s, e) { CycleImages(s, e); }" />
                    </dxe:ASPxImage>
                </HeaderCaptionTemplate>
            </dxwtl:TreeListTextColumn>
        </Columns>
    </dxwtl:ASPxTreeList>
    </form>
</body>
</html>
