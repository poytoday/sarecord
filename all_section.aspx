<%@ Page Language="VB" AutoEventWireup="false" CodeFile="all_section.aspx.vb" Inherits="all_section" %>

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
        .style4
        {
            height: 23px;
            width: 204px;
        }
        .style14
        {
            width: 208px;
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
                    แผนกทั้งหมด</h3>
            </div>
        </div>
        <h3>
            <table height="100%" width="100%" border="0">
             <tr>
                        <td class="style14">
                         องค์กร :</td>
                        <td >
                      
                         <asp:DropDownList ID="DropDownList1" runat="server" Height="19px" Width="156px" 
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
                        </td>
                        </tr>
                <tr>
                    <td class="style14">
                        หน่วยงาน :
                    </td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList3" runat="server" DataSourceID="SqlDataSource5"
                            DataTextField="office" DataValueField="office" AutoPostBack="True" RepeatDirection="Horizontal"
                            RepeatColumns="5" Height="24px" Width="99%">
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="RadioButtonList1"
                            ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="A">เลือกประเภทอุปกรณ์</asp:RequiredFieldValidator>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                            
                            SelectCommand="SELECT office FROM sa.office_name WHERE (region = @P_region) ORDER BY office">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="P_region" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>

                <tr>
                    <td class="style14">
                        ทีมงาน :
                    </td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList2" runat="server" DataSourceID="SqlDataSource3"
                            DataTextField="Team" DataValueField="ID" AutoPostBack="True" RepeatDirection="Horizontal"
                            RepeatColumns="4" Width="99%" TabIndex="1">
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="RadioButtonList1"
                            ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="A">เลือกประเภทอุปกรณ์</asp:RequiredFieldValidator>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                            SelectCommand="SELECT Team, ID FROM sa.Team WHERE (office = @office)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="RadioButtonList3" Name="office" PropertyName="SelectedValue"
                                    Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style14">
                        เลือกประเภทอุปกรณ์ :
                    </td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource1"
                            DataTextField="type_frtu" DataValueField="ID" AutoPostBack="True" RepeatDirection="Horizontal"
                            RepeatColumns="5" Height="28px" Width="99%">
                        </asp:RadioButtonList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                            SelectCommand="sa_select_type_frtu" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="RadioButtonList2" Name="ID_Team" PropertyName="SelectedValue"
                                    Type="Int32" />
                                <asp:ControlParameter ControlID="RadioButtonList3" DefaultValue="" Name="office"
                                    PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <%--<tr id="tr01">
                            <td class="style8">
                                <asp:Label ID="Label1" runat="server" Text="พื้นที่ :" Visible="False"></asp:Label>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                    SelectCommand="sa_select_area" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="RadioButtonList1" Name="P_id_type" PropertyName="SelectedValue"
                                            Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td class="style3">
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource4"
                                    DataTextField="office" DataValueField="office" AutoPostBack="True" Visible="False"
                                    Height="20px" Width="155px">
                                </asp:DropDownList>
                                <br />
                            </td>
                        </tr>--%>
                    <%--<tr>
                        <td class="style8">
                            ลำดับ(ห้ามซ้ำ) :
                        </td>
                        <td class="style1">
                            <asp:TextBox ID="TextBox1" runat="server" Width="319px" Height="26px"></asp:TextBox>
                            <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="ใส่ ลำดับ"
                                ControlToValidate="TextBox1" ValidationGroup="A1" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>--%>
                    <%--<tr>
                        <td class="style8">
                            รหัสอุปกรณ์ :
                        </td>
                        <td class="style3">
                            <asp:TextBox ID="TextBox2" runat="server" Width="319px" Height="26px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="ใส่ รหัสอุปกรณ์"
                                ControlToValidate="TextBox2" ValidationGroup="A1" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>--%>
                    <%--<tr>
                        <td class="style8">
                            สถานที่ :
                        </td>
                        <td class="style3">
                            <asp:TextBox ID="TextBox3" runat="server" Width="319px" Height="26px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="ใส่ สถานที่"
                                ControlToValidate="TextBox3" ValidationGroup="A1" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>--%>
                    <%--<tr>
                        <td class="style8">
                            พื้นที่ :
                        </td>
                        <td class="style3">
                            <asp:TextBox ID="TextBox7" runat="server" Width="319px" Height="26px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="ใส่ กฟฟ."
                                ControlToValidate="TextBox7" ValidationGroup="A1" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>--%>
                    <%--<tr>
                        <td class="style8">
                            
                            <asp:Button ID="Button1" runat="server" ForeColor="Blue" Text="เพิ่มอุปกรณ์" Width="139px"
                                ValidationGroup="A1" />
                        </td>
                        <td class="style3">
                        </td>
                    </tr>--%>
            </table>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" DataKeyNames="dbname" DataSourceID="SqlDataSource2"
                PageSize="20" Width="99%" BackColor="White" BorderColor="White" BorderStyle="Ridge"
                BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None">
                <Columns>
                    <%--<asp:BoundField DataField="master" HeaderText="master" SortExpression="master" />--%>
                    <%--<asp:BoundField DataField="dnp_address" HeaderText="dnp_address" SortExpression="dnp_address" />--%>
                    <asp:BoundField DataField="dbname" HeaderText="ลำดับ" ReadOnly="True" SortExpression="dbname">
                        <ItemStyle Width="15%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="op_id" HeaderText="รหัสอุปกรณ์" ReadOnly="True" SortExpression="op_id">
                        <ItemStyle HorizontalAlign="Center" Width="15%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="location" HeaderText="สถานที่" ReadOnly="True" SortExpression="location">
                        <ItemStyle HorizontalAlign="Center" Width="40%" />
                    </asp:BoundField>
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
                    <asp:BoundField DataField="office" HeaderText="พื้นที่" SortExpression="office">
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
        </h3>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
            SelectCommand="SELECT id, dbname, op_id, location, product, substation, office, scada, control_type, type, type_frtu, remark, Name_Create, id_type_frtu, date_create FROM sa.Device_List WHERE (id_type_frtu = @id_type_frtu) ">
            <SelectParameters>
                <asp:ControlParameter ControlID="RadioButtonList1" Name="id_type_frtu" PropertyName="SelectedValue" />
                <%--<asp:ControlParameter ControlID="DropDownList1" Name="area" PropertyName="SelectedValue" />--%>
            </SelectParameters>
        </asp:SqlDataSource>
        </h3>
        <poy:tail ID="tail1" runat="server" />
    </div>
    </form>
</body>
</html>
