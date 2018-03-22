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
Partial Class order_type
    Inherits System.Web.UI.Page

    Protected Sub Linkbutton10_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Linkbutton10.Click
        Dim Ds As New DataSet
        Dim Dt As DataTable
        Dim Dr As DataRow
        Dim StrCon As New SqlConnection("SERVER=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
        Dim Adpt As New SqlDataAdapter("SELECT * FROM sa.[order_type]", StrCon)
        Adpt.Fill(Ds, "order_type")
        Dt = Ds.Tables("order_type")
        Dr = Dt.NewRow
        Dr("order_type") = Me.TextBox1.Text
        Dr("office") = Session("UserOffice")
        Dr("view_list") = Session("User_access")
        Dr("owner") = False
        Dr("section") = False
        Dr("region") = False
        Dr("front_office") = False
        If Me.CheckBoxList1.Items.Count <> 0 Then
            For j = 0 To Me.CheckBoxList1.Items.Count - 1
                If Me.CheckBoxList1.Items(j).Selected = True Then
                    If CheckBoxList1.Items(j).Value = "owner" Then
                        Dr("owner") = True
                    ElseIf CheckBoxList1.Items(j).Value = "section" Then
                        Dr("section") = True
                    ElseIf CheckBoxList1.Items(j).Value = "region" Then
                        Dr("region") = True
                    ElseIf CheckBoxList1.Items(j).Value = "front_office" Then
                        Dr("front_office") = True
                    End If
                End If
            Next
        End If
        Dt.Rows.Add(Dr)
        Dim cdb As New SqlCommandBuilder(Adpt)
        Adpt.Update(Ds, "order_type")
        Ds.AcceptChanges()
        Me.TextBox1.Text = ""
        Me.GridView1.DataBind()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



        UserClass.CheckLogin(Page)
        If Not func.CheckUserPermissions_access("order_type.aspx", Session("User_access")) Then
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        Else
            Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        End If








        'UserClass.CheckLogin(Page)
        'If Not func.CheckUserPermissions("order_type.aspx", "S") Then
        '    Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
        '    Response.End()
        'Else
        '    Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        '    ' UserClass.login_page(UserLogin.UserName, "Device.aspx", "View")

        'End If
    End Sub
End Class
