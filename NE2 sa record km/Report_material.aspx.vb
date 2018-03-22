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
Partial Class Report_material
    Inherits System.Web.UI.Page
    Dim objConn As New SqlConnection
    Dim objCmd As SqlCommand
    Dim strConnString, strSQL, type_frtu As String
    Dim userLogin As UserClass = New UserClass()
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



        UserClass.CheckLogin(Page)
        If Not func.CheckUserPermissions_access("Report_material.aspx", Session("User_access")) Then
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        Else
            Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        End If





        'UserClass.CheckLogin(Page)
        'If Not func.CheckUserPermissions("all_page.aspx", "S") Then
        '    Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
        '    Response.End()
        'Else
        '    Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        '    'UserClass.login_page(UserLogin.UserName, "Damage.aspx", "View")

        'End If
    End Sub
    Protected Sub GridView2_RowCommand(ByVal source As Object, ByVal e As GridViewCommandEventArgs)
        'If e.CommandName = "Page" OrElse e.CommandName = "Sort" Then Exit Sub
        'Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        'Dim dkKeys As DataKey
        'dkKeys = GridView2.DataKeys(index)
        'Dim sKeysArg As String = ""
        'For Each s As String In dkKeys.Values.Keys
        '    sKeysArg += s + "='" + Convert.ToString(dkKeys(s)) & "'" 
        'Next s
        'If sKeysArg = String.Empty Then
        '    Exit Sub
        'End If
        'If e.CommandName = "cmd_view" Then
        '    Me.SqlDataSource4.SelectCommand = func.SqlBuilder(SqlDataSource4.SelectCommand, "sa.Material_List2.office = '" & dkKeys(1) & "' and sa.Material_List2.Material = '" & dkKeys(0) & "'")
        '    Me.SqlDataSource4.DataBind()
        'strConnString = "Server=172.30.203.155;Uid=sa;PASSWORD=1234;database=SA_System;Max Pool Size=400;Connect Timeout=600;"
        'objConn.ConnectionString = strConnString
        'objConn.Open()


        'Dim dtAdapter As SqlDataAdapter
        'Dim dt As New DataTable
        'strSQL = "SELECT     sa.pmcm_record.date_operate, sa.pmcm_record.operation, sa.Device_List.op_id, sa.Material_List2.office, sa.Material_List2.Material FROM   sa.Material_List2 INNER JOIN sa.pmcm_record ON sa.Material_List2.pmcm_id = sa.pmcm_record.pmcm_id INNER JOIN sa.Device_List ON sa.pmcm_record.db_name = sa.Device_List.dbname WHERE     (sa.Material_List2.office = @P_office) AND (sa.Material_List2.Material = @P_Material)"
        'dtAdapter = New SqlDataAdapter(strSQL, objConn)
        'objCmd = dtAdapter.SelectCommand
        'objCmd.Parameters.Add("@P_office", SqlDbType.VarChar).Value = dkKeys(1)
        'objCmd.Parameters.Add("@P_Material", SqlDbType.VarChar).Value = dkKeys(0)
        'dtAdapter.Fill(dt)
        'Me.GridView3.DataSource = dtAdapter
        'Me.GridView3.Visible = True
        'objConn.Close()
        'End If
    End Sub

    Protected Sub ViewData()
        '*** DataTable ***'
        Dim dtAdapter As SqlDataAdapter
        Dim dt As New DataTable
        strSQL = "SELECT     sa.pmcm_record.date_operate, sa.pmcm_record.operation, sa.Device_List.op_id, sa.Material_List2.office, sa.Material_List2.Material FROM   sa.Material_List2 INNER JOIN sa.pmcm_record ON sa.Material_List2.pmcm_id = sa.pmcm_record.pmcm_id INNER JOIN sa.Device_List ON sa.pmcm_record.db_name = sa.Device_List.dbname WHERE     (sa.Material_List2.office = @P_office) AND (sa.Material_List2.Material = @P_Material)"
        dtAdapter = New SqlDataAdapter(strSQL, objConn)
        objCmd = dtAdapter.SelectCommand
        objCmd.Parameters.Add("@P_office", SqlDbType.VarChar).Value = Request.QueryString("P_office")
        dtAdapter.Fill(dt)

        If dt.Rows.Count > 0 Then
            '' Me.ImgPic.ImageUrl = "ViewImg.aspx?FilesID=" & dt.Rows(0)("FilesID")
            'Me.Label1.Text = dt.Rows(0)("op_id").ToString
            'Me.Label2.Text = dt.Rows(0)("location").ToString
        End If

    End Sub
End Class
