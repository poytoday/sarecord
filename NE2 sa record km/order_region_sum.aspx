<%@ Page Language="VB" AutoEventWireup="false" CodeFile="order_region_sum.aspx.vb"
    Inherits="order_region_sum" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
            width: 898px;
        }
        .style4
        {
            width: 262px;
        }
        .style5
        {
            width: 121px;
        }
        .style6
        {
            width: 296px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="page-container">
        <!-- For alternative headers START PASTE here -->
        <!-- A. HEADER -->
        <poy:header ID="UCmenu1" runat="server" />
        <br />
        <div class="header">
            <div class="nav2">
                <h3 align="center">
                    จำนวนงานที่ปฏิบัติ</h3>
            </div>
        </div>
        <h3>
            <table width="99%">
                <tr>
                    <%--<td class="style5" >
               สถานะงาน :
               </td>--%>
                    <%--<td class="style6">
               
                   <asp:DropDownList ID="DropDownList1" runat="server" 
                       DataSourceID="SqlDataSource1" DataTextField="order_type" 
                       DataValueField="order_type_id" AutoPostBack="True" Height="16px" 
                       Width="288px">
                   </asp:DropDownList>
                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>" 
                       SelectCommand="SELECT order_type_id, order_type, section FROM sa.order_type WHERE (office = @P_office) AND (section = 1)">
                       <SelectParameters>
                           <asp:SessionParameter Name="P_office" SessionField="UserOffice" />
                       </SelectParameters>
                   </asp:SqlDataSource>
               
               </td>--%>
                    <td align="center">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2"
                            CellPadding="2" ForeColor="Black" GridLines="None" Width="99%" EmptyDataText="No Records"
                            OnRowCommand="GridView2_RowCommand" BackColor="LightGoldenrodYellow" 
                            BorderColor="Tan" BorderWidth="1px" DataKeyNames="id_order_type_section" 
                            SelectedIndex="0">
                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                            <Columns>
                                <%--<asp:BoundField DataField="office" HeaderText="office"
                                    SortExpression="office">
                                </asp:BoundField>--%>
                                <%--<asp:CommandField ShowSelectButton="True" HeaderImageUrl="~/images/icon_view.gif" />--%>
                                <asp:BoundField DataField="office" HeaderText="หน่วยงาน" SortExpression="office">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="count_office" HeaderText="จำนวนงานที่รอ(งาน)" SortExpression="count_office"
                                    ReadOnly="True">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                 <asp:BoundField DataField="order_type" HeaderText="จำนวนงานที่รอ(งาน)" SortExpression="order_type"
                                    ReadOnly="True">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:CommandField ShowSelectButton="True" />
                            </Columns>
                            <EmptyDataRowStyle BorderStyle="Solid" ForeColor="#3333CC" HorizontalAlign="Center" />
                            <FooterStyle BackColor="Tan" />
                            <HeaderStyle BackColor="Tan" Font-Bold="True" />
                            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                                HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                            <SortedAscendingCellStyle BackColor="#FAFAE7" />
                            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                            <SortedDescendingCellStyle BackColor="#E1DB9C" />
                            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                        </asp:GridView>
                        <br />
                    </td>
                </tr>
            </table>
            <table width="99%">
                <tr>
                    <td align="center">
                        <div class="header">
                            <div class="nav2">
                                <h3 align="center">
                                    รายละเอียดการปฎิบัติงาน</h3>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                            CellPadding="4" Width="99%" EmptyDataText="No Records"
                            OnRowCommand="GridView3_RowCommand" AllowPaging="True" PageSize="30" 
                            DataKeyNames="pmcm_id" BackColor="White" BorderColor="#CC9966" 
                            BorderStyle="None" BorderWidth="1px">
                            <Columns>
                                <asp:BoundField DataField="op_id" HeaderText="รหัสอุปกรณ์" SortExpression="op_id">
                                    <ItemStyle HorizontalAlign="Center" Width="8%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="office" HeaderText="กฟฟ." SortExpression="office">
                                    <ItemStyle HorizontalAlign="Center" Width="10%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="date_operate" HeaderText="วันที่ดำเนินการ" SortExpression="date_operate"
                                    DataFormatString="{0:dd/MMM/yyyy}" HtmlEncode="False">
                                    <ItemStyle HorizontalAlign="Center" Width="12%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="operation" HeaderText="การปฏิบัติงาน" SortExpression="operation">
                                    <ItemStyle Width="18%" />
                                </asp:BoundField>
                                <%--<asp:BoundField DataField="status_work" HeaderText="สถานะการปฏิบัติงาน" 
                                    SortExpression="status_work">
                                    <ItemStyle HorizontalAlign="Center" Width="13%" />
                                </asp:BoundField>--%>
                                <asp:BoundField DataField="remark" HeaderText="หมายเหตุ" SortExpression="remark" />
                                <asp:BoundField DataField="order_section_detail" HeaderText="คำแนะนำ หผ." SortExpression="order_section_detail" />
                                <asp:ButtonField CommandName="cmdEdit" HeaderImageUrl="~/images/icon_view.gif" Text="View" />
                            </Columns>
                            <EmptyDataRowStyle BorderStyle="Solid" ForeColor="#3333CC" HorizontalAlign="Center" />
                            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                            <RowStyle BackColor="White" ForeColor="#330099" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                            <SortedAscendingCellStyle BackColor="#FEFCEB" />
                            <SortedAscendingHeaderStyle BackColor="#AF0101" />
                            <SortedDescendingCellStyle BackColor="#F6F0C0" />
                            <SortedDescendingHeaderStyle BackColor="#7E0000" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                            SelectCommand="sa_order_total_region_list" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="P_empid" SessionField="UserName" Type="Int32" />
                                <asp:ControlParameter ControlID="GridView2" Name="P_id_order_type" 
                                    PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </h3>
        <asp:SqlDataSource ID="SqlDataSource44" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
            SelectCommand="sa_order_total_region_list" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="P_empid" SessionField="UserName" Type="Int32" />
                <%--<asp:ControlParameter ControlID="DropDownList1" Name="P_order_id" PropertyName="SelectedValue"
                Type="Int32" />--%>
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
            SelectCommand="sa_order_total_region" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="P_empid" SessionField="UserName" />
            </SelectParameters>
        </asp:SqlDataSource>
        <poy:tail ID="tail1" runat="server" />
    </div>
    </form>
</body>
</html>
