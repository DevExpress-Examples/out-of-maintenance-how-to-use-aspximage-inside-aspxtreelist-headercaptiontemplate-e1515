﻿Imports System
Imports System.Collections.Generic
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web.ASPxTreeList

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        CreateNodes()
    End Sub

    Private Sub CreateNodes()

        Dim parent_Renamed As TreeListNode = CreateNodeCore("parent1", "<b>Parent 1</b>", Nothing)
        CreateNodeCore("child1", "Child 1", parent_Renamed)
        CreateNodeCore("child2", "Child 2", parent_Renamed)

        parent_Renamed = CreateNodeCore("parent2", "<b>Parent 2</b>", parent_Renamed)
        parent_Renamed.Expanded = True
        CreateNodeCore("child3", "Child 3", parent_Renamed)
        CreateNodeCore("child4", "Child 4", parent_Renamed)

        parent_Renamed = CreateNodeCore("parent3", "<b>Parent 3</b>", Nothing)
        CreateNodeCore("child5", "Child 5", parent_Renamed)
        CreateNodeCore("child6", "Child 6", parent_Renamed)
    End Sub

    Private Function CreateNodeCore(ByVal key As Object, ByVal text As String, ByVal parentNode As TreeListNode) As TreeListNode
        Dim node As TreeListNode = treeList.AppendNode(key, parentNode)

        node("Name") = text
        Return node
    End Function

    Public Function GetText(ByVal container As Object) As String
        Dim item As DevExpress.Web.MenuItemTemplateContainer = TryCast(container, DevExpress.Web.MenuItemTemplateContainer)

        Return String.Format("Item name: {0}", item.Item.Name)
    End Function
End Class
