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
Partial Class Materaial
    Inherits System.Web.UI.Page

    Protected Sub Linkbutton10_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Linkbutton10.Click
        Dim Ds As New DataSet
        Dim Dt As DataTable
        Dim Dr As DataRow
        Dim StrCon As New SqlConnection("SERVER=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
        Dim Adpt As New SqlDataAdapter("SELECT * FROM sa.[Material] where 1<>1", StrCon)
        Adpt.Fill(Ds, "Material")
        Dt = Ds.Tables("Material")
        Dr = Dt.NewRow
        Dr("material_type") = Me.DropDownList1.SelectedValue
        Dr("number_material") = Me.TextBox2.Text
        Dr("office") = Session("UserOffice")
        Dr("date_income") = Me.Calendar1.SelectedDate
        Dr("note") = Me.TextBox3.Text
        Dt.Rows.Add(Dr)
        Dim cdb As New SqlCommandBuilder(Adpt)
        Adpt.Update(Ds, "Material")
        Ds.AcceptChanges()
        Me.TextBox1.Text = ""
        Me.TextBox2.Text = ""
        Me.TextBox3.Text = ""
        Me.TextBox4.Text = ""
        Me.GridView1.DataBind()
        Me.GridView2.DataBind()
    End Sub
    Protected Sub Calendar1_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Calendar1.SelectionChanged
        Me.Calendar1.Visible = False
        Me.Button1.Visible = True
        Me.TextBox4.Text = Me.Calendar1.SelectedDate.ToString
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



        UserClass.CheckLogin(Page)
        If Not func.CheckUserPermissions_access("Materaial.aspx", Session("User_access")) Then
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        Else
            Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        End If





        'UserClass.CheckLogin(Page)
        'If Not func.CheckUserPermissions("Materraial.aspx", "S") Then
        '    Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
        '    Response.End()
        'Else
        'End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Me.Calendar1.Visible = True
        Me.Button1.Visible = False
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dim Ds As New DataSet
        Dim Dt As DataTable
        Dim Dr As DataRow
        Dim StrCon As New SqlConnection("SERVER=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
        Dim Adpt As New SqlDataAdapter("SELECT * FROM sa.[material_type] where 1<>1", StrCon)
        Adpt.Fill(Ds, "material_type")
        Dt = Ds.Tables("material_type")
        Dr = Dt.NewRow
        Dr("material_type") = Me.TextBox1.Text
        Dr("office") = Session("UserOffice")
        Dt.Rows.Add(Dr)
        Dim cdb As New SqlCommandBuilder(Adpt)
        Adpt.Update(Ds, "material_type")
        Ds.AcceptChanges()
        Me.TextBox1.Text = ""
        Me.DropDownList1.DataBind()
        'Me.GridView1.DataBind()
    End Sub
End Class
