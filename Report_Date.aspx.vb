
Partial Class Report_Date
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Label2.Text = DD_before_y.SelectedValue - 543 & "-" & DD_before_m.SelectedValue & "-" & DD_before_d.SelectedValue & " 00:00:00"
        Label3.Text = DD_after_y.SelectedValue - 543 & "-" & DD_after_m.SelectedValue & "-" & DD_after_d.SelectedValue & "  00:00:00"

        SqlDataSource2.DataBind()
        GridView2.DataBind()
        UpdatePanel1.Update()
        GridView2.Visible = True
    End Sub


    Protected Sub DD_before_m_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DD_before_m.SelectedIndexChanged
        DD_after_m.SelectedValue = DD_before_m.SelectedValue
    End Sub

    Protected Sub DD_before_d_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DD_before_d.SelectedIndexChanged
        DD_after_d.SelectedValue = DD_before_d.SelectedValue
    End Sub

    Protected Sub RadioButtonList2_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList2.TextChanged
        Me.Label4.Visible = True
        Me.RadioButtonList1.Visible = True
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



        UserClass.CheckLogin(Page)
        If Not func.CheckUserPermissions_access("Report_Date.aspx", Session("User_access")) Then
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        Else
            Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        End If








        'UserClass.CheckLogin(Page)
        'If Not func.CheckUserPermissions("Report_Date.aspx", "S") Then
        '    Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
        '    Response.End()
        'Else
        '    Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        '    'UserClass.login_page(UserLogin.UserName, "Damage.aspx", "View")

        'End If
    End Sub
End Class
