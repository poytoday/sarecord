<%@ Page Language="VB" AutoEventWireup="false" CodeFile="office.aspx.vb" Inherits="office" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
    <style type="text/css">
        .style1
        {
            width: 169px;
        }
        .style2
        {
            width: 849px;
            height: 157px;
        }
        .style3
        {
            height: 157px;
            width: 169px;
        }
        .style5
        {
            width: 169px;
            height: 42px;
        }
        .style6
        {
            width: 169px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="page-container">
        <poy:header ID="UCmenu1" runat="server" />
        <div class="header">
            <div class="nav2">
                <h3 align="center">
                    เพิ่ม/แก้ไข หน่วยงาน 
                </h3>
            </div>
        </div>
        <h3>
            <table>
                <tr>
                    <td class="style6"  align="right">
                        เขต :
                    </td>
                    <td>
                     
                        <asp:DropDownList ID="DropDownList1" runat="server" Height="16px" Width="189px" 
                            AutoPostBack="True">
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
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>" 
                            SelectCommand="SELECT DISTINCT region FROM sa.office_name">
                        </asp:SqlDataSource>
                     
                    </td>
                </tr>
                <tr>
                    <td class="style5" align="right">
                        หน่วยงาน :
                    </td>
                    <td class="style5">
                        <asp:TextBox ID="TextBox1" runat="server" Width="306px" Height="24px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                            ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="A1">กรอกชื่อแผนก</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style6">
                        <asp:LinkButton ID="Linkbutton10" runat="server" ValidationGroup="A1" 
                            Width="129px">เพิ่มหน่วยงาน</asp:LinkButton>
                    </td>
                    <td class="style1">
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        รายละเอียด
                    </td>
                    <td class="style2">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="office"
                            DataSourceID="SqlDataSource1" BackColor="LightGoldenrodYellow" BorderColor="Tan"
                            BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" 
                            Width="130%">
                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                            <Columns>
                                <asp:BoundField DataField="office" HeaderText="แผนก" SortExpression="office" ReadOnly="True">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                            </Columns>
                            <FooterStyle BackColor="Tan" />
                            <HeaderStyle BackColor="Tan" Font-Bold="True" />
                            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                            <SortedAscendingCellStyle BackColor="#FAFAE7" />
                            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                            <SortedDescendingCellStyle BackColor="#E1DB9C" />
                            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                            DeleteCommand="DELETE FROM sa.[Team] WHERE [Team] = @Team" InsertCommand="INSERT INTO [Team] ([Team], [office]) VALUES (@Team, @office)"
                            
                            SelectCommand="SELECT office FROM sa.office_name WHERE (region = @P_region)" 
                            UpdateCommand="UPDATE sa.[Team] SET [office] = @office WHERE [Team] = @Team">
                            <DeleteParameters>
                                <asp:Parameter Name="Team" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Team" Type="String" />
                                <asp:Parameter Name="office" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="P_region" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="office" Type="String" />
                                <asp:Parameter Name="Team" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </h3>
        <poy:tail ID="tail1" runat="server" />
    </div>
    </form>
</body>
</html>
