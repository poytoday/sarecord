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
Partial Class recevice_person_issue
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        UserClass.CheckLogin(Page)
        If Not func.CheckUserPermissions_access("recevice_person_issue.aspx", Session("User_access")) Then
            Response.Write("<p>" + "You don't have permissions to access this page" + "<a href=""login.aspx"">&nbsp;" + "Back to login page" + "</a></p>")
            Response.End()
        Else
            Dim UserLogin As UserClass = CType(Session("User"), UserClass)
        End If

    End Sub

End Class
