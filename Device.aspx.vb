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
Partial Class Device
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        UserClass.CheckLogin(Page)
        If Not func.CheckUserPermissions_access("Device.aspx", Session("User_access")) Then
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        Else
            Dim UserLogin As UserClass = CType(Session("User"), UserClass)
            Me.DropDownList2.Visible = True
            Me.DropDownList2.DataBind()
            Me.Label4.Text = "ลำดับล่าสุดคือ " & Me.DropDownList2.SelectedValue
            Me.DropDownList2.Visible = False
        End If
        'UserClass.CheckLogin(Page)
        'If Not func.CheckUserPermissions("Device.aspx", "S") Then
        '    Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
        '    Response.End()
        'Else
        '    Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        '    ' UserClass.login_page(UserLogin.UserName, "Device.aspx", "View")
        'End If
    End Sub
    Protected Sub RadioButtonList1_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.TextChanged
        Me.Label1.Visible = True
        Me.DropDownList1.Visible = True
        'Me.DropDownList2.Visible = True
        'Me.DropDownList2.DataBind()
        Me.Label4.Visible = True
        Me.CheckBox1.Visible = True
        'Me.DropDownList2.Visible = False
    End Sub
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Try
            Me.Label2.Text = ""

            Dim UserLogin As UserClass = CType(Session("User"), UserClass)
            Dim Ds As New DataSet
            Dim Dt As DataTable
            Dim Dr As DataRow
            Dim StrCon As New SqlConnection("SERVER=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
            Dim Adpt As New SqlDataAdapter("SELECT * FROM sa.[Device_List]", StrCon)
            Adpt.Fill(Ds, "Device_List")
            Dt = Ds.Tables("Device_List")
            Dr = Dt.NewRow
            Dr("type_frtu") = Me.RadioButtonList1.SelectedItem
            Dr("id_type_frtu") = Me.RadioButtonList1.SelectedValue
            Dr("dbname") = Me.TextBox1.Text
            Dr("op_id") = Me.TextBox2.Text
            Dr("location") = Me.TextBox3.Text
            'Dr("product") = Me.TextBox4.Text
            'Dr("type") = Me.TextBox5.Text
            'Dr("control_type") = Me.TextBox8.Text
            'Dr("scada") = Me.TextBox6.Text
            Dr("office") = Me.TextBox7.Text
            Dr("Name_Create") = UserLogin.UserName
            Dr("date_Create") = Date.Now
            Dt.Rows.Add(Dr)
            Dim cdb As New SqlCommandBuilder(Adpt)
            Adpt.Update(Ds, "Device_List")
            Ds.AcceptChanges()
            Me.SqlDataSource4.DataBind()
            Me.DropDownList1.DataBind()
            Me.SqlDataSource2.DataBind()
            Me.GridView1.DataBind()

            Me.DropDownList1.Text = Me.TextBox7.Text
            Me.Label3.Text = "เพิ่มอุปกรณ์ลำดับ " & " " & Me.TextBox1.Text & " เรียบร้อยแล้ว"
            Me.DropDownList2.Visible = True
            Me.DropDownList2.DataBind()
            Me.Label4.Text = "ลำดับล่าสุดคือ " & Me.DropDownList2.SelectedValue
            Me.DropDownList2.Visible = False



            Dim objConn As New SqlConnection
            Dim objCmd As SqlCommand
            Dim strConnString, strSQL As String

            strConnString = "Server=172.30.203.155;Uid=sa;PASSWORD=1234;database=SA_System;Max Pool Size=400;Connect Timeout=600;"
            objConn.ConnectionString = strConnString
            objConn.Open()
            strSQL = "UPDATE sa.Type_Frtu SET  last_db = '" & Me.TextBox1.Text & "' WHERE [ID] = " & Me.RadioButtonList1.SelectedValue
            '& Request.QueryString("pmcm_id")
            objCmd = New SqlCommand(strSQL, objConn)
            objCmd.ExecuteNonQuery()
            Me.Visible = True
            Me.DropDownList2.DataBind()
            Me.Label4.Text = "ลำดับล่าสุดคือ " & Me.DropDownList2.SelectedValue
            Me.DropDownList2.Visible = False
        Catch x1 As Exception
            If Left(x1.Message, 53) = "Violation of PRIMARY KEY constraint 'PK_Device_List'." Then
                Me.Label2.Text = "มีลำดับนี้อยู่แล้วในฐานข้อมูล กรุณาเปลี่ยนลำดับใหม่"
            End If
        End Try
        'Me.TextBox3.Text = ""
    End Sub

    Protected Sub GridView1_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.DataBinding
        'Me.DropDownList1.DataBind()
    End Sub

    Protected Sub DropDownList1_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.TextChanged

    End Sub

    Protected Sub CheckBox1_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBox1.CheckedChanged
        If Me.CheckBox1.Checked = True Then

            Me.GridView1.Visible = False
            Me.GridView2.Visible = True
            Me.SqlDataSource6.DataBind()
            Me.DropDownList2.Visible = False
        Else
            Me.GridView2.Visible = False
            Me.GridView1.Visible = True
            Me.SqlDataSource2.DataBind()
            Me.DropDownList2.Visible = True
        End If
    End Sub

End Class
