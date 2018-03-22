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
Partial Class add_detail_property
    Inherits System.Web.UI.Page
    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        Dim Ds As New DataSet
        Dim Dt As DataTable
        Dim Dr As DataRow
        Dim StrCon As New SqlConnection("SERVER=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
        Dim Adpt As New SqlDataAdapter("SELECT * FROM sa.[Setting_Property]", StrCon)
        Adpt.Fill(Ds, "Setting_Property")
        Dt = Ds.Tables("Setting_Property")
        Dr = Dt.NewRow
        Dr("dbname") = Me.DD_Device.SelectedValue
        Dr("property") = Me.DropDownList1.SelectedValue
        Dr("detail") = Me.TextBox1.Text

        Dr("id_type_frtu") = Me.DD_type.SelectedValue
        Dt.Rows.Add(Dr)
        Dim cdb As New SqlCommandBuilder(Adpt)
        Adpt.Update(Ds, "Setting_Property")
        Ds.AcceptChanges()
        Me.TextBox1.Text = ""
        Me.GridView1.DataBind()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not func.CheckUserPermissions_access("add_detail_property.aspx", Session("User_access")) Then
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        Else
            Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        End If


        'UserClass.CheckLogin(Page)
        'If Not func.CheckUserPermissions("add_detail_property.aspx", "S") Then
        '    Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
        '    Response.End()
        'Else
        '    Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        '    'UserClass.login_page(UserLogin.UserName, "Damage.aspx", "View")

        'End If
    End Sub

    Protected Sub DD_type_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DD_type.TextChanged
        Me.DD_Area.DataBind()
        Me.DD_Device.DataBind()
        Me.GridView1.DataBind()
    End Sub

    Protected Sub DD_Device_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DD_Device.SelectedIndexChanged
        Me.GridView1.DataBind()
    End Sub
End Class
