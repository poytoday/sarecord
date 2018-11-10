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
Imports System.IdentityModel.Selectors
Imports System.IdentityModel.Tokens
#End Region
Partial Class person
    Inherits System.Web.UI.Page
    Dim objConn As New SqlConnection
    Dim objCmd As SqlCommand
    Dim strConnString, strSQL, type_frtu As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        UserClass.CheckLogin(Page)
        'If Not func.CheckUserPermissions("person.aspx", "S") Then
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
        'Dim my_principal As String = 
        If Not func.CheckUserPermissions_access("person.aspx", Session("User_access")) Then
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
    End Sub
    Protected Sub ViewData()
        '*** DataTable ***'
        Dim dtAdapter As SqlDataAdapter
        Dim dt As New DataTable
       
        strSQL = "SELECT * FROM sa.[user] WHERE userid = @UserName"


        'strSQL = "SELECT Emp_ID, Names, Position, Team, DATE_WORK, DATE_BIRTH, office FROM sa.Names WHERE Emp_ID = @UserName"
        dtAdapter = New SqlDataAdapter(strSQL, objConn)
        objCmd = dtAdapter.SelectCommand
        objCmd.Parameters.Add("@UserName", SqlDbType.Int).Value = Session("UserName")
        dtAdapter.Fill(dt)
        If dt.Rows.Count > 0 Then
            Me.Label5.Text = dt.Rows(0)("userid").ToString
            Me.DropDownList3.SelectedValue = dt.Rows(0)("region").ToString
            Me.firstname.Text = dt.Rows(0)("name").ToString
            Me.position.Text = dt.Rows(0)("position").ToString
        End If
        If Session("User_access") = "region" Then
            Me.Button3.Visible = False
            Me.Button1.Visible = False
            Me.DropDownList1.Visible = False
            Me.DropDownList2.Visible = False
            Me.Label13.Visible = True
            Me.Label12.Visible = True
            Me.Label13.Text = "ผู้บริหารองค์กร"
            Me.Label12.Text = "ผู้บริหารองค์กร"
            Me.Panel1.Visible = True
        ElseIf Session("User_access") = "section" Then
            Me.Button1.Visible = False
            Me.DropDownList1.Visible = True
            Me.DropDownList2.Visible = False
            Me.Label13.Visible = False
            Me.Label12.Visible = True
            Me.Label12.Text = "ผู้บริหารหน่วยงาน"
            Me.DropDownList1.Text = dt.Rows(0)("office").ToString
        Else
            Me.Button3.Visible = True
            Me.Button1.Visible = True
            Me.DropDownList1.Text = dt.Rows(0)("office").ToString
            Me.DropDownList2.SelectedValue = dt.Rows(0)("id_team").ToString
        End If
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        strSQL = "UPDATE sa.[user] SET office = '" & Me.DropDownList1.Text & "' WHERE [userid] = " & Session("UserName")
        '& Request.QueryString("pmcm_id")
        objCmd = New SqlCommand(strSQL, objConn)
        objCmd.ExecuteNonQuery()
        Me.Label6.Text = "Updated"
    End Sub
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Try
            strSQL = "UPDATE sa.[user] SET id_team = '" & Me.DropDownList2.SelectedValue & "' WHERE [userid] = " & Session("UserName")
            '& Request.QueryString("pmcm_id")
            objCmd = New SqlCommand(strSQL, objConn)
            objCmd.ExecuteNonQuery()
            strSQL = "UPDATE sa.[user] SET team = '" & Me.DropDownList2.SelectedItem.Text & "' WHERE [userid] = " & Session("UserName")
            '& Request.QueryString("pmcm_id")
            objCmd = New SqlCommand(strSQL, objConn)
            objCmd.ExecuteNonQuery()
            Me.Label7.Text = "Updated"
        Catch ex As Exception
            Me.Label7.Text = ex.Message.ToString
        End Try

    End Sub
    'Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
    '    strSQL = "UPDATE sa.[user] SET password = '" & Me.TextBox1.Text & "' WHERE [userid] = " & Session("UserName")
    '    '& Request.QueryString("pmcm_id")
    '    objCmd = New SqlCommand(strSQL, objConn)
    '    objCmd.ExecuteNonQuery()
    '    Me.Label8.Text = "Updated"
    '    Dim url As String
    '    url = "Login.aspx"
    '    Response.Redirect(url)
    'End Sub
    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        strSQL = "UPDATE sa.[user] SET name = '" & Me.firstname.Text & "' WHERE [userid] = " & Session("UserName")
        objCmd = New SqlCommand(strSQL, objConn)
        objCmd.ExecuteNonQuery()
        Me.Label9.Text = "Updated"
    End Sub
    Protected Sub Button5_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button5.Click
        strSQL = "UPDATE sa.[user] SET position = '" & Me.position.Text & "' WHERE [userid] = " & Session("UserName")
        '& Request.QueryString("pmcm_id")
        objCmd = New SqlCommand(strSQL, objConn)
        objCmd.ExecuteNonQuery()
        Me.Label10.Text = "Updated"
    End Sub
    Protected Sub Button6_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button6.Click
        If Me.DropDownList3.Text = "" Then
        End If
        strSQL = "UPDATE sa.[user] SET region = '" & Me.DropDownList3.Text & "' WHERE [userid] = " & Session("UserName")
        '& Request.QueryString("pmcm_id")
        objCmd = New SqlCommand(strSQL, objConn)
        objCmd.ExecuteNonQuery()
        Me.Label11.Text = "Updated"
    End Sub

   
    Protected Sub DropDownList3_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList3.TextChanged
        Me.SqlDataSource1.FilterExpression = "region ='" & Me.DropDownList3.Text & "'"
        Me.SqlDataSource2.FilterExpression = "office ='" & Me.DropDownList1.Text & "'"
        Me.SqlDataSource2.DataBind()
        Me.DropDownList1.DataBind()
        Me.DropDownList2.DataBind()
    End Sub


    Protected Sub DropDownList1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.DataBound
        Me.SqlDataSource2.FilterExpression = "office ='" & Me.DropDownList1.Text & "'"
    End Sub
    Protected Sub DropDownList1_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.TextChanged
        Me.SqlDataSource2.FilterExpression = "office ='" & Me.DropDownList1.Text & "'"
    End Sub
    Protected Sub Button7_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button7.Click
        Me.SqlDataSource4.Insert()
        Me.GridView1.DataBind()
    End Sub
    Protected Sub GridView1_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.DataBinding
        Me.DropDownList4.DataBind()
    End Sub
End Class
