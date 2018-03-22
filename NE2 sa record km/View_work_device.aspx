<%@ Page Language="VB" AutoEventWireup="false" CodeFile="View_work_device.aspx.vb"
    Inherits="View_work_device" %>

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
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager2" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="page-container">
                <!-- For alternative headers START PASTE here -->
                <!-- A. HEADER -->
                <poy:header ID="UCmenu1" runat="server" />
                <%--<div class="header">
            <div class="nav2">
                <h3 align="center">
                    รายละเอียดอุปกรณ์
                </h3>
            </div>
        </div>--%>
                <h3>
                    <table width="99%" cellpadding="2" cellspacing="2" frame="hsides">
                        <tr>
                            <td>
                                <div class="header">
                                    <div class="nav2">
                                        <h3 align="center">
                                            รายละเอียดุปกรณ์ :
                                        </h3>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="dbname"
                                    DataSourceID="SqlDataSource3" EmptyDataText="No records found" Width="99%" CellPadding="4"
                                    ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:BoundField DataField="op_id" HeaderText="รหัสอุปกรณ์" SortExpression="op_id">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="product" HeaderText="ผลิตภัณฑ์" SortExpression="product">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <%--<asp:BoundField DataField="type" HeaderText="Type" SortExpression="type">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>--%>
                                        <%--<asp:BoundField DataField="control_type" HeaderText="Control type" SortExpression="control_type">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>--%>
                                        <%--<asp:BoundField DataField="scada" HeaderText="ระบบสั่งการ" SortExpression="scada">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>--%>
                                        <asp:BoundField DataField="remark" HeaderText="หมายเหตุ" SortExpression="remark">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <%--<asp:BoundField DataField="dbname" HeaderText="dbname" ReadOnly="True" SortExpression="dbname" />--%>
                                        <asp:BoundField DataField="location" HeaderText="สถานที่" ReadOnly="True" SortExpression="location">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="count_pmcm" HeaderText="การปฎิบัติงาน(ครั้ง)" ReadOnly="True"
                                            SortExpression="count_pmcm">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
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
                                            รูปภาพและเอกสาร :
                                        </h3>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" CssClass="Grid"
                                    DataSourceID="SqlDataSource5" EmptyDataText="No records found" Width="100%" DataKeyNames="RUN_ID"
                                    CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
                                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle CssClass="shade" BackColor="#E3EAEB" />
                                    <EditRowStyle BackColor="#7C6F57" />
                                    <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" Font-Bold="True" HorizontalAlign="Center"
                                        VerticalAlign="Middle" />
                                    <Columns>
                                        <asp:BoundField DataField="Type" HeaderText="ประเภท" SortExpression="Type">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Detail" HeaderText="&#3619;&#3634;&#3618;&#3621;&#3632;&#3648;&#3629;&#3637;&#3618;&#3604;&#3619;&#3641;&#3611;&#3616;&#3634;&#3614;&#3649;&#3621;&#3632;&#3648;&#3629;&#3585;&#3626;&#3634;&#3619;"
                                            SortExpression="Detail">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="View">
                                            <ItemTemplate>
                                                <a href='<%#"getfile.aspx?filename=upload/"+Server.UrlPathEncode(Convert.ToString(Eval("PATH_PIC")))+"&table=[dbo].[upload]"%>'>
                                                    <asp:Image ID="imgpath" runat="server" AlternateText='<%#Convert.ToString(Eval("PATH_PIC"))%>'
                                                        ImageUrl="images/file.gif" Visible='<%# Not Convert.IsDBNull(Eval("PATH_PIC"))%>'>
                                                    </asp:Image>
                                                </a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <SelectedRowStyle CssClass="GridSelected" BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" BackColor="#1C5E55"
                                        Font-Bold="True" ForeColor="White" />
                                    <AlternatingRowStyle CssClass="GridItemOdd" BackColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                    SelectCommand="SELECT * FROM sa.[Device_PIC] WHERE ([db_name] = @dbname)" DeleteCommand="DELETE FROM sa.Device_PIC WHERE (db_name = @dbname)">
                                    <SelectParameters>
                                        <asp:QueryStringParameter DefaultValue="" Name="dbname" QueryStringField="dbname"
                                            Type="String" />
                                    </SelectParameters>
                                    <DeleteParameters>
                                        <asp:Parameter Name="dbname" />
                                    </DeleteParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="header">
                                    <div class="nav2">
                                        <h3 align="center">
                                            รายละเอียดการปฎิบัติงาน :
                                        </h3>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="pmcm_id,id_team"
                                    DataSourceID="SqlDataSource1" EmptyDataText="No records found" OnRowCommand="GridView1_RowCommand"
                                    AllowPaging="True" Width="100%" BackColor="White" BorderColor="#336666" BorderStyle="Double"
                                    BorderWidth="3px" CellPadding="4" GridLines="Horizontal" HorizontalAlign="Center"
                                    PageSize="5">
                                    <Columns>
                                        <asp:BoundField DataField="date_operate" HeaderText="วันที่" SortExpression="date_operate"
                                            DataFormatString="{0:dd/MMM/yyyy}" HtmlEncode="False">
                                            <ItemStyle HorizontalAlign="Center" Width="10%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="operation" HeaderText="การปฎิบัติงาน" 
                                            SortExpression="operation" >
                                        <ItemStyle Width="15%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="status_work" HeaderText="สถานะงาน" SortExpression="status_work">
                                            <ItemStyle HorizontalAlign="Center" Width="8%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="remark" HeaderText="หมายเหตุ" SortExpression="remark" />
                                        <asp:ButtonField CommandName="cmdEdit" HeaderImageUrl="~/images/icon_edit.gif" Text="Edit" />
                                    </Columns>
                                    <EmptyDataRowStyle HorizontalAlign="Center" />
                                    <FooterStyle BackColor="White" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="White" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                    <SortedAscendingHeaderStyle BackColor="#487575" />
                                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                    <SortedDescendingHeaderStyle BackColor="#275353" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="header">
                                    <div class="nav2">
                                        <h3 align="center">
                                            จำนวนอาการชำรุด :
                                        </h3>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2"
                                    EmptyDataText="No records found" Width="100%" BackColor="LightGoldenrodYellow"
                                    BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None"
                                    HorizontalAlign="Center">
                                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                    <Columns>
                                        <%--<asp:BoundField DataField="db_name" HeaderText="db_name" 
                    SortExpression="db_name" />--%>
                                        <asp:BoundField DataField="damage_name" HeaderText="อาการชำรุด" SortExpression="damage_name">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="count_damage" HeaderText="ชำรุด(ครั้ง)" ReadOnly="True"
                                            SortExpression="count_damage">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
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
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="header">
                                    <div class="nav2">
                                        <h3 align="center">
                                            รายละเอียดอาการชำรุด :
                                        </h3>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="id,damage_id,id_type_frtu,pmcm_id"
                                    DataSourceID="SqlDataSource4" EmptyDataText="No records found" OnRowCommand="GridView4_RowCommand"
                                    AllowPaging="True" Width="100%" BackColor="White" BorderColor="#999999" BorderStyle="None"
                                    BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                                    <AlternatingRowStyle BackColor="#DCDCDC" />
                                    <Columns>
                                        <asp:BoundField DataField="damage_name" HeaderText="อาการชำรุด" SortExpression="damage_name">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="date_operate" HeaderText="วันที่ดำเนินการ" SortExpression="date_operate"
                                            DataFormatString="{0:dd/MMM/yyyy}" HtmlEncode="False">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <%--<asp:BoundField DataField="pmcm_id" HeaderText="pmcm_id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="pmcm_id" />--%>
                                        <%--<asp:BoundField DataField="db_name" HeaderText="db_name" 
                    SortExpression="db_name" />--%>
                                        <%--<asp:BoundField DataField="id" HeaderText="id" SortExpression="id" InsertVisible="False"
                                    ReadOnly="True" />--%>
                                        <%--<asp:BoundField DataField="pmcm_id" HeaderText="pmcm_id" SortExpression="pmcm_id" />--%>
                                        <%--<asp:BoundField DataField="damage_id" HeaderText="damage_id" SortExpression="damage_id" />--%>
                                        <%--<asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />--%>
                                        <%--<asp:BoundField DataField="date_receive" HeaderText="date_receive" 
                    SortExpression="date_receive" />--%>
                                        <%--<asp:BoundField DataField="date_finish" HeaderText="date_finish" 
                    SortExpression="date_finish" />--%>
                                        <%--<asp:BoundField DataField="type_frtu" HeaderText="type_frtu" 
                    SortExpression="type_frtu" />--%>
                                        <asp:BoundField DataField="Cause" HeaderText="สาเหตุ" SortExpression="Cause">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <%--<asp:BoundField DataField="date_update" HeaderText="date_update" 
                    SortExpression="date_update" />--%>
                                        <asp:BoundField DataField="Correction" HeaderText="การแก้ไข" SortExpression="Correction" />
                                        <%--<asp:BoundField DataField="db_name" HeaderText="db_name" SortExpression="db_name" />--%>
                                        <asp:ButtonField CommandName="cmdEdit" HeaderImageUrl="~/images/icon_edit.gif" Text="Edit">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:ButtonField>
                                    </Columns>
                                    <EmptyDataRowStyle HorizontalAlign="Center" />
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
                    </table>
                </h3>
                <poy:tail ID="tail1" runat="server" />
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                
                
                SelectCommand="SELECT pmcm_id, date_receive, sap_id, device_name, id_type_frtu, db_name, operation, status_work, type, date_finish, remark, date_update, date_num, date_operate, id_team FROM sa.View_work_device_operation WHERE (db_name = @dbname) ORDER BY date_operate DESC">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="" Name="dbname" QueryStringField="dbname"
                        Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                SelectCommand="SELECT COUNT(Damage_List.damage_id) AS count_damage, Damage_Type.damage_name, pmcm_record.db_name, Damage_List.damage_id FROM sa.pmcm_record INNER JOIN sa.Damage_List ON pmcm_record.pmcm_id = Damage_List.pmcm_id INNER JOIN sa.Damage_Type ON Damage_List.damage_id = Damage_Type.id_damage GROUP BY Damage_Type.damage_name, pmcm_record.db_name, Damage_List.damage_id HAVING (pmcm_record.db_name = @dbname)">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="-1" Name="dbname" QueryStringField="dbname"
                        Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                SelectCommand="SELECT Device_List.op_id, Device_List.product, Device_List.type, Device_List.remark, Device_List.dbname, Device_List.dbname AS Expr1, Device_List.location, COUNT(pmcm_record.pmcm_id) AS count_pmcm, Device_List.control_type, Device_List.scada, Device_List.office, Device_List.type_frtu FROM sa.Device_List LEFT OUTER JOIN sa.pmcm_record ON Device_List.dbname = pmcm_record.db_name WHERE (Device_List.dbname = @dbname) GROUP BY Device_List.op_id, Device_List.product, Device_List.type, Device_List.remark, Device_List.dbname, Device_List.location, Device_List.control_type, Device_List.scada, Device_List.office, Device_List.type_frtu">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="-1" Name="dbname" QueryStringField="dbname"
                        Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                
                SelectCommand="SELECT sa.Damage_List.id, sa.Damage_List.pmcm_id, sa.Damage_List.damage_id, sa.Damage_List.Cause, sa.Damage_List.Correction, sa.pmcm_record.db_name, sa.Damage_Type.damage_name, sa.pmcm_record.pmcm_id AS Expr1, sa.Damage_Type.product, sa.pmcm_record.date_operate, sa.pmcm_record.id_type_frtu FROM sa.Damage_List INNER JOIN sa.pmcm_record ON sa.Damage_List.pmcm_id = sa.pmcm_record.pmcm_id INNER JOIN sa.Damage_Type ON sa.Damage_List.damage_id = sa.Damage_Type.id_damage WHERE (sa.pmcm_record.db_name = @dbname) ORDER BY sa.pmcm_record.date_operate DESC, sa.Damage_List.id DESC">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="" Name="dbname" QueryStringField="dbname"
                        Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
