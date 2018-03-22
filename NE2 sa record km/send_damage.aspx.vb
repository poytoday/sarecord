'Option Explicit On
'Option Strict On
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
Partial Class send_damage
    Inherits System.Web.UI.Page

    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton2.Click
        Dim office As String
        For Each Item In Me.CheckBoxList1.Items
            Dim Checked As Boolean = Item.selected
            If Checked = True Then

                office = Item.ToString
                'MsgBox(Item.ToString)
          
        Me.DropDownList4.Visible = True
        Dim Ds As New DataSet
        Dim Dt As DataTable
        Dim Dr As DataRow
        Dim StrCon As New SqlConnection("SERVER=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
        Dim Adpt As New SqlDataAdapter("SELECT * FROM sa.[send_damage]", StrCon)
        Adpt.Fill(Ds, "send_damage")
        Dt = Ds.Tables("send_damage")
        Dr = Dt.NewRow
        'Dr("db_name") = Me.DD_Device.SelectedValue.ToString
        Dr("date_in") = Me.Calendar1.SelectedDate
        Dr("damage") = Me.TextBox1.Text
        Dr("book_num") = Me.TextBox3.Text
        Dr("status") = False
                Dr("office_name") = office
        Dr("operation_order") = Me.TextBox2.Text
        Dt.Rows.Add(Dr)
        Dim cdb As New SqlCommandBuilder(Adpt)
        Adpt.Update(Ds, "send_damage")
        Ds.AcceptChanges()
        Me.DropDownList4.DataBind()

        Me.DropDownList4.Visible = False
            End If

        Next
        Dim url As String
        Me.Label2.Text = "ดำเนินการส่งข้อมูลเรียบร้อย"
        Me.TextBox1.Text = ""
        Me.TextBox2.Text = ""
        Me.TextBox3.Text = ""
        Me.Label1.Text = ""
        Me.CheckBoxList1.DataBind()
        'url = "send_damage.aspx"
        'Response.Redirect(url)
    End Sub
    Protected Sub List_name()
        'Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        Dim i As Integer = 0
        'insert_receive_emp(CInt(UserLogin.UserName))
        If Me.CheckBoxList1.Items.Count <> 0 Then
            For i = 0 To Me.CheckBoxList1.Items.Count - 1
                If Me.CheckBoxList1.Items(i).Selected = True Then
                    insert_receive_emp(CInt(Me.CheckBoxList1.Items(i).Value))
                End If
            Next
        End If
    End Sub
    Protected Sub insert_receive_emp(ByVal ID As Integer)
        Dim Ds As New DataSet
        Dim Dt As DataTable
        Dim Dr As DataRow
        Dim StrCon As New SqlConnection("SERVER=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
        Dim Adpt As New SqlDataAdapter("SELECT * FROM sa.[Receive_damage_emp_id]", StrCon)
        Adpt.Fill(Ds, "Receive_damage_emp_id")
        Dt = Ds.Tables("Receive_damage_emp_id")
        Dr = Dt.NewRow
        Dr("receive_damage_id") = Me.DropDownList4.SelectedValue
        Dr("emp_id") = ID
        Dt.Rows.Add(Dr)
        Dim cdb As New SqlCommandBuilder(Adpt)
        Adpt.Update(Ds, "Receive_damage_emp_id")
        Ds.AcceptChanges()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        UserClass.CheckLogin(Page)
        If Not func.CheckUserPermissions_access("receive_damage.aspx", Session("User_access")) Then
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        Else
            Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        End If






        'UserClass.CheckLogin(Page)
        'If Not func.CheckUserPermissions("add_damage.aspx", "S") Then
        '    Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
        '    Response.End()
        'Else
        '    Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        '    ' UserClass.login_page(UserLogin.UserName, "add_damage.aspx", "View")
        'End If
    End Sub
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Me.Calendar1.Visible = True
        Me.Button1.Visible = False
    End Sub

    Protected Sub Calendar1_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Calendar1.SelectionChanged
        Me.Calendar1.Visible = False
        Me.Button1.Visible = True
        Me.Label1.Text = Me.Calendar1.SelectedDate.ToString
    End Sub
End Class
