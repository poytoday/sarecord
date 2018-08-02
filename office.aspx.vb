#Region "Imports"
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
Partial Class office
    Inherits System.Web.UI.Page

    Protected Sub Linkbutton10_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Linkbutton10.Click
        Dim Ds As New DataSet
        Dim Dt As DataTable
        Dim Dr As DataRow
        Dim StrCon As New SqlConnection("SERVER=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
        Dim Adpt As New SqlDataAdapter("SELECT * FROM sa.[office_name]", StrCon)
        Adpt.Fill(Ds, "office_name")
        Dt = Ds.Tables("office_name")
        Dr = Dt.NewRow
        Dr("office") = Me.TextBox1.Text
        Dr("region") = Me.DropDownList1.Text
        Dt.Rows.Add(Dr)
        Dim cdb As New SqlCommandBuilder(Adpt)
        Adpt.Update(Ds, "office_name")
        Ds.AcceptChanges()

        Me.GridView1.DataBind()

        Dim Adpt2 As New SqlDataAdapter("SELECT * FROM sa.[order_type]", StrCon)
        Adpt2.Fill(Ds, "order_type")
        Dt = Ds.Tables("order_type")
        Dr = Dt.NewRow
        Dr("order_type") = "ส่งงาน-หผ. รับทราบ"
        Dr("office") = Me.TextBox1.Text
        Dr("view_list") = "owner"
        Dr("owner") = True
        Dr("section") = True
        Dr("region") = False
        Dr("front_office") = False
        Dt.Rows.Add(Dr)
        Dim cdb2 As New SqlCommandBuilder(Adpt2)
        Adpt2.Update(Ds, "order_type")
        Ds.AcceptChanges()
        Me.TextBox1.Text = ""
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        UserClass.CheckLogin(Page)
        If Not func.CheckUserPermissions_access("office.aspx", Session("User_access")) Then
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        Else
            Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        End If





        'UserClass.CheckLogin(Page)
        'If Not func.CheckUserPermissions("office.aspx", "S") Then
        '    Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
        '    Response.End()
        'Else
        '    Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        '    'UserClass.login_page(UserLogin.UserName, "Operation.aspx", "View")

        'End If
    End Sub
End Class
