<%@ Page Language="VB" AutoEventWireup="false" CodeFile="list_changed_location_opid.aspx.vb"
    Inherits="list_changed_location_opid" %>

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
        .style1
        {
            height: 24px;
        }
        .style3
        {
            height: 24px;
            width: 306px;
        }
        .style5
        {
            height: 24px;
            width: 35px;
        }
        .style6
        {
            width: 35px;
            height: 99px;
        }
        .style7
        {
            height: 24px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="page-container">
        <poy:header ID="UCmenu1" runat="server" />
        <div class="header">
            <div class="nav2">
                <h3 align="center">
                    รายละเอียดการแก้ไข
                </h3>
            </div>
        </div>
        <h3>
            <table width="99%">
                <tr>
                    <td>
                        ประเภทอุปกรณ์
                    </td>
                    <td class="style1">
                        <asp:DropDownList ID="DD_Type_Device" runat="server" AutoPostBack="True" DataSourceID="DS_Type_Device"
                            DataTextField="type_frtu" DataValueField="ID" Width="309px" Height="31px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        พื้นที่
                    </td>
                    <td class="style7">
                        <asp:DropDownList ID="DD_Area" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2"
                            DataTextField="office" DataValueField="office" Width="310px" Height="31px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        รหัสอุปกรณ์
                    </td>
                    <td class="style3">
                        <asp:DropDownList ID="DD_Device" runat="server" AutoPostBack="True" DataSourceID="DS_Device"
                            DataTextField="op_id" DataValueField="dbname" Height="31px" Width="310px">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </h3>
        <asp:SqlDataSource ID="DS_Device" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
            SelectCommand="sa_select_op_id" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="DD_Area" Name="P_area" PropertyName="SelectedValue"
                    Type="String" />
                <asp:ControlParameter ControlID="DD_Type_Device" Name="P_id_type" PropertyName="SelectedValue"
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DS_Type_Device" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
            SelectCommand="sa_select_type_frtu" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="ID_Team" SessionField="User_id_team" Type="Int32" />
                <asp:SessionParameter Name="office" SessionField="UserOffice" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
            SelectCommand="sa_select_area" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="DD_Type_Device" Name="P_id_type" PropertyName="SelectedValue"
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <h3>
            <table width="99%">
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            DataKeyNames="id_move_device" DataSourceID="SqlDataSource1" ForeColor="#333333"
                            GridLines="None" Width="99%" AllowPaging="True" AllowSorting="True" 
                            PageSize="20" EmptyDataText="No Data">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="op_id" HeaderText="รหัสปัจจุบัน" SortExpression="op_id">
                                    <ItemStyle HorizontalAlign="Center" Width="20%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="location" HeaderText="สถานที่ปัจจุบัน" SortExpression="location">
                                    <ItemStyle HorizontalAlign="Center" Width="15%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="before" HeaderText="ก่อน" SortExpression="before">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="after" HeaderText="หลัง" SortExpression="after">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="date_changed" HeaderText="วันที่แก้ไข" SortExpression="date_changed"
                                    DataFormatString="{0:dd/MMM/yyyy}" HtmlEncode="False">
                                    <ItemStyle HorizontalAlign="Center" Width="15%" />
                                </asp:BoundField>
                                <%--<asp:BoundField DataField="page_number" HeaderText="อนุมัติที่" SortExpression="page_number" />--%>
                                <asp:BoundField DataField="remark" HeaderText="หมายเหตุ" 
                                    SortExpression="remark" >
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <%--<asp:BoundField DataField="Type" HeaderText="ประเภท" SortExpression="Type">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>--%>
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <EmptyDataRowStyle ForeColor="#FF3300" HorizontalAlign="Center" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                SelectCommand="sa_changed_location_dbname" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DD_Device" Name="P_dbname" PropertyName="SelectedValue"
                        Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <poy:tail ID="tail1" runat="server" />
    </div>
    </form>
</body>
</html>
