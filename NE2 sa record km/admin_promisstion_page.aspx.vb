#Region " Imports "
Imports System
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Collections
Imports System.Configuration
Imports System.Threading
Imports System.Globalization
Imports System.Data.OleDb
Imports System.IO
Imports System.Data.SqlClient
#End Region
Partial Class admin_promisstion_page
    Inherits System.Web.UI.Page

    Protected Sub Linkbutton10_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Linkbutton10.Click
        Dim Ds As New DataSet
        Dim Dt As DataTable
        Dim Dr As DataRow
        Dim StrCon As New SqlConnection("SERVER=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
        Dim Adpt As New SqlDataAdapter("SELECT * FROM sa.[user_permissions_access] where 1<>1", StrCon)
        Adpt.Fill(Ds, "user_permissions_access")
        Dt = Ds.Tables("user_permissions_access")
        Dr = Dt.NewRow
        Dr("text_tablename") = Me.TextBox3.Text()
        Dr("tablename") = Me.TextBox1.Text
        Dr("owner") = False
        Dr("section") = False
        Dr("region") = False
        Dr("front_office") = False
        Dr("Administrator") = False
        If Me.CheckBoxList1.Items.Count <> 0 Then
            For j = 0 To Me.CheckBoxList1.Items.Count - 1
                If Me.CheckBoxList1.Items(j).Selected = True Then
                    If CheckBoxList1.Items(j).Value = "owner" Then
                        Dr("owner") = True
                    ElseIf CheckBoxList1.Items(j).Value = "section" Then
                        Dr("section") = True
                    ElseIf CheckBoxList1.Items(j).Value = "region" Then
                        Dr("region") = True
                    ElseIf CheckBoxList1.Items(j).Value = "front_office" Then
                        Dr("front_office") = True
                    ElseIf CheckBoxList1.Items(j).Value = "Administrator" Then
                        Dr("Administrator") = True
                    End If
                End If
            Next
        End If
        Dt.Rows.Add(Dr)
        Dim cdb As New SqlCommandBuilder(Adpt)
        Adpt.Update(Ds, "user_permissions_access")
        Ds.AcceptChanges()
        Me.TextBox1.Text = ""
        Me.GridView1.DataBind()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim objConn As New SqlConnection
        Dim strConnString As String
        UserClass.CheckLogin(Page)
        If Not func.CheckUserPermissions_access("admin_promisstion_page.aspx", Session("User_access")) Then
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        Else
            strConnString = "Server=172.30.203.155;Uid=sa;PASSWORD=1234;database=SA_System;Max Pool Size=400;Connect Timeout=600;"
            objConn.ConnectionString = strConnString
            objConn.Open()
            Dim UserLogin As UserClass = CType(Session("User"), UserClass)

        End If
    End Sub
End Class

