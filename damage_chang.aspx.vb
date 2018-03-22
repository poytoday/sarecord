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
Partial Class damage_chang
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        UserClass.CheckLogin(Page)
        If Not func.CheckUserPermissions_access("damage_chang.aspx", Session("User_access")) Then
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        Else
            Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        End If




        'UserClass.CheckLogin(Page)
        'If Not func.CheckUserPermissions("damage_chang.aspx", "S") Then
        '    Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
        '    Response.End()
        'Else
        '    Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        '    'UserClass.login_page(UserLogin.UserName, "Damage.aspx", "View")

        'End If
    End Sub

    Protected Sub RadioButtonList2_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList2.TextChanged
        Me.Label3.Visible = True
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        Dim objConn As New SqlConnection
        Dim objCmd As SqlCommand
        Dim strConnString, strSQL As String

        strConnString = "Server=172.30.203.155;Uid=sa;PASSWORD=1234;database=SA_System;Max Pool Size=400;Connect Timeout=600;"
        objConn.ConnectionString = strConnString
        objConn.Open()
        strSQL = "UPDATE sa.[Damage_List] SET damage_id = " & Me.DropDownList2.SelectedValue & " WHERE [damage_id] = " & Me.DropDownList1.SelectedValue
        '& Request.QueryString("pmcm_id")
        objCmd = New SqlCommand(strSQL, objConn)
        objCmd.ExecuteNonQuery()
        Me.Label4.Text = "Updated"
        If Me.CheckBox1.Checked = True Then
            strSQL = "DELETE FROM [SA_System].[sa].[Damage_Type] WHERE id_damage = " & Me.DropDownList1.SelectedValue
            objCmd = New SqlCommand(strSQL, objConn)
            objCmd.ExecuteNonQuery()
        End If
        objConn.Close()
        Me.DropDownList1.DataBind()
        'Me.DropDownList2.DataBind()
        Me.GridView1.DataBind()
        Me.GridView2.DataBind()
    End Sub

    Protected Sub RadioButtonList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.SelectedIndexChanged
        Me.Panel1.Visible = True
        Me.DropDownList1.DataBind()
        Me.DropDownList2.DataBind()
        Me.GridView1.DataBind()
        Me.GridView2.DataBind()
    End Sub

    Protected Sub DropDownList1_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.TextChanged
        Me.DropDownList2.DataBind()
        Me.GridView2.DataBind()
    End Sub
End Class
