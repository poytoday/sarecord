<%@ Page Language="VB" AutoEventWireup="false" CodeFile="damage_chang.aspx.vb" Inherits="damage_chang" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>เพิ่ม/แก้ไข อาการชำรุด</title>
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
        .style7
        {
            width: 304px;
        }
        .style8
        {
            width: 304px;
            height: 46px;
        }
        .style9
        {
            height: 46px;
        }
        .style10
        {
            height: 50px;
            width: 150px;
        }
        .style11
        {
            width: 150px;
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
                            ย้าย อาการชำรุด
                        </h3>
                    </div>
                </div>
                <h3>
                    <table width="99%">
                        <tr>
                            <td class="style10" align="right">
                                ทีมงาน :
                            </td>
                            <td>
                                <asp:RadioButtonList ID="RadioButtonList2" runat="server" DataSourceID="SqlDataSource3"
                                    DataTextField="Team" DataValueField="Team" AutoPostBack="True" 
                                    RepeatDirection="Horizontal" Width="99%">
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="RadioButtonList1"
                                    ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="A">เลือกประเภทอุปกรณ์</asp:RequiredFieldValidator>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                    SelectCommand="sa_office" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="P_office" SessionField="UserOffice" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td class="style11" align="right">
                                &nbsp;<asp:Label ID="Label3" runat="server" Text="ประเภทอุปกรณ์ :" Visible="False"></asp:Label>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource1"
                                    DataTextField="type_frtu" DataValueField="ID" AutoPostBack="True" RepeatDirection="Horizontal"
                                    RepeatColumns="4" Width="99%">
                                </asp:RadioButtonList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                    SelectCommand="SELECT type_frtu, ID FROM sa.Type_Frtu WHERE (Team = @Team) AND (office = @office)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="RadioButtonList2" Name="Team" PropertyName="SelectedValue"
                                            Type="String" />
                                        <asp:SessionParameter Name="office" SessionField="UserOffice" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="RadioButtonList1"
                                    ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="A">เลือกประเภทอุปกรณ์</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                    &nbsp;<asp:Panel ID="Panel1" runat="server" Visible="False" 
                        HorizontalAlign="Center" Width="99%">
                        <h3>
                            <table align="center">
                                <tr>
                                    <td class="style7" align="center">
                                        เปลี่ยนอาการชำรุดจาก&nbsp; -----&gt;
                                    </td>
                                    <td class="style1" align="center" valign="baseline">
                                        อาการชำรุดใหม่
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                                            BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1"
                                            DataSourceID="SqlDataSource6" GridLines="None" EmptyDataText="0 ครั้ง">
                                            <Columns>
                                                <asp:BoundField DataField="count_d" HeaderText="จำนวนอาการชำรุด(ครั้ง)" ReadOnly="True"
                                                    SortExpression="count_d">
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
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
                                            SelectCommand="SELECT COUNT(damage_id) AS count_d, damage_id FROM sa.Damage_List GROUP BY damage_id HAVING (damage_id = @P_id_damage)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="DropDownList1" Name="P_id_damage" PropertyName="SelectedValue" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td align="center">
                                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                            DataSourceID="SqlDataSource7" ForeColor="#333333" GridLines="None" EmptyDataText="0 ครั้ง">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:BoundField DataField="count_d" HeaderText="จำนวนอาการชำรุด(ครั้ง)" ReadOnly="True"
                                                    SortExpression="count_d">
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                            </Columns>
                                            <EmptyDataRowStyle BorderStyle="Dotted" HorizontalAlign="Center" />
                                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                            <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                            <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                            <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                            <SortedDescendingHeaderStyle BackColor="#820000" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                            SelectCommand="SELECT COUNT(damage_id) AS count_d, damage_id FROM sa.Damage_List GROUP BY damage_id HAVING (damage_id = @P_id_damage)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="DropDownList2" Name="P_id_damage" PropertyName="SelectedValue" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style8">
                                        <asp:DropDownList ID="DropDownList1" runat="server" Height="16px" Width="366px" AutoPostBack="True"
                                            DataSourceID="SqlDataSource4" DataTextField="damage_name" DataValueField="id_damage">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                            SelectCommand="SELECT id_damage, damage_name FROM sa.Damage_Type WHERE (id_type_frtu = @P_id_frtu)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="RadioButtonList1" Name="P_id_frtu" PropertyName="SelectedValue" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td class="style9">
                                        <asp:DropDownList ID="DropDownList2" runat="server" Height="16px" Width="366px" DataSourceID="SqlDataSource5"
                                            DataTextField="damage_name" DataValueField="id_damage" AutoPostBack="True">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                            SelectCommand="SELECT id_damage, damage_name FROM sa.Damage_Type WHERE (id_type_frtu = @P_id_frtu) AND (id_damage &lt;&gt; @P_id_damage)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="RadioButtonList1" Name="P_id_frtu" PropertyName="SelectedValue" />
                                                <asp:ControlParameter ControlID="DropDownList1" Name="P_id_damage" PropertyName="SelectedValue" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        ต้องการลบอาการชำรุดเดิม
                                    </td>
                                    <td align="left">
                                        <asp:CheckBox ID="CheckBox1" runat="server" Text="ต้องการ" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        <asp:LinkButton ID="LinkButton1" runat="server" Width="112%">เปลี่ยนอาการชำรุด</asp:LinkButton>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" ForeColor="Blue" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </h3>
                    </asp:Panel>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                        DeleteCommand="DELETE FROM sa.[Damage_Type] WHERE [id_damage] = @id_damage" InsertCommand="INSERT INTO sa.[Damage_Type] ([product], [damage_name]) VALUES (@product, @damage_name)"
                        SelectCommand="SELECT id_damage, product, damage_name FROM sa.Damage_Type WHERE (id_type_frtu = @id_type_frtu) ORDER BY id_damage"
                        UpdateCommand="UPDATE sa.[Damage_Type] SET  [damage_name] = @damage_name WHERE [id_damage] = @id_damage">
                        <DeleteParameters>
                            <asp:Parameter Name="id_damage" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="product" Type="String" />
                            <asp:Parameter Name="damage_name" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="RadioButtonList1" Name="id_type_frtu" PropertyName="SelectedValue" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="damage_name" Type="String" />
                            <asp:Parameter Name="id_damage" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <poy:tail ID="tail1" runat="server" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
