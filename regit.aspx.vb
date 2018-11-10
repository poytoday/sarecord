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
Partial Class regis
    Inherits System.Web.UI.Page

    Protected Sub cmdLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdLogin.Click
        'Dim PRIMARY_Check As Boolean
        If Insert_User() Then
            Exit Sub
        End If
        'Insert_Name()
        If Me.DropDownList2.Text = "ผอค.ต.1" Then
            Insert_mylink("Device.aspx")
            Insert_mylink("add_detail_property.aspx")
            Insert_mylink("Device_list.aspx")
            Insert_mylink("Default.aspx")
        End If
        If Me.RadioButtonList2.SelectedValue = "user" Then
            Insert_mylink("user_select_detail_proprety.aspx")
            UserClass.Insert_promission("change_location.aspx", "S", Me.tb_pea_id.Text)
            UserClass.Insert_promission("add_pic_device.aspx", "S", Me.tb_pea_id.Text)
            UserClass.Insert_promission("user_select_detail_proprety.aspx", "S", Me.tb_pea_id.Text)
            UserClass.Insert_promission_person(Me.tb_pea_id.Text)

        ElseIf Me.RadioButtonList2.SelectedValue = "owner" Then
            UserClass.Insert_promission_owner(Me.tb_pea_id.Text)
            'UserClass.Insert_promission_person(Me.tb_pea_id.Text)

        ElseIf Me.RadioButtonList2.SelectedValue = "region" Then
            UserClass.Insert_promission_person(Me.tb_pea_id.Text)
            UserClass.Insert_promission_region(Me.tb_pea_id.Text)

        ElseIf Me.RadioButtonList2.SelectedValue = "section" Then
            UserClass.Insert_promission_person(Me.tb_pea_id.Text)
            UserClass.Insert_promission_section(Me.tb_pea_id.Text)
        End If
        'Me.Panel1.Visible = False
        'Me.Panel1.Visible = False
        Dim url As String
        url = "http://smartdata.pea.co.th"
        Response.Redirect(url)
        ' Response.Write("<p>" + "คลิกที่นี่เพื่อทำการ " + "<a href=""Login.aspx"">&nbsp;" + "Login" + "</a></p>")
    End Sub

   
    Protected Sub Insert_Name()
        'Try
        Dim Ds As New DataSet
        Dim Dt As DataTable
        Dim Dr As DataRow
        Dim StrCon As New SqlConnection("SERVER=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
        Dim Adpt As New SqlDataAdapter("SELECT * FROM sa.[Names]", StrCon)
        Adpt.Fill(Ds, "Names")
        Dt = Ds.Tables("Names")
        Dr = Dt.NewRow
        Dr("Names") = Me.RadioButtonList1.Text & " " & Me.firstname.Text & " " & Me.lastname.Text
        Dr("Emp_id") = Me.tb_pea_id.Text
        'Dr("First_Name") = Me.firstname.Text
        'Dr("Last_Name") = Me.lastname.Text
        Dr("Position") = Me.position.Text
        Dr("office") = Me.DropDownList2.Text
        Dr("Team") = Me.DropDownList3.SelectedItem

        '2/23/2012 12:00:00 AM
        'Dr("DATE_WORK") = DateTime.ParseExact(fldDATE_INSERT.Text, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture)
        'Dr("DATE_BIRTH") = DateTime.ParseExact(birth.Text, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture)
        'Dr("DATE_WORK") = Me.Calendar1.SelectedDate
        'Dr("DATE_BIRTH") = Me.Calendar2.SelectedDate
        Dt.Rows.Add(Dr)
        Dim cdb As New SqlCommandBuilder(Adpt)
        Adpt.Update(Ds, "Names")
        Ds.AcceptChanges()
        'Catch x1 As Exception
        '    If Left(x1.Message, 47) = "Violation of PRIMARY KEY constraint 'PK_Names'." Then
        '        Me.lblMessage.Text = "มี USER นี้อยู่แล้วในฐานข้อมูล กรุณาตรวจสอบอีกครั้ง"

        '    End If

        'End Try
        'Me.lblMessage.Text = ""
    End Sub
    Function Insert_User()
        Try
            Dim Ds As New DataSet
            Dim Dt As DataTable
            Dim Dr As DataRow
            Dim StrCon As New SqlConnection("SERVER=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
            Dim Adpt As New SqlDataAdapter("SELECT * FROM sa.[user]", StrCon)
            Adpt.Fill(Ds, "user")
            Dt = Ds.Tables("user")
            Dr = Dt.NewRow
            Dr("userid") = Me.tb_pea_id.Text
            ' Dr("password") = Me.pass.Text
            Dr("position") = Me.position.Text
            Dr("name") = Me.RadioButtonList1.Text & " " & Me.firstname.Text + " " & Me.lastname.Text
            Dr("id_team") = Me.DropDownList3.SelectedValue
            Dr("team") = Me.DropDownList3.SelectedItem
            Dr("create_date") = Date.Now

            If Me.RadioButtonList2.SelectedValue = "user" Then
                Dr("firstpage") = "user_select_detail_proprety.aspx"
            ElseIf Me.RadioButtonList2.SelectedValue = "section" Then
                Dr("firstpage") = "order_section_sum.aspx"
            ElseIf Me.RadioButtonList2.SelectedValue = "region" Then
                Dr("firstpage") = "order_region_sum.aspx"
            Else
                If Me.DropDownList2.Text = "ผอค.ต.1" Then
                    Dr("firstpage") = "mylink.aspx"
                Else
                    Dr("firstpage") = "frist.aspx"
                End If
            End If
            If Me.RadioButtonList2.SelectedValue = "section" Then
                Dr("active_flag") = "False"
                Dr("office") = Me.DropDownList2.SelectedValue
            ElseIf Me.RadioButtonList2.SelectedValue = "region" Or Me.RadioButtonList2.SelectedValue = "Administrator" Then
                Dr("office") = "ผู้บริหาร " & Me.DropDownList1.SelectedValue
                Dr("active_flag") = "False"
            Else
                Dr("active_flag") = "True"
                Dr("office") = Me.DropDownList2.SelectedValue
            End If


            Me.DropDownList4.Visible = True
            Me.DropDownList4.DataBind()
            Dr("region") = Me.DropDownList4.SelectedValue
            Me.DropDownList4.Visible = False
            'Dr("region") = Me.DropDownList2.Text


            Dr("active_flag") = "True"
            Dr("update_date") = Date.Now
            Dr("user_access") = Me.RadioButtonList2.SelectedValue
            Dt.Rows.Add(Dr)
            Dim cdb As New SqlCommandBuilder(Adpt)
            Adpt.Update(Ds, "user")
            Ds.AcceptChanges()
        Catch x1 As Exception
            If Left(x1.Message, 46) = "Violation of PRIMARY KEY constraint 'PK_user'." Then
                Me.lblMessage.Text = "มี USER NAME นี้อยู่แล้วในฐานข้อมูล กรุณาตรวจสอบอีกครั้ง"
                Return 1
            End If
        End Try
        Return 0
    End Function
    Protected Sub Insert_mylink(ByVal name_link As String)
        Dim Ds As New DataSet
        Dim Dt As DataTable
        Dim Dr As DataRow
        Dim StrCon As New SqlConnection("SERVER=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
        Dim Adpt As New SqlDataAdapter("SELECT * FROM sa.[mylink]", StrCon)
        Adpt.Fill(Ds, "user")
        Dt = Ds.Tables("user")
        Dr = Dt.NewRow
        Dr("name_link") = name_link
        Dr("user_name") = Me.tb_pea_id.Text
        Dr("active_f") = "True"
        Dt.Rows.Add(Dr)
        Dim cdb As New SqlCommandBuilder(Adpt)
        Adpt.Update(Ds, "user")
        Ds.AcceptChanges()
    End Sub
   
    'Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
    '    Me.Calendar1.Visible = True
    'End Sub

    'Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
    '    Me.Calendar2.Visible = True
    'End Sub

    'Protected Sub Calendar1_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Calendar1.SelectionChanged
    '    Me.Label1.Text = Me.Calendar1.SelectedDate
    '    Me.Calendar1.Visible = False
    'End Sub

    'Protected Sub Calendar2_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Calendar2.SelectionChanged
    '    Me.Label2.Text = Me.Calendar2.SelectedDate
    '    Me.Calendar2.Visible = False
    'End Sub

    Protected Sub RadioButtonList2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList2.SelectedIndexChanged
        If Me.RadioButtonList2.SelectedValue = "region" Or Me.RadioButtonList2.SelectedValue = "Administrator" Then
            Me.DropDownList2.Visible = False
            Me.DropDownList3.Visible = False
            Me.Label1.Visible = True
            Me.Label2.Visible = True
            Me.Label1.Text = "ผู้บริหารองค์กร"
            Me.Label2.Text = "ผู้บริหารองค์กร"
        ElseIf Me.RadioButtonList2.SelectedValue = "section" Then
            Me.DropDownList2.Visible = True
            Me.DropDownList3.Visible = False
            Me.Label1.Visible = False
            Me.Label2.Visible = True
            Me.Label2.Text = "ผู้บริหารหน่วยงาน"
        Else
            Me.DropDownList2.Visible = True
            Me.DropDownList3.Visible = True
            Me.Label1.Visible = False
            Me.Label2.Visible = False
        End If
       
    End Sub

    Protected Sub DropDownList2_TextChanged(sender As Object, e As EventArgs) Handles DropDownList2.TextChanged
        Me.DropDownList3.DataBind()
    End Sub

    Protected Sub DropDownList1_TextChanged(sender As Object, e As EventArgs) Handles DropDownList1.TextChanged
        Me.DropDownList2.DataBind()
        Me.DropDownList3.DataBind()
    End Sub

    Private Sub regis_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsNothing(Session("LoginID")) Then
            Me.tb_pea_id.Text = Session("LoginID").ToString
        End If
    End Sub
End Class
