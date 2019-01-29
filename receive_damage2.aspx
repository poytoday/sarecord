<%@ Page Language="VB" AutoEventWireup="false" CodeFile="receive_damage2.aspx.vb"
    Inherits="receive_damage2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        *
        {
            padding: 0;
            margin-left: 0px;
            margin-top: 0;
            margin-bottom: 0;
        }
        .style6
        {
            width: 218px;
            height: 99px;
        }
        .style7
        {
            width: 218px;
        }
        .auto-style1 {
            width: 218px;
            height: 124px;
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
          <div class="nav2">
                                  
                <h3 align="center">
                   รับงานจากผู้แจ้งซ่อมเข้าแผนก </h3> 
                 </div>
             <table width="99%">
                   <tr>
                    <td>

                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" EmptyDataText="No records found" CellPadding="4" ForeColor="#333333"
                                    GridLines="Horizontal" Width="99%" AllowSorting="True" PageSize="30" 
                                    DataKeyNames="send_damage_id">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                      
                                        <asp:CommandField ShowSelectButton="True" HeaderImageUrl="~/images/icon_view.gif"  >
                                        <ItemStyle Width="5%" />
                                        </asp:CommandField>
                                        <asp:BoundField DataField="send_damage_id" HeaderText="เลขใบสั่ง(SA)" SortExpression="send_damage_id">
                                            <ItemStyle Width="8%" />
                                        </asp:BoundField>
                                         <asp:BoundField DataField="date_in" HeaderText="วันที่ชำรุด" SortExpression="date_in"
                                            DataFormatString="{0:dd/MMM/yyyy}" HtmlEncode="False">
                                            <ItemStyle HorizontalAlign="Center" Width="12%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="damage" HeaderText="อาการชำรุด" SortExpression="damage">
                                            <ItemStyle Width="25%" />
                                        </asp:BoundField>
                                       
                                        <asp:BoundField DataField="from_program" HeaderText="เปิดงานจาก" SortExpression="from_program">
                                            <ItemStyle HorizontalAlign="Center" Width="12%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="operation_order" HeaderText="หมายเหตุ" SortExpression="operation_order">
                                            <ItemStyle HorizontalAlign="Center" Width="15%" />
                                        </asp:BoundField>
                                        <%--<asp:BoundField DataField="date_num" HeaderText="จำนวนวัน" 
                                            SortExpression="date_num" >
                                        <ItemStyle Width="5%" />
                                        </asp:BoundField>--%>
                                      
                                        <%--<asp:ButtonField CommandName="cmdEdit" HeaderImageUrl="~/images/icon_view.gif" Text="View" />--%>
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

                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>" SelectCommand="SELECT send_damage_id, db_name, damage, operation_order, date_in, book_num, status, pmcm_id, office_name,from_program  FROM sa.send_damage WHERE (office_name = @office) AND (status = 1)">
                                    <SelectParameters>
                                        <asp:SessionParameter DefaultValue="" Name="office" SessionField="UserOffice" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                        <br/>
                        <asp:Label ID="Label3" runat="server" Text="Label" Visible="False" ForeColor="Red"></asp:Label>
                    </td>

                </tr>
             </table>
            <table width="99%">
               <%-- <tr>
                    <td class="style7">
                        ทีม
                    </td>
                    <td>
                        <asp:DropDownList ID="DD_Team" runat="server" AutoPostBack="True" DataSourceID="DS_Team"
                            DataTextField="Team" DataValueField="ID" Height="31px" Width="310px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        ประเภทอุปกรณ์
                    </td>
                    <td>
                        <asp:DropDownList ID="DD_Type_Device" runat="server" AutoPostBack="True" DataSourceID="DS_Type_Device"
                            DataTextField="type_frtu" DataValueField="ID" Width="309px" Height="31px">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DD_Type_Device"
                            ErrorMessage="เลือกประเภทอุปกรณ์" ForeColor="Red" ValidationGroup="A1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        พื้นที่
                    </td>
                    <td>
                        <asp:DropDownList ID="DD_Area" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1"
                            DataTextField="office" DataValueField="office" Width="310px" Height="31px">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DD_Area"
                            ErrorMessage="เลือกพื้นที่" ForeColor="Red" ValidationGroup="A1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        รหัสอุปกรณ์
                    </td>
                    <td>
                        <asp:DropDownList ID="DD_Device" runat="server" AutoPostBack="True" DataSourceID="DS_Device"
                            DataTextField="opid_location" DataValueField="dbname" Height="31px" 
                            Width="310px">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DD_Device"
                            ErrorMessage="เลือกรหัสอุปกรณ์" ForeColor="Red" ValidationGroup="A1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        อาการชำรุด
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Height="23px" Width="384px"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox1"
                            ErrorMessage="กรอกอาการชำรุด" ForeColor="Red" ValidationGroup="A1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        วันที่ชำรุด
                    </td>
                    <td>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
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
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        เลขหนังสือ
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" Height="28px" Width="407px"></asp:TextBox>
                    </td>
                </tr>--%>
             
                <tr>
                    <td class="style7">
                        ผู้ดำเนินการ
                    </td>
                    <td>
                        <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="DS_name" DataTextField="Names"
                            DataValueField="Emp_ID" RepeatColumns="3" Width="99%">
                        </asp:CheckBoxList>
                        <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        การดำเนินการ</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" Height="151px" Width="502px" 
                            TextMode="MultiLine"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2"
                            ErrorMessage="กรอกการดำเนินการ" ForeColor="Red" ValidationGroup="A1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:LinkButton ID="LinkButton2" runat="server" ValidationGroup="A1">เพิ่มผู้ดำเนินการ</asp:LinkButton>
                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="DS_MAX_ID_PMCM"
                            DataTextField="MAX_id" DataValueField="MAX_id" Visible="False">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="DS_MAX_ID_PMCM" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                            SelectCommand="SELECT MAX( receive_damage_id) AS MAX_id FROM sa.Receive_damage">
                        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DS_name" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
            SelectCommand="sa_select_name_recive2" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="office" SessionField="UserOffice" Type="String" />
              
            </SelectParameters>
        </asp:SqlDataSource>
                        <br />
                    </td>
                </tr>
            </table>

        <div class="nav2">
                                  
                <h3 align="center">
                   รายละเอียดใบงานต่างๆ</h3> 
                 </div>
                                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EmptyDataText="No records found" CellPadding="3" Width="99%" AllowSorting="True" PageSize="20" 
                                    DataKeyNames="send_damage_id" AllowPaging="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2">
                                    <Columns>
                      
                                       <%-- <asp:BoundField DataField="receive_damage_id" HeaderText="receive_damage_id" SortExpression="receive_damage_id">
                                        </asp:BoundField>--%>
                                         <%--<asp:BoundField DataField="emp_id" HeaderText="emp_id" SortExpression="emp_id" />--%>
                                        <%--<asp:BoundField DataField="send_damage_id" HeaderText="send_damage_id" InsertVisible="False" ReadOnly="True" SortExpression="send_damage_id" />--%>
                                         <%--<asp:BoundField DataField="db_name" HeaderText="db_name" SortExpression="db_name">
                                        </asp:BoundField>--%>
                                         <asp:BoundField DataField="date_in" HeaderText="วันที่แจ้ง" SortExpression="date_in"  DataFormatString="{0:dd/MMM/yyyy}"  HtmlEncode="False"  />
                                        <asp:BoundField DataField="name" HeaderText="ผู้รับผิดชอบ" SortExpression="name" />
                                        <%--<asp:BoundField DataField="position" HeaderText="position" SortExpression="position" />--%>
                                        
                                       
                                        <asp:BoundField DataField="from_program" HeaderText="เปิดงานจาก" SortExpression="from_program" />
                                        <%--<asp:CheckBoxField DataField="status" HeaderText="status" SortExpression="status" />--%>
                                        <%--<asp:BoundField DataField="pmcm_id" HeaderText="pmcm_id" SortExpression="pmcm_id" />--%>
                                        <%--<asp:BoundField DataField="office_name" HeaderText="office_name" SortExpression="office_name" />--%>
                                        
                                        <asp:BoundField DataField="damage" HeaderText="อาการชำรุด" SortExpression="damage">
                                        </asp:BoundField>
                                        <asp:BoundField DataField="operation_order" HeaderText="หมายเหตุ" SortExpression="operation_order" />

                                        <asp:BoundField DataField="operation_recive" HeaderText="การดำเนินการ" SortExpression="operation_recive">
                                        </asp:BoundField>
                                         <asp:BoundField DataField="status" HeaderText="สถานะใบงาน" SortExpression="status">
                                        </asp:BoundField>
                                    </Columns>
                                    <EmptyDataRowStyle HorizontalAlign="Center" />
                                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#FFF1D4" />
                                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                                    <SortedDescendingCellStyle BackColor="#F1E5CE" />
                                    <SortedDescendingHeaderStyle BackColor="#93451F" />
                                </asp:GridView>
          
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>" SelectCommand="SELECT sa.Receive_damage_emp_id.receive_damage_id, sa.Receive_damage_emp_id.emp_id, sa.send_damage.send_damage_id, sa.send_damage.db_name, sa.send_damage.operation_order, sa.send_damage.date_in,sa.send_damage.from_program, sa.send_damage.book_num, sa.send_damage.status, sa.send_damage.pmcm_id, sa.send_damage.office_name, sa.[user].name, sa.[user].position, sa.send_damage.damage, sa.Receive_damage.operation_recive FROM sa.Receive_damage_emp_id INNER JOIN sa.Receive_damage ON sa.Receive_damage_emp_id.receive_damage_id = sa.Receive_damage.receive_damage_id INNER JOIN sa.send_damage ON sa.Receive_damage.send_damage_id = sa.send_damage.send_damage_id INNER JOIN sa.[user] ON sa.Receive_damage_emp_id.emp_id = sa.[user].userid WHERE (sa.send_damage.office_name = @office) ORDER BY sa.send_damage.date_in DESC">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="office" SessionField="UserOffice" />
                                    </SelectParameters>
        </asp:SqlDataSource>
        <poy:tail ID="tail1" runat="server" />
    </div>

    </form>
</body>
</html>
