
Partial Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        lblMessage.Text = ""

        Try
            Dim session As HttpCookie = Request.Cookies("Login")
            Dim ck_id As HttpCookie = Request.Cookies("LoginID")
            ''
            'If session.Value = True And ck_id.Value <> "" Then


            '    login_sa(ck_id.Value)
            '    'login_sa(444678)
            '    Response.Redirect(session("firstpage").ToString)



            'Else
            '    Response.Redirect("http://smartdata.pea.co.th")
            'End If


            'test Login
            login_sa(495151)


            'Response.Redirect(session("firstpage").ToString)
            'test Login



        Catch ex As Exception
            lblMessage.Text = ex.Message
        End Try






        'If aCookie("Login") = True Then
        '    login_sa(aCookie("LoginID"))
        '    Redirect()
        'Else
        '    Response.Redirect("http://smartdata.pea.co.th")


        '    '    If (Not Page.IsPostBack) Then
        '    '        If String.IsNullOrEmpty(ConfigurationManager.AppSettings("LoginMethod")) OrElse (ConfigurationManager.AppSettings("LoginMethod")).ToUpper() = "WITHOUTLOGIN" Then
        '    '            Redirect()
        '    '            Exit Sub
        '    '        End If

        '    '        If Not IsNothing(Request.QueryString("user")) Then
        '    '            txtUserName.Text = Request.QueryString("user")
        '    '            txtPassword.Attributes.Add("value", "")
        '    '        Else
        '    '            If Request.Browser.Cookies Then
        '    '                If Not IsNothing(Request.Cookies("UserInfo")) Then
        '    '                    txtUserName.Text = Request.Cookies("UserInfo")("UserLogin_sa")
        '    '                    txtPassword.Attributes.Add("value", Request.Cookies("UserInfo")("UserPwd_Sa"))
        '    '                    chbSavePassword.Checked = True
        '    '                End If
        '    '                chbSavePassword.Visible = True
        '    '            Else
        '    '                chbSavePassword.Visible = False
        '    '            End If
        '    '        End If
        '    '        ' Session.Clear()
        '    '    End If


        '    '    If txtUserName.Text = String.Empty Then
        '    '        Page.SetFocus(txtUserName)
        '    '    Else
        '    '        Page.SetFocus(txtPassword)
        '    '    End If
        'End If

    End Sub


    Protected Sub login_sa(ByVal userID As String)
        Dim userLogin As UserClass = New UserClass()
        'Dim aCookie As HttpCookie = New HttpCookie("UserInfo")
        Try
            userLogin = userLogin.Login(userID)
            If Not IsNothing(userLogin) AndAlso userLogin.ID <> Guid.Empty Then

                'UserClass.login_page(userLogin.UserName, "Login.aspx", "Login")
                'If Request.Browser.Cookies Then
                '    If chbSavePassword.Checked Then
                '        aCookie("UserLogin_sa") = txtUserName.Text
                '        aCookie("UserPwd_Sa") = txtPassword.Text

                '        aCookie.Expires = DateTime.Now.AddYears(1)
                '    Else
                '        aCookie.Expires = DateTime.Now
                '    End If
                '    Response.Cookies.Add(aCookie)
                'End If
                If userLogin.active_flag = "True" Then
                    Session("User") = userLogin
                    Session("UserName") = userLogin.UserName
                    Session("UserTeam") = userLogin.team
                    Session("User_id_team") = userLogin.id_team
                    Session("UserOffice") = userLogin.office
                    Session("UserRegion") = userLogin.region
                    Session("User_access") = userLogin.user_access

                    Session("firstpage") = userLogin.firstpage
                Else
                    userLogin = Nothing
                    Session("User") = Nothing
                    lblMessage.Text = "User ยังไม่ได้รับการยืนยัน"
                End If
            Else
                userLogin = Nothing
                Session("User") = Nothing
                lblMessage.Text = "Invalid Login"
            End If
        Catch
            userLogin = Nothing
            Session("User") = Nothing
            'lblMessage.Text = "Invalid Login"
        End Try
        Response.Redirect(userLogin.firstpage)
        If IsNothing(userLogin) Then
            Response.Redirect("regit.aspx")
        End If

    End Sub
    Protected Sub Redirect()
        Try

            Dim sStartPageURL As String = ""
            If Not IsNothing(Request.QueryString("url")) Then
                sStartPageURL = Request.QueryString("url")

            Else
                sStartPageURL = Session("firstpage")
                ''
            End If

            If sStartPageURL = String.Empty Then
                Response.Write("<script language=javascript>alert('" + "Start page isn't set" + "');</script>")
            Else
                'Response.Redirect("New_Main_login.aspx")
                Response.Redirect("frist.aspx")
                '  Response.End()
            End If


        Catch ex As Exception
            lblMessage.Text = ex.Message
        End Try

    End Sub

End Class
