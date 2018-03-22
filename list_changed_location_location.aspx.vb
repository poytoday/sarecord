
Partial Class list_changed_location_location
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



        UserClass.CheckLogin(Page)
        If Not func.CheckUserPermissions_access("list_changed_location_location.aspx", Session("User_access")) Then
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        Else
            Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        End If



        'UserClass.CheckLogin(Page)
        'If Not func.CheckUserPermissions("list_changed_location_location.aspx", "S") Then
        '    Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
        '    Response.End()
        'Else
        'End If
    End Sub

    Protected Sub RadioButtonList2_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList2.TextChanged
        Me.Label3.Visible = True
        Me.RadioButtonList1.Visible = True
    End Sub
End Class
