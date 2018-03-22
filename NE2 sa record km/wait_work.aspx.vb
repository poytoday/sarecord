
Partial Class wait_work
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Me.GridView4.Visible = False
        UserClass.CheckLogin(Page)
        If Not func.CheckUserPermissions_access("wait_work.aspx", Session("User_access")) Then
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        Else
            Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        End If

        'Me.GridView4.Visible = False
        'UserClass.CheckLogin(Page)
        'If Not func.CheckUserPermissions("wait_work.aspx", "S") Then
        '    Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
        '    Response.End()
        'Else
        '    Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        '    'UserClass.login_page(UserLogin.UserName, "Damage.aspx", "View")

        'End If
    End Sub
    Protected Sub GridView1_RowCommand(ByVal source As Object, ByVal e As GridViewCommandEventArgs)
        Me.GridView4.Visible = True
        Me.Label3.Visible = True
        If e.CommandName = "Page" OrElse e.CommandName = "Sort" Then Exit Sub

        Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        Dim dkKeys As DataKey
        'If Me.GridView1.Visible = True Then

        dkKeys = GridView1.DataKeys(index)
        'Else
        '    'dkKeys = dbGrid_upload.DataKeys(index)
        'End If


        Dim sKeysArg As String = ""
        For Each s As String In dkKeys.Values.Keys
            sKeysArg += s + "='" + Convert.ToString(dkKeys(s)) & "'"
        Next s
        If sKeysArg = String.Empty Then
            Exit Sub
        End If

        If e.CommandName = "cmd_name" Then

            Me.SqlDataSource4.SelectCommand = func.SqlBuilder(SqlDataSource4.SelectCommand, "2=2 and pmcm_id= " & dkKeys(0))
            Me.SqlDataSource4.DataBind()
            Me.GridView4.DataBind()

            'Response.Redirect("Edit_Bu.aspx?" + sKeysArg)
        End If
        If e.CommandName = "cmdEdit" Then
            Dim sStartPageURL As String = ""
            Dim q_string As String = Convert.ToString(dkKeys(0))
            sStartPageURL = "Edit_work.aspx?pmcm_id=" & Convert.ToString(dkKeys(0)) & "&id_team=" & Convert.ToString(dkKeys(1))
            Response.Redirect(sStartPageURL)
        End If
        'If e.CommandName = "cmdView" Then
        '    Response.Redirect("Edit_Pic.aspx?" + sKeysArg)
        'End If
        'If e.CommandName = "cmdStatus" Then
        '    Response.Redirect("Edit_Status.aspx?" + sKeysArg)
        'End If

    End Sub
    Protected Sub GridView2_RowCommand(ByVal source As Object, ByVal e As GridViewCommandEventArgs)
        Me.GridView1.Visible = False
        Me.GridView3.Visible = True
        Me.Label1.Visible = True
        Me.Label2.Visible = False
        Me.Label3.Visible = False
        If e.CommandName = "Page" OrElse e.CommandName = "Sort" Then Exit Sub

        Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        Dim dkKeys As DataKey
        'If Me.GridView1.Visible = True Then

        dkKeys = GridView2.DataKeys(index)
        'Else
        '    'dkKeys = dbGrid_upload.DataKeys(index)
        'End If


        Dim sKeysArg As String = ""
        For Each s As String In dkKeys.Values.Keys
            sKeysArg += s + "='" + Convert.ToString(dkKeys(s)) & "'"
        Next s
        If sKeysArg = String.Empty Then
            Exit Sub
        End If

        If e.CommandName = "cmdView" Then
            Me.Label4.Visible = True
            Me.Label4.Text = Convert.ToString(dkKeys(0))
            Me.Label4.Visible = False

            'Me.SqlDataSource1.SelectCommand = func.SqlBuilder(SqlDataSource1.SelectCommand, "2=2 and " & sKeysArg)
            'Me.SqlDataSource1.DataBind()
            'Me.GridView1.DataBind()
            'Me.SqlDataSource3.SelectCommand = func.SqlBuilder(SqlDataSource3.SelectCommand, "2=2 and " & sKeysArg)
            'Me.SqlDataSource3.DataBind()
            'Me.GridView3.DataBind()
            'Response.Redirect("Edit_Bu.aspx?" + sKeysArg)
        End If

        'If e.CommandName = "cmdView" Then
        '    Response.Redirect("Edit_Pic.aspx?" + sKeysArg)
        'End If
        'If e.CommandName = "cmdStatus" Then
        '    Response.Redirect("Edit_Status.aspx?" + sKeysArg)
        'End If

    End Sub
    Protected Sub GridView3_RowCommand(ByVal source As Object, ByVal e As GridViewCommandEventArgs)
        Me.GridView1.Visible = True
        Me.Label2.Visible = True
        If e.CommandName = "Page" OrElse e.CommandName = "Sort" Then Exit Sub
        Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        Dim dkKeys As DataKey
        'If Me.GridView1.Visible = True Then

        dkKeys = GridView3.DataKeys(index)
        'Else
        '    'dkKeys = dbGrid_upload.DataKeys(index)
        'End If


        Dim sKeysArg As String = ""
        For Each s As String In dkKeys.Values.Keys
            sKeysArg += s + "='" + Convert.ToString(dkKeys(s)) & "'"
        Next s
        If sKeysArg = String.Empty Then
            Exit Sub
        End If


        If e.CommandName = "cmd_damage_id" Then

            Me.SqlDataSource1.SelectCommand = func.SqlBuilder(SqlDataSource1.SelectCommand, "2=2 and " & sKeysArg)
            Me.SqlDataSource1.DataBind()
            Me.GridView1.DataBind()

            'Response.Redirect("Edit_Bu.aspx?" + sKeysArg)
        End If


        'If e.CommandName = "cmdView" Then
        '    Response.Redirect("Edit_Pic.aspx?" + sKeysArg)
        'End If
        'If e.CommandName = "cmdStatus" Then
        '    Response.Redirect("Edit_Status.aspx?" + sKeysArg)
        'End If

    End Sub
End Class
