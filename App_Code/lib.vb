#region "Imports"
Imports System
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections
Imports System.Web
Imports System.Web.UI.WebControls

Imports System.Net.Mail

#End Region

Public Class func

    Public Shared Function str2date(ByVal sDate As String, ByVal sFormat As String) As DateTime
        If sDate = String.Empty Then
            Return DateTime.MinValue
        End If

        If sFormat = "CultureInfo.CurrentCulture.DateTimeFormat.ShortDatePattern" Then
            sFormat = System.Globalization.CultureInfo.CurrentCulture.DateTimeFormat.ShortDatePattern
        End If

        sDate = sDate.Trim()
        If sFormat.IndexOfAny("ms:".ToCharArray()) >= 0 AndAlso sDate.Length < 19 Then
            If sDate.Split(" ".ToCharArray()).Length > 1 AndAlso sDate.Length = 16 Then
                sDate += ":00"
            Else
                sDate += " 00:00:00"
            End If
        End If

        Return System.Xml.XmlConvert.ToDateTime(sDate, sFormat)

    End Function

    Public Shared Function date2str(ByVal dtDate As DateTime, ByVal sFormat As String) As String
        If dtDate = DateTime.MinValue Then
            Return String.Empty
        End If

        If sFormat = "CultureInfo.CurrentCulture.DateTimeFormat.ShortDatePattern" Then
            sFormat = System.Globalization.CultureInfo.CurrentCulture.DateTimeFormat.ShortDatePattern
        End If

        Return System.Xml.XmlConvert.ToString(dtDate, sFormat)

    End Function

    Public Shared Sub GetMenu(ByVal ddlQuickJump As DropDownList, ByVal sCaption As String)
        ddlQuickJump.Items.Clear()
        ddlQuickJump.Items.Add(New ListItem("Back to menu", "menu.aspx"))

        ddlQuickJump.Items.Add(New ListItem("dbo.upload", "upload_list.aspx"))

        ddlQuickJump.Items.Add(New ListItem("dbo.WORK_INSERT", "WORK_INSERT_list.aspx"))

        If ddlQuickJump.Items.FindByText(sCaption) Is Nothing Then
            ddlQuickJump.Items.Add(New ListItem("", ""))
            ddlQuickJump.Items.FindByText("").Selected = True
        Else
            ddlQuickJump.Items.FindByText(sCaption).Selected = True
        End If

    End Sub

    Public Shared Function GetSqlDataSource(ByVal sSQLSelect As String) As SqlDataSource
        Dim cts As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("Deviec_SA_V1ConnectionString")
        Dim sds As SqlDataSource = New SqlDataSource(cts.ProviderName, cts.ConnectionString, sSQLSelect)
        sds.DataSourceMode = SqlDataSourceMode.DataReader

        Return sds
    End Function

    Public Shared Function BuildParameterName(ByVal sFieldName As String) As String
        Dim sReturn As String = ""

        For i As Integer = 0 To sFieldName.Length - 1
            If sFieldName.Chars(i) = "[" OrElse sFieldName(i) = "]" Then
                Continue For
            End If
            If (sFieldName.Chars(i) >= "A" AndAlso sFieldName.Chars(i) <= "Z") _
                      OrElse (sFieldName(i) >= "a" AndAlso sFieldName.Chars(i) <= "z") _
                      OrElse (sFieldName(i) >= "0" AndAlso sFieldName.Chars(i) <= "9") _
                      OrElse sFieldName.Chars(i) = "_" Then
                sReturn += sFieldName.Chars(i)
            Else
                sReturn += "_"
            End If
        Next i

        Return sReturn
    End Function

    Public Shared Function SqlBuilder(ByVal sSQL As String, ByVal sAddString As String) As String
        If sAddString = String.Empty Then
            Return sSQL.Trim()
        End If

        Dim iPos As Integer = sSQL.ToLower().IndexOf(" where ")
        If iPos < 0 Then
            sAddString = " where " + sAddString + " "
            Dim groupByPos As Integer = sSQL.ToLower().IndexOf(" group by ")
            If groupByPos > 0 Then
                sSQL = sSQL.Insert(groupByPos, sAddString)
            Else
                Dim orderByPos As Integer = sSQL.ToLower().IndexOf(" order by ")
                If orderByPos < 0 Then
                    sSQL += sAddString
                Else
                    sSQL = sSQL.Insert(orderByPos, sAddString)
                End If
            End If
        Else
            iPos += 7
            If sSQL.Length > iPos Then
                sAddString += " And "
            End If
            sSQL = sSQL.Insert(iPos, sAddString)
        End If

        Return sSQL.Trim()
    End Function

    Public Shared Function WhereBuilder(ByVal sWhere As String, ByVal sAdd As String) As String
        Return WhereBuilder(sWhere, sAdd, "And")
    End Function

    Public Shared Function WhereBuilder(ByVal sWhere As String, ByVal sAdd As String, ByVal sLogicalOperator As String) As String
        If sAdd = String.Empty Then
            Return sWhere.Trim()
        End If

        If sWhere = String.Empty Then
            Return sAdd
        End If

        Dim sReturn As String = ""
        If sWhere.Trim().EndsWith(sLogicalOperator, StringComparison.OrdinalIgnoreCase) Then
            sReturn = sWhere.Trim() + " " + sAdd
        Else
            sReturn = sWhere.Trim() + " " + sLogicalOperator + " " + sAdd
        End If

        Return sReturn
    End Function

    Public Shared Sub AddGlyph(ByVal grid As GridView, ByVal item As GridViewRow)
        Dim glyph As Label = New Label()
        If grid.SortDirection = SortDirection.Ascending Then
            glyph.Text = "&nbsp" + ("<IMG src=""Images/down.gif"" border=0/>")
        Else
            glyph.Text = "&nbsp" + ("<IMG src=""Images/up.gif"" border=0/>")
        End If

        For i As Integer = 0 To grid.Columns.Count - 1
            Dim colExpr As String = grid.Columns(i).SortExpression
            If colExpr <> String.Empty AndAlso colExpr = grid.SortExpression Then
                item.Cells(i).Controls.Add(glyph)
            End If
            If item.Cells(i).Controls.Count > 0 AndAlso TypeOf (item.Cells(i).Controls(0)) Is LinkButton Then
                CType(item.Cells(i).Controls(0), LinkButton).CssClass = grid.HeaderStyle.CssClass
            Else
                item.Cells(i).CssClass = grid.HeaderStyle.CssClass
            End If
        Next i
    End Sub

    'Date as ddl
    Public Shared Sub DateToDropDownList(ByVal dt As DateTime, ByRef ddlDay As System.Web.UI.WebControls.DropDownList, ByRef ddlMonth As System.Web.UI.WebControls.DropDownList, ByRef ddlYear As System.Web.UI.WebControls.DropDownList)
        Dim i As Integer
        i = (IIf(dt.Year = 1, DateTime.Now.Year, dt.Year)) - 50
        While i <= (IIf(dt.Year = 1, DateTime.Now.Year, dt.Year)) + 50
            ddlYear.Items.Add(New System.Web.UI.WebControls.ListItem(i.ToString(), i.ToString()))
            i += 1
        End While

        If dt = DateTime.MinValue Then
            Exit Sub
        End If

        ddlDay.SelectedValue = dt.Day.ToString()
        ddlMonth.SelectedValue = dt.Month.ToString()
        If dt.Year = 1 Then
            ddlYear.SelectedValue = System.Convert.ToString(DateTime.Now.Year)
        Else
            ddlYear.SelectedValue = System.Convert.ToString(dt.Year)
        End If
    End Sub

    Public Shared Function DropDownListToDate(ByRef ddlDay As System.Web.UI.WebControls.DropDownList, ByRef ddlMonth As System.Web.UI.WebControls.DropDownList, ByRef ddlYear As System.Web.UI.WebControls.DropDownList) As Object
        Dim sDayRequiredDate, sMonthdtRequiredDate, sYeardtRequiredDate As String

        sDayRequiredDate = ddlDay.SelectedValue
        sMonthdtRequiredDate = ddlMonth.SelectedValue
        sYeardtRequiredDate = ddlYear.SelectedValue

        If sDayRequiredDate = String.Empty AndAlso sMonthdtRequiredDate = String.Empty AndAlso sYeardtRequiredDate = String.Empty Then
            Return Nothing
        ElseIf sDayRequiredDate = String.Empty OrElse sMonthdtRequiredDate = String.Empty OrElse sYeardtRequiredDate = String.Empty Then
            Throw New System.Exception("Invalid Datetime format")
        End If

        If sDayRequiredDate.Length < 2 Then
            sDayRequiredDate = "0" + sDayRequiredDate
        End If
        If sMonthdtRequiredDate.Length < 2 Then
            sMonthdtRequiredDate = "0" + sMonthdtRequiredDate
        End If

        Return System.Xml.XmlConvert.ToDateTime(sDayRequiredDate + "/" + sMonthdtRequiredDate + "/" + sYeardtRequiredDate, "dd/MM/yyyy")
    End Function

    'lookup column as ddl
    Public Shared Sub LoadDataToLookUp(ByRef ddlLookUp As DropDownList, ByVal sSQLSelect As String, ByVal sCurrentValue As String)
        ddlLookUp.Items.Clear()
        ddlLookUp.DataSource = GetSqlDataSource(sSQLSelect)
        ddlLookUp.DataBind()
        ddlLookUp.Items.Insert(0, "")
        ddlLookUp.SelectedValue = Nothing
        If Not (ddlLookUp.Items.FindByValue(sCurrentValue) Is Nothing) Then
            ddlLookUp.SelectedValue = sCurrentValue
        Else
            ddlLookUp.SelectedIndex = 0
        End If
    End Sub

    'lookup column as rbl
    Public Shared Sub LoadDataToLookUp(ByRef ddlLookUp As System.Web.UI.WebControls.RadioButtonList, ByVal sSQLSelect As String, ByVal sCurrentValue As String)
        ddlLookUp.Items.Clear()
        ddlLookUp.DataSource = GetSqlDataSource(sSQLSelect)
        ddlLookUp.DataBind()
        ddlLookUp.Items.Insert(0, "")
        ddlLookUp.SelectedValue = Nothing
        If Not (ddlLookUp.Items.FindByValue(sCurrentValue) Is Nothing) Then
            ddlLookUp.SelectedValue = sCurrentValue
        Else
            ddlLookUp.SelectedIndex = 0
        End If
    End Sub

    Public Shared Sub LoadDataToLookUp(ByRef ddlLookUp As System.Web.UI.WebControls.ListBox, ByVal sSQLSelect As String, ByVal sCurrentValue As String)
        ddlLookUp.Items.Clear()
        ddlLookUp.DataSource = GetSqlDataSource(sSQLSelect)
        ddlLookUp.DataBind()
        ddlLookUp.Items.Insert(0, "")
        ddlLookUp.SelectedValue = Nothing
        For Each s As String In sCurrentValue.Split(",")
            If Not IsNothing(ddlLookUp.Items.FindByValue(s)) Then
                ddlLookUp.Items.FindByValue(s).Selected = True
            End If
        Next

        If String.IsNullOrEmpty(ddlLookUp.SelectedValue) Then
            ddlLookUp.SelectedIndex = 0
        End If
    End Sub

    Public Shared Function GetLookupValue(ByVal sDisplayField As String, ByVal sLinkField As String, ByVal sTable As String, ByVal sValue As String, ByVal TType As TypeCode, Optional ByVal isMultiline As Boolean = False) As String
        Dim sGetLookupValue As String = ""
        Dim cts As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("Deviec_SA_V1ConnectionString")

        Dim sqlSelect As String = "SELECT " + sDisplayField + " FROM sa." + sTable + " WHERE "
        Dim sds As SqlDataSource = New SqlDataSource()

        Try

            sds.ProviderName = cts.ProviderName
            sds.ConnectionString = cts.ConnectionString

            If isMultiline Then
                Dim i As Integer = 0
                For Each s As String In sValue.Split(",")
                    Dim paramName As String = "param" + i.ToString()
                    sqlSelect += sLinkField + "=@" + paramName + " Or "
                    sds.SelectParameters.Add(paramName, TType, s)
                    i += 1
                Next
                If sqlSelect.Length > 2 Then sqlSelect = sqlSelect.Remove(sqlSelect.Length - 3)
            Else
                sqlSelect += sLinkField + "= @LinkField"
                sds.SelectParameters.Add("LinkField", TType, sValue)
            End If

            sds.SelectCommand = sqlSelect
            sds.DataSourceMode = SqlDataSourceMode.DataReader

            Dim dbDr As System.Data.Common.DbDataReader = CType(sds.Select(System.Web.UI.DataSourceSelectArguments.Empty), System.Data.Common.DbDataReader)
            If dbDr.HasRows Then
                If isMultiline Then
                    While (dbDr.Read())
                        sGetLookupValue += dbDr(0).ToString() + ","
                    End While
                    sGetLookupValue = sGetLookupValue.Trim(",".ToCharArray())
                Else
                    If dbDr.Read() Then sGetLookupValue = dbDr(0).ToString()
                End If
            End If
            dbDr.Dispose()
        Finally
            sds.Dispose()
        End Try

        Return sGetLookupValue
    End Function

    'Upload binary file
    Public Shared Function GetBinary(ByRef _InputFile As FileUpload) As Object
        If Not (_InputFile.PostedFile Is Nothing) Then
            Dim iImageSize As Integer = _InputFile.PostedFile.ContentLength
            If iImageSize = 0 Then
                Throw New System.Exception(" File '" + _InputFile.PostedFile.FileName + "' not found<br>")
            End If

            Dim ImageStream As System.IO.Stream = _InputFile.PostedFile.InputStream
            Dim ImageContent As Byte() = New Byte(iImageSize - 1) {}
            ImageStream.Read(ImageContent, 0, iImageSize)
            Return ImageContent
        Else
            Return DBNull.Value
        End If
    End Function

    Public Shared Sub DeleteFile(ByVal sFileName As String)
        Dim fiDescription As System.IO.FileInfo = New System.IO.FileInfo(sFileName)
        If fiDescription.Exists Then
            fiDescription.Delete()
        End If
    End Sub

    Public Shared Function GetNavigateUrl(ByVal sValue As String, ByVal sLinkType As String) As String
        If sValue.StartsWith(sLinkType) Then
            Return (sValue)
        Else
            Return (sLinkType + sValue)
        End If
    End Function

    Public Shared Function ProcessLargeText(ByVal sValue As String, ByVal iNumberOfChars As Integer, ByVal tableName As String, ByVal param As String) As String
        Dim sProcessLargeText As String = ""
        If sValue.TrimStart().StartsWith("<a href") OrElse sValue = String.Empty OrElse sValue = "&nbsp;" Then
            Return sValue
        End If
        If iNumberOfChars > 0 Then
            If sValue.Length > iNumberOfChars AndAlso (Not sValue.TrimStart().StartsWith("<a href")) Then
                sProcessLargeText = sValue.Substring(0, iNumberOfChars).Replace("'", "'") + " <a href=""#"" onClick=""javascript: pwin = window.open('',null,'height=300,width=400,status=yes,resizable=yes,toolbar=no,menubar=no,location=no,left=150,top=200,scrollbars=yes'); " + "pwin.location='" + tableName + "_fulltext.aspx?" + HttpUtility.HtmlEncode(param) + "';" + "return false;"">" + "More" + "&nbsp;...</a>"
            End If
        End If
        Return sProcessLargeText
    End Function

    Public Shared Sub SendMail(ByVal mailTo As String, ByVal subj As String, ByVal body As String)
        Dim mailSender As String = ConfigurationManager.AppSettings("MailSender")
        Dim mailSmtpServer As String = ConfigurationManager.AppSettings("MailSmtpServer")
        Dim mailSmtpPort As String = ConfigurationManager.AppSettings("MailSmtpPort")
        Dim mailSMTPUser As String = ConfigurationManager.AppSettings("MailSMTPUser")
        Dim mailSMTPPassword As String = ConfigurationManager.AppSettings("MailSMTPPassword")

        If String.IsNullOrEmpty(mailSender) OrElse String.IsNullOrEmpty(mailTo) Then
            Exit Sub
        End If
        Dim mail As MailMessage = New MailMessage(mailSender, mailTo, subj, body)

        'send the message
        Dim smtp As SmtpClient = New SmtpClient(mailSmtpServer)
        smtp.Port = Convert.ToInt32(mailSmtpPort)

        If mailSMTPUser <> "" Then
            'to authenticate we set the username AndAlso password properites on the SmtpClient
            smtp.Credentials = New System.Net.NetworkCredential(mailSMTPUser, mailSMTPPassword)
        End If
        smtp.Send(mail)
    End Sub

    Public Shared Function IsDate(ByVal dt As Object) As Boolean
        Try
            System.DateTime.Parse(dt.ToString())
            Return True
        Catch
            Return False
        End Try
    End Function
    Public Shared Function IsNumeric(ByVal oValue As Object) As Boolean
        Try
            Double.Parse(oValue.ToString())
            Return True
        Catch
            Return False
        End Try
    End Function

    Public Shared Function CheckUserPermissions(ByVal sTable As String, ByVal sAction As String) As Boolean

        If System.Web.HttpContext.Current.Session("User") Is Nothing Then
            Return False
        End If

        'If IsAdminUser() Then
        '    Return True
        'End If

        'Dim myXmlDocument As XmlDocument = GetConfigXML("")

        'If myXmlDocument.DocumentElement.SelectSingleNode("/Security/Tables/Table") Is Nothing Then
        '    Return True
        'End If

        'Dim sDefautPremissons As String = ""
        'If Not (GetTableProp(sTable, "DEFAULT") Is Nothing) Then
        '    sDefautPremissons = GetTableProp(sTable, "DEFAULT").ToLower()
        'End If
        'sAction = sAction.ToLower()
        'If myXmlDocument.DocumentElement.SelectSingleNode("/Security/Tables/Table/UserGroups/User") Is Nothing Then
        '    Return (sDefautPremissons.IndexOfAny(sAction.ToCharArray()) > -1)
        'End If

        Dim sUserName As String = (CType(System.Web.HttpContext.Current.Session("User"), UserClass)).UserName

        'Dim sPath As String = "/Security/Tables/Table[@Name='" + sTable + "']/UserGroups/User[@Name='" + sUserName + "']"
        'Dim node As XmlNode = myXmlDocument.DocumentElement.SelectSingleNode(sPath)

        'If Not node Is Nothing Then
        '    If node.Attributes("Permission") Is Nothing Then
        '        Return (sDefautPremissons.IndexOfAny(sAction.ToCharArray()) > -1)
        '    Else
        '        Return (node.Attributes("Permission").Value.ToLower().IndexOfAny(sAction.ToCharArray()) > -1)
        '    End If
        'Else
        '    Return (sDefautPremissons.IndexOfAny(sAction.ToCharArray()) > -1)
        'End If

        Dim sql As String
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("Deviec_SA_V1ConnectionString").ToString)
        sql = "select permission from sa.user_permissions where userid='" + sUserName + "' and tablename='" + sTable + "' and action='" + sAction + "'"
        Dim cmd1 As New SqlCommand(Sql, con)
        con.Open()
        Dim cmdreader As SqlDataReader = cmd1.ExecuteReader

        While cmdreader.Read()
            If cmdreader.Item("permission") = "" Or cmdreader.Item("permission") = "N" Then
                con.Close()
                Return False
            Else
                con.Close()
                Return True
            End If
        End While
        Return 0
    End Function
    Public Shared Function CheckUserPermissions_access(ByVal sPage As String, ByVal sAction As String) As Boolean

        If System.Web.HttpContext.Current.Session("User") Is Nothing Then
            Return False
        End If
        'Dim sUserName As String = (CType(System.Web.HttpContext.Current.Session("User"), UserClass)).UserName
        Dim sql As String
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("Deviec_SA_V1ConnectionString").ToString)
        sql = "select tablename, owner, section, region, front_office, Administrator from sa.[user_permissions_access] where tablename like '%" + sPage + "' and " + sAction + "= 1"
        Dim cmd1 As New SqlCommand(sql, con)
        con.Open()
        Dim cmdreader As SqlDataReader = cmd1.ExecuteReader

        While cmdreader.Read()
            If cmdreader.Item("tablename") = "" Or cmdreader.Item("tablename") = "N" Then
                con.Close()
                Return False
            Else
                con.Close()
                Return True
            End If
        End While
        Return 0
    End Function
