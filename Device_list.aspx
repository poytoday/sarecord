<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Device_list.aspx.vb" Inherits="Device_list" %>

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
            width: 169px;
        }
        .style2
        {
            height: 4px;
        }
        .style5
        {
            width: 189px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <%--  <asp:ScriptManager ID="ScriptManager2" runat="server">
    </asp:ScriptManager>--%>
    <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>--%>
    <div class="page-container">
        <poy:header ID="UCmenu1" runat="server" />
        <div class="header">
            <div class="nav2">
                <h3 align="center" style="color: #0000FF">
                    รายละเอียดอุปกรณ์
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/Excel2.jpg"
                        ImageAlign="Right" />
                </h3>
            </div>
        </div>
        <h3>
            <table width="99%">
                <tr>
                    <td class="style5">
                        ทีมงาน :
                    </td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList2" runat="server" DataSourceID="SqlDataSource3"
                            DataTextField="Team" DataValueField="ID" AutoPostBack="True" RepeatDirection="Horizontal"
                            RepeatColumns="6" Height="26px" Width="99%">
                        </asp:RadioButtonList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                            
                            SelectCommand="SELECT Team, ID, office FROM sa.Team WHERE (office = @office)">
                            <SelectParameters>
                                <asp:SessionParameter Name="office" SessionField="UserOffice" 
                                    DefaultValue="ผอค.น.3" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                  
                </tr>
                <tr>
                    <td class="style5">
                        &nbsp;<asp:Label ID="Label2" runat="server" Text="ประเภทอุปกรณ์ :" Visible="False"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource1"
                            DataTextField="type_frtu" DataValueField="ID" AutoPostBack="True" RepeatDirection="Horizontal"
                            RepeatColumns="6" Height="28px" Width="99%" Visible="False">
                        </asp:RadioButtonList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                            SelectCommand="sa_select_type_frtu" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="RadioButtonList2" Name="ID_Team" PropertyName="SelectedValue"
                                    Type="Int32" />
                                <asp:SessionParameter Name="office" SessionField="UserOffice" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr id="tr01">
                    <td class="style5">
                        <asp:Label ID="Label1" runat="server" Text="พื้นที่ :" Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                            SelectCommand="sa_select_area" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="RadioButtonList1" Name="P_id_type" PropertyName="SelectedValue"
                                    Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource4"
                            DataTextField="office" DataValueField="office" AutoPostBack="True" Height="20px"
                            Width="155px" Visible="False">
                        </asp:DropDownList>
                        <br />
                    </td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" DataKeyNames="dbname" DataSourceID="SqlDataSource2"
                EmptyDataText="No records found" OnRowCommand="GridView1_RowCommand" PageSize="20"
                CellPadding="4" ForeColor="#333333" GridLines="None" Width="99%" Visible="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="dbname" HeaderText="dbname" ReadOnly="True" SortExpression="dbname" />
                    <asp:BoundField DataField="op_id" HeaderText="รหัสอุปกรณ์" ReadOnly="True" SortExpression="op_id">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="location" HeaderText="สถานที่" SortExpression="location" />
                    <%--<asp:BoundField DataField="product" HeaderText="ผลิตภัณฑ์" 
                            SortExpression="product">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>--%>
                    <%--<asp:BoundField DataField="type" HeaderText="ทีม" SortExpression="type">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>--%>
                    <%--<asp:BoundField DataField="control_type" HeaderText="Control Type" 
                            SortExpression="control_type">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>--%>
                    <asp:BoundField DataField="count_pmcm" HeaderText="ปฎิบัติงาน(ครั้ง)" SortExpression="count_pmcm">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:ButtonField CommandName="cmd_edit" HeaderImageUrl="~/images/icon_edit.gif" Text="Location" />
                    <asp:ButtonField CommandName="cmd_pic" HeaderImageUrl="~/images/icon_view.gif" Text="Pic" />
                    <asp:ButtonField CommandName="cmd_detail" HeaderImageUrl="~/images/icon_view.gif"
                        Text="Detail" />
                    <asp:ButtonField CommandName="cmdView" HeaderImageUrl="~/images/icon_view.gif" Text="View" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
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
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="dbname"
                DataSourceID="SqlDataSource5" EmptyDataText="No records found" OnRowCommand="GridView2_RowCommand"
                PageSize="20" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="99%"
                BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                Visible="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="dbname" HeaderText="dbname" ReadOnly="True" SortExpression="dbname" />
                    <asp:BoundField DataField="op_id" HeaderText="รหัสอุปกรณ์" ReadOnly="True" SortExpression="op_id">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="location" HeaderText="สถานที่" SortExpression="location" />
                    <%--<asp:BoundField DataField="product" HeaderText="ผลิตภัณฑ์" 
                            SortExpression="product">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>--%>
                    <%--<asp:BoundField DataField="type" HeaderText="ทีม" SortExpression="type">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>--%>
                    <%--<asp:BoundField DataField="control_type" HeaderText="Control Type" 
                            SortExpression="control_type">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>--%>
                    <asp:BoundField DataField="count_pmcm" HeaderText="ปฎิบัติงาน(ครั้ง)" SortExpression="count_pmcm">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <%-- <asp:ButtonField CommandName="cmd_edit" HeaderImageUrl="~/images/icon_edit.gif" Text="Location" />
                            <asp:ButtonField CommandName="cmd_pic" HeaderImageUrl="~/images/icon_view.gif" Text="Pic" />
                            <asp:ButtonField CommandName="cmd_detail" HeaderImageUrl="~/images/icon_view.gif"
                                Text="Detail" />--%>
                    <asp:ButtonField CommandName="cmd_edit" Text="Edit" HeaderText="สถานที่/รหัส" ItemStyle-HorizontalAlign="Center" />
                    <asp:ButtonField CommandName="cmd_pic" Text="Pic" HeaderText="รูปภาพ" ItemStyle-HorizontalAlign="Center" />
                    <asp:ButtonField CommandName="cmd_detail" Text="Detail" HeaderText="รายละเอียด" ItemStyle-HorizontalAlign="Center" />
                    <asp:ButtonField CommandName="cmdView" Text="View" HeaderText="ประวัติ" HeaderStyle-HorizontalAlign="Center" />
                    <%--<asp:ButtonField CommandName="cmdView" HeaderImageUrl="~/images/icon_view.gif" Text="View" />--%>
                </Columns>
                <EmptyDataRowStyle BackColor="#FFFF99" ForeColor="#FF66FF" HorizontalAlign="Center" />
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
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="dbname"
                DataSourceID="SqlDataSource5" EmptyDataText="No records found" OnRowCommand="GridView2_RowCommand"
                PageSize="20" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="99%"
                BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                Visible="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="dbname" HeaderText="dbname" ReadOnly="True" SortExpression="dbname" />
                    <asp:BoundField DataField="op_id" HeaderText="รหัสอุปกรณ์" ReadOnly="True" SortExpression="op_id">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="location" HeaderText="สถานที่" SortExpression="location" />
                    <asp:BoundField DataField="count_pmcm" HeaderText="ปฎิบัติงาน(ครั้ง)" SortExpression="count_pmcm">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
                <EmptyDataRowStyle BackColor="#FFFF99" ForeColor="#FF66FF" HorizontalAlign="Center" />
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
            SelectCommand="SELECT dbname, count_pmcm, op_id, location, id_type_frtu FROM sa.View_device_list WHERE (id_type_frtu = @id_type_frtu)">
            <SelectParameters>
                <asp:ControlParameter ControlID="RadioButtonList1" Name="id_type_frtu" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
            SelectCommand="SELECT dbname, count_pmcm, op_id, location, office, id_type_frtu FROM sa.View_device_list WHERE (office = @office) AND (id_type_frtu = @id_type_frtu)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="office" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="RadioButtonList1" Name="id_type_frtu" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <poy:tail ID="tail1" runat="server" />
    </div>
    <%--   </ContentTemplate>
    </asp:UpdatePanel>--%>
    </form>
</body>
</html>
