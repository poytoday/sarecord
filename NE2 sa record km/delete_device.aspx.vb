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
Partial Class delete_device
    Inherits System.Web.UI.Page
    Dim objConn As New SqlConnection
    Dim objCmd As SqlCommand
    Dim strConnString, strSQL As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        UserClass.CheckLogin(Page)
        If Not func.CheckUserPermissions_access("delete_device.aspx", Session("User_access")) Then
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        Else
            Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        End If




        'Me.Button1.Attributes.Add("OnClick", "return confirm('Are you sure delete?');")
        'UserClass.CheckLogin(Page)
        'If Not func.CheckUserPermissions("delete_device.aspx", "S") Then
        '    Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
        '    Response.End()
        'Else
        '    Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        '    UserClass.login_page(UserLogin.UserName, "Damage.aspx", "View")
        'End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Me.Label7.Visible = True
        strConnString = "Server=172.30.203.155;Uid=sa;PASSWORD=1234;database= SA_System;Max Pool Size=400;Connect Timeout=600;"
        objConn.ConnectionString = strConnString
        objConn.Open()
        strSQL = "DELETE FROM [SA_System].[sa].[Device_List] WHERE id = " & Me.Label7.Text
        objCmd = New SqlCommand(strSQL, objConn)
        objCmd.ExecuteNonQuery()
        insert_operation_data()
        Me.Label7.Visible = False
        'Response.Redirect("delete_device.aspx")
        Me.Panel1.Visible = False
        objConn.Close()
        Me.DD_Area.DataBind()
        Me.DD_Device.DataBind()
    End Sub
    Protected Sub DD_Device_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DD_Device.SelectedIndexChanged
        Me.Panel1.Visible = True
        ViewData()
    End Sub
    Protected Sub insert_operation_data()
        '*** DataTable ***'
        Dim Ds As New DataSet
        Dim Dt As DataTable
        Dim Dr As DataRow
        Dim StrCon As New SqlConnection("Server=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
        Dim Adpt As New SqlDataAdapter("SELECT *  FROM [SA_System].[sa].[operation_data] where 1<>1", StrCon)
        Adpt.Fill(Ds, "operation_data")
        Dt = Ds.Tables("operation_data")
        Dr = Dt.NewRow
        Dr("dbname") = Me.Label1.Text
        Dr("detail") = Me.Label1.Text & Me.Label1.Text & Me.Label1.Text & Me.Label1.Text
        Dr("user_operation") = Session("UserName")
        Dr("date_operation") = Date.Now
        Dr("operation") = "delete"
        Dt.Rows.Add(Dr)
        Dim cdb As New SqlCommandBuilder(Adpt)
        Adpt.Update(Ds, "operation_data")
        Ds.AcceptChanges()
        Me.Label9.Text = "ลบข้อมูล " & Me.Label1.Text & Me.Label1.Text & Me.Label1.Text & Me.Label1.Text & " สำเร็จ"
        objConn.Close()
    End Sub
    Protected Sub ViewData()
        Me.Label7.Visible = False
        'Me.Label9.Text = ""
        '*** DataTable ***'

        strConnString = "Server=172.30.203.155;Uid=sa;PASSWORD=1234;database= SA_System;Max Pool Size=400;Connect Timeout=600;"
        objConn.ConnectionString = strConnString
        objConn.Open()
        Dim dtAdapter As SqlDataAdapter
        Dim dt As New DataTable
        strSQL = "SELECT * FROM [SA_System].[sa].[Device_List] WHERE dbname = @dbname"
        dtAdapter = New SqlDataAdapter(strSQL, objConn)
        objCmd = dtAdapter.SelectCommand
        objCmd.Parameters.Add("@dbname", SqlDbType.Char).Value = Me.DD_Device.SelectedValue
        dtAdapter.Fill(dt)
        If dt.Rows.Count > 0 Then
            ' Me.ImgPic.ImageUrl = "ViewImg.aspx?FilesID=" & dt.Rows(0)("FilesID")
            Me.Label1.Text = dt.Rows(0)("dbname")
            Me.Label2.Text = dt.Rows(0)("op_id")
            Me.Label3.Text = dt.Rows(0)("location")
            'Me.Label4.Text = dt.Rows(0)("product")
            Me.Label7.Text = dt.Rows(0)("id")
            Me.Label5.Text = dt.Rows(0)("office")
        End If
        dt = Nothing
        objConn.Close()
    End Sub
    Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Unload
        objConn.Close()
    End Sub
    Protected Sub DD_Device_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DD_Device.TextChanged
        Me.Label9.Text = ""
        Me.Panel1.Visible = True
        ViewData()
    End Sub

    Protected Sub DD_Area_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DD_Area.TextChanged
        Me.Label9.Text = ""
        Me.Panel1.Visible = True
        Me.DS_Device.DataBind()
        Me.DD_Device.DataBind()
        ViewData()
    End Sub

    Protected Sub RadioButtonList1_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.TextChanged
        Me.Label9.Text = ""
        Me.Panel1.Visible = True
        Me.DD_Area.DataBind()
        Me.DS_Device.DataBind()
        Me.DD_Device.DataBind() '
        ViewData()
    End Sub
End Class
