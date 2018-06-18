
Partial Class admin_flag
    Inherits System.Web.UI.Page
    Protected Sub GridView1_RowCommand(ByVal source As Object, ByVal e As GridViewCommandEventArgs)
        If e.CommandName = "Page" OrElse e.CommandName = "Sort" Then Exit Sub
        Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        Dim dkKeys As DataKey


        dkKeys = GridView1.DataKeys(index)

        Dim sKeysArg As String = ""
        If e.CommandName = "cmd_access_en" Then

            'Response.Redirect("Edit_Bu.aspx?" + sKeysArg)
            Me.SqlDataSource1.UpdateCommand = "UPDATE sa.[user] SET [active_flag] = 1 " & "WHERE [userid] = " & Convert.ToString(dkKeys(0))
            Me.SqlDataSource1.Update()
            GridView2.DataBind()
        End If

    End Sub
    Protected Sub GridView2_RowCommand(ByVal source As Object, ByVal e As GridViewCommandEventArgs)
        'Me.Label2.Visible = True
        If e.CommandName = "Page" OrElse e.CommandName = "Sort" Then Exit Sub
        Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        Dim dkKeys As DataKey
        'If Me.GridView1.Visible = True Then

        dkKeys = GridView2.DataKeys(index)
        'Else
        '    'dkKeys = dbGrid_upload.DataKeys(index)
        'End If
        Dim sKeysArg As String = ""

        'Me.Label3.Visible = True
        'Me.Label3.Text = Convert.ToString(dkKeys(0))
        If e.CommandName = "cmd_access_dis" Then
            'Me.SqlDataSource2.SelectCommand = func.SqlBuilder(SqlDataSource2.SelectCommand, "2=2 and " & sKeysArg)
            'Me.SqlDataSource2.DataBind()
            'Me.GridView2.DataBind()
            'Me.GridView2.Visible = True
            'Me.Label3.Visible = False
            'Response.Redirect("Edit_Bu.aspx?" + sKeysArg)
            Me.SqlDataSource2.UpdateCommand = "UPDATE sa.[user] SET [active_flag] = 0 " & "WHERE [userid] = " & Convert.ToString(dkKeys(0))
            Me.SqlDataSource2.Update()
            GridView1.DataBind()
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        UserClass.CheckLogin(Page)
        If Not func.CheckUserPermissions_access("admin_flag.aspx", Session("User_access")) Then
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        Else
            Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        End If

        'UserClass.CheckLogin(Page)
        'If Not func.CheckUserPermissions("admin_flag.aspx", "S") Then
        '    Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
        '    Response.End()

        'End If
    End Sub
End Class
