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
Partial Class order_section_sum_detail
    Inherits System.Web.UI.Page
    Dim objConn As New SqlConnection
    Dim objCmd, objCmd2 As SqlCommand
    Dim strConnString, strSQL As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        UserClass.CheckLogin(Page)
        If Not func.CheckUserPermissions_access("order_section_sum_detail.aspx", Session("User_access")) Then
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
        'If Not func.CheckUserPermissions("order_section_sum_detail.aspx", "S") Then
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
    Protected Sub ViewData()
        '*** DataTable ***'
        Dim dtAdapter, dtAdapter2 As SqlDataAdapter
        Dim dt, dt2 As New DataTable
        strSQL = "SELECT * FROM sa.View_pmcm_name_list WHERE pmcm_id = @pmcm_id"
        dtAdapter = New SqlDataAdapter(strSQL, objConn)
        objCmd = dtAdapter.SelectCommand
        objCmd.Parameters.Add("@pmcm_id", SqlDbType.Int).Value = Request.QueryString("pmcm_id")
        dtAdapter.Fill(dt)
        If dt.Rows.Count > 0 Then
            Me.Label2.Text = dt.Rows(0)("op_id").ToString
            Me.Label4.Text = dt.Rows(0)("operation").ToString
            Me.Label5.Text = dt.Rows(0)("date_operate").ToString
            Me.Label6.Text = dt.Rows(0)("date_num").ToString & " ชม."
            Me.Label7.Text = dt.Rows(0)("status_work").ToString
            Me.Label8.Text = dt.Rows(0)("remark").ToString
            Me.Label3.Text = dt.Rows(0)("sap_id").ToString

        End If
        DataBind_gridview1()
        DataBind_gridview2()
        strSQL = "SELECT pmcm_id, order_section_detail, id_order_type FROM sa.order_detail_section WHERE pmcm_id = @pmcm_id"
        dtAdapter2 = New SqlDataAdapter(strSQL, objConn)
        objCmd2 = dtAdapter2.SelectCommand
        objCmd2.Parameters.Add("@pmcm_id", SqlDbType.Int).Value = Request.QueryString("pmcm_id")
        dtAdapter2.Fill(dt2)
        If dt2.Rows.Count > 0 Then
            Me.DropDownList1.SelectedValue = dt2.Rows(0)("id_order_type").ToString
            Me.TextBox1.Text = dt2.Rows(0)("order_section_detail").ToString
        End If

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

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        strSQL = "UPDATE sa.order_detail_section SET id_order_type = '" & Me.DropDownList1.SelectedValue & "' WHERE [pmcm_id] = " & Request.QueryString("pmcm_id")
        '& Request.QueryString("pmcm_id")
        objCmd = New SqlCommand(strSQL, objConn)
        objCmd.ExecuteNonQuery()
        strSQL = "UPDATE sa.pmcm_record SET order_id = '" & Me.DropDownList1.SelectedValue & "' WHERE [pmcm_id] = " & Request.QueryString("pmcm_id")
        '& Request.QueryString("pmcm_id")
        objCmd = New SqlCommand(strSQL, objConn)
        objCmd.ExecuteNonQuery()
        Me.Label9.Text = "OK"
        Me.Label10.Text = ""
    End Sub

    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton2.Click
        strSQL = "UPDATE sa.order_detail_section SET order_section_detail = '" & Me.TextBox1.Text & "' WHERE [pmcm_id] = " & Request.QueryString("pmcm_id")
        '& Request.QueryString("pmcm_id")
        objCmd = New SqlCommand(strSQL, objConn)
        objCmd.ExecuteNonQuery()
        Me.Label10.Text = "OK"
        Me.Label9.Text = ""
    End Sub

    Protected Sub LinkButton3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton3.Click
        Dim sStartPageURL As String = ""
        sStartPageURL = "order_section_his.aspx"
        Response.Redirect(sStartPageURL)
    End Sub
End Class

