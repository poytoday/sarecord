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
Partial Class receive_damage2
    Inherits System.Web.UI.Page

    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton2.Click
        Dim index As Integer = Convert.ToInt32(Me.GridView2.SelectedIndex)
        If index >= 0 Then
            Dim objConn As New SqlConnection
            Dim objCmd As SqlCommand
            Dim strConnString, strSQL As String
            strConnString = "Server=172.30.203.155;Uid=sa;PASSWORD=1234;database=SA_System;Max Pool Size=400;Connect Timeout=600;"
            objConn.ConnectionString = strConnString
            objConn.Open()
            Me.DropDownList4.Visible = True
            Dim Ds As New DataSet
            Dim Dt As DataTable
            Dim Dr As DataRow
            Dim dkKeys As DataKey

            dkKeys = GridView2.DataKeys(index)
            Dim StrCon As New SqlConnection("SERVER=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
            Dim Adpt As New SqlDataAdapter("SELECT * FROM sa.[Receive_damage]", StrCon)
            Adpt.Fill(Ds, "Receive_damage")
            Dt = Ds.Tables("Receive_damage")
            Dr = Dt.NewRow
            Dr("send_damage_id") = Convert.ToString(dkKeys(0))
            Dr("date_recive") = Date.Now
            Dr("operation_recive") = Me.TextBox2.Text
            Dr("office_name") = Session("UserOffice")
            Dr("status") = False
            Dt.Rows.Add(Dr)
            Dim cdb As New SqlCommandBuilder(Adpt)
            Adpt.Update(Ds, "Receive_damage")
            Ds.AcceptChanges()
            Me.DropDownList4.DataBind()
            List_name()
            Me.DropDownList4.Visible = False


            'Dim url As String
            'url = "list_receive_damage.aspx"
            'Response.Redirect(url)
            strSQL = "UPDATE [SA_System].[sa].[send_damage] SET status = 1 where send_damage_id = " & Convert.ToString(dkKeys(0))
            '& Request.QueryString("pmcm_id")
            objCmd = New SqlCommand(strSQL, objConn)
            objCmd.ExecuteNonQuery()
            objConn.Close()
            Me.GridView2.DataBind()
            Me.GridView3.DataBind()
            Me.CheckBoxList1.DataBind()
            Me.TextBox2.Text = ""
            Me.Label3.Visible = False
        Else
            Me.Label3.Visible = True
            Me.Label3.Text = "ยังไม่ได้มีการเลือกรายการซ่อมแก้ไข"

        End If
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
        If Not func.CheckUserPermissions_access("receive_damage2.aspx", Session("User_access")) Then
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

End Class
