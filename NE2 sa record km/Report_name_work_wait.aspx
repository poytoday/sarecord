<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Report_name_work_wait.aspx.vb"
    Inherits="Report_name_work_wait" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>จำนวนงานที่รอดำเนินการของพนักงาน</title>
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
        <contenttemplate>
                <!-- For alternative headers START PASTE here -->
                <!-- A. HEADER -->
                <poy:header ID="UCmenu1" runat="server" />
                <h3>
                    <table width="99%">
                        <tr>
                            <td>
                                <div class="header">
                                    <div class="nav2">
                                        <h3 align="center">
                                            <asp:Label ID="Label1" runat="server" ForeColor="#FF66FF" 
                                                Text="จำนวนงานที่รอดำเนินการของพนักงาน"></asp:Label>
                                        </h3>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                                    DataKeyNames="Emp_id" EmptyDataText="No records found" OnRowCommand="GridView1_RowCommand"
                                    Width="99%" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px"
                                    CellPadding="2" ForeColor="Black" GridLines="None">
                                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                    <Columns>
                                        <asp:BoundField DataField="count_work" HeaderText="จำนวนงาน(ตัว)" ReadOnly="True"
                                            SortExpression="count_work">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Emp_id" HeaderText="รหัสประจำตัว" SortExpression="Emp_id" />
                                        <asp:BoundField DataField="Names" HeaderText="ชื่อ - สกุล" SortExpression="Names">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Position" HeaderText="ตำแหน่ง" SortExpression="Position">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:ButtonField CommandName="cmd_name" HeaderImageUrl="~/images/icon_view.gif" Text="Work" />
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
                                            <asp:Label ID="Label2" runat="server" ForeColor="#FF66FF" 
                                                Text="รายละเอียดงานที่รอดำเนินการของพนักงาน" Visible="False"></asp:Label>
                                        </h3>
                                        <tr>
                                            <td>
                                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                                                    BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                                                    CellPadding="3" DataKeyNames="pmcm_id,id_team" DataSourceID="SqlDataSource3" 
                                                    EmptyDataText="No records found" GridLines="Vertical" 
                                                    OnRowCommand="GridView2_RowCommand" Visible="False" Width="99%">
                                                    <AlternatingRowStyle BackColor="#DCDCDC" />
                                                    <Columns>
                                                        <asp:BoundField DataField="status_work" HeaderText="สถานะงาน" 
                                                            SortExpression="status_work" >
                                                        <ItemStyle Width="15%" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="op_id" HeaderText="รหัสอุปกรณ์" 
                                                            SortExpression="op_id">
                                                        <ItemStyle HorizontalAlign="Center" Width="12%" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="operation" HeaderText="การปฎิบัติงาน" 
                                                            SortExpression="operation" >
                                                        <ItemStyle Width="18%" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="date_operate" DataFormatString="{0:dd/MMM/yyyy}" 
                                                            HeaderText="วันที่ดำเนินการ" HtmlEncode="False" SortExpression="date_operate">
                                                        <ItemStyle HorizontalAlign="Center" Width="12%" />
                                                        </asp:BoundField>
                                                        <%--<asp:BoundField DataField="date_num" HeaderText="จำนวน(วัน)" SortExpression="date_num">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>--%>
                                                        <asp:BoundField DataField="remark" HeaderText="หมายเหตุ" 
                                                            SortExpression="remark" />
                                                        <%--<asp:BoundField DataField="pmcm_id" HeaderText="pmcm_id" InsertVisible="False" ReadOnly="True"
                    SortExpression="pmcm_id" />--%><%--<asp:BoundField DataField="Emp_id" HeaderText="รหัสพนักงาน" 
                    SortExpression="Emp_id" />--%>
                                                        <asp:ButtonField CommandName="cmdEdit" HeaderImageUrl="~/images/icon_view.gif" 
                                                            Text="Edit" />
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
                                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>" 
                                                    SelectCommand="SELECT sa.View_Report_name_work_wait.* FROM sa.View_Report_name_work_wait">
                                                </asp:SqlDataSource>
                                            </td>
                                        </tr>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                        SelectCommand="sa_wait_work_by_name" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="P_Office" SessionField="UserOffice" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </h3>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                    
                    SelectCommand="SELECT sa.pmcm_record.status_work, sa.pmcm_record.db_name, sa.pmcm_record.operation, sa.pmcm_record.date_operate, sa.pmcm_record.remark, sa.pmcm_record.date_num, sa.pmcm_record.pmcm_id, sa.Name_List.Emp_id, sa.Device_List.op_id, sa.[user].id_team FROM sa.pmcm_record INNER JOIN sa.Name_List ON sa.pmcm_record.pmcm_id = sa.Name_List.pmcm_id INNER JOIN sa.Device_List ON sa.pmcm_record.db_name = sa.Device_List.dbname INNER JOIN sa.[user] ON sa.Name_List.Emp_id = sa.[user].userid WHERE (sa.pmcm_record.status_work &lt;&gt; 'ใช้งานได้') ORDER BY sa.pmcm_record.date_operate DESC">
                </asp:SqlDataSource>
                <poy:tail ID="tail1" runat="server" />
    </div>
    </form>
</body>
</html>
