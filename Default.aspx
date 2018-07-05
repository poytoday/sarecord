<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
        .auto-style1 {
            width: 174px;
            height: 32px;
        }
        .auto-style2 {
            width: 174px;
        }
    </style>
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
  
     <script type='text/javascript' src='//code.jquery.com/jquery-1.11.0.js'></script>
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
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header">
                        <div class="nav2">
                            <h3 align="center">ลงประวัติการปฏิบัติงาน</h3>
                        </div>
                    </div>
                    <h3>
                        <table width="99%">

                            <tr>
                                <td>เลขใบสั่งงาน
                                </td>
                                <td class="style17">
                                    <asp:TextBox ID="TextBox2" runat="server" Width="308px" Height="31px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2"
                                        ErrorMessage="กรอกเลขใบสั่งงาน" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
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
                                <td>ประเภทอุปกรณ์
                                </td>
                                <td class="style15">
                                    <asp:DropDownList ID="DD_Type_Device" runat="server" AutoPostBack="True" DataSourceID="DS_Type_Device"
                                        DataTextField="type_frtu" DataValueField="ID" Width="309px" Height="31px">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DD_Type_Device"
                                        ErrorMessage="เลือกประเภทอุปกรณ์" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>พื้นที่
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
                                <td>รหัสอุปกรณ์
                                </td>
                                <td class="style9">
                                    <asp:DropDownList ID="DD_Device" runat="server" AutoPostBack="True" DataSourceID="DS_Device"
                                        DataTextField="opid_location" DataValueField="dbname" Height="31px" Width="310px">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DD_Device"
                                        ErrorMessage="เลือกรหัสอุปกรณ์" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>งานที่รับมอบหมาย (ผูกงานจากใบสั่ง):
                                </td>
                                <td class="style17">
                                    <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource4" 
                                        EmptyDataText="No records found" ForeColor="#333333" GridLines="Horizontal" PageSize="5" Width="99%" DataKeyNames="send_damage_id">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:CommandField ShowSelectButton="True" HeaderImageUrl="~/images/icon_view.gif" />
                                            <asp:BoundField DataField="date_in" HeaderText="วันที่แจ้งอาการชำรุด" SortExpression="date_in"
                                                DataFormatString="{0:dd/MMM/yyyy}" HtmlEncode="False">
                                                <ItemStyle HorizontalAlign="Center" Width="12%" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="operation_recive" HeaderText="หผ. ให้ดำเนินการ" SortExpression="operation_recive"></asp:BoundField>
                                            <asp:BoundField DataField="damage" HeaderText="อาการชำรุด" SortExpression="damage"></asp:BoundField>
                                            <asp:BoundField DataField="operation_order" HeaderText="หมายเหตุ" SortExpression="operation_order"></asp:BoundField>

                                            <asp:BoundField DataField="from_program" HeaderText="เปิดงานจาก" SortExpression="from_program" />
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
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>" SelectCommand="SELECT sa.Receive_damage.operation_recive, sa.send_damage.damage, sa.send_damage.operation_order, sa.send_damage.date_in, sa.send_damage.book_num, sa.Receive_damage.receive_damage_id,sa.send_damage.send_damage_id, sa.send_damage.status, sa.send_damage.from_program  FROM sa.Receive_damage INNER JOIN sa.send_damage ON sa.Receive_damage.send_damage_id = sa.send_damage.send_damage_id WHERE (sa.send_damage.status = 2) AND (sa.send_damage.office_name = @office)">
                                        <SelectParameters>
                                            <asp:SessionParameter DefaultValue="" Name="office" SessionField="UserOffice" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td>รายการย้อนหลัง
                                </td>
                                <td>
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="pmcm_id"
                                        DataSourceID="SqlDataSource2" AllowPaging="True" BackColor="White" BorderColor="#DEDFDE"
                                        BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical"
                                        PageSize="5" Width="100%" EmptyDataText="No Records">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <%--<asp:BoundField DataField="op_id" HeaderText="op_id" SortExpression="op_id" />--%>
                                            <asp:BoundField DataField="pmcm_id" HeaderText="Index" ReadOnly="True" SortExpression="pmcm_id" />
                                            <%--<asp:BoundField DataField="db_name" HeaderText="db_name" 
                                SortExpression="db_name" />--%>
                                            <asp:BoundField DataField="date_operate" HeaderText="วันที่ดำเนินการ" SortExpression="date_operate"
                                                DataFormatString="{0:dd/MMM/yyyy}" HtmlEncode="False" />
                                            <asp:BoundField DataField="operation" HeaderText="การปฏิบัติงาน" SortExpression="operation" />
                                            <asp:BoundField DataField="status_work" HeaderText="สถานะงาน" SortExpression="status_work" />
                                            <%--<asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />--%>
                                            <%--<asp:BoundField DataField="date_receive" HeaderText="date_receive" 
                                SortExpression="date_receive" />--%>
                                            <%--<asp:BoundField DataField="date_finish" HeaderText="date_finish" 
                                SortExpression="date_finish" />--%>
                                            <%--<asp:BoundField DataField="type_frtu" HeaderText="type_frtu" 
                                SortExpression="type_frtu" />--%>
                                            <%--<asp:BoundField DataField="remark" HeaderText="หมายเหตุ" SortExpression="remark" />--%>
                                            <%--<asp:BoundField DataField="date_update" HeaderText="date_update" 
                                SortExpression="date_update" />--%>
                                            <%--<asp:BoundField DataField="date_num" HeaderText="date_num" 
                                SortExpression="date_num" />--%>
                                            <%--<asp:BoundField DataField="sap_id" HeaderText="sap_id" 
                                SortExpression="sap_id" />--%>
                                            <%--<asp:BoundField DataField="device_name" HeaderText="device_name" 
                                SortExpression="device_name" />--%>
                                        </Columns>
                                        <EmptyDataRowStyle BorderStyle="Dashed" ForeColor="#FF3300" HorizontalAlign="Center" />
                                        <FooterStyle BackColor="#CCCC99" />
                                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                        <RowStyle BackColor="#F7F7DE" />
                                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                        <SortedAscendingHeaderStyle BackColor="#848384" />
                                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                        <SortedDescendingHeaderStyle BackColor="#575357" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                        SelectCommand="sa_pmcm_list" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DD_Device" Name="dbname" PropertyName="SelectedValue"
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td>การปฎิบัติงาน
                                </td>
                                <td class="style5">
                                    <asp:DropDownList ID="DD_operation" runat="server" AutoPostBack="True" DataSourceID="DS_pm_cm"
                                        DataTextField="PM_CM" DataValueField="PM_CM" Height="26px" Width="612px">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="DD_operation"
                                        ErrorMessage="เลือกการปฎิบัติงาน" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>วันที่เริ่มดำเนินการ
                                </td>
                                <td>
                                     
                                    <asp:TextBox ID="TextBox3" runat="server" Width="306px" Height="31px"></asp:TextBox>
                                    <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66"
                                        BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
                                        ForeColor="#663399" Height="200px" ShowGridLines="True" Visible="False" Width="220px">
                                        <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                                        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                                        <OtherMonthDayStyle ForeColor="#CC9966" />
                                        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                                        <SelectorStyle BackColor="#FFCC66" />
                                        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                                        <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                                    </asp:Calendar>
                                    <asp:Button ID="Button1" runat="server" Text="วันที่" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox3"
                                        ErrorMessage="เลือกวันที่การปฎิบัติงาน" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>จำนวนวันในการปฏิบัติงาน
                                </td>
                                <td class="style4">
                                    <asp:DropDownList ID="DropDownList3" runat="server" Height="31px" Width="66px">
                                         <asp:ListItem Value="1">1 ชม.</asp:ListItem>
                                        <asp:ListItem Value="2">2 ชม.</asp:ListItem>
                                        <asp:ListItem Value="3">3 ชม.</asp:ListItem>
                                        <asp:ListItem Value="4">4 ชม.</asp:ListItem>
                                        <asp:ListItem Value="5">5 ชม.</asp:ListItem>
                                         <asp:ListItem Value="6">6 ชม.</asp:ListItem>
                                        <asp:ListItem Value="7">7 ชม.</asp:ListItem>
                                        <asp:ListItem Value="8">8 ชม.</asp:ListItem>
                                        <asp:ListItem Value="9">9 ชม.</asp:ListItem>
                                        <asp:ListItem Value="10">10 ชม.</asp:ListItem>
                                   
                                        <asp:ListItem Value="99">&gt; 5 วัน</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>ผู้ร่วมดำเนินการ
                                </td>
                                <td class="style1">
                                    <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="DS_name" DataTextField="Names"
                                        DataValueField="Emp_ID" RepeatColumns="4" RepeatDirection="Horizontal">
                                    </asp:CheckBoxList>
                                    <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>ความผิดปกติ
                                </td>
                                <td class="style1">
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" AutoPostBack="True">
                                        <asp:ListItem>ปกติ</asp:ListItem>
                                        <asp:ListItem>มีอาการชำรุด 1 อาการ</asp:ListItem>
                                        <asp:ListItem>มีอาการชำรุดมากกว่า 1 อาการ</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="RadioButtonList1"
                                        ErrorMessage="เลือกความผิดปกติ" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text="สถานะการปฏิบัติงาน"></asp:Label>
                                </td>
                                <td class="style1">
                                    <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal"
                                        Height="28px" Width="465px">
                                        <asp:ListItem>ใช้งานได้</asp:ListItem>
                                        <asp:ListItem>ใช้งานได้บางส่วน</asp:ListItem>
                                        <asp:ListItem Value="ใช้งานไม่ได้">ใช้งานไม่ได้</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="RadioButtonList2"
                                        ErrorMessage="เลือกสถานะอุปกรณ์" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style12">
                                    <asp:Label ID="Label3" runat="server" Text="สถานะการส่งงาน"></asp:Label>
                                </td>
                                <td class="style1">
                                    <asp:DropDownList ID="DD_order_type" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3"
                                        DataTextField="order_type" DataValueField="order_type_id" Height="31px" Width="310px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                        SelectCommand="SELECT order_type, order_type_id FROM sa.order_type WHERE (office = @P_office) AND (view_list = @P_user_access)">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="P_office" SessionField="UserOffice" />
                                            <asp:Parameter DefaultValue="owner" Name="P_user_access" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td>หมายเหตุ
                                </td>
                                <td class="style1">
                                    <asp:TextBox ID="TextBox1" runat="server" Height="91px" TextMode="MultiLine" Width="532px"></asp:TextBox>
                                </td>
                            </tr>
                          
                        </table>
                    </h3>
              


                <asp:Panel ID="Panel1" runat="server" visible ="false">
                    <div class="header">
                        <div class="nav2">
                            <h3 align="center">
                                <asp:Label ID="Label5" runat="server" Text="รายอาการชำรุด"></asp:Label></h3>
                        </div>
                    </div>

                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                        SelectCommand="SELECT damage_name, Cause, Correction,damage_id, pmcm_id FROM sa.View_pmcm_damage_name WHERE (pmcm_id = @pmcm_id)">
                        <selectparameters>
                        <asp:QueryStringParameter Name="pmcm_id" QueryStringField="pmcm_id" />
                    </selectparameters>
                    </asp:SqlDataSource>
                    <h3>
                        <table width="99%">
                            <tr>
                                <td>เพิ่มอาการชำรุดใหม่ :
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox5" runat="server" Width="340px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox5"
                                        ErrorMessage="ใส่อาการชำรุด" ForeColor="Red" ValidationGroup="AA"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:Button ID="Button3" runat="server" Text="เพิ่มหัวข้ออาการชำรุด" ValidationGroup="AA" />
                                </td>
                            </tr>
                        </table>
                    </h3>
                    <h3>
                        <table width="99%" style="background-color: #C0C0C0">
                            <tr>
                                <td class="auto-style1">อาการชำรุด :
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="RadioButtonList3" runat="server" DataSourceID="ds_damage"
                                        DataTextField="damage_name" DataValueField="id_damage" RepeatColumns="3" RepeatDirection="Horizontal"
                                        AutoPostBack="True" ValidationGroup="C">
                                    </asp:RadioButtonList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="RadioButtonList1"
                                        ErrorMessage="เลือกอาการชำรุด" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">สาเหตุ :
                                </td>
                                <td>
                                    <asp:Panel ID="Panel2" runat="server" Visible="True">
                                        <asp:TextBox ID="TextBox4" runat="server" Height="148px" Width="99%" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="TextBox4"
                                        ErrorMessage="กรอกสาเหตุ" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">การแก้ไข :
                                </td>
                                <td>
                                    <asp:Panel ID="Panel3" runat="server" Visible="True">
                                        <asp:TextBox ID="TextBox6" runat="server" Height="154px" TextMode="MultiLine" Width="99%"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TextBox6"
                                        ErrorMessage="กรอกการแก้ไข" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator> </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">
                                    <asp:Button ID="Button2" runat="server" ForeColor="Lime" Text="เพิ่มอาการชำรุด" ValidationGroup="B" Visible="False" />
                                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource6"
                                        DataTextField="Max_damage" DataValueField="Max_damage" Visible="False">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                        SelectCommand="SELECT MAX(id) AS Max_damage FROM sa.Damage_List"></asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                    </h3>
                </asp:Panel>
                      </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="DD_Area" EventName="TextChanged" />
                    <asp:AsyncPostBackTrigger ControlID="DD_Device" EventName="TextChanged" />
                    <asp:AsyncPostBackTrigger ControlID="DD_Type_Device" EventName="TextChanged" />
                      <asp:AsyncPostBackTrigger ControlID="RadioButtonList1" EventName="TextChanged" />
                </Triggers>
            </asp:UpdatePanel>
            <table>
              <tr>
                                <td>
                                    <asp:LinkButton ID="LinkButton1" runat="server" ValidationGroup="A">เพิ่มข้อมูลการปฏิบัติงาน</asp:LinkButton>
                                </td>
                                <td class="style1">
                                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="DS_MAX_ID_PMCM"
                                        DataTextField="MAX_id" DataValueField="MAX_id" Visible="False">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="DS_MAX_ID_PMCM" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                        SelectCommand="SELECT MAX(pmcm_id) AS MAX_id FROM sa.pmcm_record"></asp:SqlDataSource>
                                    <asp:Label ID="Label4" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                                </td>
                            </tr>
                </table>
            <asp:SqlDataSource ID="DS_pm_cm" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                SelectCommand="SELECT [PM_CM] FROM sa.[Operation_Device] WHERE ([id_team] = @id_team)">
                <SelectParameters>
                    <asp:SessionParameter Name="id_team" SessionField="User_id_team" Type="int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DS_name" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                SelectCommand="sa_select_name" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="" Name="Emp_ID" SessionField="UserName" Type="Int32" />
                    <asp:SessionParameter DefaultValue="" Name="office" SessionField="UserOffice" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="ds_damage" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
            SelectCommand="SELECT id_damage, damage_name, id_type_frtu FROM sa.Damage_Type WHERE (id_type_frtu = @id_type_frtu) ORDER BY damage_name">
            <SelectParameters>
                <asp:ControlParameter ControlID="DD_Type_Device" DefaultValue="" Name="id_type_frtu" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
            <asp:SqlDataSource ID="DS_Team" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                SelectCommand="SELECT [Team] FROM sa.[Team] WHERE ([Team] &lt;&gt; @Team)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="0" Name="Team" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DS_Device" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                SelectCommand="sa_select_op_id" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DD_Area" Name="P_area" PropertyName="SelectedValue"
                        Type="String" DefaultValue="" />
                    <asp:ControlParameter ControlID="DD_Type_Device" Name="P_id_type" PropertyName="SelectedValue"
                        Type="Int32" DefaultValue="36" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DS_Type_Device" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                SelectCommand="sa_select_type_frtu" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="ID_Team" SessionField="User_id_team" Type="Int32" />
                    <asp:SessionParameter Name="office" SessionField="UserOffice" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                SelectCommand="sa_select_area" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DD_Type_Device" Name="P_id_type" PropertyName="SelectedValue"
                        Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <%--<asp:BoundField DataField="op_id" HeaderText="op_id" SortExpression="op_id" />--%>
            <poy:tail ID="tail1" runat="server" />
        </div>
    </form>
</body>
</html>
