<%@ Page Language="VB" AutoEventWireup="false" CodeFile="all_device_admin.aspx.vb"
    Inherits="all_device_admin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style2
        {
            width: 549px;
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
        <poy:header ID="UCmenu1" runat="server" />
        <div class="header">
            <div class="nav2">
                <h3 align="center">
                    อุปกรณ์ทั้งหมด</h3>
            </div>
        </div>
        <h3 align="center">
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True"
                AutoGenerateColumns="False" DataSourceID="SqlDataSource2" PageSize="20" Width="59%"
                BackColor="White" BorderColor="White" BorderStyle="Ridge" 
                BorderWidth="2px" CellPadding="3"
                CellSpacing="1" GridLines="Horizontal" DataKeyNames="ID">
                <Columns>
                    <%--<asp:BoundField DataField="master" HeaderText="master" SortExpression="master" />--%>
                    <%--<asp:BoundField DataField="dnp_address" HeaderText="dnp_address" SortExpression="dnp_address" />--%>
                    <%--<asp:TemplateField HeaderText="ผลิตภัณฑ์" SortExpression="product">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("product") %>' Width="60px"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("product") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>--%>
                    <%--<asp:TemplateField HeaderText="Type" SortExpression="type">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Height="17px" Text='<%# Bind("type") %>'
                                    Width="59px"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("type") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>--%>
                    <%--<asp:TemplateField HeaderText="Control Type" SortExpression="control_type">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Height="16px" Text='<%# Bind("control_type") %>'
                                    Width="60px"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("control_type") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>--%>
                    <%--<asp:TemplateField HeaderText="ระบบสั่งการ" SortExpression="scada">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("scada") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("scada") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>--%>
                    <asp:BoundField DataField="office" HeaderText="หน่วยงาน" 
                        SortExpression="office"></asp:BoundField>
                    <asp:BoundField DataField="type_frtu" HeaderText="ประเภทอุปกรณ์" 
                        SortExpression="type_frtu">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="count_dbname" HeaderText="จำนวนอุปกรณ์(ตัว)" 
                        SortExpression="count_dbname">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <%--<asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />--%>
                    <asp:CommandField ShowSelectButton="True" HeaderText="เลือก" />
                </Columns>
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#594B9C" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#33276A" />
            </asp:GridView>
        </h3>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
            
            SelectCommand="SELECT office, type_frtu, count_dbname, ID FROM sa.View_count_device_total ORDER BY office, type_frtu, count_dbname DESC">
        </asp:SqlDataSource>
        <div class="header">
            <div class="nav2">
                <h3 align="center">
                    รายละเอียดอุปกรณ์ทั้งหมด</h3>
            </div>
        </div>
        <h3>
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" DataSourceID="SqlDataSource1" PageSize="20" Width="99%"
                BackColor="White" BorderColor="White" BorderStyle="Ridge" 
                BorderWidth="2px" CellPadding="3"
                CellSpacing="1" GridLines="Horizontal" DataKeyNames="dbname">
                <Columns>
                    <%--<asp:BoundField DataField="master" HeaderText="master" SortExpression="master" />--%>
                    <%--<asp:BoundField DataField="dnp_address" HeaderText="dnp_address" SortExpression="dnp_address" />--%>
                    <%--<asp:TemplateField HeaderText="ผลิตภัณฑ์" SortExpression="product">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("product") %>' Width="60px"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("product") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>--%>
                    <%--<asp:TemplateField HeaderText="Type" SortExpression="type">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Height="17px" Text='<%# Bind("type") %>'
                                    Width="59px"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("type") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>--%>
                    <%--<asp:TemplateField HeaderText="Control Type" SortExpression="control_type">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Height="16px" Text='<%# Bind("control_type") %>'
                                    Width="60px"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("control_type") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>--%>
                    <%--<asp:TemplateField HeaderText="ระบบสั่งการ" SortExpression="scada">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("scada") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("scada") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>--%>
                    <asp:BoundField DataField="dbname" HeaderText="dbname" SortExpression="dbname" 
                        ReadOnly="True"></asp:BoundField>
                    <asp:BoundField DataField="op_id" HeaderText="รหัสอุปกรณ์" 
                        SortExpression="op_id">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="location" HeaderText="สถานที่" 
                        SortExpression="location">
                    </asp:BoundField>
                    <asp:BoundField DataField="office" HeaderText="พื้นที่" 
                        SortExpression="office" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#594B9C" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#33276A" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>" 
                SelectCommand="SELECT dbname, op_id, location, office FROM sa.Device_List WHERE (id_type_frtu = @P_id_type_frtu)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="P_id_type_frtu" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </h3>
        <poy:tail ID="tail1" runat="server" />
    </div>
    </form>
</body>
</html>
