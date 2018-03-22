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
Partial Class add_damage
    Inherits System.Web.UI.Page
    Dim objConn As New SqlConnection
    Dim objCmd As SqlCommand
    Dim strConnString, strSQL, type_frtu As String

    Protected Sub RadioButtonList1_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.TextChanged
        'Me.Panel1.Visible = True
        'Me.LinkButton1.Visible = True
        Me.fldpath.Text = ""
        Me.TextBox4.Text = ""
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
        Dr("Damage_id") = Me.RadioButtonList1.SelectedValue
        Dr("Damage_name") = Me.RadioButtonList1.SelectedItem
        Dr("cause") = Me.TextBox1.Text
        Dr("repair_name") = Me.TextBox3.Text
        Dr("pmcm_id") = Request.QueryString("pmcm_id")
        Dt.Rows.Add(Dr)
        Dim cdb As New SqlCommandBuilder(Adpt)
        Adpt.Update(Ds, "Repair_List")
        Ds.AcceptChanges()
        Me.DropDownList2.Visible = False
    End Sub
    Protected Sub insert_material()
        Dim Ds As New DataSet
        Dim Dt As DataTable
        Dim Dr As DataRow
        Me.DropDownList2.Visible = True
        Dim StrCon As New SqlConnection("SERVER=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
        Dim Adpt As New SqlDataAdapter("SELECT * FROM sa.[Material_List2] where 1<>1", StrCon)
        Adpt.Fill(Ds, "Material_List")
        Dt = Ds.Tables("Material_List")
        Dr = Dt.NewRow
        Dr("Damage_id") = Me.RadioButtonList1.SelectedValue
        Dr("Material") = Me.DropDownList1.Text
        'Dr("id_material") = Me.DropDownList1.SelectedValue
        Dr("number_Material") = Me.TextBox2.Text
        'Dr("Damage_name") = Me.RadioButtonList1.SelectedItem
        Dr("pmcm_id") = Request.QueryString("pmcm_id")
        Dr("office") = Session("UserOffice")
        Dt.Rows.Add(Dr)
        Dim cdb As New SqlCommandBuilder(Adpt)
        Adpt.Update(Ds, "Material_List")
        Ds.AcceptChanges()
        Me.DropDownList2.Visible = False
    End Sub

    Protected Sub CheckBox1_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBox1.CheckedChanged
        If Me.CheckBox1.Checked = False Then
            Me.pnlForm2.Visible = False
        Else
            Me.pnlForm2.Visible = True
        End If
    End Sub
    Protected Sub CheckBox2_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBox2.CheckedChanged
        If Me.CheckBox2.Checked = False Then
            Me.pnlForm3.Visible = False
        Else
            Me.pnlForm3.Visible = True
        End If
    End Sub
    Protected Sub Button1_Click1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Insert_file()
        Me.SqlDataSource5.DataBind()
        Me.GridView5.DataBind()
        Me.fldpath.Text = ""
        Me.TextBox4.Text = ""
    End Sub
    Protected Sub Insert_file()
        Dim fupath As FileUpload = Uploadfldpath 'CType(uploadDetailsView.FindControl("Uploadfldpath"), FileUpload)
        Dim txtpath As TextBox = fldpath 'CType(uploadDetailsView.FindControl("fldpath"), TextBox)
        If fupath.PostedFile.ContentLength > 0 Then
            Dim sFileName As String = fupath.PostedFile.FileName
            sFileName = sFileName.Remove(0, sFileName.LastIndexOfAny("\/".ToCharArray()) + 1)
            fupath.PostedFile.SaveAs(Server.MapPath("upload/" + sFileName))
        End If
        Insert_Work_To_Pic()
    End Sub
    Protected Sub Insert_Work_To_Pic()
        'Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        Dim Ds As New DataSet
        Dim Dt As DataTable
        Dim Dr As DataRow
        Dim StrCon As New SqlConnection("SERVER=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
        Dim Adpt As New SqlDataAdapter("SELECT * FROM sa.[Damage_PIC] WHERE 2<>2", StrCon)
        Adpt.Fill(Ds, "Damage_PIC")
        Dt = Ds.Tables("Damage_PIC")
        Dr = Dt.NewRow
        Dr("pmcm_id") = Request.QueryString("pmcm_id")
        Dr("PATH_PIC") = Me.Uploadfldpath.FileName
        Dr("Detail") = Me.TextBox4.Text
        Dr("Type") = Me.RadioButtonList2.Text
        Dr("damage_id") = Me.RadioButtonList1.SelectedValue
        'Dr("damage_list_id") = Request.QueryString("damage_list_id")

        Dt.Rows.Add(Dr)
        Dim cdb As New SqlCommandBuilder(Adpt)
        Adpt.Update(Ds, "Damage_PIC")
        Ds.AcceptChanges()
    End Sub
    Protected Sub GridView5_RowCommand(ByVal source As Object, ByVal e As GridViewCommandEventArgs)
        If e.CommandName = "Page" OrElse e.CommandName = "Sort" Then Exit Sub

        Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        Dim dkKeys As DataKey
        dkKeys = GridView5.DataKeys(index)

        Dim sKeysArg As String = ""
        For Each s As String In dkKeys.Values.Keys
            sKeysArg += s + "='" + Convert.ToString(dkKeys(s)) & "'"
        Next s
        If sKeysArg = String.Empty Then
            Exit Sub
        End If
        If e.CommandName = "cmdDelete" Then
            Dim strSQL As String
            strSQL = "DELETE FROM sa.Damage_PIC WHERE RUN_ID = " & Convert.ToString(dkKeys(0))
            '& Request.QueryString("pmcm_id")
            objCmd = New SqlCommand(strSQL, objConn)
            objCmd.ExecuteNonQuery()
            Me.GridView5.DataBind()
        End If

    End Sub
    Protected Sub GridView1_RowCommand(ByVal source As Object, ByVal e As GridViewCommandEventArgs)
        If e.CommandName = "Page" OrElse e.CommandName = "Sort" Then Exit Sub

        Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        Dim dkKeys As DataKey
        dkKeys = GridView1.DataKeys(index)

        Dim sKeysArg As String = ""
        For Each s As String In dkKeys.Values.Keys
            sKeysArg += s + "='" + Convert.ToString(dkKeys(s)) & "'"
        Next s
        If sKeysArg = String.Empty Then
            Exit Sub
        End If
        If e.CommandName = "cmdDelete" Then
            Dim strSQL As String
            strSQL = "DELETE FROM sa.Material_List2  WHERE (pmcm_id = " & Request.QueryString("pmcm_id") & " and id_material  = " & Convert.ToString(dkKeys(0)) & ")"
            '& Request.QueryString("pmcm_id")
            objCmd = New SqlCommand(strSQL, objConn)
            objCmd.ExecuteNonQuery()
            Me.GridView1.DataBind()
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not func.CheckUserPermissions_access("add_damage.aspx", Session("User_access")) Then
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        Else
            strConnString = "Server=172.30.203.155;Uid=sa;PASSWORD=1234;database=SA_System;Max Pool Size=400;Connect Timeout=600;"
            objConn.ConnectionString = strConnString
            objConn.Open()
            Dim UserLogin As UserClass = CType(Session("User"), UserClass)
            If Not Page.IsPostBack() Then
                'ViewData()
            End If
        End If



        'UserClass.CheckLogin(Page)
        'If Not func.CheckUserPermissions("add_damage.aspx", "S") Then
        '    Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
        '    Response.End()
        'Else
        '    Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        '    'UserClass.login_page(UserLogin.UserName, "add_damage.aspx", "View")
        '    strConnString = "Server=172.30.203.155;Uid=sa;PASSWORD=1234;database=SA_System;Max Pool Size=400;Connect Timeout=600;"
        '    objConn.ConnectionString = strConnString
        '    objConn.Open()
        'End If
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dim Ds As New DataSet
        Dim Dt As DataTable
        Dim Dr As DataRow
        Dim StrCon As New SqlConnection("SERVER=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
        Dim Adpt As New SqlDataAdapter("SELECT * FROM sa.[Damage_List]", StrCon)
        Adpt.Fill(Ds, "Damage_List")
        Dt = Ds.Tables("Damage_List")
        Dr = Dt.NewRow
        Dr("Damage_id") = Me.RadioButtonList1.SelectedValue
        Dr("pmcm_id") = Request.QueryString("pmcm_id")
        Dr("Cause") = Me.TextBox1.Text
        Dr("Correction") = Me.TextBox3.Text
        Dt.Rows.Add(Dr)
        Dim cdb As New SqlCommandBuilder(Adpt)
        Adpt.Update(Ds, "Damage_List")
        Ds.AcceptChanges()
        insert_repair()

        'Me.Panel1.Visible = False
        'Me.LinkButton1.Visible = False

        If Me.CheckBox1.Checked = True Then


        End If
        Me.SqlDataSource4.DataBind()
        Me.GridView7.DataBind()
        Me.TextBox1.Text = ""
        Me.TextBox3.Text = ""
        'Response.Redirect("Default.aspx")

    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        Dim Ds As New DataSet
        Dim Dt As DataTable
        Dim Dr As DataRow
        Dim StrCon As New SqlConnection("SERVER=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
        Dim Adpt As New SqlDataAdapter("SELECT * FROM sa.[Damage_Type]", StrCon)
        Adpt.Fill(Ds, "Damage_Type")
        Dt = Ds.Tables("Damage_Type")
        Dr = Dt.NewRow
        Dr("id_type_frtu") = Request.QueryString("id_type_frtu")
        Dr("damage_name") = Me.TextBox5.Text
        Dt.Rows.Add(Dr)
        Dim cdb As New SqlCommandBuilder(Adpt)
        Adpt.Update(Ds, "Damage_Type")
        Ds.AcceptChanges()
        Me.TextBox5.Text = ""
        Me.RadioButtonList1.DataBind()
    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        insert_material()
        Me.GridView1.DataBind()
    End Sub
End Class
