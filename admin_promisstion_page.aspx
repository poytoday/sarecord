<%@ Page Language="VB" AutoEventWireup="false" CodeFile="admin_promisstion_page.aspx.vb"
    Inherits="admin_promisstion_page" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>เพิ่ม/แก้ไข การปฎิบัติงาน</title>
    <style type="text/css">
        
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
    <asp:ScriptManager ID="ScriptManager2" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="page-container">
                <!-- For alternative headers START PASTE here -->
                <!-- A. HEADER -->
                <poy:header ID="UCmenu1" runat="server" />
                <div class="header">
                    <div class="nav2">
                        <h3 align="center">
                            เพิ่ม/แก้ไข Promisstion Page</h3>
                    </div>
                </div>
                <h3>
                    <table width="99%">
                     <tr>
                            <td>
                                Page (ชื่อ):
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox3" runat="server" Width="68%"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3"
                                    ErrorMessage="กรอก ชื่อ" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Page(.aspx) :
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" Width="68%"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                                    ErrorMessage="กรอก Page" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Promisstion :
                            </td>
                            <td>
                                <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="owner">เจ้าของอุปกรณ์</asp:ListItem>
                                    <asp:ListItem Value="section">ผู้บริหารหน่วยงาน</asp:ListItem>
                                    <asp:ListItem Value="region">ผู้บริหารเขต</asp:ListItem>
                                    <asp:ListItem Value="front_office">ผู้ใช้งานอุปกรณ์</asp:ListItem>
                                    <asp:ListItem Value="Administrator">Administrator</asp:ListItem>
                                </asp:CheckBoxList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                                <asp:LinkButton ID="Linkbutton10" runat="server" Width="99px" ValidationGroup="A">เพิ่ม Page</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        DataSourceID="SqlDataSource2" PageSize="20" Width="99%" BackColor="White" BorderColor="White"
                        BorderWidth="2px" CellPadding="3" GridLines="Horizontal" DataKeyNames="tablename"
                        BorderStyle="Ridge" CellSpacing="1" HorizontalAlign="Center">
                        <AlternatingRowStyle BorderStyle="Ridge" />
                        <Columns>
                            <asp:CommandField ShowEditButton="True" HeaderText="แก้ไข" />
                            <asp:TemplateField HeaderText="ชื่อ" SortExpression="text_tablename">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Height="30px" Text='<%# Bind("text_tablename") %>'
                                        Width="200px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label25" runat="server" Text='<%# Bind("text_tablename") %>' Width="200px"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="200px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Page" SortExpression="tablename">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Height="30px" Text='<%# Bind("tablename") %>'
                                        Width="200px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("tablename") %>' Width="200px"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="200px" />
                            </asp:TemplateField>
                            <asp:CheckBoxField DataField="owner" HeaderText="เจ้าของอุปกรณ์" SortExpression="owner">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:CheckBoxField>
                            <asp:CheckBoxField DataField="section" HeaderText="ผู้บริหารหน่วยงาน" SortExpression="section">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:CheckBoxField>
                            <asp:CheckBoxField DataField="region" HeaderText="ผู้บริหารเขต" SortExpression="region">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:CheckBoxField>
                            <asp:CheckBoxField DataField="front_office" HeaderText="ผู้ใช้งานอุปกรณ์" SortExpression="front_office">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:CheckBoxField>
                            <asp:CheckBoxField DataField="Administrator" HeaderText="Administrator" SortExpression="Administrator">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:CheckBoxField>
                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                        </Columns>
                        <EmptyDataRowStyle HorizontalAlign="Center" />
                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#9471DE" ForeColor="White" Font-Bold="True" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#594B9C" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#33276A" />
                    </asp:GridView>
                </h3>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                    SelectCommand="SELECT text_tablename,tablename, owner, section, region, front_office, Administrator FROM sa.user_permissions_access ORDER BY tablename"
                    UpdateCommand="UPDATE sa.user_permissions_access SET text_tablename = @text_tablename , owner = @owner , section = @section , region = @region , front_office = @front_office, Administrator = @Administrator  WHERE (tablename = @tablename)"
                    DeleteCommand="DELETE FROM sa.user_permissions_access WHERE (tablename = @tablename)">
                    <DeleteParameters>
                        <asp:Parameter Name="tablename" Type="String" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="owner" Type="Boolean" />
                        <asp:Parameter Name="section" Type="Boolean" />
                        <asp:Parameter Name="region" Type="Boolean" />
                        <asp:Parameter Name="front_office" Type="Boolean" />
                        <asp:Parameter Name="Administrator" Type="Boolean" />
                        <asp:Parameter Name="tablename" Type="String" />
                        <asp:Parameter Name="text_tablename" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
                <poy:tail ID="tail1" runat="server" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
