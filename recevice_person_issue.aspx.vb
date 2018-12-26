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
Partial Class recevice_person_issue
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        UserClass.CheckLogin(Page)
        If Not func.CheckUserPermissions_access("recevice_person_issue.aspx", Session("User_access")) Then
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        Else
            Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        End If

    End Sub
    Protected Sub GridView2_RowCommand(ByVal source As Object, ByVal e As GridViewCommandEventArgs)
        Dim objConn As New SqlConnection
        Dim objCmd As SqlCommand
        Dim strSQL, strConnString As String
        strConnString = "Server=172.30.203.155;Uid=sa;PASSWORD=1234;database=SA_System;Max Pool Size=400;Connect Timeout=600;"
        objConn.ConnectionString = strConnString
        objConn.Open()
        If e.CommandName = "Page" OrElse e.CommandName = "Sort" Then Exit Sub
        Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        Dim dkKeys As DataKey
        dkKeys = GridView2.DataKeys(index)
        If e.CommandName = "cmdDelet" Then
            strSQL = "DELETE FROM [SA_System].[sa].[send_damage] WHERE [send_damage_id] = " & Convert.ToString(dkKeys(0))
            'Request.QueryString("pmcm_id")
            objCmd = New SqlCommand(strSQL, objConn)
            objCmd.ExecuteNonQuery()
            Me.GridView2.DataBind()
        End If
        objConn.Close()



    End Sub
End Class
