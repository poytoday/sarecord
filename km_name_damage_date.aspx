<%@ Page Language="VB" AutoEventWireup="false" CodeFile="km_name_damage_date.aspx.vb"
    Inherits="km_name_damage_date" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>แก้ไขชื่อผู้ดำเนินการ</title>
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
        .style2
        {
            width: 707px;
        }
        .style3
        {
            width: 443px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="page-container">
        <!-- For alternative headers START PASTE here -->
        <!-- A. HEADER -->
        <poy:header ID="UCmenu1" runat="server" />
        <h3>
            <table width="99%">
                <tr>
                    <td align="center" class="style3" style="background-color: #C0C0C0">
                        Start&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label7" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                    <td align="center" style="background-color: #008080">
                        End&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label8" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
            <table width="99%">
                <tr>
                    <td style="background-color: #C0C0C0" class="style8">
                        Year
                    </td>
                    <td style="background-color: #C0C0C0" class="style7">
                        Mounth
                    </td>
                    <td style="background-color: #C0C0C0" class="style9">
                        Day
                    </td>
                    <td style="background-color: #008080" class="style10">
                        Year
                    </td>
                    <td style="background-color: #008080" class="style7">
                        Mounth
                    </td>
                    <td style="background-color: #008080">
                        Day
                    </td>
                </tr>
                <tr>
                    <td style="background-color: #C0C0C0" class="style8">
                        <asp:DropDownList ID="DD_before_y" runat="server">
                            <asp:ListItem>2562</asp:ListItem>
                                    <asp:ListItem>2561</asp:ListItem>
                            <asp:ListItem>2560</asp:ListItem>
                            <asp:ListItem>2559</asp:ListItem>
                           <asp:ListItem>2558</asp:ListItem><asp:ListItem>2557</asp:ListItem>
                            <asp:ListItem>2556</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td style="background-color: #C0C0C0" class="style7">
                        <asp:DropDownList ID="DD_before_m" runat="server" AutoPostBack="True">
                            <asp:ListItem>01</asp:ListItem>
                            <asp:ListItem>02</asp:ListItem>
                            <asp:ListItem>03</asp:ListItem>
                            <asp:ListItem>04</asp:ListItem>
                            <asp:ListItem>05</asp:ListItem>
                            <asp:ListItem>06</asp:ListItem>
                            <asp:ListItem>07</asp:ListItem>
                            <asp:ListItem>08</asp:ListItem>
                            <asp:ListItem>09</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td style="background-color: #C0C0C0" class="style9">
                        <asp:DropDownList ID="DD_before_d" runat="server" AutoPostBack="True">
                            <asp:ListItem>01</asp:ListItem>
                            <asp:ListItem>02</asp:ListItem>
                            <asp:ListItem>03</asp:ListItem>
                            <asp:ListItem>04</asp:ListItem>
                            <asp:ListItem>05</asp:ListItem>
                            <asp:ListItem>06</asp:ListItem>
                            <asp:ListItem>07</asp:ListItem>
                            <asp:ListItem>08</asp:ListItem>
                            <asp:ListItem>09</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                            <asp:ListItem>13</asp:ListItem>
                            <asp:ListItem>14</asp:ListItem>
                            <asp:ListItem>15</asp:ListItem>
                            <asp:ListItem>16</asp:ListItem>
                            <asp:ListItem>17</asp:ListItem>
                            <asp:ListItem>18</asp:ListItem>
                            <asp:ListItem>19</asp:ListItem>
                            <asp:ListItem>20</asp:ListItem>
                            <asp:ListItem>21</asp:ListItem>
                            <asp:ListItem>22</asp:ListItem>
                            <asp:ListItem>23</asp:ListItem>
                            <asp:ListItem>24</asp:ListItem>
                            <asp:ListItem>25</asp:ListItem>
                            <asp:ListItem>26</asp:ListItem>
                            <asp:ListItem>27</asp:ListItem>
                            <asp:ListItem>28</asp:ListItem>
                            <asp:ListItem>29</asp:ListItem>
                            <asp:ListItem>30</asp:ListItem>
                            <asp:ListItem>31</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td style="background-color: #008080" class="style10">
                        <asp:DropDownList ID="DD_after_y" runat="server">
                           <asp:ListItem>2562</asp:ListItem>
                                    <asp:ListItem>2561</asp:ListItem>
                            <asp:ListItem>2560</asp:ListItem>
                            <asp:ListItem>2559</asp:ListItem>
                            <asp:ListItem>2558</asp:ListItem> <asp:ListItem>2557</asp:ListItem>
                            <asp:ListItem>2556</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td style="background-color: #008080" class="style7">
                        <asp:DropDownList ID="DD_after_m" runat="server">
                            <asp:ListItem>01</asp:ListItem>
                            <asp:ListItem>02</asp:ListItem>
                            <asp:ListItem>03</asp:ListItem>
                            <asp:ListItem>04</asp:ListItem>
                            <asp:ListItem>05</asp:ListItem>
                            <asp:ListItem>06</asp:ListItem>
                            <asp:ListItem>07</asp:ListItem>
                            <asp:ListItem>08</asp:ListItem>
                            <asp:ListItem>09</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td style="background-color: #008080">
                        <asp:DropDownList ID="DD_after_d" runat="server">
                            <asp:ListItem>01</asp:ListItem>
                            <asp:ListItem>02</asp:ListItem>
                            <asp:ListItem>03</asp:ListItem>
                            <asp:ListItem>04</asp:ListItem>
                            <asp:ListItem>05</asp:ListItem>
                            <asp:ListItem>06</asp:ListItem>
                            <asp:ListItem>07</asp:ListItem>
                            <asp:ListItem>08</asp:ListItem>
                            <asp:ListItem>09</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                            <asp:ListItem>13</asp:ListItem>
                            <asp:ListItem>14</asp:ListItem>
                            <asp:ListItem>15</asp:ListItem>
                            <asp:ListItem>16</asp:ListItem>
                            <asp:ListItem>17</asp:ListItem>
                            <asp:ListItem>18</asp:ListItem>
                            <asp:ListItem>19</asp:ListItem>
                            <asp:ListItem>20</asp:ListItem>
                            <asp:ListItem>21</asp:ListItem>
                            <asp:ListItem>22</asp:ListItem>
                            <asp:ListItem>23</asp:ListItem>
                            <asp:ListItem>24</asp:ListItem>
                            <asp:ListItem>25</asp:ListItem>
                            <asp:ListItem>26</asp:ListItem>
                            <asp:ListItem>27</asp:ListItem>
                            <asp:ListItem>28</asp:ListItem>
                            <asp:ListItem>29</asp:ListItem>
                            <asp:ListItem>30</asp:ListItem>
                            <asp:ListItem>31</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="OK" />
                    </td>
                </tr>
            </table>
        </h3>
        <h3 align="center">
            <asp:Label ID="Label1" runat="server" ForeColor="#FF66FF" Text="จำนวนอาการชำรุดทั้งหมดแบ่งตามพนักงาน"></asp:Label>
        </h3>
        <table width="99%">
            <tr>
                <td width="99%">
                    <h3>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource5"
                            DataKeyNames="Emp_id" EmptyDataText="No records found" Width="99%" BackColor="LightGoldenrodYellow"
                            BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None"
                            AllowSorting="True">
                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                            <Columns>
                                <asp:BoundField DataField="Emp_id" HeaderText="รหัสประจำตัว" SortExpression="Emp_id" />
                                <asp:BoundField DataField="Names" HeaderText="ชื่อ - สกุล" SortExpression="Names">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Position" HeaderText="ตำแหน่ง" SortExpression="Position">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Team" HeaderText="Team" SortExpression="Team">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Expr1" HeaderText="จำนวน(ตัว)" SortExpression="Expr1">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" HeaderImageUrl="~/images/icon_view.gif" />
                                <%--<asp:ButtonField CommandName="cmd_name" HeaderImageUrl="~/images/icon_view.gif" Text="Work" />--%>
                            </Columns>
                            <EmptyDataRowStyle HorizontalAlign="Center" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                        SelectCommand="SELECT sa.Names.Emp_ID, sa.Names.Names, sa.Names.Position, COUNT(sa.Damage_List.damage_id) AS Expr1, sa.Names.Team FROM sa.pmcm_record INNER JOIN sa.Damage_List ON sa.pmcm_record.pmcm_id = sa.Damage_List.pmcm_id INNER JOIN sa.Name_List ON sa.pmcm_record.pmcm_id = sa.Name_List.pmcm_id INNER JOIN sa.Names ON sa.Names.Emp_ID = sa.Name_List.Emp_id WHERE (sa.Names.office = @P_office_name) GROUP BY sa.Names.Emp_ID, sa.Names.Names, sa.Names.Position, sa.Names.Team">
                        <SelectParameters>
                            <asp:SessionParameter Name="P_office_name" SessionField="UserOffice" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                        SelectCommand="sa_historical_km_damage" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Label7" Name="P_date_before" PropertyName="Text"
                                Type="DateTime" />
                            <asp:ControlParameter ControlID="Label8" Name="P_date_after" PropertyName="Text"
                                Type="DateTime" />
                            <asp:SessionParameter Name="P_office_name" SessionField="UserOffice" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <div class="header">
                        <div class="nav2">
                            <h3 align="center">
                                <asp:Label ID="Label2" runat="server" ForeColor="#FF66FF" Text="จำนวนอาการชำรุดทั้งหมดแบ่งตามประเภท"></asp:Label>
                            </h3>
                            <tr>
                                <td>
                                    <h3>
                                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White"
                                            BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource6"
                                            EmptyDataText="No records found" GridLines="Vertical" Width="99%" AllowPaging="True"
                                            AllowSorting="True" DataKeyNames="damage_id">
                                            <AlternatingRowStyle BackColor="#DCDCDC" />
                                            <Columns>
                                                <%--<asp:BoundField DataField="date_num" HeaderText="จำนวน(วัน)" SortExpression="date_num">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>--%>
                                                <%--<asp:BoundField DataField="pmcm_id" HeaderText="pmcm_id" InsertVisible="False" ReadOnly="True"
                    SortExpression="pmcm_id" />--%><%--<asp:BoundField DataField="Emp_id" HeaderText="รหัสพนักงาน" 
                    SortExpression="Emp_id" />--%>
                                                <asp:BoundField DataField="damage_name" HeaderText="อาการชำรุด" SortExpression="damage_name">
                                                </asp:BoundField>
                                                <asp:BoundField DataField="count_1" HeaderText="จำนวน(ตัว)" SortExpression="count_1">
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:CommandField ShowSelectButton="True" HeaderImageUrl="~/images/icon_view.gif" />
                                            </Columns>
                                            <EmptyDataRowStyle HorizontalAlign="Center" />
                                            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                            <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                            <SortedDescendingHeaderStyle BackColor="#000065" />
                                        </asp:GridView>
                                    </h3>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                        SelectCommand="SELECT count_1, Emp_id, Names, Position, Team, damage_id, id_type_frtu, damage_name, product, office FROM sa.View_name_damage WHERE (Emp_id = @P_em_id) order by count_1 desc">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="GridView1" Name="P_em_id" PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                        SelectCommand="sa_historical_km_damage2" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Label7" Name="P_date_before" PropertyName="Text"
                                                Type="DateTime" />
                                            <asp:ControlParameter ControlID="Label8" Name="P_date_after" PropertyName="Text"
                                                Type="DateTime" />
                                            <asp:ControlParameter ControlID="GridView1" Name="P_em_id" PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <br />
                                    <h3 align="center">
                                        <asp:Label ID="Label3" runat="server" ForeColor="#FF66FF" Text="รายละเอียดการปฎิบัติงาน"></asp:Label>
                                    </h3>
                                    <h3>
                                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" BackColor="White"
                                            BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="pmcm_id,ID"
                                            DataSourceID="SqlDataSource7" EmptyDataText="No records found" GridLines="Vertical"
                                            OnRowCommand="GridView3_RowCommand" Width="99%" AllowPaging="True">
                                            <AlternatingRowStyle BackColor="#DCDCDC" />
                                            <Columns>
                                                <asp:BoundField DataField="op_id" HeaderText="รหัสอุปกรณ์" SortExpression="op_id" />
                                                <asp:BoundField DataField="date_operate" HeaderText="วันที่ดำเนินการ" SortExpression="date_operate"
                                                    DataFormatString="{0:dd/MMM/yyyy}"></asp:BoundField>
                                                <asp:BoundField DataField="operation" HeaderText="การปฎิบัติงาน" SortExpression="operation" />
                                                <asp:BoundField DataField="remark" HeaderText="หมายเหตุ" SortExpression="remark" />
                                                <asp:ButtonField CommandName="cmdEdit" HeaderImageUrl="~/images/icon_view.gif" Text="Edit" />
                                            </Columns>
                                            <EmptyDataRowStyle HorizontalAlign="Center" />
                                            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                            <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                            <SortedDescendingHeaderStyle BackColor="#000065" />
                                        </asp:GridView>
                                    </h3>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                        SelectCommand="SELECT sa.pmcm_record.status_work, sa.pmcm_record.db_name, sa.pmcm_record.operation, sa.pmcm_record.date_operate, sa.pmcm_record.remark, sa.pmcm_record.date_num, sa.pmcm_record.pmcm_id, sa.Name_List.Emp_id, sa.Device_List.op_id, sa.pmcm_record.id_type_frtu, sa.Damage_List.damage_id, sa.Team.ID FROM sa.pmcm_record INNER JOIN sa.Name_List ON sa.pmcm_record.pmcm_id = sa.Name_List.pmcm_id INNER JOIN sa.Device_List ON sa.pmcm_record.db_name = sa.Device_List.dbname INNER JOIN sa.Damage_List ON sa.pmcm_record.pmcm_id = sa.Damage_List.pmcm_id INNER JOIN sa.Type_Frtu ON sa.Device_List.id_type_frtu = sa.Type_Frtu.ID INNER JOIN sa.Team ON sa.Type_Frtu.office = sa.Team.office AND sa.Type_Frtu.Team = sa.Team.Team WHERE (sa.Damage_List.damage_id = @P_damage) AND (sa.Name_List.Emp_id = @P_em_id)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="GridView2" Name="P_damage" PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="GridView1" Name="P_em_id" PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <br />
                                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                        SelectCommand="sa_historical_km_damage3" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Label7" Name="P_date_before" PropertyName="Text"
                                                Type="DateTime" />
                                            <asp:ControlParameter ControlID="Label8" Name="P_date_after" PropertyName="Text"
                                                Type="DateTime" />
                                            <asp:ControlParameter ControlID="GridView2" Name="P_damage" PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="GridView1" Name="P_em_id" PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
        </table>
        <poy:tail ID="tail1" runat="server" />
    </div>
    </form>
</body>
</html>
