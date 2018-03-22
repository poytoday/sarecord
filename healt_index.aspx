<%@ Page Language="VB" AutoEventWireup="false" CodeFile="healt_index.aspx.vb" Inherits="healt_index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1 {
            width: 606px;
        }

        .style2 {
            height: 23px;
            width: 188px;
        }

        .style4 {
            height: 32px;
        }

        .style5 {
            width: 606px;
            height: 32px;
        }

        .style7 {
            width: 606px;
            height: 26px;
        }

        .style9 {
            width: 606px;
            height: 46px;
        }

        .style12 {
            width: 188px;
        }

        .style15 {
            width: 606px;
            height: 36px;
        }

        .style17 {
            width: 180px;
            height: 42px;
        }

        .auto-style2 {
            width: 79px;
        }
        .auto-style3 {
            width: 252px;
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
            <!-- For alternative headers START PASTE here -->
            <!-- A. HEADER -->
            <poy:header ID="UCmenu1" runat="server" />
            <!-- For alternative headers END PASTE here -->
            <!-- B. MAIN -->
            <asp:ScriptManager ID="ScriptManager2" runat="server">
            </asp:ScriptManager>
           
                    <div class="header">
                        <div class="nav2">
                            <h3 align="center">ลงประวัติการปฏิบัติงาน</h3>
                        </div>
                    </div>
                    <h3>
                        <table >
                            <tr>
                                <td>




                                </td>

                            </tr>

                        </table >




                        <table width="99%">
                            <tr>
                                <td></td>
                                <td>
                                    พื้นที่
                                </td>
                                <td class="style7">
                                    <asp:DropDownList ID="DD_Area" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1"
                                        DataTextField="office" DataValueField="office" Width="310px" Height="31px">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DD_Area"
                                        ErrorMessage="เลือกพื้นที่" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>

                                </td>
                                <td>
                                    รหัสอุปกรณ์
                                </td>
                                <td class="style9">
                                    <asp:DropDownList ID="DD_Device" runat="server" AutoPostBack="True" DataSourceID="DS_Device"
                                        DataTextField="op_id" DataValueField="dbname" Height="31px" Width="310px">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DD_Device"
                                        ErrorMessage="เลือกรหัสอุปกรณ์" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                              <tr>
                                <td class="auto-style2">
                                    1.
                                </td>
                                <td class="auto-style3">Brand/Type of Reloser</td>
                                <td class="style7">
                                    <asp:DropDownList ID="DD_brand" runat="server" DataSourceID="SqlDataSource3"
                                        DataTextField="detail" DataValueField="dbname" Width="310px" Height="31px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>" SelectCommand="SELECT dbname, property, detail FROM sa.Setting_Property WHERE (property = 'Brand_REC') AND (dbname = @dbname)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DD_Device" Name="dbname" PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                              <tr>
                                <td class="auto-style2">
                                    2.
                                </td>
                                <td class="auto-style3">Age of the Recloser</td>
                                <td class="style7">
                                    <asp:TextBox ID="TextBox6" runat="server" Width="195px" Height="16px"></asp:TextBox>
                                </td>
                            </tr>
                              <tr>
                                <td class="auto-style2">
                                    3.
                                </td>
                                <td class="auto-style3">Counter</td>
                                <td class="style7">
                                    <asp:DropDownList ID="DD_counter" runat="server" DataSourceID="SqlDataSource2"
                                        DataTextField="NowB_R" DataValueField="id_device" Width="310px" Height="31px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>" SelectCommand="SELECT id_device, Dates AS date1, NowB_R, AUTO FROM san2.counters WHERE (id_device = @dbname) AND (Dates = (SELECT MAX(Dates) AS Expr1 FROM san2.counters AS counters_1 WHERE (id_device = @dbname)))">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DD_Device" Name="dbname" PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                              <tr>
                                <td class="auto-style2">
                                    4.
                                </td>
                                <td class="auto-style3">Peak Load</td>
                                <td class="style7">
                                    <asp:TextBox ID="TextBox8" runat="server" Width="195px" Height="16px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">
                                    5.
                                </td>
                                <td class="auto-style3">Fault Level(%Ic)</td>
                                <td class="style7">
                                    <asp:TextBox ID="TextBox2" runat="server" Width="195px" Height="16px"></asp:TextBox>
                                </td>
                            </tr>
                            <%--<tr>
                    <td>
                        ทีม
                    </td>
                    <td class="style1">
                        <asp:DropDownList ID="DD_Team" runat="server" AutoPostBack="True" DataSourceID="DS_Team"
                            DataTextField="Team" DataValueField="Team" Height="31px" Width="310px">
                        </asp:DropDownList>
                    </td>
                </tr>--%>
                            <tr>
                                <td class="auto-style2">
                                    7.
                                </td>
                                <td class="auto-style3">Contact Resistance</td>
                                <td class="style15">
                                    <asp:TextBox ID="TextBox3" runat="server" Height="16px" Width="195px"></asp:TextBox>
                                    micro-ohm</td>
                            </tr>
                              <tr><td class="auto-style2">8.</td>
                                <td class="auto-style3">Terminal Temperature</td>
                                <td class="style7">
                                    <asp:TextBox ID="TextBox4" runat="server" Height="16px" Width="195px"></asp:TextBox>
                                </td>
                            </tr>
                              <tr><td class="auto-style2">10.</td>
                                <td class="auto-style3">Speed time</td>
                                <td class="style7">
                                    <asp:TextBox ID="TextBox5" runat="server" Height="16px" Width="195px"></asp:TextBox>
                                </td>
                            </tr>
                              <tr><td class="auto-style2">11.</td>
                                <td class="auto-style3">Indication Status</td>
                                <td>
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" Height="25px" RepeatDirection="Horizontal" Width="224px">
                                        <asp:ListItem>Poor</asp:ListItem>
                                        <asp:ListItem>Good</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr> <tr><td class="auto-style2">12.</td>
                                <td class="auto-style3">InsulationResistance</td>
                                <td>
                                    <asp:RadioButtonList ID="RadioButtonList2" runat="server" Height="25px" RepeatDirection="Horizontal" Width="224px">
                                        <asp:ListItem>Poor</asp:ListItem>
                                        <asp:ListItem>Good</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                              <tr><td class="auto-style2">13.</td>
                                <td class="auto-style3">Audible Noise</td>
                                <td class="style5">
                                    <asp:RadioButtonList ID="RadioButtonList3" runat="server" Height="25px" RepeatDirection="Horizontal" Width="224px">
                                        <asp:ListItem>Poor</asp:ListItem>
                                        <asp:ListItem>Good</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                              <tr><td class="auto-style2">14.</td>
                                <td class="auto-style3">Bushing Conditon</td>
                                <td>
                                    <asp:RadioButtonList ID="RadioButtonList4" runat="server" Height="25px" RepeatDirection="Horizontal" Width="224px">
                                        <asp:ListItem>Poor</asp:ListItem>
                                        <asp:ListItem>Good</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                              <tr><td class="auto-style2">15.</td>
                                <td class="auto-style3">Loss Index</td>
                                <td class="style4">
                                    <asp:TextBox ID="TextBox9" runat="server" Height="16px" Width="195px"></asp:TextBox>
                                    %</td>
                            </tr>
                             <tr><td class="auto-style2">16.</td>
                                <td class="auto-style3">Dilelctric Strengh</td>
                                <td class="style4">
                                    <asp:TextBox ID="TextBox10" runat="server" Height="16px" Width="195px"></asp:TextBox>
                                    kV</td>
                            </tr>
                             <tr><td class="auto-style2">17.</td>
                                <td class="auto-style3">Closing Solenoid Condition</td>
                                <td class="style1">
                                    <asp:RadioButtonList ID="RadioButtonList5" runat="server" Height="25px" RepeatDirection="Horizontal" Width="224px">
                                        <asp:ListItem>Poor</asp:ListItem>
                                        <asp:ListItem>Good</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                             <tr><td class="auto-style2">18.</td>
                                <td class="auto-style3">Bakelite Condition</td>
                                <td class="style1">
                                    <asp:RadioButtonList ID="RadioButtonList6" runat="server" Height="25px" RepeatDirection="Horizontal" Width="224px">
                                        <asp:ListItem>Poor</asp:ListItem>
                                        <asp:ListItem>Good</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                             <tr><td class="auto-style2">19.</td>
                                <td class="auto-style3">Gaskets Condition</td>
                                <td class="style1">
                                    <asp:RadioButtonList ID="RadioButtonList7" runat="server" Height="25px" RepeatDirection="Horizontal" Width="224px">
                                        <asp:ListItem>Poor</asp:ListItem>
                                        <asp:ListItem>Good</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                             <tr><td class="auto-style2">20.</td>
                                <td class="auto-style3">Vacuum Interrupter</td>
                                <td class="style1">
                                    <asp:RadioButtonList ID="RadioButtonList8" runat="server" Height="25px" RepeatDirection="Horizontal" Width="224px">
                                        <asp:ListItem>Poor</asp:ListItem>
                                        <asp:ListItem>Good</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                             <tr><td class="auto-style2">21.</td>
                                <td class="auto-style3">SF6 GasPressure</td>
                                <td class="style1">
                                    <asp:RadioButtonList ID="RadioButtonList9" runat="server" Height="25px" RepeatDirection="Horizontal" Width="224px">
                                        <asp:ListItem>Poor</asp:ListItem>
                                        <asp:ListItem>Good</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                             <tr><td class="auto-style2">24.</td>
                                <td class="auto-style3">Measurement Check</td>
                                <td class="style1">
                                    <asp:RadioButtonList ID="RadioButtonList25" runat="server" Height="25px" RepeatDirection="Horizontal" Width="224px">
                                        <asp:ListItem>Poor</asp:ListItem>
                                        <asp:ListItem>Good</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                             <tr><td class="auto-style2">25.</td>
                                <td class="auto-style3">Function Check</td>
                                <td class="style1">
                                    <asp:RadioButtonList ID="RadioButtonList24" runat="server" Height="25px" RepeatDirection="Horizontal" Width="224px">
                                        <asp:ListItem>Poor</asp:ListItem>
                                        <asp:ListItem>Good</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                             <tr><td class="auto-style2">26.</td>
                                <td class="auto-style3">Internal Visual Inspect</td>
                                <td class="style1">
                                    <asp:RadioButtonList ID="RadioButtonList23" runat="server" Height="25px" RepeatDirection="Horizontal" Width="224px">
                                        <asp:ListItem>Poor</asp:ListItem>
                                        <asp:ListItem>Good</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                             <tr><td class="auto-style2">27.</td>
                                <td class="auto-style3">Grouding System Check</td>
                                <td class="style1">
                                    <asp:RadioButtonList ID="RadioButtonList22" runat="server" Height="25px" RepeatDirection="Horizontal" Width="224px">
                                        <asp:ListItem>Poor</asp:ListItem>
                                        <asp:ListItem>Good</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                             <tr><td class="auto-style2">28.</td>
                                <td class="auto-style3">Battery Check</td>
                                <td class="style1">
                                    <asp:RadioButtonList ID="RadioButtonList21" runat="server" Height="25px" RepeatDirection="Horizontal" Width="224px">
                                        <asp:ListItem>Poor</asp:ListItem>
                                        <asp:ListItem>Good</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                             <tr><td class="auto-style2">29.</td>
                                <td class="auto-style3">Heater Check</td>
                                <td class="style1">
                                    <asp:RadioButtonList ID="RadioButtonList20" runat="server" Height="25px" RepeatDirection="Horizontal" Width="224px">
                                        <asp:ListItem>Poor</asp:ListItem>
                                        <asp:ListItem>Good</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                             <tr><td class="auto-style2">33.</td>
                                <td class="auto-style3">Bushing Condition</td>
                                <td class="style1">
                                    <asp:RadioButtonList ID="RadioButtonList19" runat="server" Height="25px" RepeatDirection="Horizontal" Width="224px">
                                        <asp:ListItem>Poor</asp:ListItem>
                                        <asp:ListItem>Good</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                             <tr><td class="auto-style2">34.</td>
                                <td class="auto-style3">Audible Noise</td>
                                <td class="style1">
                                    <asp:RadioButtonList ID="RadioButtonList18" runat="server" Height="25px" RepeatDirection="Horizontal" Width="224px">
                                        <asp:ListItem>Poor</asp:ListItem>
                                        <asp:ListItem>Good</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                 <tr><td class="auto-style2">35.</td>
                                    <td class="auto-style3">Insulation Resistance</td>
                                    <td class="style1">
                                        <asp:RadioButtonList ID="RadioButtonList17" runat="server" Height="25px" RepeatDirection="Horizontal" Width="224px">
                                            <asp:ListItem>Poor</asp:ListItem>
                                            <asp:ListItem>Good</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                     <tr><td class="auto-style2">36.</td>
                                        <td class="auto-style3">Case Visual Inspect&nbsp; </td>
                                        <td class="style1">
                                            <asp:RadioButtonList ID="RadioButtonList16" runat="server" Height="25px" RepeatDirection="Horizontal" Width="224px">
                                                <asp:ListItem>Poor</asp:ListItem>
                                                <asp:ListItem>Good</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                         <tr><td class="auto-style2">37.</td>
                                            <td class="auto-style3">Voltage Output</td>
                                            <td class="style1">
                                                <asp:RadioButtonList ID="RadioButtonList15" runat="server" Height="25px" RepeatDirection="Horizontal" Width="224px">
                                                    <asp:ListItem>Poor</asp:ListItem>
                                                    <asp:ListItem>Good</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                         <tr><td class="auto-style2">38.</td>
                                            <td class="auto-style3">Bird Guard</td>
                                            <td class="style1">
                                                <asp:RadioButtonList ID="RadioButtonList14" runat="server" Height="25px" RepeatDirection="Horizontal" Width="224px">
                                                    <asp:ListItem>Poor</asp:ListItem>
                                                    <asp:ListItem>Good</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                             <tr><td class="auto-style2">39.</td>
                                                <td class="auto-style3">Surge Arrester</td>
                                                <td class="style1">
                                                    <asp:RadioButtonList ID="RadioButtonList13" runat="server" Height="25px" RepeatDirection="Horizontal" Width="224px">
                                                        <asp:ListItem>Poor</asp:ListItem>
                                                        <asp:ListItem>Good</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                                 <tr><td class="auto-style2">40.</td>
                                                    <td class="auto-style3">Bird Guard</td>
                                                    <td class="style1">
                                                        <asp:RadioButtonList ID="RadioButtonList12" runat="server" Height="25px" RepeatDirection="Horizontal" Width="224px">
                                                            <asp:ListItem>Poor</asp:ListItem>
                                                            <asp:ListItem>Good</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                     <tr><td class="auto-style2">41.</td>
                                                        <td class="auto-style3">Snake Guard</td>
                                                        <td class="style1">
                                                            <asp:RadioButtonList ID="RadioButtonList11" runat="server" Height="25px" RepeatDirection="Horizontal" Width="224px">
                                                                <asp:ListItem>Poor</asp:ListItem>
                                                                <asp:ListItem>Good</asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                    </tr>
                                                     <tr><td class="auto-style2">42.</td>
                                                        <td class="auto-style3">Foundation</td>
                                                        <td class="style1">
                                                            <asp:RadioButtonList ID="RadioButtonList10" runat="server" Height="25px" RepeatDirection="Horizontal" Width="224px">
                                                                <asp:ListItem>Poor</asp:ListItem>
                                                                <asp:ListItem>Good</asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </td>
                                                    </tr>
                                                     <tr><td class="auto-style2">&nbsp;</td>
                                                        <td class="auto-style3">&nbsp;</td>
                                                        <td class="style1">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style2">
                                                            &nbsp;</td>
                                                    </tr>

                                                </tr>
                                            </tr>
                                        </tr>
                                    </tr>
                                </tr>
                                <tr>
                                    <td class="auto-style2">
                                        &nbsp;</td>
                                    <td class="auto-style3">
                                        <asp:LinkButton ID="LinkButton1" runat="server" ValidationGroup="A">เพิ่มข้อมูลการปฏิบัติงาน</asp:LinkButton>
                                    </td>
                                </tr>
                            </tr>
                        </table>
                    </h3>
                
            <%--<asp:BoundField DataField="op_id" HeaderText="op_id" SortExpression="op_id" />--%>
        <asp:SqlDataSource ID="DS_Device" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
            SelectCommand="SELECT op_id + '   (' + location + ')'AS op_id, dbname, office FROM sa.Device_List WHERE (office = @area)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DD_Area" Name="area" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
            SelectCommand="SELECT DISTINCT sa.Device_List.office, sa.office_name.office AS section FROM sa.office_name INNER JOIN sa.Type_Frtu ON sa.office_name.office = sa.Type_Frtu.office INNER JOIN sa.Device_List ON sa.Type_Frtu.ID = sa.Device_List.id_type_frtu WHERE (sa.office_name.office = @section)">
            <SelectParameters>
                <asp:SessionParameter Name="section" SessionField="UserOffice" />
            </SelectParameters>
        </asp:SqlDataSource>
            <poy:tail ID="tail1" runat="server" />
        </div>
    </form>
</body>
</html>
