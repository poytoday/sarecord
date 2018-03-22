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
Partial Class Edit_name
    Inherits System.Web.UI.Page
    Dim objConn As New SqlConnection
    Dim objCmd As SqlCommand
    Dim strConnString, strSQL As String

    Protected Sub ViewData()
        '*** DataTable ***'
        'Dim dtAdapter As SqlDataAdapter
        'Dim dt As New DataTable
        'strSQL = "SELECT * FROM Names WHERE Emp_id = @id "
        'dtAdapter = New SqlDataAdapter(strSQL, objConn)
        'objCmd = dtAdapter.SelectCommand
        'objCmd.Parameters.Add("@id", SqlDbType.Int).Value = Request.QueryString("id")
        'dtAdapter.Fill(dt)

        'If dt.Rows.Count > 0 Then
        ' Me.ImgPic.ImageUrl = "ViewImg.aspx?FilesID=" & dt.Rows(0)("FilesID")
        Me.DropDownList1.SelectedValue = Request.QueryString("Emp_id")
        'End If


    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        UserClass.CheckLogin(Page)
        If Not func.CheckUserPermissions_access("Edit_name.aspx", Session("User_access")) Then
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        Else
            Dim UserLogin As UserClass = CType(Session("User"), UserClass)
            strConnString = "Server=172.30.203.155;Uid=sa;PASSWORD=1234;database=SA_System;Max Pool Size=400;Connect Timeout=600;"
            objConn.ConnectionString = strConnString
            objConn.Open()
            If Not Page.IsPostBack() Then
                ViewData()
            End If
        End If




       
    End Sub

    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton2.Click
        strSQL = "UPDATE sa.Name_List SET Emp_id = '" & Me.DropDownList1.SelectedValue & "' WHERE [id] = " & Request.QueryString("id")
        objCmd = New SqlCommand(strSQL, objConn)
        objCmd.ExecuteNonQuery()
        Dim sStartPageURL As String = ""
        sStartPageURL = "Edit_work.aspx?pmcm_id=" & Request.QueryString("pmcm_id") & "&id_team=" & Request.QueryString("id_team")
        Response.Redirect(sStartPageURL)
    End Sub
End Class
