
Partial Class all_section
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        UserClass.CheckLogin(Page)
        If Not func.CheckUserPermissions_access("all_section.aspx", Session("User_access")) Then
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        Else
            Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        End If




        'UserClass.CheckLogin(Page)
        'If Not func.CheckUserPermissions("all_section.aspx", "S") Then
        '    Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
        '    Response.End()

        'End If
    End Sub
   

    Protected Sub RadioButtonList2_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList2.TextChanged
        Me.RadioButtonList1.DataBind()
        Me.GridView1.DataBind()
    End Sub

    Protected Sub RadioButtonList3_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList3.TextChanged
        Me.RadioButtonList2.DataBind()
        'Me.SqlDataSource1.DataBind()
        Me.RadioButtonList1.DataBind()
        Me.GridView1.DataBind()
    End Sub


End Class
