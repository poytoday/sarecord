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
Partial Class change_location
    Inherits System.Web.UI.Page
    Dim objConn As New SqlConnection
    Dim objCmd As SqlCommand
    Dim strConnString, strSQL, type_frtu As String
    Dim userLogin As UserClass = New UserClass()
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        UserClass.CheckLogin(Page)
        If Not func.CheckUserPermissions_access("change_location.aspx", Session("User_access")) Then
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        Else
            Dim UserLogin As UserClass = CType(Session("User"), UserClass)
            'UserClass.login_page(UserLogin.UserName, "change_location.aspx", "View")
            strConnString = "Server=172.30.203.155;Uid=sa;PASSWORD=1234;database=SA_System;Max Pool Size=400;Connect Timeout=600;"
            objConn.ConnectionString = strConnString
            objConn.Open()
            ViewData()
        End If






        'UserClass.CheckLogin(Page)
        'If Not func.CheckUserPermissions("change_location.aspx", "S") Then
        '    Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
        '    Response.End()
        'Else
        '    Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        '    'UserClass.login_page(UserLogin.UserName, "change_location.aspx", "View")
        '    strConnString = "Server=172.30.203.155;Uid=sa;PASSWORD=1234;database=SA_System;Max Pool Size=400;Connect Timeout=600;"
        '    objConn.ConnectionString = strConnString
        '    objConn.Open()
        '    ViewData()
        'End If

    End Sub
    Protected Sub ViewData()
        '*** DataTable ***'
        Dim dtAdapter As SqlDataAdapter
        Dim dt As New DataTable
        strSQL = "SELECT * FROM sa.Device_List WHERE dbname = @dbname "
        dtAdapter = New SqlDataAdapter(strSQL, objConn)
        objCmd = dtAdapter.SelectCommand
        objCmd.Parameters.Add("@dbname", SqlDbType.VarChar).Value = Request.QueryString("dbname")
        dtAdapter.Fill(dt)

        If dt.Rows.Count > 0 Then
            ' Me.ImgPic.ImageUrl = "ViewImg.aspx?FilesID=" & dt.Rows(0)("FilesID")
            Me.Label1.Text = dt.Rows(0)("op_id").ToString
            Me.Label2.Text = dt.Rows(0)("location").ToString
        End If

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        Dim Ds As New DataSet
        Dim Dt As DataTable
        Dim Dr As DataRow
        Dim StrCon As New SqlConnection("SERVER=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
        Dim Adpt As New SqlDataAdapter("SELECT * FROM sa.[Move_Device] WHERE 2<>2", StrCon)
        Adpt.Fill(Ds, "Move_Device")
        Dt = Ds.Tables("Move_Device")
        Dr = Dt.NewRow
        Dr("db_name") = Request.QueryString("dbname")
        Dr("before") = Me.Label1.Text
        Dr("after") = Me.TextBox1.Text
        Dr("page_number") = Me.TextBox2.Text
        Dr("remark") = Me.TextBox3.Text
        Dr("Type") = Me.RadioButtonList1.SelectedValue
        Dr("user_name") = userLogin.UserName
        Dr("date_changed") = Date.Now
        Dt.Rows.Add(Dr)
        Dim cdb As New SqlCommandBuilder(Adpt)
        Adpt.Update(Ds, "Move_Device")
        Ds.AcceptChanges()
        strSQL = "UPDATE sa.Device_List SET op_id = '" & Me.TextBox1.Text & "' WHERE [dbname] = '" & Request.QueryString("dbname") & "'"
        '& Request.QueryString("pmcm_id")
        objCmd = New SqlCommand(strSQL, objConn)
        objCmd.ExecuteNonQuery()
        Dim sStartPageURL As String = ""
        sStartPageURL = "Device_list.aspx"
        Response.Redirect(sStartPageURL)
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dim Ds As New DataSet
        Dim Dt As DataTable
        Dim Dr As DataRow
        Dim StrCon As New SqlConnection("SERVER=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
        Dim Adpt As New SqlDataAdapter("SELECT * FROM sa.[Move_Device] WHERE 2<>2", StrCon)
        Adpt.Fill(Ds, "Move_Device")
        Dt = Ds.Tables("Move_Device")
        Dr = Dt.NewRow
        Dr("db_name") = Request.QueryString("dbname")
        Dr("before") = Me.Label2.Text
        Dr("after") = Me.TextBox4.Text
        Dr("page_number") = Me.TextBox5.Text
        Dr("remark") = Me.TextBox6.Text
        Dr("Type") = Me.RadioButtonList1.SelectedValue
        Dr("user_name") = userLogin.UserName
        Dr("date_changed") = Date.Now

        Dt.Rows.Add(Dr)
        Dim cdb As New SqlCommandBuilder(Adpt)
        Adpt.Update(Ds, "Move_Device")
        Ds.AcceptChanges()
        strSQL = "UPDATE sa.Device_List SET location = '" & Me.TextBox4.Text & "' WHERE [dbname] = '" & Request.QueryString("dbname") & "'"
        '& Request.QueryString("pmcm_id")
        objCmd = New SqlCommand(strSQL, objConn)
        objCmd.ExecuteNonQuery()
        Dim sStartPageURL As String = ""
        sStartPageURL = "Device_list.aspx"
        Response.Redirect(sStartPageURL)
    End Sub

    Protected Sub RadioButtonList1_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.TextChanged
        If Me.RadioButtonList1.SelectedValue = "device" Then
            Me.Panel1.Visible = True
            Me.Panel2.Visible = False
            Me.Panel3.Visible = False
        ElseIf Me.RadioButtonList1.SelectedValue = "location" Then
            Me.Panel1.Visible = False
            Me.Panel2.Visible = True
            Me.Panel3.Visible = False
        Else
            Me.Panel1.Visible = False
            Me.Panel2.Visible = False
            Me.Panel3.Visible = True
        End If
    End Sub

 

    Protected Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click

    End Sub
End Class
