
Partial Class report_for_vor9
    Inherits System.Web.UI.Page
    Protected Sub GridView1_RowCommand(ByVal source As Object, ByVal e As GridViewCommandEventArgs)
        If e.CommandName = "Page" OrElse e.CommandName = "Sort" Then Exit Sub

        Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        Dim dkKeys As DataKey
        dkKeys = GridView1.DataKeys(index)

        Dim sKeysArg As String = ""
        For Each s As String In dkKeys.Values.Keys
            sKeysArg += s + "='" + Convert.ToString(dkKeys(s)) & "'"
        Next s
        If sKeysArg = String.Empty Then
            Exit Sub
        End If
        If e.CommandName = "cmdEdit" Then
            Dim sStartPageURL As String = ""
            sStartPageURL = "Edit_work.aspx?pmcm_id=" & Convert.ToString(dkKeys(0))
            Response.Redirect(sStartPageURL)
        End If
    End Sub
    Protected Sub GridView4_RowCommand(ByVal source As Object, ByVal e As GridViewCommandEventArgs)
        If e.CommandName = "Page" OrElse e.CommandName = "Sort" Then Exit Sub

        Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        Dim dkKeys As DataKey
        dkKeys = GridView4.DataKeys(index)

        Dim sKeysArg As String = ""
        For Each s As String In dkKeys.Values.Keys
            sKeysArg += s + "='" + Convert.ToString(dkKeys(s)) & "'"
        Next s
        If sKeysArg = String.Empty Then
            Exit Sub
        End If
        If e.CommandName = "cmdEdit" Then

            Dim sStartPageURL As String = ""
            sStartPageURL = "Edit_damage.aspx?id=" & Convert.ToString(dkKeys(1)) & "&id_type_frtu= " & Convert.ToInt32(dkKeys(2)) & "&id_damage_list=" & Convert.ToString(dkKeys(0)) & "&pmcm_id=" & Convert.ToString(dkKeys(3))
            Response.Redirect(sStartPageURL)

            'Dim sStartPageURL As String = ""
            'sStartPageURL = "Edit_damage.aspx?id_damage_list=" & Convert.ToString(dkKeys(0))
            'Response.Redirect(sStartPageURL)
        End If
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        UserClass.CheckLogin(Page)
        If Not func.CheckUserPermissions_access("report_for_vor9.aspx", Session("User_access")) Then
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        Else
            Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        End If

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Me.GridView9.Visible = False
        Me.SqlDataSource11.DataBind()
        Me.GridView8.DataBind()
        Me.GridView8.Visible = True
    End Sub

    Protected Sub GridView8_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView8.SelectedIndexChanged
        Me.GridView7.DataBind()
        Me.GridView7.Visible = True
        Me.GridView8.Visible = False
        Me.GridView9.Visible = True

    End Sub
End Class