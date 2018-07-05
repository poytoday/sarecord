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
Partial Class _Default
    Inherits System.Web.UI.Page
    Dim db As New DataClassesDataContext()
    Dim objConn As New SqlConnection
    Dim objCmd As SqlCommand
    Dim strConnString, strSQL, type_frtu As String
    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        If Me.RadioButtonList1.Text = "ปกติ" And Me.RadioButtonList2.Text <> "ใช้งานได้" Then
            Me.Label4.Visible = True
            Me.Label4.Text = "ถ้าเลือก ใช้งานได้บางส่วน หรือ ใช้งานไม่ได้ ต้อง เลือก อาการชำรุด ด้วยค่ะ"
        Else
            'url = "Default.aspx"

            Me.DropDownList4.Visible = True
                Dim Ds As New DataSet
                Dim Dt As DataTable
                Dim Dr As DataRow


            Dim StrCon As New SqlConnection("SERVER=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
                Dim Adpt As New SqlDataAdapter("SELECT * FROM sa.[pmcm_record] Where 1<>1", StrCon)
                Adpt.Fill(Ds, "pmcm_record")
                Dt = Ds.Tables("pmcm_record")
                Dr = Dt.NewRow
                Dr("db_name") = Me.DD_Device.SelectedValue.ToString
                Dr("date_operate") = Me.Calendar1.SelectedDate
                Dr("operation") = Me.DD_operation.Text
                Dr("status_work") = Me.RadioButtonList2.Text
                Dr("remark") = Me.TextBox1.Text
                Dr("Date_Update") = Date.Now
                Dr("date_num") = Me.DropDownList3.SelectedValue
                Dr("sap_id") = Me.TextBox2.Text
                Dr("type") = Session("UserTeam").ToString

                Dr("id_type_frtu") = Me.DD_Type_Device.SelectedValue
                Dr("order_id") = Me.DD_order_type.SelectedValue
                Dt.Rows.Add(Dr)
                Dim cdb As New SqlCommandBuilder(Adpt)
                Adpt.Update(Ds, "pmcm_record")
                Ds.AcceptChanges()
                Me.DropDownList4.DataBind()
                List_name()

            Dim index As Integer = Convert.ToInt32(Me.GridView2.SelectedIndex)
            If index >= 0 Then
                Dim dkKeys As DataKey
                dkKeys = GridView2.DataKeys(index)
                'strSQL = "UPDATE [SA_System].[sa].[recive_damage] SET status = 1 where receive_damage_id = " & Convert.ToString(dkKeys(0))
                ''& Request.QueryString("pmcm_id")
                'objCmd = New SqlCommand(strSQL, objConn)
                'objCmd.ExecuteNonQuery()
                'End If

                'If Request.QueryString("recevice_id") <> "" Then
                update_recevice_work(CInt(Convert.ToString(dkKeys(0))))

                ' update_recevice_work(CInt(Request.QueryString("receive_damage_id")))
            End If


            If Me.RadioButtonList1.Text = "มีอาการชำรุด 1 อาการ" Then
                insert_damage()

            ElseIf Me.RadioButtonList1.Text = "มีอาการชำรุดมากกว่า 1 อาการ" Then
                Dim url As String
                url = "add_damage.aspx?pmcm_id=" & Me.DropDownList4.Text & "&id_type_frtu=" & Me.DD_Type_Device.SelectedValue
                Response.Redirect(url)
                'url = "Default.aspx"
            End If
            Me.SqlDataSource2.DataBind()
            Me.GridView1.DataBind()
            Me.GridView2.DataBind()
            Me.DropDownList4.Visible = False
            Me.TextBox2.Text = ""
            Me.TextBox1.Text = ""
            Me.TextBox3.Text = ""
            Me.TextBox4.Text = ""
            Me.TextBox6.Text = ""
            Me.Panel1.Visible = False

        End If

    End Sub
    Protected Sub update_recevice_work(ByVal receive_damage_id As Integer)
        Dim objConn As New SqlConnection
        Dim objCmd As SqlCommand
        Dim strConnString, strSQL As String
        strConnString = "Server=172.30.203.155;Uid=sa;PASSWORD=1234;database=SA_System;Max Pool Size=400;Connect Timeout=600;"
        objConn.ConnectionString = strConnString
        objConn.Open()
        Dim StrCon As New SqlConnection("SERVER=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
        Dim Adpt As New SqlDataAdapter("SELECT * FROM sa.[pmcm_record] Where 1<>1", StrCon)
        strSQL = "UPDATE sa.Receive_damage SET status = 'True',pmcm_id = '" & Me.DropDownList4.Text & "' WHERE [receive_damage_id] = " & receive_damage_id
        objCmd = New SqlCommand(strSQL, objConn)
        objCmd.ExecuteNonQuery()
        strSQL = "UPDATE  sa.send_damage SET status = 3  ,[pmcm_id] = " & Me.DropDownList4.Text & "  WHERE send_damage_id = " & Me.GridView2.SelectedValue.ToString
        objCmd = New SqlCommand(strSQL, objConn)
        objCmd.ExecuteNonQuery()
        objConn.Close()
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
        Dr("pmcm_id") = Me.DropDownList4.Text
        Dt.Rows.Add(Dr)
        Dim cdb As New SqlCommandBuilder(Adpt)
        Adpt.Update(Ds, "Name_List")
        Ds.AcceptChanges()
    End Sub
    Protected Sub List_name()
        Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        Dim i As Integer = 0
        insert_name(CInt(UserLogin.UserName))
        If Me.CheckBoxList1.Items.Count <> 0 Then
            For i = 0 To Me.CheckBoxList1.Items.Count - 1
                If Me.CheckBoxList1.Items(i).Selected = True Then
                    insert_name(CInt(Me.CheckBoxList1.Items(i).Value))
                End If
            Next
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If Not func.CheckUserPermissions_access("Default.aspx", Session("User_access")) Then
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        Else
            Dim UserLogin As UserClass = CType(Session("User"), UserClass)
            Me.DS_name.FilterExpression = "Emp_id <> " & UserLogin.UserName
        End If




        'UserClass.CheckLogin(Page)
        'If Not func.CheckUserPermissions("Default.aspx", "S") Then
        '    Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
        '    Response.End()
        'Else
        '    Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        '    'UserClass.login_page(UserLogin.UserName, "Default.aspx", "View")
        '    Me.DS_name.FilterExpression = "Emp_id <> " & UserLogin.UserName
        'End If

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Me.Calendar1.Visible = True
        Me.Button1.Visible = False
    End Sub

    Protected Sub Calendar1_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Calendar1.SelectionChanged
        Me.Calendar1.Visible = False
        Me.Button1.Visible = True
        Me.TextBox3.Text = Me.Calendar1.SelectedDate.ToString
    End Sub

    Protected Sub DD_Area_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DD_Area.TextChanged
        Me.DS_Device.DataBind()
        Me.DD_Device.DataBind()
        Me.GridView1.DataBind()
    End Sub

    Protected Sub DD_Device_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DD_Device.TextChanged
        Me.GridView1.DataBind()
    End Sub

    Protected Sub DD_Type_Device_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DD_Type_Device.TextChanged
        Me.DS_Type_Device.DataBind()
        Me.DD_Area.DataBind()
        Me.DS_Device.DataBind()
        Me.DD_Device.DataBind()
        Me.GridView1.DataBind()
    End Sub
    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        insert_damage()
    End Sub
    Protected Sub insert_damage()
        Dim Ds As New DataSet
        Dim Dt As DataTable
        Dim Dr As DataRow
        Dim StrCon As New SqlConnection("SERVER=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
        Dim Adpt As New SqlDataAdapter("SELECT * FROM sa.[Damage_List]", StrCon)
        Adpt.Fill(Ds, "Damage_List")
        Dt = Ds.Tables("Damage_List")
        Dr = Dt.NewRow
        Dr("Damage_id") = Me.RadioButtonList3.SelectedValue
        Dr("pmcm_id") = Me.DropDownList4.Text
        Dr("Cause") = Me.TextBox4.Text
        Dr("Correction") = Me.TextBox6.Text
        Dt.Rows.Add(Dr)
        Dim cdb As New SqlCommandBuilder(Adpt)
        Adpt.Update(Ds, "Damage_List")
        Ds.AcceptChanges()
        insert_repair()

        'Me.Panel1.Visible = False
        'Me.LinkButton1.Visible = False


        Me.SqlDataSource4.DataBind()

        Me.TextBox1.Text = ""
        Me.TextBox3.Text = ""
    End Sub
    Protected Sub insert_repair()
        Dim Ds As New DataSet
        Dim Dt As DataTable
        Dim Dr As DataRow
        Me.DropDownList2.Visible = True
        Me.DropDownList2.DataBind()
        Dim StrCon As New SqlConnection("SERVER=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
        Dim Adpt As New SqlDataAdapter("SELECT * FROM sa.[Repair_List] where 1<>1", StrCon)
        Adpt.Fill(Ds, "Repair_List")
        Dt = Ds.Tables("Repair_List")
        Dr = Dt.NewRow
        Dr("Damage_id") = Me.RadioButtonList3.SelectedValue
        Dr("Damage_name") = Me.RadioButtonList3.SelectedItem
        Dr("cause") = Me.TextBox1.Text
        Dr("repair_name") = Me.TextBox3.Text
        Dr("pmcm_id") = Me.DropDownList4.Text
        Dt.Rows.Add(Dr)
        Dim cdb As New SqlCommandBuilder(Adpt)
        Adpt.Update(Ds, "Repair_List")
        Ds.AcceptChanges()
        Me.DropDownList2.Visible = False
    End Sub



    Private Sub RadioButtonList1_TextChanged(sender As Object, e As EventArgs) Handles RadioButtonList1.TextChanged
        If Me.RadioButtonList1.SelectedValue = "มีอาการชำรุด 1 อาการ" Then

            Me.Panel1.Visible = True

        Else
            Me.Panel1.Visible = False
        End If
    End Sub
End Class
