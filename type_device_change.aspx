<%@ Page Language="VB" AutoEventWireup="false" CodeFile="type_device_change.aspx.vb"
    Inherits="type_device_change" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>แก้ไข ประเภทอุปกรณ์</title>
    <style type="text/css">
        .style1
        {
            height: 23px;
            width: 573px;
        }
        .style2
        {
            width: 573px;
        }
        .style4
        {
            height: 50px;
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
                            ย้าย อุปกรณ์
                        </h3>
                    </div>
                </div>
                <h3>
                    <table>
                        <tr>
                            <td>
                                เขต :
                            </td>
                            <td>
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource7"
                                    DataTextField="region" DataValueField="region" RepeatColumns="4" RepeatDirection="Horizontal">
                                </asp:RadioButtonList>
                                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                    SelectCommand="SELECT DISTINCT region FROM sa.office_name ORDER BY region"></asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                </h3>
                <h3>
                    <table width="99%">
                        <tr>
                            <td align="right">
                                จากหน่วยงาน :
                            </td>
                            <td class="style5">
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource4"
                                    DataTextField="office" DataValueField="office" Height="16px" Width="219px" AutoPostBack="True">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                    SelectCommand="SELECT office FROM sa.office_name WHERE (region = @P_region)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="RadioButtonList1" Name="P_region" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td align="right">
                                ไปยังหน่วยงาน :
                            </td>
                            <td class="style5">
                                <asp:DropDownList ID="DropDownList11" runat="server" DataSourceID="SqlDataSource2"
                                    DataTextField="office" DataValueField="office" Height="16px" Width="219px" AutoPostBack="True">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                    SelectCommand="SELECT office FROM sa.office_name WHERE (region = @P_region)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="RadioButtonList1" Name="P_region" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                จากทีมงาน :
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList12" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3"
                                    DataTextField="Team" DataValueField="ID" Height="16px" Width="219px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                    SelectCommand="sa_office" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList1" Name="P_office" PropertyName="SelectedValue"
                                            Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td align="right">
                                ไปยังทีมงาน :
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList13" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource5"
                                    DataTextField="Team" DataValueField="ID" Height="16px" Width="219px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                    SelectCommand="sa_office" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList11" Name="P_office" PropertyName="SelectedValue"
                                            Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                จากประเภทอุปกรณ์ :
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1"
                                    DataTextField="type_frtu" DataValueField="ID" Height="16px" Width="209px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                    SelectCommand="SELECT type_frtu, ID FROM sa.Type_Frtu WHERE (office = @office) AND (id_team = @id_Team)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList1" Name="office" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="DropDownList12" Name="id_Team" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td>
                                ไปยังประเภทอุปกรณ์ :
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource10"
                                    DataTextField="type_frtu" DataValueField="ID" Height="16px" Width="218px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                    SelectCommand="SELECT type_frtu, ID FROM sa.Type_Frtu WHERE (office = @office) AND (id_team = @id_Team) AND (ID &lt;&gt; @P_id_type_frtu)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList11" Name="office" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="DropDownList13" Name="id_Team" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="DropDownList3" Name="P_id_type_frtu" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                เปลี่ยนประเภทอุปกรณ์
                            </td>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                                    BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1"
                                    DataSourceID="SqlDataSource6" EmptyDataText="0 ครั้ง" GridLines="None">
                                    <Columns>
                                        <asp:BoundField DataField="count_dbname" HeaderText="จำนวนอุปกรณ์(ตัว)" ReadOnly="True"
                                            SortExpression="count_dbname" />
                                    </Columns>
                                    <EmptyDataRowStyle BorderStyle="Dotted" HorizontalAlign="Center" />
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
                                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                    SelectCommand="SELECT COUNT(dbname) AS count_dbname, id_type_frtu FROM sa.Device_List GROUP BY id_type_frtu HAVING (id_type_frtu = @P_id_type_frtu)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList3" Name="P_id_type_frtu" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td>
                                ประเภทอุปกรณ์ใหม่
                            </td>
                            <td>
                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White"
                                    BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource9"
                                    EmptyDataText="0 ครั้ง" ForeColor="Black" GridLines="Vertical">
                                    <AlternatingRowStyle BackColor="#CCCCCC" />
                                    <Columns>
                                        <asp:BoundField DataField="count_dbname" HeaderText="จำนวนอุปกรณ์(ตัว)" ReadOnly="True"
                                            SortExpression="count_dbname" />
                                    </Columns>
                                    <EmptyDataRowStyle BorderStyle="Dotted" HorizontalAlign="Center" />
                                    <FooterStyle BackColor="#CCCCCC" />
                                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                    <SortedAscendingHeaderStyle BackColor="#808080" />
                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                    <SortedDescendingHeaderStyle BackColor="#383838" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                    SelectCommand="SELECT COUNT(dbname) AS count_dbname, id_type_frtu FROM sa.Device_List GROUP BY id_type_frtu HAVING (id_type_frtu = @P_id_type_frtu)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList2" Name="P_id_type_frtu" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                ต้องการลบประเภทอุปกรณ์เดิม
                            </td>
                            <td>
                                <asp:CheckBox ID="CheckBox1" runat="server" Text="ต้องการ" />
                            </td>
                            <td>
                                <asp:LinkButton ID="LinkButton1" runat="server" ValidationGroup="A" Width="112%">เปลี่ยนประเภทอุปกรณ์</asp:LinkButton>
                            </td>
                            <td>
                                <asp:Label ID="Label4" runat="server" ForeColor="Blue" Visible="False"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <h3>
                    </h3>
                    <poy:tail ID="tail1" runat="server" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
