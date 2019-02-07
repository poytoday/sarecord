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
Partial Class issue_region
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        UserClass.CheckLogin(Page)
        If Not func.CheckUserPermissions_access("issue_region.aspx", Session("User_access")) Then
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        Else
            Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        End If
        'UserClass.CheckLogin(Page)
        'If Not func.CheckUserPermissions("recevice_person.aspx", "S") Then
        '    Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
        '    Response.End()
        'End If
    End Sub
    Protected Sub GridView1_RowCommand(ByVal source As Object, ByVal e As GridViewCommandEventArgs)
        Try

            If e.CommandName = "Page" OrElse e.CommandName = "Sort" Then Exit Sub

            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            Dim dkKeys As DataKey
            dkKeys = GridView4.DataKeys(index)

            Dim sKeysArg As String = ""
            For Each s As String In dkKeys.Values.Keys
                sKeysArg += s + "='" + Convert.ToString(dkKeys(s)) & "'"
            Next s
            If sKeysArg = String.Empty Then
                Exit Sub
            End If
            If e.CommandName = "cmdDelete" Then
                'Dim sStartPageURL As String = ""
                'sStartPageURL = "View_work_device.aspx?dbname=" & Convert.ToString(dkKeys(0))
                'Response.Redirect(sStartPageURL)

                Dim objConn As New SqlConnection
                Dim objCmd As SqlCommand
                Dim strSQL As String
                ' Dim StrCon As New SqlConnection("SERVER=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
                Dim strConnString As String = "Server=172.30.203.155;Uid=sa;PASSWORD=1234;database=SA_System;Max Pool Size=400;Connect Timeout=600;"
                objConn.ConnectionString = strConnString
                objConn.Open()
                strSQL = "UPDATE  sa.send_damage SET status = 99 WHERE " & sKeysArg
                '& Request.QueryString("pmcm_id")
                objCmd = New SqlCommand(strSQL, objConn)
                objCmd.ExecuteNonQuery()

                Me.GridView4.DataBind()



            End If

        Catch ex As Exception

        End Try
    End Sub
End Class
