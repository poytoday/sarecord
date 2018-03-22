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
Partial Class view_permission
    Inherits System.Web.UI.Page

    Protected Sub Linkbutton10_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Linkbutton10.Click
        Dim Ds As New DataSet
        Dim Dt As DataTable
        Dim Dr As DataRow
        Dim StrCon As New SqlConnection("SERVER=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
        Dim Adpt As New SqlDataAdapter("SELECT * FROM  sa.user_permissions", StrCon)
        Adpt.Fill(Ds, "user_permissions")
        Dt = Ds.Tables("user_permissions")
        Dr = Dt.NewRow

        Dr("tablename") = Me.TextBox1.Text

        Dr("userid") = Request.QueryString("user_id")
        Dr("action") = Me.TextBox2.Text
        Dr("permission") = Me.TextBox3.Text

        Dt.Rows.Add(Dr)
        Dim cdb As New SqlCommandBuilder(Adpt)
        Adpt.Update(Ds, "user_permissions")
        Ds.AcceptChanges()
        Me.TextBox1.Text = ""
        'Me.TextBox2.Text = ""
        'Me.TextBox3.Text = ""
        Me.GridView1.DataBind()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        UserClass.CheckLogin(Page)
        If Not func.CheckUserPermissions_access("view_permission.aspx", Session("User_access")) Then
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
       Else
            If Request.QueryString("user_id").ToString = "" Then

                Response.Redirect("admin_check_user.aspx")
            Else

                Dim UserLogin As UserClass = CType(Session("User"), UserClass)
            End If
        End If







        'UserClass.CheckLogin(Page)
        'If Not func.CheckUserPermissions("view_permission.aspx", "S") Then
        '    Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
        '    Response.End()
        'Else
        '    If Request.QueryString("user_id").ToString = "" Then

        '        Response.Redirect("admin_check_user.aspx")
        '    Else

        '        Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        '    End If


        '    'UserClass.login_page(UserLogin.UserName, "Damage.aspx", "View")

        'End If
    End Sub

    Protected Sub Linkbutton11_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Linkbutton11.Click
        UserClass.Insert_promission_owner(Request.QueryString("user_id"))
        Me.GridView1.DataBind()
    End Sub
    Protected Sub Linkbutton12_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Linkbutton12.Click
        delete_promission_owner()
        Me.GridView1.DataBind()
    End Sub
    Protected Sub Linkbutton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Linkbutton1.Click
        UserClass.Insert_promission_admin(Request.QueryString("user_id"))
        Me.GridView1.DataBind()
    End Sub
    Protected Sub Linkbutton2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Linkbutton2.Click
        delete_promission_admin()
        Me.GridView1.DataBind()
    End Sub
    Protected Sub delete_promission_admin()
        delete_promission("admin_check_user.aspx", "S")
        delete_promission("all_section.aspx", "S")
        delete_promission("admin_flag.aspx", "S")
        delete_promission("all_device_admin.aspx", "S")
        Me.GridView1.DataBind()
    End Sub
    Protected Sub delete_promission_owner()
        delete_promission("add_damage.aspx", "S")
        delete_promission("Add_Edit_damage.aspx", "S")
        delete_promission("Add_Edit_name.aspx", "S")
        delete_promission("add_pic_damage.aspx", "S")
        delete_promission("add_pic_device.aspx", "S")
        delete_promission("change_location.aspx", "S")
        delete_promission("Damage.aspx", "S")
        delete_promission("Default.aspx", "S")
        delete_promission("Device.aspx", "S")
        delete_promission("Device_list.aspx", "S")
        delete_promission("Device_type.aspx", "S")
        delete_promission("Edit_damage.aspx", "S")
        delete_promission("Edit_name.aspx", "S")
        delete_promission("Edit_work.aspx", "S")
        delete_promission("getfile.aspx", "S")
        delete_promission("list_receive_damage.aspx", "S")
        delete_promission("Materaial.aspx", "S")
        delete_promission("Operation.aspx", "S")
        delete_promission("receive_damage.aspx", "S")
        delete_promission("Report_damage_his.aspx", "S")
        delete_promission("Report_material.aspx", "S")
        delete_promission("Report_name_work_wait.aspx", "S")
        delete_promission("Team2.aspx", "S")
        delete_promission("View_work_device.aspx", "S")
        delete_promission("wait_work.aspx", "S")
        delete_promission("Report_work_date.aspx", "S")
        delete_promission("Materraial.aspx", "S")
        delete_promission("all_page.aspx", "S")
        delete_promission("delete_device.aspx", "S")
        delete_promission("list_changed_location_location.aspx", "S")
        delete_promission("list_changed_location_dbname.aspx", "S")
        delete_promission("Report_damage_his.aspx", "S")
        delete_promission("select_detail_proprety.aspx", "S")
        delete_promission("Team2.aspx", "S")
        delete_promission("Report_Date.aspx", "S")
        delete_promission("wait_work.aspx", "S")
        delete_promission("Report_name_work_wait.aspx", "S")
        delete_promission("add_property.aspx", "S")
        delete_promission("km_name_damage.aspx", "S")
        delete_promission("add_detail_property.aspx", "S")
        delete_promission("user_select_detail_proprety.aspx", "S")
        delete_promission("list_changed_location_opid.aspx", "S")
        delete_promission("list_changed_location_dbname.aspx", "S")
        delete_promission("frist.aspx", "S")
        delete_promission("mylink.aspx", "S")
        delete_promission("person.aspx", "S")
        delete_promission("damage_chang.aspx", "S")
        delete_promission("me_pmce_list_detail.aspx", "S")
        Me.GridView1.DataBind()
    End Sub
   
    Protected Sub delete_promission(ByVal page As String, ByVal permission As String)
        Dim objConn As New SqlConnection
        Dim objCmd As SqlCommand
        Dim strConnString, strSQL As String
        strConnString = "Server=172.30.203.155;Uid=sa;PASSWORD=1234;database= SA_System;Max Pool Size=400;Connect Timeout=600;"
        objConn.ConnectionString = strConnString
        objConn.Open()
        strSQL = "DELETE FROM [SA_System].[sa].[user_permissions] WHERE userid = " & Request.QueryString("user_id") & " and tablename = '" & page & "'"
        objCmd = New SqlCommand(strSQL, objConn)
        objCmd.ExecuteNonQuery()
        'insert_operation_data()
        objConn.Close()
    End Sub
    Protected Sub Linkbutton3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Linkbutton3.Click
        UserClass.Insert_promission_section(Request.QueryString("user_id"))
        Me.GridView1.DataBind()
    End Sub
    Protected Sub Linkbutton4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Linkbutton4.Click
        delete_promission("order_type.aspx", "S")
        delete_promission("order_section.aspx", "S")
        delete_promission("order_section_sum.aspx", "S")
        delete_promission("order_section_his.aspx", "S")
        delete_promission("order_section_sum_detail.aspx", "S")
        Me.GridView1.DataBind()
    End Sub

    Protected Sub Linkbutton13_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Linkbutton13.Click
        Dim objConn As New SqlConnection
        Dim objCmd As SqlCommand
        Dim strConnString, strSQL As String
        strConnString = "Server=172.30.203.155;Uid=sa;PASSWORD=1234;database=SA_System;Max Pool Size=400;Connect Timeout=600;"
        objConn.ConnectionString = strConnString
        objConn.Open()
        strSQL = "UPDATE sa.[user] SET user_access = '" & Me.DropDownList1.Text & "' WHERE userid = " & Request.QueryString("user_id")
        objCmd = New SqlCommand(strSQL, objConn)
        objCmd.ExecuteNonQuery()
        objConn.Close()
        Me.Label2.Text = "Updated"
        Me.SqlDataSource2.DataBind()
        Me.DetailsView1.DataBind()
    End Sub

    Protected Sub Linkbutton5_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Linkbutton5.Click
        UserClass.Insert_promission_region(Request.QueryString("user_id"))
        Me.GridView1.DataBind()
    End Sub

    Protected Sub Linkbutton6_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Linkbutton6.Click
        UserClass.Delete_promission_km(Request.QueryString("user_id"))
        Me.GridView1.DataBind()
    End Sub
End Class
