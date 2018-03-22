#Region " Imports "
Imports System
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Collections
Imports System.Configuration
Imports System.Threading
Imports System.Globalization
Imports System.Data.OleDb
Imports System.IO
Imports System.Data.SqlClient
#End Region
Partial Class add_pic_device
    Inherits System.Web.UI.Page
    Dim objConn As New SqlConnection
    Dim objCmd As SqlCommand
    Dim strConnString, strSQL As String
    Protected Sub Button1_Click1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Insert_file()
        Me.GridView5.DataBind()
    End Sub
    Protected Sub Insert_file()
        Dim fupath As FileUpload = Uploadfldpath 'CType(uploadDetailsView.FindControl("Uploadfldpath"), FileUpload)
        Dim txtpath As TextBox = fldpath 'CType(uploadDetailsView.FindControl("fldpath"), TextBox)
        If fupath.PostedFile.ContentLength > 0 Then
            Dim sFileName As String = fupath.PostedFile.FileName
            sFileName = sFileName.Remove(0, sFileName.LastIndexOfAny("\/".ToCharArray()) + 1)
            fupath.PostedFile.SaveAs(Server.MapPath("upload/" + sFileName))
        End If
        Insert_Work_To_Pic()
    End Sub
    Protected Sub Insert_Work_To_Pic()
        'Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        Dim Ds As New DataSet
        Dim Dt As DataTable
        Dim Dr As DataRow
        Dim StrCon As New SqlConnection("SERVER=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
        Dim Adpt As New SqlDataAdapter("SELECT * FROM sa.[Device_PIC] WHERE 2<>2", StrCon)
        Adpt.Fill(Ds, "Device_PIC")
        Dt = Ds.Tables("Device_PIC")
        Dr = Dt.NewRow
        Dr("db_name") = Request.QueryString("dbname")
        Dr("PATH_PIC") = Me.Uploadfldpath.FileName
        Dr("Detail") = Me.TextBox1.Text
        Dr("Type") = Me.RadioButtonList1.Text
        Dr("Type_pic") = "device"
        Dt.Rows.Add(Dr)
        Dim cdb As New SqlCommandBuilder(Adpt)
        Adpt.Update(Ds, "Device_PIC")
        Ds.AcceptChanges()
    End Sub
    Protected Sub GridView5_RowCommand(ByVal source As Object, ByVal e As GridViewCommandEventArgs)
        If e.CommandName = "Page" OrElse e.CommandName = "Sort" Then Exit Sub

        Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        Dim dkKeys As DataKey
        dkKeys = GridView5.DataKeys(index)

        Dim sKeysArg As String = ""
        For Each s As String In dkKeys.Values.Keys
            sKeysArg += s + "='" + Convert.ToString(dkKeys(s)) & "'"
        Next s
        If sKeysArg = String.Empty Then
            Exit Sub
        End If
        If e.CommandName = "cmdDelete" Then
            Dim strSQL As String
            strSQL = "DELETE FROM sa.Device_PIC WHERE RUN_ID = " & Convert.ToString(dkKeys(0))
            '& Request.QueryString("pmcm_id")
            objCmd = New SqlCommand(strSQL, objConn)
            objCmd.ExecuteNonQuery()
            Me.GridView5.DataBind()
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        UserClass.CheckLogin(Page)
        If Not func.CheckUserPermissions_access("add_pic_device.aspx", Session("User_access")) Then
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        Else
            Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        End If

        'UserClass.CheckLogin(Page)
        'If Not func.CheckUserPermissions("add_pic_device.aspx", "S") Then
        '    Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
        '    Response.End()
        'Else
        '    Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        '    'UserClass.login_page(UserLogin.UserName, "Edit_damage.aspx", "View")
        '    strConnString = "Server=172.30.203.155;Uid=sa;PASSWORD=1234;database=SA_System;Max Pool Size=400;Connect Timeout=600;"
        '    objConn.ConnectionString = strConnString
        '    objConn.Open()
        '    'If Not Page.IsPostBack() Then
        '    '    ViewData()
        '    'End If
        'End If
    End Sub
End Class
