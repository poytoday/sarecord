<%@ Page Language="VB" AutoEventWireup="false" CodeFile="frist.aspx.vb" Inherits="frist" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>หน้าหลัก</title>
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
        <h3>
            <table width="99%">
                <tr>
                    <td>
                        <div class="header">
                            <div class="nav2">
                                <h3 align="center">
                                    <asp:Label ID="Label3" runat="server" ForeColor="#FF66FF" Text="งานที่ได้ปฎิบัติ"></asp:Label>
                                </h3>
                            </div>
                        </div>
                    </td>
                    <tr>
                        <td>
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id_type_frtu"
                                DataSourceID="SqlDataSource2" EmptyDataText="No records found" OnRowCommand="GridView2_RowCommand"
                                Width="99%" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px"
                                CellPadding="4">
                                <Columns>
                                    <%--<asp:HyperLinkField DataNavigateUrlFormatString="type_frtu_name.aspx?type_frtu={0}"
                    HeaderText="View" Text="Click" DataNavigateUrlFields="type_frtu">
                    <ItemStyle Width="50px" />
                </asp:HyperLinkField>--%>
                                    <%--<asp:BoundField DataField="Emp_id" HeaderText="รหัสประจำตัว" SortExpression="Emp_id">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>--%>
                                    <asp:BoundField DataField="type_frtu" HeaderText="ประเภทอุปกรณ์" ReadOnly="True"
                                        SortExpression="type_frtu">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Count_type" HeaderText="จำนวน(ตัว)" SortExpression="Count_type">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                  <%--  <asp:ButtonField CommandName="cmdView" HeaderImageUrl="~/images/icon_view.gif" Text="View">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:ButtonField>--%>
                                    <asp:CommandField ShowSelectButton="True"  HeaderImageUrl="~/images/icon_view.gif"  >
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:CommandField>
                                </Columns>
                                <EmptyDataRowStyle HorizontalAlign="Center" />
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
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="header">
                                <div class="nav2">
                                    <h3 align="center">
                                        <asp:Label ID="Label1" runat="server" ForeColor="#FF66FF" Text="รายละเอียดงานที่ได้ปฎิบัติ"
                                            Visible="False"></asp:Label>
                                    </h3>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False"
                                AllowPaging="True" AllowSorting="True" Width="99%" Visible="False" CellPadding="4"
                                ForeColor="#333333" GridLines="None" EmptyDataText="No records found" DataKeyNames="pmcm_id,id_team"
                                OnRowCommand="GridView1_RowCommand" PageSize="15">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="op_id" HeaderText="รหัสอุปกรณ์" SortExpression="op_id" >
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="operation" HeaderText="การปฎิบัติงาน" SortExpression="operation" >
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="damage_name" HeaderText="อาการชำรุด" SortExpression="damage_name" >
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <%--<asp:BoundField DataField="op_id" HeaderText="op_id" SortExpression="op_id" />--%>
                                    <asp:BoundField DataField="date_operate" HeaderText="วันที่" SortExpression="date_operate"
                                        DataFormatString="{0:dd/MMM/yyyy}" HtmlEncode="False">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <%--<asp:ButtonField CommandName="cmdEdit" HeaderImageUrl="~/images/icon_view.gif" Text="Edit" />--%>
                                    <%--<asp:BoundField DataField="dbname" HeaderText="dbname" 
                    SortExpression="dbname" />--%>
                                    <%--<asp:BoundField DataField="dbname" HeaderText="dbname" 
                    SortExpression="dbname" />--%>
                                    <%--<asp:BoundField DataField="pmcm_id" HeaderText="pmcm_id" 
                    SortExpression="pmcm_id" />--%>
                                    <%--<asp:BoundField DataField="pmcm_id" HeaderText="pmcm_id" 
                    SortExpression="pmcm_id" />--%>
                                    <%--<asp:BoundField DataField="Emp_ID" HeaderText="Emp_ID" 
                    SortExpression="Emp_ID" />--%>
                                    <%--<asp:BoundField DataField="type_frtu" HeaderText="ประเภทอุปกรณ์" SortExpression="type_frtu">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>--%>
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
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="header">
                                <div class="nav2">
                                    <h3 align="center">
                                        <asp:Label ID="Label4" runat="server" ForeColor="#FF66FF" Text="งานที่รอดำเนินการ"></asp:Label>
                                    </h3>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3"
                                EmptyDataText="No records found" OnRowCommand="GridView3_RowCommand" Width="99%"
                                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                                CellPadding="3" DataKeyNames="id_type_frtu,status_work">
                                <Columns>
                                    <asp:BoundField DataField="count_wait_work" HeaderText="จำนวนงาน(ตัว)" SortExpression="count_wait_work"
                                        ReadOnly="True">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="type_frtu" HeaderText="ประเภทอุปกรณ์" SortExpression="type_frtu">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="status_work" HeaderText="สถานะงาน" SortExpression="status_work">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <%--<asp:BoundField DataField="Emp_id" HeaderText="Emp_id" SortExpression="Emp_id" />--%>
                                    <%--<asp:BoundField DataField="id_type_frtu" HeaderText="id_type_frtu" SortExpression="id_type_frtu" />--%>
                                    <asp:ButtonField CommandName="cmdView" HeaderImageUrl="~/images/icon_view.gif" Text="View">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:ButtonField>
                                </Columns>
                                <EmptyDataRowStyle HorizontalAlign="Center" />
                                <FooterStyle BackColor="White" ForeColor="#000066" />
                                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                <RowStyle ForeColor="#000066" />
                                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#00547E" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="header">
                                <div class="nav2">
                                    <h3 align="center">
                                        <asp:Label ID="Label2" runat="server" ForeColor="#FF66FF" Text="รายละเอียดงานที่รอดำเนินการ"
                                            Visible="False"></asp:Label>
                                    </h3>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="GridView4" runat="server" DataSourceID="SqlDataSource4" AutoGenerateColumns="False"
                                AllowPaging="True" AllowSorting="True" Width="99%" DataKeyNames="pmcm_id,id_team"
                                Visible="False" CellPadding="4" ForeColor="#333333" GridLines="None" EmptyDataText="No records found"
                                OnRowCommand="GridView4_RowCommand">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="op_id" HeaderText="รหัสอุปกรณ์" SortExpression="op_id" />
                                    <asp:BoundField DataField="damage_name" HeaderText="อาการชำรุด" SortExpression="damage_name" />
                                    <%--<asp:BoundField DataField="pmcm_id" HeaderText="pmcm_id" 
                    SortExpression="pmcm_id" ReadOnly="True" />--%>
                                    <%--<asp:BoundField DataField="op_id" HeaderText="op_id" SortExpression="op_id" />--%>
                                    <%--<asp:BoundField DataField="db_name" HeaderText="db_name" 
                    SortExpression="db_name" />--%>
                                    <asp:BoundField DataField="date_operate" HeaderText="วันที่" SortExpression="date_operate"
                                        DataFormatString="{0:dd/MMM/yyyy}" HtmlEncode="False" />
                                    <%--<asp:BoundField DataField="dbname" HeaderText="dbname" 
                    SortExpression="dbname" />--%>
                                    <%--<asp:BoundField DataField="pmcm_id" HeaderText="pmcm_id" 
                    SortExpression="pmcm_id" />--%>
                                    <asp:BoundField DataField="operation" HeaderText="การปฎิบัติงาน" SortExpression="operation" />
                                    <asp:ButtonField CommandName="cmdEdit" HeaderImageUrl="~/images/icon_view.gif" Text="Edit" />
                                    <%--<asp:BoundField DataField="Emp_ID" HeaderText="Emp_ID" 
                    SortExpression="Emp_ID" />--%>
                                    <%--<asp:BoundField DataField="status_work" HeaderText="status_work" 
                    SortExpression="status_work" />--%>
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
                                    <%--<asp:BoundField DataField="date_num" HeaderText="จำนวน(วัน)" SortExpression="date_num" />--%>
                                    <%--<asp:BoundField DataField="damage_id" HeaderText="damage_id" 
                    SortExpression="damage_id" />--%>
                                    <%--<asp:BoundField DataField="Emp_id" HeaderText="Emp_id" 
                    SortExpression="Emp_id" />--%>
                                </Columns>
                                <EditRowStyle BackColor="#7C6F57" />
                                <EmptyDataRowStyle HorizontalAlign="Center" />
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                SelectCommand="sa_first_work" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="0" Name="Emp_id" SessionField="User2" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                SelectCommand="sa_first_work_2" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="Emp_id" SessionField="User2" Type="Int32" />
                    <asp:SessionParameter Name="id_type_device" SessionField="id_type_frtu1" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                
                SelectCommand="SELECT TOP (100) PERCENT COUNT(sa.pmcm_record.id_type_frtu) AS count_wait_work, sa.Type_Frtu.ID AS id_type_frtu, sa.Name_List.Emp_id, sa.pmcm_record.status_work, sa.Type_Frtu.type_frtu FROM sa.pmcm_record INNER JOIN sa.Type_Frtu ON sa.pmcm_record.id_type_frtu = sa.Type_Frtu.ID INNER JOIN sa.Name_List ON sa.pmcm_record.pmcm_id = sa.Name_List.pmcm_id WHERE (sa.pmcm_record.status_work &lt;&gt; 'ใช้งานได้') GROUP BY sa.Type_Frtu.ID, sa.Name_List.Emp_id, sa.pmcm_record.status_work, sa.Type_Frtu.type_frtu HAVING (sa.Name_List.Emp_id = @P_empid) ORDER BY count_wait_work DESC, sa.Type_Frtu.type_frtu">
                <SelectParameters>
                    <asp:SessionParameter Name="P_empid" SessionField="User2" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </h3>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
            
            
            SelectCommand="SELECT sa.Device_List.op_id, sa.pmcm_record.date_operate, sa.pmcm_record.operation, sa.pmcm_record.remark, sa.pmcm_record.pmcm_id, sa.Team.ID AS id_team, sa.pmcm_record.status_work, sa.pmcm_record.id_type_frtu, sa.Damage_Type.damage_name, sa.Name_List.Emp_id FROM sa.Name_List INNER JOIN sa.pmcm_record INNER JOIN sa.Device_List ON sa.pmcm_record.db_name = sa.Device_List.dbname INNER JOIN sa.Type_Frtu ON sa.pmcm_record.id_type_frtu = sa.Type_Frtu.ID INNER JOIN sa.Team ON sa.Type_Frtu.Team = sa.Team.Team AND sa.Type_Frtu.office = sa.Team.office ON sa.Name_List.pmcm_id = sa.pmcm_record.pmcm_id LEFT OUTER JOIN sa.Damage_Type INNER JOIN sa.Damage_List ON sa.Damage_Type.id_damage = sa.Damage_List.damage_id ON sa.pmcm_record.pmcm_id = sa.Damage_List.pmcm_id WHERE (sa.pmcm_record.status_work = @P_status_work) AND (sa.pmcm_record.id_type_frtu = @P_id_type_frtu) AND (sa.Name_List.Emp_id = @P_emp_id)">
            <SelectParameters>
                <asp:SessionParameter Name="P_status_work" SessionField="status_work2" Type="String" />
                <asp:SessionParameter Name="P_id_type_frtu" SessionField="id_type_device2" Type="String" />
                <asp:SessionParameter Name="P_emp_id" SessionField="User2" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <poy:tail ID="tail1" runat="server" />
    </div>
    </form>
</body>
</html>
