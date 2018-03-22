<%@ Page Language="VB" AutoEventWireup="false" CodeFile="report_work_by_time.aspx.vb"
    Inherits="report_work_by_time" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
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
        .style9
        {
            width: 71px;
            height: 14px;
        }
        .style10
        {
            width: 162px;
        }
    </style>
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
                <div class="header">
                    <div class="nav2">
                        <h3 align="center" style="color: #008080">
                            รายละเอียดการลงประวัติอุปกรณ์
                        </h3>
                    </div>
                </div>
                <h3>
                    <table width="99%">
                        <tr>
                            <td class="style10">
                                Team
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
                                    DataTextField="Team" DataValueField="ID" AutoPostBack="True" Width="306px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                    
                                    SelectCommand="SELECT Team, office, ID FROM sa.Team WHERE (office = @office)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="office" SessionField="UserOffice" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td class="style10">
                                ประเภทอุปกรณ์
                            </td>
                            <td>
                                <asp:DropDownList ID="DD_Type_Device" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2"
                                    DataTextField="type_frtu" DataValueField="ID" Width="308px" >
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                    SelectCommand="sa_select_type_frtu" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList1" Name="ID_Team" PropertyName="SelectedValue"
                                            Type="Int32" />
                                        <asp:SessionParameter Name="office" SessionField="UserOffice" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                </h3>
                <h3>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                        AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"
                        BorderWidth="1px" CellPadding="4" DataKeyNames="pmcm_id" DataSourceID="SqlDataSource3"
                        ForeColor="Black" GridLines="Vertical" PageSize="20" Width="99%" 
                        EmptyDataText="No Reccord">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <%--<asp:BoundField DataField="db_name" HeaderText="DBName" 
                                SortExpression="db_name" >
                            <ItemStyle Width="10%" />
                            </asp:BoundField>--%>
                            <asp:BoundField DataField="op_id" HeaderText="รหัสอุปกรณ์" 
                                SortExpression="op_id" >
                            <ItemStyle Width="12%" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <%--<asp:BoundField DataField="pmcm_id" HeaderText="pmcm_id" ReadOnly="True" 
                              SortExpression="pmcm_id" />--%>
                            <asp:BoundField DataField="date_operate" HeaderText="วันดำเนินการ" SortExpression="date_operate"
                                DataFormatString="{0:dd/MMM/yyyy}" HtmlEncode="False" >
                            <ItemStyle HorizontalAlign="Center" Width="14%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="operation" HeaderText="การปฏิบัติงาน" 
                                SortExpression="operation" >
                            <ItemStyle Width="25%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="status_work" HeaderText="สถานะงาน" 
                                SortExpression="status_work" >
                            <ItemStyle HorizontalAlign="Center" Width="13%" />
                            </asp:BoundField>
                            <%--<asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />--%>
                            <%--<asp:BoundField DataField="type_frtu" HeaderText="type_frtu" 
                              SortExpression="type_frtu" />--%>
                            <asp:BoundField DataField="remark" HeaderText="หมายเหตุ" SortExpression="remark" />
                            <%--<asp:BoundField DataField="date_num" HeaderText="date_num" 
                              SortExpression="date_num" />--%>
                            <%--<asp:BoundField DataField="sap_id" HeaderText="sap_id" 
                              SortExpression="sap_id" />--%>
                            <%--<asp:BoundField DataField="device_name" HeaderText="device_name" 
                              SortExpression="device_name" />--%>
                        </Columns>
                        <EmptyDataRowStyle BorderStyle="Solid" HorizontalAlign="Center" />
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                        <SortedAscendingHeaderStyle BackColor="#848384" />
                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                        <SortedDescendingHeaderStyle BackColor="#575357" />
                    </asp:GridView>
                </h3>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                    SelectCommand="sa_date_his_device" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DD_Type_Device" Name="id_type_frtu" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
