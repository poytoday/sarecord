<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login2.aspx.vb" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ลงชื่อเข้าใช้ </title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="3600" />
    <meta name="revisit-after" content="2 days" />
    <meta name="robots" content="index,follow" />
    <meta name="publisher" content="Your publisher infos here ..." />
    <meta name="copyright" content="Your copyright infos here ..." />
    <meta name="author" content="Design: Wolfgang (www.1-2-3-4.info) / Modified: Your Name" />
    <meta name="distribution" content="global" />
    <meta name="description" content="Your page description here ..." />
    <meta name="keywords" content="Your keywords, keywords, keywords, here ..." />
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="./css/layout4_setup.css" />
    <link rel="stylesheet" type="text/css" media="screen,projection,print" href="./css/layout4_text.css" />
    <style type="text/css">
        .style1
        {
            width: 915px;
        }
        .errormsg {}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="page-container">
        <poy:header ID="UCmenu1" runat="server" />
        <h3>
            <table border="0">
                <tr>
                    <td valign="middle" align="center" class="style1">
                        <asp:Panel ID="Panel1" runat="server" Enabled="true" Width="330" HorizontalAlign="Center"
                            CssClass="shade">
                            <table class="loginForm" cellspacing="0" cellpadding="4" width="330" border="0">
                                <tr>
                                    <td colspan="2" class="blackshade" align="center" style="height: 27px">
                                        <strong><font size="+1"><span style="font-size: 13pt">&nbsp;<asp:Label ID="Label1"
                                            runat="server" CssClass="errormsg" ForeColor="#FF8000">&#3621;&#3591;&#3594;&#3639;&#3656;&#3629;&#3648;&#3586;&#3657;&#3634;&#3651;&#3594;&#3657;</asp:Label></span></font></strong>
                                    </td>
                                </tr>
                                <%--<tr>
                                        <td colspan="3">
                                            <strong><span style="font-size: 13pt">Login &nbsp; </span></strong>
                                            <img src="images/users.gif" />&nbsp;</td>
                                    </tr>--%>
                               <%-- <tr>
                                    <td valign="top" align="right" style="width: 83px">
                                        Username:&nbsp;
                                    </td>
                                    <td align="left" style="width: 178px">
                                        <asp:TextBox ID="txtUserName" TabIndex="1" runat="server" Width="150px" Height="22px"></asp:TextBox><br />
                                        <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ErrorMessage="Username can not be empty."
                                            ControlToValidate="txtUserName" Display="Dynamic" Width="208px" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>--%>
                               <%-- <tr>
                                    <td valign="top" align="right" style="width: 83px">
                                        Password:&nbsp;
                                    </td>
                                    <td align="left" style="width: 178px">
                                        <asp:TextBox ID="txtPassword" TabIndex="2" runat="server" Width="150px" TextMode="Password"
                                            Height="27px"></asp:TextBox><br />
                                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is required"
                                            ControlToValidate="txtPassword" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:CheckBox ID="chbSavePassword" runat="server" TextAlign="Left" CssClass="checkbox"
                                            Text="Remember Password" Width="232px" Checked="True"></asp:CheckBox>
                                    </td>
                                </tr>--%>
                              <%--  <tr>
                                    <td align="center" colspan="2" style="height: 20px">
                                        &nbsp;
                                        <asp:Button ID="cmdLogin" runat="server" CssClass="buttonM" OnClick="cmdLogin_Click"
                                            Text="Submit"></asp:Button>
                                    </td>
                                </tr>--%>
                            </table>
                            <p>
                                &nbsp;</p>
                            <p>
                                &nbsp;&nbsp;&nbsp;</p>
                            <p>
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/regit.aspx" Width="140px">&#3621;&#3591;&#3607;&#3632;&#3648;&#3610;&#3637;&#3618;&#3609;&#3651;&#3627;&#3617;&#3656;</asp:HyperLink>
                            </p>
                            <p>
                                &nbsp;<asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Forget_pass.aspx"
                                    Width="254px" Height="27px">&#3621;&#3639;&#3617;&#3619;&#3627;&#3633;&#3626;&#3612;&#3656;&#3634;&#3609;</asp:HyperLink>
                                <asp:Label ID="lblMessage" runat="server" CssClass="errormsg" ForeColor="Red" Width="320px"></asp:Label>
                                &nbsp;
                            </p>
                        </asp:Panel>
                </tr>
            </table>
            <poy:tail ID="tail1" runat="server" />
    </div>
    </form>
</body>
</html>
