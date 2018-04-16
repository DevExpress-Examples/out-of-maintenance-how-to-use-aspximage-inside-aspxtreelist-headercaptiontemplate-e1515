using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxTreeList;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CreateNodes();
    }

    void CreateNodes()
    {
        TreeListNode parent = CreateNodeCore("parent1", "<b>Parent 1</b>", null);
        CreateNodeCore("child1", "Child 1", parent);
        CreateNodeCore("child2", "Child 2", parent);

        parent = CreateNodeCore("parent2", "<b>Parent 2</b>", parent);
        parent.Expanded = true;
        CreateNodeCore("child3", "Child 3", parent);
        CreateNodeCore("child4", "Child 4", parent);

        parent = CreateNodeCore("parent3", "<b>Parent 3</b>", null);
        CreateNodeCore("child5", "Child 5", parent);
        CreateNodeCore("child6", "Child 6", parent);
    }

    TreeListNode CreateNodeCore(object key, string text, TreeListNode parentNode)
    {
        TreeListNode node = treeList.AppendNode(key, parentNode);
        
        node["Name"] = text;
        return node;
    }

    public String GetText(Object container)
    {
        DevExpress.Web.ASPxMenu.MenuItemTemplateContainer item = container as DevExpress.Web.ASPxMenu.MenuItemTemplateContainer;

        return String.Format("Item name: {0}", item.Item.Name);
    }
}
