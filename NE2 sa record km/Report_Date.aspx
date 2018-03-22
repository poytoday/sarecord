<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Report_Date.aspx.vb" Inherits="Report_Date" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>เรียกดูการปฎิบัติงานตามช่วงเวลา</title>
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
            width: 77px;
        }
        .style3
        {
            width: 442px;
        }
        .style7
        {
            width: 21%;
        }
        .style8
        {
            width: 18%;
        }
        .style9
        {
            width: 11%;
        }
        .style10
        {
            width: 19%;
        }
        .style12
        {
            width: 173px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="page-container">
        <!-- For alternative headers START PASTE here -->
        <!-- A. HEADER -->
        <poy:header ID="UCmenu1" runat="server" />
        <div class="header">
            <div class="nav2">
                <h3 align="center">
                    เรียกดูการปฎิบัติงานตามช่วงเวลา
                </h3>
            </div>
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <h3>
            <table width="99%">
                <tr>
                    <td class="style12">
                        ทีมงาน :
                    </td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList2" runat="server" DataSourceID="SqlDataSource3"
                            DataTextField="Team" DataValueField="Team" AutoPostBack="True" RepeatDirection="Horizontal"
                            RepeatColumns="4" Width="99%">
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="RadioButtonList1"
                            ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="A">เลือกประเภทอุปกรณ์</asp:RequiredFieldValidator>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                            SelectCommand="SELECT Team FROM sa.Team WHERE (office = @office)">
                            <SelectParameters>
                                <asp:SessionParameter Name="office" SessionField="UserOffice" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                            SelectCommand="sa_type_frtu" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="RadioButtonList2" DefaultValue="FRTU" Name="P_Team"
                                    PropertyName="SelectedValue" Type="String" />
                                <asp:SessionParameter Name="P_office" SessionField="UserOffice" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style12">
                        <asp:Label ID="Label4" runat="server" Text="ประเภทอุปกรณ์" Visible="False"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource1"
                            DataTextField="type_frtu" DataValueField="ID" RepeatDirection="Horizontal" Width="269px"
                            CellPadding="10" ClientIDMode="Predictable" ForeColor="Black" BorderStyle="None"
                            EnableTheming="True" TabIndex="10" AutoPostBack="True" Visible="False" RepeatColumns="4">
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <table width="99%">
                        <tr>
                            <td align="center" class="style3" style="background-color: #C0C0C0">
                                Start&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td align="center" style="background-color: #008080">
                                End&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>
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
                                    <asp:ListItem>2560</asp:ListItem>
                                    <asp:ListItem>2559</asp:ListItem>
                                    <asp:ListItem>2558</asp:ListItem> <asp:ListItem>2557</asp:ListItem>
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
                    </table>
                    <table width="99%">
                        <%--<tr>
            <td class="style2">
            
                Substation</td>
            <td>
            
                <asp:DropDownList ID="DD_after_y0" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource1" DataTextField="Substation" 
                    DataValueField="Substation">
                    <asp:ListItem>2013</asp:ListItem>
                </asp:DropDownList>
            
            </td>
          
            </tr>--%>
                        <tr>
                            <td>
                                <asp:Button ID="Button1" runat="server" Text="OK" />
                            </td>
                            <td>
                                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                    <ProgressTemplate>
                                        Pless Wait New Event !................
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                            </td>
                        </tr>
                    </table>
                    <h3>
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Height="88px"
                            HorizontalAlign="Left" Style="margin-top: 1px" Width="99%" Visible="False" EmptyDataText="Not Found Data"
                            DataKeyNames="pmcm_id">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <%--<asp:BoundField DataField="sap_id" HeaderText="sap_id" SortExpression="sap_id"></asp:BoundField>--%>
                                <asp:BoundField DataField="op_id" HeaderText="รหัสอุปกรณ์" SortExpression="op_id">
                                    <ItemStyle HorizontalAlign="Center" Width="10%" />
                                </asp:BoundField>
                                <%--<asp:BoundField DataField="office" HeaderText="office" SortExpression="office"></asp:BoundField>--%>
                                <%--<asp:BoundField DataField="substation" HeaderText="substation" SortExpression="substation" />--%>
                                <asp:BoundField DataField="date_operate" HeaderText="วันดำเนินการ" SortExpression="date_operate"
                                    DataFormatString="{0:dd/MMM/yyyy}" HtmlEncode="False">
                                    <ItemStyle HorizontalAlign="Center" Width="14%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="operation" HeaderText="การปฏิบัติงาน" SortExpression="operation">
                                    <ItemStyle Width="30%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="status_work" HeaderText="สถานะงาน" SortExpression="status_work">
                                    <ItemStyle HorizontalAlign="Center" Width="12%" />
                                </asp:BoundField>
                                <%--<asp:BoundField DataField="type_frtu" HeaderText="type_frtu" SortExpression="type_frtu" />--%>
                                <asp:BoundField DataField="remark" HeaderText="หมายเหตุ" SortExpression="remark" />
                                <%--<asp:BoundField DataField="date_num" HeaderText="date_num" SortExpression="date_num" />--%>
                                <%--<asp:BoundField DataField="pmcm_id" HeaderText="pmcm_id" ReadOnly="True" SortExpression="pmcm_id" />--%>
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
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
                    </h3>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </h3>
        <poy:tail ID="tail1" runat="server" />
    </div>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
        SelectCommand="sa_historical" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label2" DefaultValue="01/01/2557 00:00:01" Name="P_date_before"
                PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="Label3" DefaultValue="01/01/2558 00:01:00" Name="P_date_after"
                PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="RadioButtonList1" DefaultValue="22" Name="P_id_type_frtu"
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
