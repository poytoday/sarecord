<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Report_material.aspx.vb"
    Inherits="Report_material" %>

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
</head>
<body>
    <form id="form1" runat="server">
    <div class="page-container">
        <!-- For alternative headers START PASTE here -->
        <!-- A. HEADER -->
        <poy:header ID="UCmenu1" runat="server" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
            SelectCommand="sa_material_total" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="P_office" SessionField="UserOffice" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
            SelectCommand="sa_select_material_use" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="office" SessionField="UserOffice" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <h3>
            <table width="99%">
                <tr>
                    <td align="center">
                        จำนวนวัสดุทั้งหมด
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="material_type,office"
                            DataSourceID="SqlDataSource1" BackColor="LightGoldenrodYellow" BorderColor="Tan"
                            BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" Width="50%"
                            EmptyDataText="No Records">
                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                            <Columns>
                                <asp:BoundField DataField="material_type" HeaderText="ชื่อวัสดุ" ReadOnly="True"
                                    SortExpression="material_type">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <%--<asp:BoundField DataField="sum_income" HeaderText="sum_income" 
                                    SortExpression="sum_income" ReadOnly="True">
                                </asp:BoundField>--%>
                                <%--<asp:BoundField DataField="sum_material" HeaderText="sum_material" 
                                    ReadOnly="True" SortExpression="sum_material" />--%>
                                <%--<asp:BoundField DataField="office" HeaderText="office" ReadOnly="True" 
                                    SortExpression="office" />--%>
                                <asp:BoundField DataField="total" HeaderText="คงเหลือ(ชิ้น)" ReadOnly="True" SortExpression="total" >
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                            </Columns>
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
                    <td align="center">
                        รายละเอียดการใช้งานวัสดุ
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"
                            DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None"
                            OnRowCommand="GridView2_RowCommand" Width="100%" EmptyDataText="No Records">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="material_type" HeaderText="ชื่อวัสดุ" SortExpression="material_type">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="sum_material" HeaderText="จำนวนที่ใช้(ชิ้น)" ReadOnly="True" SortExpression="sum_material">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="op_id" HeaderText="รหัสอุปกรณ์" SortExpression="op_id">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="date_operate" HeaderText="วันที่ดำเนินการ" SortExpression="date_operate"  DataFormatString="{0:dd/MMM/yyyy}" >
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="operation" HeaderText="การปฏิบัติงาน" SortExpression="operation">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="remark" HeaderText="หมายเหตุ" SortExpression="remark">
                                <HeaderStyle HorizontalAlign="Center" />
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
                <tr>
                    <td align="center">
                        รายละเอียดการใช้งานวัสดุ
                    </td>
                </tr>
                <tr>
                <td>
                
                  <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4"
                            CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" EmptyDataText="No Records"
                            Visible="False">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="date_operate" HeaderText="วันดำเนินการ" SortExpression="date_operate"
                                    DataFormatString="{0:dd/MMM/yyyy}" HtmlEncode="False">
                                    <ItemStyle HorizontalAlign="Center" Width="14%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="op_id" HeaderText="รหัสอุปกรณ์" SortExpression="op_id">
                                    <ItemStyle HorizontalAlign="Center" Width="14%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="operation" HeaderText="การปฏิบัติงาน" SortExpression="operation">
                                    <ItemStyle Width="30%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="number_material" HeaderText="จำนวน(ชิ้น)" SortExpression="number_material">
                                    <ItemStyle HorizontalAlign="Center"  Width="9%" />
                                </asp:BoundField>
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
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                            SelectCommand="SELECT sa.pmcm_record.date_operate, sa.Material_List2.number_material, sa.pmcm_record.operation, sa.Device_List.op_id, sa.Material_List2.office, sa.Material_List2.Material, sa.Material_List2.id_material FROM sa.Material_List2 INNER JOIN sa.pmcm_record ON sa.Material_List2.pmcm_id = sa.pmcm_record.pmcm_id INNER JOIN sa.Device_List ON sa.pmcm_record.db_name = sa.Device_List.dbname ">
                        </asp:SqlDataSource>
                </td>
                
                </tr>
            </table>
        </h3>
        <poy:tail ID="tail1" runat="server" />
    </div>
    </form>
</body>
</html>
