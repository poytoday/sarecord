<%@ Page Language="VB" AutoEventWireup="false" CodeFile="regit.aspx.vb" Inherits="regis" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
        .style1 {
            height: 97px;
            width: 894px;
        }

        .style2 {
            width: 192px;
            height: 30px;
        }

        .style7 {
            width: 192px;
            height: 30px;
        }

        .style9 {
            height: 30px;
        }

        .style12 {
            width: 193px;
            height: 30px;
        }

        .style14 {
            width: 194px;
            height: 30px;
        }

        .style16 {
            width: 368px;
        }

        .style17 {
            width: 216px;
            height: 30px;
        }

        .style18 {
            width: 368px;
            height: 30px;
        }

        .style19 {
            height: 20px;
        }

        .style20 {
            height: 97px;
            width: 760px;
        }

        .style21 {
            width: 217px;
            height: 45px;
        }

        .style22 {
            width: 368px;
            height: 45px;
        }

        .style23 {
            width: 217px;
            height: 33px;
        }

        .style24 {
            width: 368px;
            height: 33px;
        }

        .style25 {
            width: 217px;
            height: 37px;
        }

        .style26 {
            width: 368px;
            height: 37px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-container">
            <poy:header ID="UCmenu1" runat="server" />
            <h3>
                <table border="0" id="tb01">
                    <tr>
                        <td valign="middle" align="center" class="style1">
                            <table border="0" style="table-layout: auto; font-family: Arial, Helvetica, sans-serif; width: 815px;"
                                align="center">
                                <tr>
                                    <td valign="middle" align="center" class="style20" width="99%">
                                        <table class="loginForm" cellspacing="0" cellpadding="4" border="0">
                                            <tr>
                                                <td colspan="2" class="blackshade" align="center">
                                                    <strong><font size="+1">ลงทะเบียนเข้าใช้งาน</font></strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="text-align: center" valign="middle" class="style19">Sa record</td>
                                            </tr>
                                            <tr>
                                                <td valign="top" align="right" class="style12">คำนำหน้า:&nbsp;
                                                </td>
                                                <td align="left" class="style16">
                                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                                        <asp:ListItem>นาย</asp:ListItem>
                                                        <asp:ListItem>นาง</asp:ListItem>
                                                        <asp:ListItem>นางสาว</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="เลือกคำนำหน้า"
                                                        ForeColor="Red" ControlToValidate="RadioButtonList1" ValidationGroup="A1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top" align="right" class="style14">ชื่อ:&nbsp;
                                                </td>
                                                <td align="left" class="style16">&nbsp;<asp:TextBox ID="firstname" runat="server" Width="125px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="ใส่ชื่อ"
                                                        ForeColor="Red" ControlToValidate="firstname" ValidationGroup="A1"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top" align="right" class="style17">นามสกุล :
                                                </td>
                                                <td align="left" class="style16">&nbsp;<asp:TextBox ID="lastname" runat="server" Width="125px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="ใส่นามสกุล"
                                                        ForeColor="Red" ControlToValidate="lastname" ValidationGroup="A1"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top" align="right" class="style7">ตำแหน่ง :
                                                </td>
                                                <td align="left" class="style18">&nbsp;<asp:TextBox ID="position" runat="server" Width="125px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="ตำแหน่ง"
                                                        ForeColor="Red" ControlToValidate="position" ValidationGroup="A1"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top" align="right" class="style9" style="color: #0000FF">รหัสประจำตัว<br />
                                                    (ใช้เป็น USER NAME) :
                                                </td>
                                                <td align="left" class="style16">&nbsp;<asp:TextBox ID="tb_pea_id" runat="server" Width="125px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="ใส่รหัสประจำตัว"
                                                        ForeColor="Red" ControlToValidate="tb_pea_id" ValidationGroup="A1"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top" align="right" class="style12">ประเภทผู้ใช้งาน:&nbsp;
                                                </td>
                                                <td align="left" class="style16">
                                              <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal"
                                                        RepeatColumns="1" AutoPostBack="True">

                                                        <asp:ListItem Value="owner" Selected="True">เจ้าของอุปกรณ์</asp:ListItem>
                                                     <%--   <asp:ListItem Value="user" Enabled="False">ผู้ใช้งาน</asp:ListItem>
                                                        <asp:ListItem Value="section">ผู้บริหารหน่วยงาน</asp:ListItem>
                                                        <asp:ListItem Value="region" Enabled="False">ผู้บริหารองค์กร</asp:ListItem>--%>

                                                    </asp:RadioButtonList>
                                             <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="เลือกประเภทผู้ใช้งาน"
                                                        ForeColor="Red" ControlToValidate="RadioButtonList2" ValidationGroup="A1" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" dir="ltr">เขต :
                                                </td>
                                                <td align="left" class="style16">
                                                    <asp:DropDownList ID="DropDownList1" runat="server" Height="19px" Width="156px" AutoPostBack="True">
                                                        <asp:ListItem>น.1</asp:ListItem>
                                                        <asp:ListItem>น.2</asp:ListItem>
                                                        <asp:ListItem>น.3</asp:ListItem>
                                                        <asp:ListItem>ฉ.1</asp:ListItem>
                                                        <asp:ListItem>ฉ.2</asp:ListItem>
                                                        <asp:ListItem>ฉ.3</asp:ListItem>
                                                        <asp:ListItem>ก.1</asp:ListItem>
                                                        <asp:ListItem>ก.2</asp:ListItem>
                                                        <asp:ListItem>ก.3</asp:ListItem>
                                                        <asp:ListItem>ต.1</asp:ListItem>
                                                        <asp:ListItem>ต.2</asp:ListItem>
                                                        <asp:ListItem>ต.3</asp:ListItem>
                                                        <asp:ListItem>PEA</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                                        SelectCommand="SELECT DISTINCT region FROM sa.office_name"></asp:SqlDataSource>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top" align="right" class="style21" id="td01">แผนก :&nbsp;
                                                </td>
                                                <td align="left" class="style22">&nbsp;<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1"
                                                    DataTextField="office" DataValueField="office" AutoPostBack="True" Height="20px"
                                                    Width="152px">
                                                </asp:DropDownList>
                                                    <asp:Label ID="Label1" runat="server" ForeColor="Blue" Visible="False"></asp:Label>
                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                                        SelectCommand="SELECT office, region FROM sa.office_name WHERE (region = @P_region) AND (NOT (office LIKE 'ผู้บริหาร%'))">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="DropDownList1" Name="P_region" PropertyName="SelectedValue" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top" align="right" class="style23" id="td02">ทีมงาน :&nbsp;
                                                </td>
                                                <td align="left" class="style24">&nbsp;<asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2"
                                                    DataTextField="Team" DataValueField="ID" Height="20px" Width="151px">
                                                </asp:DropDownList>
                                                    <asp:Label ID="Label2" runat="server" ForeColor="Blue" Visible="False"></asp:Label>
                                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                                        SelectCommand="SELECT Team, ID FROM sa.Team WHERE (office = @office)">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="DropDownList2" Name="office" PropertyName="SelectedValue"
                                                                Type="String" DefaultValue="ผอค.น.3" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </td>
                                            </tr>
                                            <%--<tr>
                                <td valign="top" align="right" class="style2">
                                    วันบรรจุ(วัน/เดือน/ปี):
                                </td>
                                <td align="left" class="style16">
                                    &nbsp;<asp:Label ID="Label1" runat="server"></asp:Label>
                                    <asp:Button ID="Button1" runat="server" Text="คลิกวันที่" />
                                    <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66"
                                        BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
                                        ForeColor="#663399" Height="200px" ShowGridLines="True" Visible="False" Width="220px">
                                        <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                                        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                                        <OtherMonthDayStyle ForeColor="#CC9966" />
                                        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                                        <SelectorStyle BackColor="#FFCC66" />
                                        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                                        <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                                    </asp:Calendar>
                                </td>
                            </tr>--%>
                                            <%--<tr>
                                <td valign="top" align="right" class="style6">
                                    วันเกิด(วัน/เดือน/ปี):
                                </td>
                                <td align="left" class="style18">
                                    <asp:Label ID="Label2" runat="server"></asp:Label>
                                    &nbsp;<asp:Button ID="Button2" runat="server" Text="คลิกวันที่" />
                                    <asp:Calendar ID="Calendar2" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66"
                                        BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
                                        ForeColor="#663399" Height="200px" ShowGridLines="True" Visible="False" Width="220px">
                                        <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                                        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                                        <OtherMonthDayStyle ForeColor="#CC9966" />
                                        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                                        <SelectorStyle BackColor="#FFCC66" />
                                        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                                        <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                                    </asp:Calendar>
                                </td>
                            </tr>--%>
                                            <%--<tr>
                                <td align="center" colspan="2" style="height: 28px">
                                    <asp:CheckBox ID="CheckBox1" runat="server" CausesValidation="True" Text="ต้องการสิทธ์ในการแก้ไขข้อมูล" />
                                </td>
                            </tr>--%>
                                            <%--<tr>
                                            <td valign="top" align="right" class="style25">
                                                รหัสผ่าน :
                                            </td>
                                            <td align="left" class="style26">
                                                &nbsp;<asp:TextBox ID="pass" runat="server" TextMode="Password" Width="125px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="กรอก password"
                                                    ForeColor="Red" ControlToValidate="pass" ValidationGroup="A1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>--%>
                                            <%--<tr>
                                            <td valign="top" align="right">
                                                ยืนยันรหัสผ่าน:
                                            </td>
                                            <td align="left" class="style18">
                                                &nbsp;<asp:TextBox ID="cpass" runat="server" TextMode="Password" Width="127px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="ยืนยัน password"
                                                    ForeColor="Red" ControlToValidate="cpass" ValidationGroup="A1"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>--%>
                                        </table>
                                        <p>
                                            <asp:Button ID="cmdLogin" runat="server" CssClass="buttonM" ForeColor="#FF3300" Height="20px"
                                                Text="ลงทะเบียน" ValidationGroup="A1" /><br />
                                            <asp:Label ID="lblMessage" runat="server" CssClass="errormsg" ForeColor="Red"></asp:Label>
                                            <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource3"
                                                DataTextField="region" DataValueField="region" AutoPostBack="True" Height="16px"
                                                Width="152px" Visible="False">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                                SelectCommand="SELECT region FROM sa.office_name WHERE (office = @office)">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="DropDownList2" DefaultValue="ผอค.น.3" Name="office"
                                                        PropertyName="SelectedValue" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </p>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </h3>
            <poy:tail ID="tail1" runat="server" />
        </div>
    </form>
</body>
</html>
