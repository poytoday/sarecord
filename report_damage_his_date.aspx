<%@ Page Language="VB" AutoEventWireup="false" CodeFile="report_damage_his_date.aspx.vb"
    Inherits="report_damage_his_date" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>รายละเอียดอาการชำรุดของอุปกรณ์</title>
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
        .style4
        {
            width: 392px;
        }
        .style5
        {
            width: 157px;
        }
    </style>
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
                            รายละเอียดอาการชำรุดของอุปกรณ์
                        </h3>
                    </div>
                </div>
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
                            <td style="background-color: #C0C0C0">
                                Year
                            </td>
                            <td style="background-color: #C0C0C0">
                                Mounth
                            </td>
                            <td style="background-color: #C0C0C0" class="style17">
                                Day
                            </td>
                            <td style="background-color: #008080" class="style18">
                                Year
                            </td>
                            <td style="background-color: #008080">
                                Mounth
                            </td>
                            <td style="background-color: #008080">
                                Day
                            </td>
                        </tr>
                        <tr>
                            <td style="background-color: #C0C0C0">
                                <asp:DropDownList ID="DD_before_y" runat="server">
                                    <asp:ListItem>2562</asp:ListItem>
                                    <asp:ListItem>2561</asp:ListItem>
                                    <asp:ListItem>2560</asp:ListItem>
                                    <asp:ListItem>2559</asp:ListItem>
                                    <asp:ListItem>2558</asp:ListItem> <asp:ListItem>2557</asp:ListItem>
                                    <asp:ListItem>2556</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="background-color: #C0C0C0">
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
                            <td style="background-color: #C0C0C0" class="style17">
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
                            <td style="background-color: #008080" class="style18">
                                <asp:DropDownList ID="DD_after_y" runat="server">
                                    <asp:ListItem>2562</asp:ListItem>
                                    <asp:ListItem>2561</asp:ListItem>
                                    <asp:ListItem>2560</asp:ListItem>
                                    <asp:ListItem>2559</asp:ListItem>
                                    <asp:ListItem>2558</asp:ListItem> <asp:ListItem>2557</asp:ListItem>
                                    <asp:ListItem>2556</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="background-color: #008080">
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
                            <td class="style12">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                    <table width="99%">
                        <tr>
                            <td class="style5">
                                ทีมงาน :
                            </td>
                            <td>
                                <asp:RadioButtonList ID="RadioButtonList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource5"
                                    DataTextField="Team" DataValueField="ID" RepeatColumns="6" 
                                    RepeatDirection="Horizontal" Width="99%">
                                </asp:RadioButtonList>
                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                    SelectCommand="SELECT Team, ID, office FROM sa.Team WHERE (office = @office)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="office" SessionField="UserOffice" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td class="style5">
                                <asp:Label ID="Label4" runat="server" Text="ประเภทอุปกรณ์ : " Visible="False"></asp:Label>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource2"
                                    DataTextField="type_frtu" DataValueField="ID" RepeatColumns="4" 
                                    RepeatDirection="Horizontal" Width="99%">
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="Button1" runat="server" Text="Show" Width="65px" />
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                    <table width="99%">
                        <tr>
                            <td>
                                <div>
                                    <div class="nav2">
                                        <h3 align="center">
                                            <asp:Label ID="Label1" runat="server" ForeColor="#3366FF" Text="รายละเอียดอาการชำรุด :"
                                                Visible="False"></asp:Label>
                                        </h3>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                                    EmptyDataText="No records found" OnRowCommand="GridView1_RowCommand" DataKeyNames="damage_id"
                                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="99%" AllowSorting="True">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="damage_name" HeaderText="อาการชำรุด" SortExpression="damage_name">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="count_damage" HeaderText="จำนวน(ครั้ง)" SortExpression="count_damage">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <%--<asp:ButtonField CommandName="cmdView" HeaderImageUrl="~/images/icon_view.gif" Text="View" />--%>
                                        <asp:CommandField ShowSelectButton="True" HeaderImageUrl="~/images/icon_view.gif" />
                                    </Columns>
                                    <EditRowStyle BackColor="#7C6F57" />
                                    <EmptyDataRowStyle HorizontalAlign="Center" />
                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#E3EAEB" />
                                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="header">
                                    <div class="nav2">
                                        <h3 align="center">
                                            <asp:Label ID="Label2" runat="server" ForeColor="#3366FF" Visible="False">รายละเอียดอุปกรณ์ :</asp:Label>
                                        </h3>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="pmcm_id"
                                    DataSourceID="SqlDataSource3" Visible="False" EmptyDataText="No records found"
                                    OnRowCommand="GridView2_RowCommand" CellPadding="4" ForeColor="#333333" GridLines="None"
                                    Width="99%" AllowPaging="True" AllowSorting="True" PageSize="5">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <%--<asp:BoundField DataField="damage_name" HeaderText="damage_name" 
                    SortExpression="damage_name" />--%>
                                        <%--<asp:BoundField DataField="pmcm_id" HeaderText="pmcm_id" ReadOnly="True" 
                    SortExpression="pmcm_id" />--%>
                                        <asp:BoundField DataField="op_id" HeaderText="รหัสอุปกรณ์" SortExpression="op_id">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="date_operate" HeaderText="วันที่ดำเนินการ" SortExpression="date_operate"
                                            DataFormatString="{0:dd/MMM/yyyy}" HtmlEncode="False">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="operation" HeaderText="การปฎิบัติงาน" SortExpression="operation" />
                                        <asp:BoundField DataField="remark" HeaderText="หมายเหตุ" SortExpression="remark" />
                                        <%--<asp:BoundField DataField="date_update" HeaderText="date_update" 
                    SortExpression="date_update" />--%>
                                        <%--<asp:BoundField DataField="date_num" HeaderText="จำนวนวันที่ดำเนินการ(วัน)" SortExpression="date_num">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>--%>
                                        <%--<asp:ButtonField CommandName="cmd_name" HeaderImageUrl="~/images/icon_view.gif" Text="Names" />--%>
                                        <%--<asp:BoundField DataField="damage_id" HeaderText="damage_id" 
                    SortExpression="damage_id" />--%>
                                        <asp:CommandField ShowSelectButton="True" HeaderImageUrl="~/images/icon_view.gif"
                                            SelectText="Name" />
                                    </Columns>
                                    <EditRowStyle BackColor="#999999" />
                                    <EmptyDataRowStyle HorizontalAlign="Center" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="header">
                                    <div class="nav2">
                                        <h3 align="center">
                                            <asp:Label ID="Label3" runat="server" ForeColor="#3366FF" Visible="False">ผู้ดำเนินการ :</asp:Label>
                                        </h3>
                                    </div>
                                </div>
                        </tr>
                        <tr>
                            <td align="center" class="style2">
                                <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="Emp_ID"
                                    DataSourceID="SqlDataSource4" Visible="False" CellPadding="4" ForeColor="#333333"
                                    GridLines="None" Width="99%" EmptyDataText="No records found" HorizontalAlign="Center">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="Names" HeaderText="ผู้ดำเนินการ" SortExpression="Names">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Position" HeaderText="ตำแหน่ง" SortExpression="Position">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <%--<asp:BoundField DataField="pmcm_id" HeaderText="pmcm_id" SortExpression="pmcm_id" />--%>
                                        <asp:BoundField DataField="Emp_ID" HeaderText="รหัสประจำตัว" ReadOnly="True" SortExpression="Emp_ID">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                    </Columns>
                                    <EditRowStyle BackColor="#2461BF" />
                                    <EmptyDataRowStyle HorizontalAlign="Center" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EFF3FB" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                        SelectCommand="sa_select_type_frtu" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="RadioButtonList2" Name="ID_Team" PropertyName="SelectedValue"
                                Type="Int32" />
                            <asp:SessionParameter Name="office" SessionField="UserOffice" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                        SelectCommand="sa_historical_km_damage5" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Label7" Name="P_date_before" PropertyName="Text"
                                Type="DateTime" />
                            <asp:ControlParameter ControlID="Label8" Name="P_date_after" PropertyName="Text"
                                Type="DateTime" />
                            <asp:ControlParameter ControlID="GridView1" Name="P_damage_id" PropertyName="SelectedValue"
                                Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                        SelectCommand="sa_historical_km_damage4" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Label7" Name="P_date_before" PropertyName="Text"
                                Type="DateTime" DefaultValue="" />
                            <asp:ControlParameter ControlID="Label8" Name="P_date_after" PropertyName="Text"
                                Type="DateTime" DefaultValue="" />
                            <asp:ControlParameter ControlID="RadioButtonList1" Name="P_id_type_frtu" PropertyName="SelectedValue"
                                Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                        SelectCommand="sa_damage_id_by_name" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="P_pmcm_id" SessionField="sa_damage_name" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </h3>
                <poy:tail ID="tail1" runat="server" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
