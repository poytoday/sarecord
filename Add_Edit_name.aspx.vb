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
Partial Class Add_Edit_name
    Inherits System.Web.UI.Page
    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        List_name()
        Dim sStartPageURL As String = ""
        sStartPageURL = "Edit_work.aspx?pmcm_id=" & Request.QueryString("pmcm_id") & "&id_team=" & Request.QueryString("id_team")
        Response.Redirect(sStartPageURL)

    End Sub
    Protected Sub insert_name(ByVal ID As Integer)
        Dim Ds As New DataSet
        Dim Dt As DataTable
        Dim Dr As DataRow
        Dim StrCon As New SqlConnection("SERVER=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
        Dim Adpt As New SqlDataAdapter("SELECT * FROM sa.[Name_List]", StrCon)
        Adpt.Fill(Ds, "Name_List")
        Dt = Ds.Tables("Name_List")
        Dr = Dt.NewRow
        Dr("Emp_id") = ID
        Dr("pmcm_id") = Request.QueryString("pmcm_id")
        Dt.Rows.Add(Dr)
        Dim cdb As New SqlCommandBuilder(Adpt)
        Adpt.Update(Ds, "Name_List")
        Ds.AcceptChanges()
    End Sub
    Protected Sub List_name()
        Dim i As Integer = 0
        If Me.CheckBoxList1.Items.Count <> 0 Then
            For i = 0 To Me.CheckBoxList1.Items.Count - 1
                If Me.CheckBoxList1.Items(i).Selected = True Then
                    insert_name(CInt(Me.CheckBoxList1.Items(i).Value))
                End If
            Next
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        UserClass.CheckLogin(Page)
        If Not func.CheckUserPermissions_access("Add_Edit_name.aspx", Session("User_access")) Then
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        Else
            Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        End If

        'UserClass.CheckLogin(Page)
        'If Not func.CheckUserPermissions("Add_Edit_name.aspx", "S") Then
        '    Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
        '    Response.End()
        'Else
        '    Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        '    'UserClass.login_page(UserLogin.UserName, "Add_Edit_name.aspx", "View")

        'End If
    End Sub
End Class
