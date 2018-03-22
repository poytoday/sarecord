
Partial Class View_work_device
    Inherits System.Web.UI.Page
    Protected Sub GridView1_RowCommand(ByVal source As Object, ByVal e As GridViewCommandEventArgs)
        If e.CommandName = "Page" OrElse e.CommandName = "Sort" Then Exit Sub
        Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        Dim dkKeys As DataKey
        dkKeys = GridView1.DataKeys(index)

        Dim sKeysArg As String = ""
        For Each s As String In dkKeys.Values.Keys
            sKeysArg += s + "='" + Convert.ToString(dkKeys(s)) & "'" & "&"
        Next s
        If sKeysArg = String.Empty Then
            Exit Sub
        End If
        If e.CommandName = "cmdEdit" Then
            Dim sStartPageURL As String = ""
            'sStartPageURL = "Edit_work.aspx?" & sKeysArg
            sStartPageURL = "Edit_work.aspx?pmcm_id=" & Convert.ToString(dkKeys(0)) & "&id_team=" & Convert.ToString(dkKeys(1))
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
        End If
    End Sub
End Class
