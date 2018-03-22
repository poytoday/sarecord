
Partial Class report_work_by_time
    Inherits System.Web.UI.Page

    Protected Sub DropDownList1_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.TextChanged
        Me.SqlDataSource3.DataBind()
        Me.GridView1.DataBind()
    End Sub

    Protected Sub DD_Type_Device_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DD_Type_Device.TextChanged
        Me.SqlDataSource3.DataBind()
        Me.GridView1.DataBind()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        UserClass.CheckLogin(Page)
        If Not func.CheckUserPermissions_access("report_work_by_time.aspx", Session("User_access")) Then
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        Else
            Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        End If







        'UserClass.CheckLogin(Page)
        'If Not func.CheckUserPermissions("all_page.aspx", "S") Then
        '    Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
        '    Response.End()
        'Else
        '    Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        '    'UserClass.login_page(UserLogin.UserName, "Damage.aspx", "View")
        'End If
    End Sub
End Class
