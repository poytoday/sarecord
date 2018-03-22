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
Partial Class Edit_work
    Inherits System.Web.UI.Page
    Dim objConn As New SqlConnection
    Dim objCmd As SqlCommand
    Dim strConnString, strSQL, type_frtu As String
    Protected Sub ViewData()
        '*** DataTable ***'
        Dim dtAdapter As SqlDataAdapter
        Dim dt As New DataTable
        strSQL = "SELECT * FROM sa.View_pmcm_name_list WHERE pmcm_id = @pmcm_id"
        dtAdapter = New SqlDataAdapter(strSQL, objConn)
        objCmd = dtAdapter.SelectCommand
        objCmd.Parameters.Add("@pmcm_id", SqlDbType.Int).Value = Request.QueryString("pmcm_id")
        dtAdapter.Fill(dt)
        If dt.Rows.Count > 0 Then
            Me.Label2.Text = dt.Rows(0)("op_id").ToString
            Try
                Me.DD_operation.Text = dt.Rows(0)("operation")
            Catch ex As Exception
                Label4.Text = "การปฎิบัติงานไม่มีใน Cattalog กรุณาแก้ไข"
            End Try

            Me.TextBox2.Text = dt.Rows(0)("date_operate")
            Me.DropDownList3.Text = dt.Rows(0)("date_num").ToString
            Me.RadioButtonList2.SelectedValue = dt.Rows(0)("status_work")
            Me.TextBox1.Text = dt.Rows(0)("remark")
            Me.TextBox3.Text = dt.Rows(0)("sap_id").ToString
            type_frtu = dt.Rows(0)("id_type_frtu")
        End If
        DataBind_gridview1()
        DataBind_gridview2()
    End Sub
    Protected Sub DataBind_gridview1()
        '*** DataTable ***'
        Me.SqlDataSource1.SelectCommand = func.SqlBuilder(SqlDataSource1.SelectCommand, "2=2  and [pmcm_id] = " & Request.QueryString("pmcm_id").Replace("2=2 and ", ""))
        'Me.SqlDataSource1.SelectCommand = func.SqlBuilder(SqlDataSource1.SelectCommand, "2=2  and [pmcm_id] = 2882")
        Me.SqlDataSource1.DataBind()
        Me.GridView1.DataBind()
    End Sub
    Protected Sub DataBind_gridview2()
        '*** DataTable ***'
        Me.SqlDataSource2.SelectCommand = func.SqlBuilder(SqlDataSource2.SelectCommand, "2=2  and [pmcm_id] = " & Request.QueryString("pmcm_id").Replace("2=2 and ", ""))
        'Me.SqlDataSource1.SelectCommand = func.SqlBuilder(SqlDataSource1.SelectCommand, "2=2  and [pmcm_id] = 2882")
        Me.SqlDataSource2.DataBind()
        Me.GridView2.DataBind()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.Button1.Attributes.Add("OnClick", "return confirm('Are you sure delete?');")
        UserClass.CheckLogin(Page)
        If Not func.CheckUserPermissions_access("Edit_work.aspx", Session("User_access")) Then
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        Else
            strConnString = "Server=172.30.203.155;Uid=sa;PASSWORD=1234;database=SA_System;Max Pool Size=400;Connect Timeout=600;"
            objConn.ConnectionString = strConnString
            objConn.Open()

            Dim UserLogin As UserClass = CType(Session("User"), UserClass)
            If Not Page.IsPostBack() Then
                ViewData()

            End If
        End If




        'Me.Button1.Attributes.Add("OnClick", "return confirm('Are you sure delete?');")
        'UserClass.CheckLogin(Page)
        'If Not func.CheckUserPermissions("Edit_work.aspx", "S") Then
        '    Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
        '    Response.End()
        'Else
        '    strConnString = "Server=172.30.203.155;Uid=sa;PASSWORD=1234;database=SA_System;Max Pool Size=400;Connect Timeout=600;"
        '    objConn.ConnectionString = strConnString
        '    objConn.Open()
        '    Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        '    'UserClass.login_page(UserLogin.UserName, "Edit_work.aspx", "View")

        '    If Not Page.IsPostBack() Then
        '        ViewData()

        '    End If
        'End If


    End Sub

    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton2.Click
        'Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        'UPDATE_STATUS("MODIFY", before, after, "Name_BU", UserLogin.UserName)
        strSQL = "UPDATE sa.pmcm_record SET operation = '" & Me.DD_operation.Text & "' WHERE [pmcm_id] = " & Request.QueryString("pmcm_id")

        '& Request.QueryString("pmcm_id")
        objCmd = New SqlCommand(strSQL, objConn)
        objCmd.ExecuteNonQuery()
        Me.Label4.Text = "OK"
    End Sub
    Protected Sub LinkButton3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton3.Click
        'Dim s_date As String = Me.Calendar1.SelectedDate.Year & "-" & Me.Calendar1.SelectedDate.Month & "-" & Me.Calendar1.SelectedDate.Date
        strSQL = "UPDATE sa.pmcm_record SET date_operate = '" & Me.TextBox2.Text & " 00:00:00' WHERE [pmcm_id] = " & Request.QueryString("pmcm_id")
        '& Request.QueryString("pmcm_id")
        objCmd = New SqlCommand(strSQL, objConn)
        objCmd.ExecuteNonQuery()
        Me.Label5.Text = "OK"
    End Sub

    Protected Sub LinkButton4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton4.Click
        strSQL = "UPDATE sa.pmcm_record SET date_num = '" & Me.DropDownList3.Text & "' WHERE [pmcm_id] = " & Request.QueryString("pmcm_id")

        '& Request.QueryString("pmcm_id")
        objCmd = New SqlCommand(strSQL, objConn)
        objCmd.ExecuteNonQuery()
        Me.Label6.Text = "OK"
    End Sub
    Protected Sub GridView1_RowCommand(ByVal source As Object, ByVal e As GridViewCommandEventArgs)
        If e.CommandName = "Page" OrElse e.CommandName = "Sort" Then Exit Sub
        Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        Dim dkKeys As DataKey

        dkKeys = GridView1.DataKeys(index)

        Dim sKeysArg As String = ""
        Dim sKeysArg2 As String = ""
        For Each s As String In dkKeys.Values.Keys
            sKeysArg += s + "='" + Convert.ToString(dkKeys(s)) & "'"
            sKeysArg2 += s + "=" + Convert.ToString(dkKeys(s))
        Next s
        If sKeysArg = String.Empty Then
            Exit Sub
        End If

     
        If e.CommandName = "cmdDelet" Then

            'DELETE FROM Name_List WHERE (id = @id)
            strSQL = "DELETE FROM sa.Name_List WHERE id = " & Convert.ToString(dkKeys(0))
            'Request.QueryString("pmcm_id")
            objCmd = New SqlCommand(strSQL, objConn)
            objCmd.ExecuteNonQuery()
            Me.GridView1.DataBind()
        End If

        If e.CommandName = "cmdEdit" Then
            Dim sStartPageURL As String = ""
            sStartPageURL = "Edit_name.aspx?id=" & Convert.ToString(dkKeys(0)) & "&Emp_id=" & Convert.ToString(dkKeys(1)) & "&pmcm_id=" & Convert.ToString(dkKeys(2)) & "&id_team=" & Request.QueryString("id_team")
            Response.Redirect(sStartPageURL)
        End If
        If e.CommandName = "cmdAdd" Then
            Dim sStartPageURL As String = ""
            sStartPageURL = "Add_Edit_name.aspx?pmcm_id=" & Convert.ToString(dkKeys(2)) & "&id_team=" & Request.QueryString("id_team")
            Response.Redirect(sStartPageURL)
        End If
        DataBind_gridview1()
    End Sub

    Protected Sub GridView2_RowCommand(ByVal source As Object, ByVal e As GridViewCommandEventArgs)
        If e.CommandName = "Page" OrElse e.CommandName = "Sort" Then Exit Sub
        Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        Dim dkKeys As DataKey
        dkKeys = GridView2.DataKeys(index)
        Dim sKeysArg As String = ""
        Dim sKeysArg2 As String = ""
        For Each s As String In dkKeys.Values.Keys
            sKeysArg += s + "='" + Convert.ToString(dkKeys(s)) & "'"
            sKeysArg2 += s + "=" + Convert.ToString(dkKeys(s))
        Next s
        If sKeysArg = String.Empty Then
            Exit Sub
        End If
        If e.CommandName = "cmdDelet" Then
            strSQL = "DELETE FROM sa.Damage_List WHERE sa.Damage_List.id = " & Convert.ToString(dkKeys(2))
            'Request.QueryString("pmcm_id")
            objCmd = New SqlCommand(strSQL, objConn)
            objCmd.ExecuteNonQuery()
            Me.GridView2.DataBind()
        End If

        If e.CommandName = "cmdEdit" Then
            Dim sStartPageURL As String = ""
            sStartPageURL = "Edit_damage.aspx?id_damage=" & Convert.ToString(dkKeys(1)) & "&id_type_frtu=" & (dkKeys(3)) & "&id_damage_list=" & Convert.ToString(dkKeys(2)) & "&pmcm_id=" & Convert.ToString(dkKeys(0)) & "&id_team=" & Request.QueryString("id_team")
            Response.Redirect(sStartPageURL)
        End If
        If e.CommandName = "cmdAdd" Then
            Dim sStartPageURL As String = ""
            sStartPageURL = "Add_Edit_damage.aspx?pmcm_id=" & Convert.ToString(dkKeys(0)) & "&id_type_frtu=" & (dkKeys(3)) & "&id_team=" & Request.QueryString("id_team")
            Response.Redirect(sStartPageURL)
        End If

    End Sub
    'Protected Sub GridView2_RowCommand(ByVal source As Object, ByVal e As GridViewCommandEventArgs)

    '    If e.CommandName = "Page" OrElse e.CommandName = "Sort" Then Exit Sub

    '    Dim index As Integer = Convert.ToInt32(e.CommandArgument)
    '    Dim dkKeys As DataKey
    '    'If Me.GridView1.Visible = True Then

    '    dkKeys = GridView2.DataKeys(index)
    '    'Else
    '    '    'dkKeys = dbGrid_upload.DataKeys(index)
    '    'End If


    '    Dim sKeysArg As String = ""
    '    Dim sKeysArg2 As String = ""
    '    For Each s As String In dkKeys.Values.Keys
    '        sKeysArg += s + "='" + Convert.ToString(dkKeys(0)) & "'"
    '        sKeysArg2 += s + "=" + Convert.ToString(dkKeys(s))
    '    Next s
    '    If sKeysArg = String.Empty Then
    '        Exit Sub
    '    End If

    '    'If e.CommandName = "cmd_name" Then

    '    '    Me.SqlDataSource2.SelectCommand = func.SqlBuilder(SqlDataSource2.SelectCommand, "2=2 and " & sKeysArg)
    '    '    Me.SqlDataSource2.DataBind()
    '    '    Me.GridView2.DataBind()

    '    '    'Response.Redirect("Edit_Bu.aspx?" + sKeysArg)
    '    'End If
    '    If e.CommandName = "cmdDelet" Then

    '        'DELETE FROM Name_List WHERE (id = @id)
    '        strSQL = "DELETE FROM sa.Damage_List WHERE id = " & Convert.ToString(dkKeys(0))
    '        'Request.QueryString("pmcm_id")
    '        objCmd = New SqlCommand(strSQL, objConn)
    '        objCmd.ExecuteNonQuery()
    '        Me.GridView2.DataBind()
    '    End If

    '    If e.CommandName = "cmdEdit" Then
    '        'Dim dtAdapter As SqlDataAdapter
    '        'Dim dt As New DataTable
    '        'strSQL = "SELECT * FROM View_pmcm_name_list WHERE pmcm_id = @pmcm_id "
    '        'dtAdapter = New SqlDataAdapter(strSQL, objConn)
    '        'objCmd = dtAdapter.SelectCommand
    '        'objCmd.Parameters.Add("@pmcm_id", SqlDbType.Int).Value = "2882"
    '        'dtAdapter.Fill(dt)

    '        'If dt.Rows.Count > 0 Then
    '        '    'type_frtu = dt.Rows(0)("type_frtu")

    '        'End If
    '        Dim sStartPageURL As String = ""
    '        sStartPageURL = "Edit_damage.aspx?id=" & Convert.ToString(dkKeys(1)) & "&id_type_frtu=" & (dkKeys(2)) & "&id_damage_list=" & Convert.ToString(dkKeys(0)) & "&pmcm_id=" & Convert.ToString(dkKeys(3))
    '        Response.Redirect(sStartPageURL)

    '        'Response.Redirect("Edit_damage.aspx?" + sKeysArg2)
    '    End If
    '    If e.CommandName = "cmdAdd" Then
    '        Dim sStartPageURL As String = ""
    '        sStartPageURL = "Add_Edit_damage.aspx?pmcm_id=" & Convert.ToString(dkKeys(3)) & "&id_type_frtu=" & (dkKeys(2))
    '        Response.Redirect(sStartPageURL)
    '    End If
    '    DataBind_gridview()
    'End Sub

    Protected Sub LinkButton7_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton7.Click
        strSQL = "UPDATE sa.pmcm_record SET sap_id = '" & Me.TextBox3.Text & "' WHERE [pmcm_id] = " & Request.QueryString("pmcm_id")
        '& Request.QueryString("pmcm_id")
        objCmd = New SqlCommand(strSQL, objConn)
        objCmd.ExecuteNonQuery()
        Me.Label3.Text = "OK"
    End Sub

    Protected Sub LinkButton5_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton5.Click
        strSQL = "UPDATE sa.pmcm_record SET status_work = '" & Me.RadioButtonList2.Text & "' WHERE [pmcm_id] = " & Request.QueryString("pmcm_id")
        '& Request.QueryString("pmcm_id")
        objCmd = New SqlCommand(strSQL, objConn)
        objCmd.ExecuteNonQuery()
        Me.Label7.Text = "OK"
    End Sub

    Protected Sub LinkButton6_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton6.Click
        strSQL = "UPDATE sa.pmcm_record SET remark = '" & Me.TextBox1.Text & "' WHERE [pmcm_id] = " & Request.QueryString("pmcm_id")
        '& Request.QueryString("pmcm_id")
        objCmd = New SqlCommand(strSQL, objConn)
        objCmd.ExecuteNonQuery()
        Me.Label8.Text = "OK"
    End Sub


    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        strSQL = "DELETE FROM [SA_System].[sa].[pmcm_record] WHERE  [pmcm_id] = " & Request.QueryString("pmcm_id")
        objCmd = New SqlCommand(strSQL, objConn)
        objCmd.ExecuteNonQuery()
        Dim sStartPageURL As String
        sStartPageURL = "wait_work.aspx"
        Response.Redirect(sStartPageURL)
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Me.Calendar1.Visible = True
        Me.Button1.Visible = False
    End Sub
    Protected Sub Calendar1_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Calendar1.SelectionChanged
        Me.Calendar1.Visible = False
        Me.Button1.Visible = True
        Dim s_date As String = Me.Calendar1.SelectedDate.Year & "-" & Me.Calendar1.SelectedDate.Month & "-" & Me.Calendar1.SelectedDate.Day
        Me.TextBox2.Text = s_date
    End Sub
End Class
