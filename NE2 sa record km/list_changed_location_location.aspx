<%@ Page Language="VB" AutoEventWireup="false" CodeFile="list_changed_location_location.aspx.vb" Inherits="list_changed_location_location" %>

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
            width: 179px;
        }
        .style4
        {
            width: 400px;
        }
        .style5
        {
            width: 163px;
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
       รายละเอียดการแก้ไขสถานที่
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
                            DataTextField="Team" DataValueField="ID" AutoPostBack="True" 
                            RepeatDirection="Horizontal">
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="RadioButtonList1"
                            ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="A">เลือกประเภทอุปกรณ์</asp:RequiredFieldValidator>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                            SelectCommand="sa_office" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="P_office" SessionField="UserOffice" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        &nbsp;<asp:Label ID="Label3" runat="server" Text="ประเภทอุปกรณ์ :" Visible="False"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource2"
                            DataTextField="type_frtu" DataValueField="ID" AutoPostBack="True" RepeatDirection="Horizontal"
                            RepeatColumns="5" Visible="False">
                        </asp:RadioButtonList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                            SelectCommand="sa_select_type_frtu" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="RadioButtonList2" Name="ID_Team" PropertyName="SelectedValue"
                                    Type="Int32" />
                                <asp:SessionParameter Name="office" SessionField="UserOffice" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="RadioButtonList1"
                            ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="A">เลือกประเภทอุปกรณ์</asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
            <table width="99%">
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            DataKeyNames="id_move_device" DataSourceID="SqlDataSource1" ForeColor="#333333"
                            GridLines="None" Width="99%" AllowPaging="True" AllowSorting="True" 
                            PageSize="20">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                             <asp:BoundField DataField="op_id" HeaderText="รหัสปัจจุบัน" SortExpression="op_id">
                                    <ItemStyle HorizontalAlign="Center" Width="20%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="location" HeaderText="สถานที่ปัจจุบัน" SortExpression="location">
                                    <ItemStyle HorizontalAlign="Center" Width="25%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="before" HeaderText="ก่อน" SortExpression="before">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="after" HeaderText="หลัง" SortExpression="after">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                 <asp:BoundField DataField="date_changed" HeaderText="วันที่แก้ไข" SortExpression="date_changed" DataFormatString="{0:dd/MMM/yyyy}" HtmlEncode="False">
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
                SelectCommand="sa_changed_location" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter DefaultValue="location" Name="P_type" Type="String" />
                    <asp:ControlParameter ControlID="RadioButtonList1" DefaultValue="" 
                        Name="id_type_frtu" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
      <poy:tail ID="tail1" runat="server" />
    </div>
    </form>
</body>
</html>
