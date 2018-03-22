
Partial Class report_km1
    Inherits System.Web.UI.Page
    Protected Sub GridView1_RowCommand(ByVal source As Object, ByVal e As GridViewCommandEventArgs)
       show_detail()
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

        If e.CommandName = "cmdView" Then
            Session("report_km1_damage_id") = Convert.ToString(dkKeys(0))
            'Me.SqlDataSource3.SelectCommand = func.SqlBuilder(SqlDataSource3.SelectCommand, "2=2 and " & sKeysArg)
            Me.SqlDataSource3.DataBind()
            Me.GridView2.DataBind()
            Me.SqlDataSource4.DataBind()
            Me.GridView4.DataBind()
            'Response.Redirect("Edit_Bu.aspx?" + sKeysArg)
        End If
    
    End Sub
    Protected Sub GridView2_RowCommand(ByVal source As Object, ByVal e As GridViewCommandEventArgs)

        'Me.Label3.Visible = True
        'If e.CommandName = "Page" OrElse e.CommandName = "Sort" Then Exit Sub

        'Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        'Dim dkKeys As DataKey
        ''If Me.GridView1.Visible = True Then

        'dkKeys = GridView2.DataKeys(index)
        ''Else
        ''    'dkKeys = dbGrid_upload.DataKeys(index)
        ''End If


        'Dim sKeysArg As String = ""
        'For Each s As String In dkKeys.Values.Keys
        '    sKeysArg += s + "='" + Convert.ToString(dkKeys(s)) & "'"
        'Next s
        'If sKeysArg = String.Empty Then
        '    Exit Sub
        'End If
        'Me.GridView4.Visible = True
        'If e.CommandName = "cmd_name" Then
        '    Session("sa_damage_name") = Convert.ToString(dkKeys(0))

        '    'Me.SqlDataSource4.SelectCommand = func.SqlBuilder(SqlDataSource4.SelectCommand, "2=2 and " & sKeysArg)
        '    Me.SqlDataSource4.DataBind()
        '    Me.GridView4.DataBind()


        '    'Response.Redirect("Edit_Bu.aspx?" + sKeysArg)
        'End If
        'If e.CommandName = "cmdEdit" Then
        '    Dim sStartPageURL As String = ""
        '    sStartPageURL = "Edit_work.aspx?pmcm_id=" & Convert.ToString(dkKeys(0))
        '    Response.Redirect(sStartPageURL)
        'End If
        ''If e.CommandName = "cmdView" Then
        ''    Response.Redirect("Edit_Pic.aspx?" + sKeysArg)
        ''End If
        ''If e.CommandName = "cmdStatus" Then
        ''    Response.Redirect("Edit_Status.aspx?" + sKeysArg)
        'End If

    End Sub

    Protected Sub RadioButtonList2_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList2.TextChanged
        Me.GridView1.Visible = False
       
        Me.Label1.Visible = False
        Me.Label2.Visible = False
        Me.Label3.Visible = False
        Me.Label4.Visible = True
        dis_detail()
    End Sub

    Protected Sub RadioButtonList1_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.TextChanged
        Me.GridView1.Visible = True
        Me.Label1.Visible = True
       dis_detail()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        UserClass.CheckLogin(Page)
        If Not func.CheckUserPermissions_access("Report_damage_his.aspx", Session("User_access")) Then
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        Else
            Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        End If






        'UserClass.CheckLogin(Page)
        'If Not func.CheckUserPermissions("Report_damage_his.aspx", "S") Then
        '    Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
        '    Response.End()
        'Else
        'End If
    End Sub
    Function show_detail()

        Me.GridView2.Visible = True
        Me.GridView4.Visible = True
        Me.Label2.Visible = True
        Me.Label3.Visible = True
        Return 0
    End Function
    Function dis_detail()

        Me.GridView2.Visible = False
        Me.GridView4.Visible = False
        Me.Label2.Visible = False
        Me.Label3.Visible = False
        Return 0
    End Function
End Class
