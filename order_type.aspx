<%@ Page Language="VB" AutoEventWireup="false" CodeFile="order_type.aspx.vb" Inherits="order_type" %>

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
                            เพิ่ม/แก้ไข การปฎิบัติงาน
                        </h3>
                    </div>
                </div>
                <h3>
                    <table width="99%">
                        <tr>
                            <td>
                                สถานะงาน :
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" Width="68%"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                                    ErrorMessage="กรอกสถานะงาน" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                           <td>
                           แสดงที่ :
                           </td>
                            <td>
                                <asp:CheckBoxList ID="CheckBoxList1" runat="server" 
                                    RepeatDirection="Horizontal">
                                    <asp:ListItem Value="owner">เจ้าของอุปกรณ์</asp:ListItem>
                                    <asp:ListItem Value="section">ผู้บริหารหน่วยงาน</asp:ListItem>
                                    <asp:ListItem Value="region">ผู้บริหารเขต</asp:ListItem>
                                    <asp:ListItem Value="front_office">ผู้ใช้งานอุปกรณ์</asp:ListItem>
                                </asp:CheckBoxList>
                            </td>
                        </tr>
                        <tr>
                         <td class="style1">
                                <asp:LinkButton ID="Linkbutton10" runat="server" Width="99px" ValidationGroup="A">เพิ่มสถานะ</asp:LinkButton>
                            </td></tr>
                    </table>
                    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        DataSourceID="SqlDataSource2" PageSize="20" Width="99%" BackColor="LightGoldenrodYellow"
                        BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None"
                        DataKeyNames="order_type_id">
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <Columns>
                            <asp:CommandField ShowEditButton="True" HeaderText="แก้ไข" />
                            <asp:TemplateField HeaderText="ชื่อสถานะ" SortExpression="order_type">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Height="30px" Text='<%# Bind("order_type") %>'
                                        Width="468px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("order_type") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="30%" />
                            </asp:TemplateField>
                            <asp:CheckBoxField DataField="owner" HeaderText="เจ้าของอุปกรณ์" SortExpression="owner">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:CheckBoxField>
                             <asp:CheckBoxField DataField="section" HeaderText="ผู้บริหารหน่วยงาน" SortExpression="section">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:CheckBoxField>
                             <asp:CheckBoxField DataField="region" HeaderText="ผู้บริหารเขต" 
                                SortExpression="region">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:CheckBoxField>
                             <asp:CheckBoxField DataField="front_office" HeaderText="ผู้ใช้งานอุปกรณ์" SortExpression="front_office">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:CheckBoxField>
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
                </h3>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                    SelectCommand="SELECT order_type, view_list, owner, section, region, front_office, order_type_id FROM sa.order_type WHERE (office = @P_office)"
                    UpdateCommand="UPDATE sa.order_type SET order_type = @order_type , owner = @owner , section = @section , region = @region , front_office = @front_office WHERE (order_type_id = @order_type_id)">
                    <SelectParameters>
                        <asp:SessionParameter Name="P_office" SessionField="UserOffice" DefaultValue="ผอค.น.3" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="order_type" Type="String" />
                        <asp:Parameter Name="order_type_id" Type="Int32" />
                        <asp:Parameter Name="owner" Type="Boolean" />
                         <asp:Parameter Name="section" Type="Boolean" />
                          <asp:Parameter Name="region" Type="Boolean" />
                           <asp:Parameter Name="front_office" Type="Boolean" />
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