End Class

Public Class UserClass
    Private _id As Guid
    Private _userName As String
    Private _GroupID As String = ""
    Private _password As String
    Private _firstpage As String
    Private _team As String
    Private _id_team As Integer
    Private _office As String
    Private _region As String
    Private _user_access As String
    Private _active_flag As String

    Public Property ID() As Guid
        Get
            Return _id
        End Get
        Set(ByVal value As Guid)
            _id = Value
        End Set
    End Property

    Public Property UserName() As String
        Get
            Return _userName
        End Get
        Set(ByVal value As String)
            _userName = Value
        End Set
    End Property
    Public Property GroupID() As String
        Get
            Return _GroupID
        End Get
        Set(ByVal value As String)
            _GroupID = value
        End Set
    End Property
    Public Property Password() As String
        Get
            Return _password
        End Get
        Set(ByVal value As String)
            _password = Value
        End Set
    End Property

    Public Property firstpage() As String
        Get
            Return _firstpage
        End Get
        Set(ByVal value As String)
            _firstpage = value
        End Set
    End Property
    Public Property team() As String
        Get
            Return _team
        End Get
        Set(ByVal value As String)
            _team = value
        End Set
    End Property
    Public Property id_team() As Integer
        Get
            Return _id_team
        End Get
        Set(ByVal value As Integer)
            _id_team = value
        End Set
    End Property
    Public Property office() As String
        Get
            Return _office
        End Get
        Set(ByVal value As String)
            _office = value
        End Set
    End Property
    Public Property region() As String
        Get
            Return _region
        End Get
        Set(ByVal value As String)
            _region = value
        End Set
    End Property
    Public Property user_access() As String
        Get
            Return _user_access
        End Get
        Set(ByVal value As String)
            _user_access = value
        End Set
    End Property

    Public Property active_flag() As String
        Get
            Return _active_flag
        End Get
        Set(ByVal value As String)
            _active_flag = value
        End Set
    End Property
    Public Function Login(ByVal txtUser As String) As UserClass
        Dim UserLogin As UserClass = New UserClass()
        Dim sLoginFrom As String = ConfigurationManager.AppSettings("LoginFrom")
        If sLoginFrom = "DB" Then
            Dim sTable As String = ConfigurationManager.AppSettings("UserListTable")
            Dim sLogin As String = ConfigurationManager.AppSettings("FieldUserLogin")
            Dim sLoginType As String = ConfigurationManager.AppSettings("FieldUserLoginType")
            '  Dim sPwd As String = ConfigurationManager.AppSettings("FieldUserPwd")
            Dim sPwdType As String = ConfigurationManager.AppSettings("FieldUserPwdType")

            If sTable = String.Empty OrElse sLogin = String.Empty Then
                Return Nothing
            End If
            Dim sSQL As String = "select [" + sLogin + "],[firstpage],[team],[office],[id_team],[region],[user_access],[active_flag]"
            sTable = "sa.[" & sTable.Replace(".", "].[") & "]"
            sSQL += " from " + sTable + " where [" + sLogin + "] = @Login "
            Dim cts As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("Deviec_SA_V1ConnectionString")
            Dim sds As SqlDataSource = New SqlDataSource(cts.ProviderName, cts.ConnectionString, sSQL)
            Try
                sds.DataSourceMode = SqlDataSourceMode.DataReader
                sds.SelectParameters.Add("Login", CType(System.Enum.Parse(GetType(TypeCode), sLoginType), TypeCode), txtUser)
                ' sds.SelectParameters.Add("Password", CType(System.Enum.Parse(GetType(TypeCode), sPwdType), TypeCode), txtPassword)
                Dim dbDr As System.Data.Common.DbDataReader = CType(sds.Select(System.Web.UI.DataSourceSelectArguments.Empty), System.Data.Common.DbDataReader)
                If dbDr.HasRows AndAlso dbDr.Read() Then
                    If dbDr(sLogin).ToString() = txtUser Then
                        UserLogin.ID = Guid.NewGuid()
                        UserLogin.firstpage = dbDr("firstpage").ToString()
                        UserLogin.team = dbDr("team").ToString()
                        If dbDr("id_team").ToString() = "" Then
                            UserLogin.id_team = "0"
                        Else
                            UserLogin.id_team = dbDr("id_team").ToString()
                        End If
                        UserLogin.office = dbDr("office").ToString()
                        UserLogin.region = dbDr("region").ToString()
                        UserLogin.user_access = dbDr("user_access").ToString()
                        UserLogin.active_flag = dbDr("active_flag").ToString()
                    End If
                End If
                dbDr.Dispose()
            Finally
                sds.Dispose()
            End Try
        Else
            If txtUser = ConfigurationManager.AppSettings("UserLogin") Then
                UserLogin.ID = Guid.NewGuid()
            End If
        End If
        If UserLogin.ID = Guid.Empty Then
            Return Nothing
        Else
            UserLogin.UserName = txtUser
            Return UserLogin
        End If
    End Function
    Public Function Login_pass(ByVal txtUser As String, ByVal txtPassword As String) As UserClass
        Dim UserLogin As UserClass = New UserClass()
        Dim sLoginFrom As String = ConfigurationManager.AppSettings("LoginFrom")
        If sLoginFrom = "DB" Then
            Dim sTable As String = ConfigurationManager.AppSettings("UserListTable")
            Dim sLogin As String = ConfigurationManager.AppSettings("FieldUserLogin")
            Dim sLoginType As String = ConfigurationManager.AppSettings("FieldUserLoginType")
            Dim sPwd As String = ConfigurationManager.AppSettings("FieldUserPwd")
            Dim sPwdType As String = ConfigurationManager.AppSettings("FieldUserPwdType")

            If sTable = String.Empty OrElse sLogin = String.Empty OrElse sPwd = String.Empty Then
                Return Nothing
            End If
            Dim sSQL As String = "select [" + sLogin + "],[" + sPwd + "],[firstpage],[team],[office],[id_team],[region],[user_access],[active_flag]"
            sTable = "sa.[" & sTable.Replace(".", "].[") & "]"
            sSQL += " from " + sTable + " where [" + sLogin + "] = @Login And [" + sPwd + "] = @Password "
            Dim cts As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("Deviec_SA_V1ConnectionString")
            Dim sds As SqlDataSource = New SqlDataSource(cts.ProviderName, cts.ConnectionString, sSQL)
            Try
                sds.DataSourceMode = SqlDataSourceMode.DataReader
                sds.SelectParameters.Add("Login", CType(System.Enum.Parse(GetType(TypeCode), sLoginType), TypeCode), txtUser)
                sds.SelectParameters.Add("Password", CType(System.Enum.Parse(GetType(TypeCode), sPwdType), TypeCode), txtPassword)
                Dim dbDr As System.Data.Common.DbDataReader = CType(sds.Select(System.Web.UI.DataSourceSelectArguments.Empty), System.Data.Common.DbDataReader)
                If dbDr.HasRows AndAlso dbDr.Read() Then
                    If dbDr(sLogin).ToString() = txtUser AndAlso dbDr(sPwd).ToString() = txtPassword Then
                        UserLogin.ID = Guid.NewGuid()
                        UserLogin.firstpage = dbDr("firstpage").ToString()
                        UserLogin.team = dbDr("team").ToString()
                        If dbDr("id_team").ToString() = "" Then
                            UserLogin.id_team = "0"
                        Else
                            UserLogin.id_team = dbDr("id_team").ToString()
                        End If
                        UserLogin.office = dbDr("office").ToString()
                        UserLogin.region = dbDr("region").ToString()
                        UserLogin.user_access = dbDr("user_access").ToString()
                        UserLogin.active_flag = dbDr("active_flag").ToString()
                    End If
                End If
                dbDr.Dispose()
            Finally
                sds.Dispose()
            End Try
        Else
            If txtUser = ConfigurationManager.AppSettings("UserLogin") AndAlso txtPassword = ConfigurationManager.AppSettings("UserPassword") Then
                UserLogin.ID = Guid.NewGuid()
            End If
        End If
        If UserLogin.ID = Guid.Empty Then
            Return Nothing
        Else
            UserLogin.UserName = txtUser
            Return UserLogin
        End If
    End Function
    Public Shared Sub CheckLogin(ByVal Page As System.Web.UI.Page)
        If String.IsNullOrEmpty(ConfigurationManager.AppSettings("LoginMethod")) OrElse (ConfigurationManager.AppSettings("LoginMethod")).ToUpper() = "WITHOUTLOGIN" Then
            Exit Sub
        End If
        If Page.Session("User") Is Nothing Then
            Page.Response.Redirect(ConfigurationManager.AppSettings("LoginFile") + "?url=" + Page.Request.RawUrl)
        End If
        If (CType(Page.Session("User"), UserClass)).ID = Guid.Empty Then
            Page.Response.Redirect(ConfigurationManager.AppSettings("LoginFile") + "?url=" + Page.Request.RawUrl)
        End If
    End Sub
    Public Shared Sub Insert_promission_admin(ByVal username As Integer)
        UserClass.Insert_promission("admin_check_user.aspx", "S", username)
        UserClass.Insert_promission("all_section.aspx", "S", username)
        UserClass.Insert_promission("admin_flag.aspx", "S", username)
        UserClass.Insert_promission("all_device_admin.aspx", "S", username)
    End Sub
    Public Shared Sub Insert_promission_person(ByVal username As Integer)
        UserClass.Insert_promission("frist.aspx", "S", username)
        UserClass.Insert_promission("mylink.aspx", "S", username)
        UserClass.Insert_promission("person.aspx", "S", username)
    End Sub
    Public Shared Sub Insert_promission_section(ByVal username As Integer)
        UserClass.Insert_promission("order_type.aspx", "S", username)
        UserClass.Insert_promission("order_section.aspx", "S", username)
        UserClass.Insert_promission("order_section_sum.aspx", "S", username)
        UserClass.Insert_promission("order_section_his.aspx", "S", username)
        UserClass.Insert_promission("order_section_sum_detail.aspx", "S", username)

    End Sub
    Public Shared Sub Insert_promission_region(ByVal username As Integer)
        UserClass.Insert_promission("order_type.aspx", "S", username)
        UserClass.Insert_promission("order_region.aspx", "S", username)
        UserClass.Insert_promission("order_region_sum.aspx", "S", username)
        UserClass.Insert_promission("order_region_his.aspx", "S", username)
        UserClass.Insert_promission("order_region_sum_detail.aspx", "S", username)
    End Sub
    Public Shared Sub Insert_promission_km(ByVal username As Integer)
        UserClass.Insert_promission("km_name_damage.aspx", "S", username)
        UserClass.Insert_promission("report_km1.aspx", "S", username)
        UserClass.Insert_promission("Report_damage_his.aspx", "S", username)
        UserClass.Insert_promission("report_damage_his_date.aspx", "S", username)
        UserClass.Insert_promission("km_name_damage_date.aspx", "S", username)
    End Sub
    Public Shared Sub Delete_promission_km(ByVal username As Integer)
        UserClass.delete_promission("km_name_damage.aspx", "S", username)
        UserClass.delete_promission("report_km1.aspx", "S", username)
        UserClass.delete_promission("Report_damage_his.aspx", "S", username)
        UserClass.delete_promission("report_damage_his_date.aspx", "S", username)
        UserClass.delete_promission("km_name_damage_date.aspx", "S", username)
    End Sub
    Public Shared Sub Insert_promission_owner(ByVal username As Integer)
        UserClass.Insert_promission("add_damage.aspx", "S", username)
        UserClass.Insert_promission("Add_Edit_damage.aspx", "S", username)
        UserClass.Insert_promission("Add_Edit_name.aspx", "S", username)
        UserClass.Insert_promission("add_pic_damage.aspx", "S", username)
        UserClass.Insert_promission("add_pic_device.aspx", "S", username)
        UserClass.Insert_promission("change_location.aspx", "S", username)
        UserClass.Insert_promission("Damage.aspx", "S", username)
        UserClass.Insert_promission("Default.aspx", "S", username)
        UserClass.Insert_promission("Device.aspx", "S", username)
        UserClass.Insert_promission("Device_list.aspx", "S", username)
        UserClass.Insert_promission("Device_type.aspx", "S", username)
        UserClass.Insert_promission("Edit_damage.aspx", "S", username)
        UserClass.Insert_promission("Edit_name.aspx", "S", username)
        UserClass.Insert_promission("Edit_work.aspx", "S", username)

        UserClass.Insert_promission("getfile.aspx", "S", username)
        UserClass.Insert_promission("list_receive_damage.aspx", "S", username)
        UserClass.Insert_promission("Materaial.aspx", "S", username)
        UserClass.Insert_promission("Operation.aspx", "S", username)
        UserClass.Insert_promission("receive_damage.aspx", "S", username)

        UserClass.Insert_promission("Report_material.aspx", "S", username)
        UserClass.Insert_promission("Report_name_work_wait.aspx", "S", username)
        UserClass.Insert_promission("Team2.aspx", "S", username)
        UserClass.Insert_promission("View_work_device.aspx", "S", username)
        UserClass.Insert_promission("wait_work.aspx", "S", username)
        UserClass.Insert_promission("Report_work_date.aspx", "S", username)
        UserClass.Insert_promission("Materraial.aspx", "S", username)
        UserClass.Insert_promission("all_page.aspx", "S", username)
        UserClass.Insert_promission("delete_device.aspx", "S", username)
        UserClass.Insert_promission("list_changed_location_location.aspx", "S", username)
        UserClass.Insert_promission("list_changed_location_dbname.aspx", "S", username)
        UserClass.Insert_promission("Report_damage_his.aspx", "S", username)
        UserClass.Insert_promission("select_detail_proprety.aspx", "S", username)

        'UserClass.Insert_promission("Team2.aspx", "S", username)
        UserClass.Insert_promission("Report_Date.aspx", "S", username)
        UserClass.Insert_promission("wait_work.aspx", "S", username)
        UserClass.Insert_promission("Report_name_work_wait.aspx", "S", username)
        UserClass.Insert_promission("add_property.aspx", "S", username)

        UserClass.Insert_promission("add_detail_property.aspx", "S", username)

        UserClass.Insert_promission("user_select_detail_proprety.aspx", "S", username)
        UserClass.Insert_promission("list_changed_location_opid.aspx", "S", username)
        UserClass.Insert_promission("list_changed_location_dbname.aspx", "S", username)
        UserClass.Insert_promission("frist.aspx", "S", username)
        UserClass.Insert_promission("mylink.aspx", "S", username)
        UserClass.Insert_promission("person.aspx", "S", username)
        UserClass.Insert_promission("damage_chang.aspx", "S", username)
        UserClass.Insert_promission("me_pmce_list_detail.aspx", "S", username)
        'UserClass.Insert_promission("mylink.aspx", "S", username)

        Insert_promission_km(username)
    End Sub

    Public Shared Sub Insert_promission(ByVal page As String, ByVal permission As String, ByVal username As Integer)
        Dim Ds As New DataSet
        Dim Dt As DataTable
        Dim Dr As DataRow
        Dim StrCon As New SqlConnection("SERVER=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
        Dim Adpt As New SqlDataAdapter("SELECT * FROM sa.[user_permissions]", StrCon)
        Adpt.Fill(Ds, "user_permissions")
        Dt = Ds.Tables("user_permissions")
        Dr = Dt.NewRow
        Dr("userid") = username
        Dr("action") = "S"
        Dr("permission") = permission
        Dr("tablename") = page
        Dt.Rows.Add(Dr)
        Dim cdb As New SqlCommandBuilder(Adpt)
        Adpt.Update(Ds, "user_permissions")
        Ds.AcceptChanges()
    End Sub
    Protected Shared Sub delete_promission(ByVal page As String, ByVal permission As String, ByVal username As Integer)
        Dim objConn As New SqlConnection
        Dim objCmd As SqlCommand
        Dim strConnString, strSQL As String
        strConnString = "Server=172.30.203.155;Uid=sa;PASSWORD=1234;database= SA_System;Max Pool Size=400;Connect Timeout=600;"
        objConn.ConnectionString = strConnString
        objConn.Open()
        strSQL = "DELETE FROM [SA_System].[sa].[user_permissions] WHERE userid = " & username & " and tablename = '" & page & "'"
        objCmd = New SqlCommand(strSQL, objConn)
        objCmd.ExecuteNonQuery()
        'insert_operation_data()
        objConn.Close()
    End Sub

    'Protected Shared Sub UPDATE_STATUS_VSPP2(ByVal solution As String, ByVal Before As String, ByVal After As String, ByVal Type As String, ByVal UserName As String)
    '    Dim Ds As New DataSet
    '    Dim Dt As DataTable
    '    Dim Dr As DataRow
    '    Dim StrCon As New SqlConnection("SERVER=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
    '    Dim Adpt As New SqlDataAdapter("SELECT * FROM [VSPP_LOG]", StrCon)
    '    Adpt.Fill(Ds, "VSPP_LOG")
    '    Dt = Ds.Tables("VSPP_LOG")
    '    Dr = Dt.NewRow
    '    Dr("Solution") = solution
    '    Dr("Before") = Before
    '    Dr("After") = After
    '    Dr("UserName") = UserName
    '    Dr("Type") = Type
    '    Dr("Date_status") = Date.Now
    '    Dt.Rows.Add(Dr)
    '    Dim cdb As New SqlCommandBuilder(Adpt)
    '    Adpt.Update(Ds, "VSPP_LOG")
    '    Ds.AcceptChanges()
    'End Sub
    'Public Shared Sub Insert_Status_BU(ByVal ID_BU As Int32, ByVal Status As String, ByVal DATE_CREATE As DateTime, ByVal User_name As String, ByVal Note As String)
    '    Dim Ds As New DataSet
    '    Dim Dt As DataTable
    '    Dim Dr As DataRow
    '    Dim StrCon As New SqlConnection("SERVER=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
    '    Dim Adpt As New SqlDataAdapter("SELECT * FROM [VSPP_STATUS_List]", StrCon)
    '    Adpt.Fill(Ds, "VSPP_STATUS_List")
    '    Dt = Ds.Tables("VSPP_STATUS_List")
    '    Dr = Dt.NewRow
    '    Dr("ID_BU") = ID_BU
    '    Dr("Status") = Status
    '    Dr("Date") = DATE_CREATE
    '    Dr("User_name") = User_name
    '    Dr("Date_Update") = Date.Now
    '    Dr("Note") = Note

    '    Dt.Rows.Add(Dr)
    '    Dim cdb As New SqlCommandBuilder(Adpt)
    '    Adpt.Update(Ds, "VSPP_STATUS_List")
    '    Ds.AcceptChanges()
    'End Sub


    'Public Shared Sub login_page(ByVal User_name As String, ByVal Page As String, ByVal Login_Type As String)
    '    Dim Ds As New DataSet
    '    Dim Dt As DataTable
    '    Dim Dr As DataRow
    '    Dim StrCon As New SqlConnection("SERVER=172.30.203.155; uid=sa;pwd=1234; database= SA_System")
    '    Dim Adpt As New SqlDataAdapter("SELECT * FROM [VSPP_HIS]", StrCon)
    '    Adpt.Fill(Ds, "VSPP_HIS")
    '    Dt = Ds.Tables("VSPP_HIS")
    '    Dr = Dt.NewRow
    '    Dr("Page") = Page
    '    Dr("Login_Name") = User_name
    '    Dr("Login_Time") = Date.Now
    '    Dr("Login_Type") = Login_Type
    '    Dt.Rows.Add(Dr)
    '    Dim cdb As New SqlCommandBuilder(Adpt)
    '    Adpt.Update(Ds, "VSPP_HIS")
    '    Ds.AcceptChanges()
    'End Sub
End Class