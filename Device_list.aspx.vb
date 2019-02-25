
Partial Class Device_list
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

    Protected Sub RadioButtonList1_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.TextChanged
        'If (RadioButtonList1.SelectedValue = "SF6" Or RadioButtonList1.SelectedValue = "REC" Or RadioButtonList1.SelectedValue = "Recloser") Then
        Me.Label1.Visible = True

        Me.DropDownList1.Visible = True
        Me.GridView2.Visible = True
        Me.CheckBox1.Visible = True
    End Sub

    Protected Sub RadioButtonList2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList2.SelectedIndexChanged
        'Me.GridView1.Visible = False
        'Me.GridView2.Visible = False
        Me.Label2.Visible = True
        Me.RadioButtonList1.Visible = True
        Me.Label1.Visible = False
        Me.DropDownList1.Visible = False
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        UserClass.CheckLogin(Page)
        If Not func.CheckUserPermissions_access("Device_list.aspx", Session("User_access")) Then
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        Else
            Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        End If




        'UserClass.CheckLogin(Page)
        'If Not func.CheckUserPermissions("Device_list.aspx", "S") Then
        '    Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
        '    Response.End()
        'Else
        '    Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        '    'UserClass.login_page(UserLogin.UserName, "Operation.aspx", "View")

        'End If
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        Me.GridView3.Visible = True
        Me.GridView3.DataBind()
        ExportToExcel("SA_Report_" & Date.Now.ToShortDateString & ".xls", GridView3)

    End Sub
    Private Sub ExportToExcel(ByVal strFileName As String, ByVal dg As GridView)
        Response.Clear()
        Response.Buffer = True
        Response.ContentType = "application/vnd.ms-excel"
        Response.AddHeader("content-disposition", "attachment;filename=" & strFileName)
        Response.Charset = "Utf-8"
        Me.EnableViewState = False
        Dim oStringWriter As New System.IO.StringWriter
        Dim oHtmlTextWriter As New System.Web.UI.HtmlTextWriter(oStringWriter)

        dg.RenderControl(oHtmlTextWriter)

        Response.Write(oStringWriter.ToString())
        Response.[End]()
        Me.GridView3.Visible = False
    End Sub
    Public Overloads Overrides Sub VerifyRenderingInServerForm(ByVal control As Control)

    End Sub
    Protected Sub CheckBox1_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBox1.CheckedChanged
        If Me.CheckBox1.Checked = True Then

            Me.GridView1.Visible = True
            Me.GridView2.Visible = False
            Me.SqlDataSource6.DataBind()
            Me.DropDownList1.Visible = False
        Else
            Me.GridView2.Visible = True
            Me.GridView1.Visible = False
            Me.SqlDataSource5.DataBind()
            Me.DropDownList1.Visible = True
        End If
    End Sub
End Class
