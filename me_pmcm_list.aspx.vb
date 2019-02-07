
Partial Class me_pmcm_list
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Me.GridView2.Visible = True
        'Me.Label1.Visible = True
        Label7.Text = DD_before_y.SelectedValue & "-" & DD_before_m.SelectedValue & "-" & DD_before_d.SelectedValue & " 00:00:00"
        Label8.Text = DD_after_y.SelectedValue & "-" & DD_after_m.SelectedValue & "-" & DD_after_d.SelectedValue & "  00:00:00"
        Me.SqlDataSource3.DataBind()
        Me.GridView2.DataBind()
    End Sub
    Protected Sub GridView2_RowCommand(ByVal source As Object, ByVal e As GridViewCommandEventArgs)
        If e.CommandName = "Page" OrElse e.CommandName = "Sort" Then Exit Sub
        Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        Dim dkKeys As DataKey
        dkKeys = GridView2.DataKeys(index)
        Dim sKeysArg As String = ""
        For Each s As String In dkKeys.Values.Keys
            sKeysArg += s + "='" + Convert.ToString(dkKeys(s)) & "'"
        Next s
        If sKeysArg = String.Empty Then
            Exit Sub
        End If
        If e.CommandName = "cmdEdit" Then
            Dim sStartPageURL As String = ""
            sStartPageURL = "me_pmce_list_detail.aspx?pmcm_id=" & Convert.ToString(dkKeys(0))
            Response.Redirect(sStartPageURL)
        End If
    End Sub

    Protected Sub GridView2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView2.SelectedIndexChanged

    End Sub
End Class
