<%@ Page Language="VB" AutoEventWireup="false" CodeFile="order_region_his.aspx.vb"
    Inherits="order_region_his" %>

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
                    จำนวนงานที่พนักงานปฏิบัติ</h3>
            </div>
        </div>
        <h3>
            <table width="99%">
                <tr>
                    <td class="style5">
                        สถานะงาน :
                    </td>
                    <td class="style6">
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
                            DataTextField="order_type" DataValueField="order_type_id" AutoPostBack="True"
                            Height="16px" Width="288px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                            SelectCommand="SELECT order_type_id, order_type, section FROM sa.order_type WHERE (office = @P_office) AND (section = 1)">
                            <SelectParameters>
                                <asp:SessionParameter Name="P_office" SessionField="UserOffice" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td align="center">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2"
                            CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" EmptyDataText="No Records"
                            OnRowCommand="GridView2_RowCommand">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <%--<asp:BoundField DataField="office" HeaderText="office"
                                    SortExpression="office">
                                </asp:BoundField>--%>
                                <%--<asp:CommandField ShowSelectButton="True" HeaderImageUrl="~/images/icon_view.gif" />--%>
                                <asp:BoundField DataField="office" HeaderText="ชื่่อแผนก" 
                                    SortExpression="office">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="count_office" HeaderText="จำนวนงาน(งาน)" SortExpression="count_office"
                                    ReadOnly="True">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <EmptyDataRowStyle BorderStyle="Solid" ForeColor="#3333CC" HorizontalAlign="Center" />
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
                        <br />
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td align="center" class="style3">
                        <div class="header">
                            <div class="nav2">
                                <h3 align="center">
                                    รายละเอียดการปฎิบัติงานของพนักงาน</h3>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4"
                            CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" EmptyDataText="No Records"
                            OnRowCommand="GridView3_RowCommand" DataKeyNames="pmcm_id" AllowPaging="True"
                            PageSize="30">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="op_id" HeaderText="รหัสอุปกรณ์" SortExpression="op_id">
                                    <ItemStyle HorizontalAlign="Center" Width="11%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="date_operate" HeaderText="วันที่ดำเนินการ" SortExpression="date_operate"
                                    DataFormatString="{0:dd/MMM/yyyy}" HtmlEncode="False">
                                    <ItemStyle HorizontalAlign="Center" Width="17%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="operation" HeaderText="การปฏิบัติงาน" SortExpression="operation">
                                    <ItemStyle Width="10%" />
                                </asp:BoundField>
                                <%--<asp:BoundField DataField="status_work" HeaderText="สถานะการปฏิบัติงาน" SortExpression="status_work">
                                    <ItemStyle HorizontalAlign="Center" Width="15%" />
                                </asp:BoundField>--%>
                                <asp:BoundField DataField="remark" HeaderText="หมายเหตุ" 
                                    SortExpression="remark" >
                                <ItemStyle Width="15%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="order_section_detail" HeaderText="ข้อแนะนำ หผ." 
                                    SortExpression="order_section_detail" >
                                <ItemStyle Width="15%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="order_region_detail" HeaderText="ข้อแนะนำ อก." 
                                    SortExpression="order_region_detail" >
                                <ItemStyle Width="15%" />
                                </asp:BoundField>
                                <asp:ButtonField CommandName="cmdEdit" HeaderImageUrl="~/images/icon_view.gif" Text="Edit" />
                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <EmptyDataRowStyle BorderStyle="Solid" ForeColor="#3333CC" HorizontalAlign="Center" />
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
            </table>
        </h3>
        <poy:tail ID="tail1" runat="server" />
    </div>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
        
        SelectCommand="SELECT COUNT(*) AS count_office, sa.View_order_region.office, sa.pmcm_record.order_id FROM sa.View_order_region INNER JOIN sa.pmcm_record ON sa.View_order_region.pmcm_id = sa.pmcm_record.pmcm_id GROUP BY sa.View_order_region.office, sa.pmcm_record.order_id, sa.View_order_region.emp_id HAVING (sa.pmcm_record.order_id = @P_order_id) AND (sa.View_order_region.emp_id = @P_empid) ORDER BY count_office DESC, sa.View_order_region.office">
        <SelectParameters>
            <%--<asp:ControlParameter ControlID="DropDownList1" Name="P_order_id" PropertyName="SelectedValue"
                Type="Int32" />--%>
            <asp:ControlParameter ControlID="DropDownList1" Name="P_order_id" PropertyName="SelectedValue"
                Type="Int32" />
            <asp:SessionParameter Name="P_empid" SessionField="UserName" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
        SelectCommand="sa_order_region_his" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <%--<asp:ControlParameter ControlID="DropDownList1" Name="P_order_id" PropertyName="SelectedValue"
                Type="Int32" />--%>
            <asp:ControlParameter ControlID="DropDownList1" Name="P_order_id" PropertyName="SelectedValue"
                Type="Int32" />
            <asp:SessionParameter Name="P_empid" SessionField="UserName" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
