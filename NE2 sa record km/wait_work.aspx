<%@ Page Language="VB" AutoEventWireup="false" CodeFile="wait_work.aspx.vb" Inherits="wait_work" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>งานที่รอดำเนินการ</title>
    <style type="text/css">
        .style2
        {
            height: 48px;
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
        <h3>
            <table width="99%">
                <tr>
                    <td>
                        <div class="header">
                            <div class="nav2">
                                <h3 align="center" style="color: #0099FF">
                                    ประเภทอุปกรณ์
                                </h3>
                            </div>
                        </div>
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow"
                            BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="id_type_frtu"
                            DataSourceID="SqlDataSource5" EmptyDataText="No records found" ForeColor="Black"
                            GridLines="None" HorizontalAlign="Center" OnRowCommand="GridView2_RowCommand"
                            Width="99%">
                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                            <Columns>
                                <asp:BoundField DataField="type_frtu" HeaderText="ประเภทอุปกรณ์" SortExpression="type_frtu">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="count_wait_work" HeaderText="รอดำเนินการ(ตัว)" ReadOnly="True"
                                    SortExpression="count_wait_work">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:ButtonField CommandName="cmdView" HeaderImageUrl="~/images/icon_view.gif" Text="View" />
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
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="header">
                            <div class="nav2">
                                <h3 align="center">
                                    <asp:Label ID="Label1" runat="server" ForeColor="#0099FF" Visible="False">อาการชำรุด </asp:Label>
                                    <asp:Label ID="Label4" runat="server" Visible="False"></asp:Label>
                                </h3>
                            </div>
                        </div>
                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" BackColor="White"
                            BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="damage_id"
                            DataSourceID="SqlDataSource3" EmptyDataText="No records found" GridLines="Vertical"
                            HorizontalAlign="Center" OnRowCommand="GridView3_RowCommand" Visible="False"
                            Width="99%">
                            <AlternatingRowStyle BackColor="#DCDCDC" />
                            <Columns>
                                <asp:BoundField DataField="damage_name" HeaderText="อาการชำรุด" SortExpression="damage_name">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="count_damage" HeaderText="รอดำเนินการ(ตัว)" ReadOnly="True"
                                    SortExpression="count_damage">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:ButtonField CommandName="cmd_damage_id" HeaderImageUrl="~/images/icon_view.gif"
                                    Text="View" />
                            </Columns>
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
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="header">
                            <div class="nav2">
                                <h3 align="center">
                                    <asp:Label ID="Label2" runat="server" ForeColor="#0099FF" Visible="False">การปฎิบัติงาน </asp:Label>
                                </h3>
                            </div>
                        </div>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                            BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1"
                            DataKeyNames="pmcm_id,id_team" DataSourceID="SqlDataSource1" EmptyDataText="No records found"
                            GridLines="None" OnRowCommand="GridView1_RowCommand" Visible="False" Width="99%">
                            <Columns>
                                <%--<asp:BoundField DataField="damage_name" HeaderText="damage_name" SortExpression="damage_name" />--%>
                                <asp:BoundField DataField="op_id" HeaderText="รหัสอุปกรณ์" SortExpression="op_id" />
                                <asp:BoundField DataField="date_operate" DataFormatString="{0:dd/MMM/yyyy}" HeaderText="วันที่ดำเนินการ"
                                    HtmlEncode="False" SortExpression="date_operate">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <%--<asp:BoundField DataField="damage_id" HeaderText="damage_id" 
                    SortExpression="damage_id" /> DataKeyNames="pmcm_id,id_team" --%>
                                <asp:BoundField DataField="status_work" HeaderText="สถานะการใช้งาน" SortExpression="status_work">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="remark" HeaderText="หมายเหตุ" SortExpression="remark" />
                                <%--<asp:BoundField DataField="date_num" HeaderText="จำนวนวันที่ดำเนินการ(วัน)" 
                                    SortExpression="date_num" >
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>--%>
                                <asp:ButtonField CommandName="cmdEdit" HeaderImageUrl="~/images/icon_view.gif" Text="Edit" />
                                <asp:ButtonField CommandName="cmd_name" HeaderImageUrl="~/images/icon_view.gif" Text="Names" />
                                <%--<asp:BoundField DataField="Names" HeaderText="Names" SortExpression="Names" />--%>
                            </Columns>
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
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                            SelectCommand="sa_workwait_damage_count" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label4" Name="id_type_frtu" PropertyName="Text"
                                    Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="header">
                            <div class="nav2">
                                <h3 align="center">
                                    <asp:Label ID="Label3" runat="server" ForeColor="#0099FF" Visible="False">ผู้ดำเนินการ </asp:Label>
                                </h3>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="Emp_ID"
                            DataSourceID="SqlDataSource4" Visible="False" CellPadding="4" ForeColor="#333333"
                            GridLines="None" Width="50%" EmptyDataText="No records found">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="Names" HeaderText="ผู้กำเนินการ" SortExpression="Names">
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
        </h3>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
            
            
            SelectCommand="SELECT sa.Device_List.op_id, sa.pmcm_record.date_operate, sa.pmcm_record.operation, sa.pmcm_record.remark, sa.pmcm_record.pmcm_id, sa.Team.ID AS id_team, sa.pmcm_record.status_work, sa.pmcm_record.id_type_frtu, sa.Damage_List.damage_id FROM sa.pmcm_record INNER JOIN sa.Device_List ON sa.pmcm_record.db_name = sa.Device_List.dbname INNER JOIN sa.Type_Frtu ON sa.pmcm_record.id_type_frtu = sa.Type_Frtu.ID INNER JOIN sa.Team ON sa.Type_Frtu.Team = sa.Team.Team AND sa.Type_Frtu.office = sa.Team.office INNER JOIN sa.Damage_List ON sa.pmcm_record.pmcm_id = sa.Damage_List.pmcm_id WHERE (sa.pmcm_record.status_work &lt;&gt; 'ใช้งานได้')">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
            SelectCommand="SELECT * FROM sa.[View_name_name_list_pmcm_id]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
            SelectCommand="sa_wait_work_by_type" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="P_office" SessionField="UserOffice" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>" 
            
            SelectCommand="SELECT COUNT(sa.pmcm_record.id_type_frtu) AS count_wait_work, sa.Type_Frtu.ID AS id_type_frtu, sa.Type_Frtu.type_frtu FROM sa.pmcm_record INNER JOIN sa.Type_Frtu ON sa.pmcm_record.id_type_frtu = sa.Type_Frtu.ID WHERE (sa.pmcm_record.status_work &lt;&gt; 'ใช้งานได้') GROUP BY sa.Type_Frtu.ID, sa.Type_Frtu.office, sa.Type_Frtu.type_frtu HAVING (sa.Type_Frtu.office = @P_office) ORDER BY count_wait_work DESC">
            <SelectParameters>
                <asp:SessionParameter Name="P_office" SessionField="UserOffice" />
            </SelectParameters>
        </asp:SqlDataSource>
        <poy:tail ID="tail1" runat="server" />
    </div>
    </form>
</body>
</html>
