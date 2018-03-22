<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Materaial.aspx.vb" Inherits="Materaial" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
        .style3
        {
            width: 533px;
        }
        .style4
        {
            width: 259px;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
    <div class="page-container">
        <!-- For alternative headers START PASTE here -->
        <!-- A. HEADER -->
        <poy:header ID="UCmenu1" runat="server" />
        <h2 style="color: #0000FF" align="center">
            เพิ่ม/แก้ไข วัสดุสิ้นเปลือง
        </h2>
        <!-- For alternative headers END PASTE here -->
        <!-- B. MAIN -->
        <h3>
            <table style="background-color: #C0C0C0">
                <tr>
                    <td class="style4">
                        เพิ่มหัวข้อวัสดุใหม่ :
                    </td>
                    <td class="style1">
                        <asp:TextBox ID="TextBox1" runat="server" Width="319px" Height="20px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="ใส่ ชื่อวัสดุ"
                            ControlToValidate="TextBox1" ValidationGroup="AA" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td class="style1">
                        <asp:Button ID="Button2" runat="server" Text="เพิ่มวัสดุ" 
                            ValidationGroup="AA" />
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>
                        เลือกวัสดุที่ต้องการเพิ่มจำนวน
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2"
                            DataTextField="material_type" DataValueField="material_type" Height="20px" Width="278px"
                            AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                            SelectCommand="SELECT material_type FROM sa.material_type WHERE (office = @office_name)">
                            <SelectParameters>
                                <asp:SessionParameter Name="office_name" SessionField="UserOffice" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <tr>
                        <td class="style3">
                            รายละเอียดการเพิ่มเข้าคลัง :
                        </td>
                        <td>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="material_type,office"
                                DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None"
                                Width="734px">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="material_type" HeaderText="ชื่อวัสดุสิ้นเปลือง" ReadOnly="True"
                                        SortExpression="material_type"></asp:BoundField>
                                    <asp:BoundField DataField="number_material" HeaderText="จำนวนที่นำเข้าคลัง" SortExpression="number_material">
                                    </asp:BoundField>
                                    <%--<asp:BoundField DataField="office" HeaderText="office" ReadOnly="True" SortExpression="office" />--%>
                                    <asp:BoundField DataField="date_income" HeaderText="วันที่ได้มา" SortExpression="date_income"
                                        DataFormatString="{0:dd/MMM/yyyy}" HtmlEncode="False" />
                                    <asp:BoundField DataField="note" HeaderText="หมายเหตุ" SortExpression="note" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                        </td>
                    </tr>
                </tr>
                <tr>
                    <td class="style3">
                        จำนวน(ชิ้น) :
                    </td>
                    <td class="style1">
                        <asp:TextBox ID="TextBox2" runat="server" Width="319px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="จำนวน"
                            ControlToValidate="TextBox2" ValidationGroup="A1" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td class="style1">
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        วันที่ได้มา
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server" Width="306px" Height="31px"></asp:TextBox>
                        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC"
                            BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
                            ForeColor="#003399" Height="200px" Visible="False" Width="220px" CellPadding="1">
                            <DayHeaderStyle BackColor="#99CCCC" Height="1px" ForeColor="#336666" />
                            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                            <TitleStyle BackColor="#003399" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF"
                                BorderColor="#3366CC" BorderWidth="1px" Height="25px" />
                            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                            <WeekendDayStyle BackColor="#CCCCFF" />
                        </asp:Calendar>
                        <asp:Button ID="Button1" runat="server" Text="วันที่" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox3"
                            ErrorMessage="เลือกวันที่การปฎิบัติงาน" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        หมายเหตุ :
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" Width="642px" Height="168px" 
                            TextMode="MultiLine" ValidationGroup="A1"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <asp:LinkButton ID="Linkbutton10" runat="server" Width="99px" ValidationGroup="A1">เพิ่มวัสดุ</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </h3>
        <h3 align="center">
            <table align="center">
                <tr>
                    <td align="center">
                        รายการคงเหลือ
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3"
                            BackColor="White" BorderColor="White" BorderWidth="2px" CellPadding="3" 
                            GridLines="None" Width="734px" BorderStyle="Ridge" CellSpacing="1">
                            <Columns>
                                <asp:BoundField DataField="material_type" HeaderText="รายชื่อวัสดุ" SortExpression="material_type">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <%--<asp:BoundField DataField="office" HeaderText="office" SortExpression="office"></asp:BoundField>--%>
                                <asp:BoundField DataField="net_values" HeaderText="คงเหลือ(ตัว)" ReadOnly="True"
                                    SortExpression="net_values" >
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                            </Columns>
                            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                            <SelectedRowStyle BackColor="#9471DE" ForeColor="White" Font-Bold="True" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#594B9C" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#33276A" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                            SelectCommand="SELECT material_type, office, net_values FROM sa.View_material_net WHERE (office = @office_name) AND (material_type = @material_name)">
                            <SelectParameters>
                                <asp:SessionParameter Name="office_name" SessionField="UserOffice" />
                                <asp:ControlParameter ControlID="DropDownList1" Name="material_name" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        รายการที่ใช้ไป
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4"
                            BackColor="White" BorderColor="#CCCCCC" BorderWidth="1px" CellPadding="4"
                            ForeColor="Black" GridLines="Horizontal" Width="734px" BorderStyle="None">
                            <Columns>
                                <asp:BoundField DataField="op_id" HeaderText="รหัสอุปกรณ์" 
                                    SortExpression="op_id" >
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <%--<asp:BoundField DataField="Material" HeaderText="Material" 
                                    SortExpression="Material" />--%>
                                <asp:BoundField DataField="damage_name" HeaderText="อาการชำรุด" 
                                    SortExpression="damage_name" >
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="number_material" HeaderText="จำนวนที่ใช้" 
                                    SortExpression="number_material" >
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <%--<asp:BoundField DataField="db_name" HeaderText="db_name" 
                                    SortExpression="db_name" />--%>
                                <asp:BoundField DataField="date_operate" HeaderText="วันที่เดำเนินการ" 
                                    SortExpression="date_operate" DataFormatString="{0:dd/MMM/yyyy}" 
                                    HtmlEncode="False" >
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="operation" HeaderText="การปฎิบัติงาน" SortExpression="operation" />
                                <asp:BoundField DataField="remark" HeaderText="หมายเหตุ" SortExpression="remark" />
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                            <SelectedRowStyle BackColor="#CC3333" ForeColor="White" Font-Bold="True" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#242121" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                            
                            SelectCommand="SELECT sa.Material_List2.Material, sa.Damage_Type.damage_name, sa.Material_List2.number_material, sa.pmcm_record.db_name, sa.pmcm_record.date_operate, sa.pmcm_record.operation, sa.pmcm_record.remark, sa.Device_List.op_id, sa.Material_List2.office FROM sa.Material_List2 INNER JOIN sa.Damage_Type ON sa.Material_List2.damage_id = sa.Damage_Type.id_damage INNER JOIN sa.pmcm_record ON sa.Material_List2.pmcm_id = sa.pmcm_record.pmcm_id INNER JOIN sa.Device_List ON sa.pmcm_record.db_name = sa.Device_List.dbname WHERE (sa.Material_List2.Material = @material) AND (sa.Material_List2.office = @office_name)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="material" 
                                    PropertyName="SelectedValue" />
                                <asp:SessionParameter Name="office_name" SessionField="UserOffice" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </h3>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
            DeleteCommand="DELETE FROM sa.[Material] WHERE [material_type] = @material_type"
            InsertCommand="INSERT INTO sa.[Material] ([material_type], [number_material]) VALUES (@material_type, @number_material)"
            SelectCommand="SELECT material_type, number_material, office, date_income, note FROM sa.Material WHERE (office = @office) AND (material_type = @materail)"
            UpdateCommand="UPDATE sa.[Material] SET [number_material] = @number_material WHERE [material_type] = @material_type">
            <DeleteParameters>
                <asp:Parameter Name="material_type" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="material_type" Type="String" />
                <asp:Parameter Name="number_material" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="office" SessionField="UserOffice" />
                <asp:ControlParameter ControlID="DropDownList1" Name="materail" PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="number_material" Type="Int32" />
                <asp:Parameter Name="material_type" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <poy:tail ID="tail1" runat="server" />
    </div>
    </form>
</body>
</html>
