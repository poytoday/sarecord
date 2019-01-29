<%@ Page Language="VB" AutoEventWireup="false" CodeFile="send_damage.aspx.vb"
    Inherits="send_damage" %>

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
                   แจ้งอุปกรณ์ชำรุด</h3> 
                 </div>

            <table width="99%">
                <tr>
                    <td class="style7">
                        แผนก</td>
                    <td>
                        <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="DS_Team" DataTextField="office"
                            DataValueField="office" RepeatColumns="3" Width="99%">
                        </asp:CheckBoxList>
                    </td>
                </tr>
              
                <tr>
                    <td class="style7">
                        อาการชำรุด
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Height="124px" Width="491px" TextMode="MultiLine"></asp:TextBox>
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
                        <asp:TextBox ID="TextBox3" runat="server" Height="28px" Width="495px"></asp:TextBox>
                    </td>
                </tr>
              
                <tr>
                    <td class="style7">
                        หมายเหตุ</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" Height="151px" Width="502px" 
                            TextMode="MultiLine"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2"
                            ErrorMessage="กรอกการดำเนินการ" ForeColor="Red" ValidationGroup="A1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        <asp:LinkButton ID="LinkButton2" runat="server" ValidationGroup="A1">เพิ่มการแจ้งอุปกรณ์ชำรุด</asp:LinkButton>
                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="DS_MAX_ID_PMCM"
                            DataTextField="MAX_id" DataValueField="MAX_id" Visible="False">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="DS_MAX_ID_PMCM" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                            SelectCommand="SELECT MAX( receive_damage_id) AS MAX_id FROM sa.Receive_damage">
                        </asp:SqlDataSource>
                       <br/> <asp:Label ID="Label2" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        <table>
            <tr>
                <td>


                </td>
            </tr>
        </table>
        </h3>
           <div class="nav2">
                                  
                <h3 align="center">
                   รายละเอียดใบงานต่างๆภายในแผนก</h3> 
                 </div>
                                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EmptyDataText="No records found" CellPadding="3" Width="99%" AllowSorting="True" PageSize="20" 
                                    DataKeyNames="send_damage_id" AllowPaging="True" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                                    <AlternatingRowStyle BackColor="#F7F7F7" />
                                    <Columns>
                      
                                       <%-- <asp:BoundField DataField="receive_damage_id" HeaderText="receive_damage_id" SortExpression="receive_damage_id">
                                        </asp:BoundField>--%>
                                         <%--<asp:BoundField DataField="emp_id" HeaderText="emp_id" SortExpression="emp_id" />--%>
                                        <%--<asp:BoundField DataField="send_damage_id" HeaderText="send_damage_id" InsertVisible="False" ReadOnly="True" SortExpression="send_damage_id" />--%>
                                         <%--<asp:BoundField DataField="db_name" HeaderText="db_name" SortExpression="db_name">
                                        </asp:BoundField>--%>
                                        <%--<asp:BoundField DataField="position" HeaderText="position" SortExpression="position" />--%>
                                        
                                       
                                        <%--<asp:BoundField DataField="from_program" HeaderText="เปิดงานจาก" SortExpression="from_program" />--%>
                                        <%--<asp:CheckBoxField DataField="status" HeaderText="status" SortExpression="status" />--%>
                                        <%--<asp:BoundField DataField="pmcm_id" HeaderText="pmcm_id" SortExpression="pmcm_id" />--%>
                                        <%--<asp:BoundField DataField="office_name" HeaderText="office_name" SortExpression="office_name" />--%>
                                        
                                        <%--<asp:BoundField DataField="operation_recive" HeaderText="การดำเนินการ" SortExpression="operation_recive">
                                        </asp:BoundField>--%>
                                         <asp:BoundField DataField="date_in" HeaderText="วันที่แจ้ง" SortExpression="date_in"  DataFormatString="{0:dd/MMM/yyyy}"  HtmlEncode="False"  >
                                        <ItemStyle Width="8%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="name" HeaderText="ผู้แจ้ง" SortExpression="name" >
                                        <ItemStyle Width="10%" />
                                        </asp:BoundField>
                                         <asp:BoundField DataField="status" HeaderText="สถานะใบงาน" SortExpression="status">
                                        <ItemStyle Width="7%" />
                                        </asp:BoundField>
                                        
                                        <asp:BoundField DataField="damage" HeaderText="อาการชำรุด" SortExpression="damage">
                                        </asp:BoundField>
                                        <asp:BoundField DataField="operation_order" HeaderText="หมายเหตุ" SortExpression="operation_order" />

                                    </Columns>
                                    <EmptyDataRowStyle HorizontalAlign="Center" />
                                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                    <PagerStyle ForeColor="#4A3C8C" HorizontalAlign="Right" BackColor="#E7E7FF" />
                                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                                </asp:GridView>
          
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>" SelectCommand="SELECT        sa.send_damage.send_damage_id, sa.send_damage.db_name, sa.send_damage.operation_order, sa.send_damage.date_in, sa.send_damage.from_program, sa.send_damage.book_num, 
                         sa.send_damage.status, sa.send_damage.pmcm_id, sa.send_damage.office_name, sa.[user].name, sa.send_damage.damage
FROM            sa.[user] INNER JOIN
                         sa.send_damage ON sa.[user].userid = sa.send_damage.em_id_send
WHERE        (sa.send_damage.office_name = @office)
ORDER BY sa.send_damage.date_in DESC">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="office" SessionField="UserOffice" />
                                    </SelectParameters>
        </asp:SqlDataSource>
          
        <poy:tail ID="tail1" runat="server" />
    </div>
    <p>
        <asp:SqlDataSource ID="DS_Team" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
            SelectCommand="SELECT office, region FROM sa.office_name WHERE (region = @region) ORDER BY office">
            <SelectParameters>
                <asp:SessionParameter Name="region" SessionField="UserRegion" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    </form>
</body>
</html>
