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
Partial Class Device_type
    Inherits System.Web.UI.Page

    Protected Sub Linkbutton10_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Linkbutton10.Click
        Dim Ds As New DataSet
        Dim Dt As DataTable
        Dim Dr As DataRow
        Dim StrCon As New SqlConnection("SERVER=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
        Dim Adpt As New SqlDataAdapter("SELECT * FROM sa.[Type_Frtu]", StrCon)
        Adpt.Fill(Ds, "Type_Frtu")
        Dt = Ds.Tables("Type_Frtu")
        Dr = Dt.NewRow
        Dr("Team") = Me.RadioButtonList1.SelectedItem.Text
        Dr("type_frtu") = Me.TextBox1.Text
        Dr("office") = Session("UserOffice")
        Dr("id_team") = Me.RadioButtonList1.SelectedValue
        Dt.Rows.Add(Dr)
        Dim cdb As New SqlCommandBuilder(Adpt)
        Adpt.Update(Ds, "Type_Frtu")
        Ds.AcceptChanges()
        Me.TextBox1.Text = ""
        Me.GridView1.DataBind()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        UserClass.CheckLogin(Page)
        If Not func.CheckUserPermissions_access("Device_type.aspx", Session("User_access")) Then
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        Else
            Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        End If




        'UserClass.CheckLogin(Page)
        'If Not func.CheckUserPermissions("Device_type.aspx", "S") Then
        '    Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
        '    Response.End()
        'Else
        '    Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        '    'UserClass.login_page(UserLogin.UserName, "Device_type.aspx", "View")

        'End If
    End Sub
End Class
