
Partial Class select_detail_proprety
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        UserClass.CheckLogin(Page)
        If Not func.CheckUserPermissions_access("select_detail_proprety.aspx", Session("User_access")) Then
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        Else
            Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        End If







        'UserClass.CheckLogin(Page)
        'If Not func.CheckUserPermissions("select_detail_proprety.aspx", "S") Then
        '    Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
        '    Response.End()
        'Else
        '    Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        '    'UserClass.login_page(UserLogin.UserName, "Damage.aspx", "View")

        'End If
    End Sub
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
        If e.CommandName = "cmdView" Then
            Dim sStartPageURL As String = ""
            sStartPageURL = "View_work_device.aspx?dbname=" & Convert.ToString(dkKeys(0))
            Response.Redirect(sStartPageURL)
        End If
        If e.CommandName = "cmd_pic" Then
            Dim sStartPageURL As String = ""
            sStartPageURL = "add_pic_device.aspx?dbname=" & Convert.ToString(dkKeys(0))
            Response.Redirect(sStartPageURL)
        End If
        If e.CommandName = "cmd_edit" Then
            Dim sStartPageURL As String = ""
            sStartPageURL = "change_location.aspx?dbname=" & Convert.ToString(dkKeys(0))
            Response.Redirect(sStartPageURL)
        End If
        If e.CommandName = "cmd_detail" Then
            Dim sStartPageURL As String = ""
            sStartPageURL = "Detail_device.aspx?dbname=" & Convert.ToString(dkKeys(0))
            Response.Redirect(sStartPageURL)
        End If
    End Sub
    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        Me.GridView2.Visible = True
        Me.GridView2.DataBind()
        ExportToExcel("Report.xls", GridView2)
    End Sub
    Private Sub ExportToExcel(ByVal strFileName As String, ByVal dg As GridView)
        Response.Clear()
        Response.Buffer = True
        Response.ContentType = "application/vnd.ms-excel"
        Response.Charset = "Utf-8"
        Me.EnableViewState = False
        Dim oStringWriter As New System.IO.StringWriter
        Dim oHtmlTextWriter As New System.Web.UI.HtmlTextWriter(oStringWriter)

        dg.RenderControl(oHtmlTextWriter)

        Response.Write(oStringWriter.ToString())
        Response.[End]()

    End Sub
    Public Overloads Overrides Sub VerifyRenderingInServerForm(ByVal control As Control)

    End Sub
End Class
