
Partial Class frist
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        UserClass.CheckLogin(Page)
        If Not func.CheckUserPermissions_access("frist.aspx", Session("User_access")) Then
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        Else
            Dim UserLogin As UserClass = CType(Session("User"), UserClass)
            Session("User2") = UserLogin.UserName
        End If





        'UserClass.CheckLogin(Page)
        'If Not func.CheckUserPermissions("frist.aspx", "S") Then
        '    Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
        '    Response.End()
        'Else
        '    'UserClass.login_page(UserLogin.UserName, "frist.aspx", "View")
        '    Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        '    Session("User2") = UserLogin.UserName
        '    'BindData()
        'End If

        'Me.GridView2.DataBind()
    End Sub

    Protected Sub BindData()
        Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        Try
       
        Catch ex As Exception
            'lblMessage.Text += "Error description" & ": " & ex.Message & "<p>"
        End Try
    End Sub
    Protected Sub GridView2_RowCommand(ByVal source As Object, ByVal e As GridViewCommandEventArgs)
        Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        Me.GridView1.Visible = True
        Me.Label1.Visible = True
        If e.CommandName = "Page" OrElse e.CommandName = "Sort" Then Exit Sub

        Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        Dim dkKeys As DataKey
        dkKeys = GridView2.DataKeys(index)
        Dim sKeysArg As String = ""
        For Each s As String In dkKeys.Values.Keys
            sKeysArg += s + "='" + Convert.ToString(dkKeys(s)) & "'"
            Session("id_type_frtu1") = Convert.ToString(dkKeys(0))
        Next s
        If sKeysArg = String.Empty Then
            Exit Sub
        End If



        If e.CommandName = "cmdView" Then
            'Me.SqlDataSource1.SelectCommand = ""
            'Me.SqlDataSource1.SelectCommand = "SELECT * FROM sa.[View_first_page]  where 2=2  and Emp_ID = " & UserLogin.UserName & " and " & sKeysArg & "order by date_operate desc"
            'Me.SqlDataSource1.DataBind()
            'Me.GridView1.Visible = True
            'Me.GridView1.DataBind()
            Me.Label1.Visible = True
        End If
    End Sub
    Protected Sub GridView3_RowCommand(ByVal source As Object, ByVal e As GridViewCommandEventArgs)
        Dim UserLogin As UserClass = CType(Session("User"), UserClass)

        Me.Label2.Visible = True
        If e.CommandName = "Page" OrElse e.CommandName = "Sort" Then Exit Sub

        Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        Dim dkKeys As DataKey
        dkKeys = GridView3.DataKeys(index)
        'dkKeys2 = GridView3.DataKeys(index)
        'Dim sKeysArg As String = ""
        'For Each s As String In dkKeys.Values.Keys
        'sKeysArg += s + "='" + Convert.ToString(dkKeys(s)) & "'"
        Session("id_type_device2") = Convert.ToString(dkKeys(0))
        Session("status_work2") = Convert.ToString(dkKeys(1))


        If e.CommandName = "cmdView" Then
            Me.GridView4.Visible = True
            Me.GridView4.DataBind()
            Me.Label2.Visible = True
        End If
    End Sub
    Protected Sub GridView4_RowCommand(ByVal source As Object, ByVal e As GridViewCommandEventArgs)
        If e.CommandName = "Page" OrElse e.CommandName = "Sort" Then Exit Sub

        Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        Dim dkKeys As DataKey
        'If Me.GridView1.Visible = True Then

        dkKeys = GridView4.DataKeys(index)
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

        If e.CommandName = "cmdEdit" Then
            Dim sStartPageURL As String = ""
            sStartPageURL = "Edit_work.aspx?pmcm_id=" & Convert.ToString(dkKeys(0)) & "&id_team=" & Convert.ToString(dkKeys(1))
            Response.Redirect(sStartPageURL)
        End If
    End Sub
    Protected Sub GridView1_RowCommand(ByVal source As Object, ByVal e As GridViewCommandEventArgs)
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

        If e.CommandName = "cmdEdit" Then
            Dim sStartPageURL As String = ""
            sStartPageURL = "Edit_work.aspx?pmcm_id=" & Convert.ToString(dkKeys(0)) & "&id_team=" & Convert.ToString(dkKeys(1))
            Response.Redirect(sStartPageURL)
        End If
    End Sub
End Class
