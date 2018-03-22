<%@ Page Language="VB" AutoEventWireup="false" CodeFile="move_property.aspx.vb" Inherits="move_property" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 205px;
        }
        .style2
        {
            width: 207px;
        }
        .style3
        {
            width: 217px;
            height: 33px;
        }
        .style4
        {
            height: 33px;
        }
        .style8
        {
            height: 38px;
        }
        .style9
        {
            width: 177px;
        }
        .style10
        {
            height: 38px;
            width: 177px;
        }
    </style>
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
</head>
<body>
    <form id="form1" runat="server">
    <div class="page-container">
        <!-- For alternative headers START PASTE here -->
        <!-- A. HEADER -->
        <poy:header ID="UCmenu1" runat="server" />
        <div class="header">
            <div class="nav2">
                <h3 align="center" style="color: #0000FF">
                    แก้ไข รหัส/สถานที่ ของอุปกรณ์
                </h3>
            </div>
        </div>
        <asp:ScriptManager ID="ScriptManager2" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <h3 align="center" style="color: #0000FF">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" HorizontalAlign="Center" Width="50%">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="dbname" HeaderText="DBName" SortExpression="dbname" />
                            <asp:BoundField DataField="op_id" HeaderText="รหัสอุปกรณ์" SortExpression="op_id" />
                            <asp:BoundField DataField="location" HeaderText="Location" SortExpression="location" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                        <SortedAscendingHeaderStyle BackColor="#848384" />
                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                        <SortedDescendingHeaderStyle BackColor="#575357" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>" SelectCommand="SELECT [dbname], [op_id], [location] FROM [SA_System].[sa].[Device_List] WHERE ([dbname] = @dbname)">
                        <SelectParameters>
                            <asp:QueryStringParameter DefaultValue="N3REC.001" Name="dbname" QueryStringField="dbname" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </h3>
                </br>
                <h3>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" Height="18px" RepeatDirection="Horizontal" Width="357px">
                        <asp:ListItem Value="device">รหัสอุปกรณ์</asp:ListItem>
                        <asp:ListItem Value="location">สถานที่</asp:ListItem>
                    </asp:RadioButtonList>
                </h3>
                <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Left" Visible="False">
                    <h3>
                        <table width="99%">
                            <tr>
                                <td class="style1">รหัสเก่า </td>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Width="50%"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">รหัสใหม่ </td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server" Width="50%"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="กรุณาใส่รหัสใหม่" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">อนุมัติที่ </td>
                                <td>
                                    <asp:TextBox ID="TextBox2" runat="server" Width="50%"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox2" ErrorMessage="กรุณาใส่เลขที่อนุมัติ" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">หมายเหตุ </td>
                                <td>
                                    <asp:TextBox ID="TextBox3" runat="server" Height="75px" TextMode="MultiLine" Width="50%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    <asp:Button ID="Button1" runat="server" Text="แก้ไข" ValidationGroup="A" Width="99px" />
                                </td>
                                <td>&nbsp; </td>
                            </tr>
                        </table>
                    </h3>
                </asp:Panel>
                <asp:Panel ID="Panel2" runat="server" Visible="False">
                    <h3>
                        <table width="99%">
                            <tr>
                                <td class="style9">สถานที่เดิม </td>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Width="50%"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style9">สถานที่ใหม่ </td>
                                <td>
                                    <asp:TextBox ID="TextBox4" runat="server" Width="50%"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox4" ErrorMessage="กรุณาใส่สถานที่ใหม่" ForeColor="Red" ValidationGroup="B"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style9">อนุมัติที่ </td>
                                <td>
                                    <asp:TextBox ID="TextBox5" runat="server" Width="50%"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox5" ErrorMessage="กรุณาใส่เลขที่อนุมัติ" ForeColor="Red" ValidationGroup="B"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style9">หมายเหตุ </td>
                                <td>
                                    <asp:TextBox ID="TextBox6" runat="server" Height="81px" TextMode="MultiLine" Width="50%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style10">
                                    <asp:Button ID="Button2" runat="server" Text="แก้ไข" ValidationGroup="B" Width="99px" />
                                </td>
                                <td class="style8">&nbsp; </td>
                            </tr>
                        </table>
                    </h3>
                </asp:Panel>
                 <asp:Panel ID="Panel3" runat="server" Visible="False">
                    <h3>
                        <table width="99%">
                            <tr>
                                <td class="style9">สถานที่เดิม </td>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Width="50%"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style9">สถานที่ใหม่ </td>
                                <td>
                                    <asp:TextBox ID="TextBox7" runat="server" Width="50%"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox4" ErrorMessage="กรุณาใส่สถานที่ใหม่" ForeColor="Red" ValidationGroup="B"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style9">อนุมัติที่ </td>
                                <td>
                                    <asp:TextBox ID="TextBox8" runat="server" Width="50%"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox5" ErrorMessage="กรุณาใส่เลขที่อนุมัติ" ForeColor="Red" ValidationGroup="B"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style9">หมายเหตุ </td>
                                <td>
                                    <asp:TextBox ID="TextBox9" runat="server" Height="81px" TextMode="MultiLine" Width="50%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style10">
                                    <asp:Button ID="Button3" runat="server" Text="แก้ไข" ValidationGroup="B" Width="99px" />
                                </td>
                                <td class="style8">&nbsp; </td>
                            </tr>
                        </table>
                    </h3>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
        <poy:tail ID="tail1" runat="server" />
    </div>
    </form>
</body>
</html>
