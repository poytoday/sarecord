<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Operation.aspx.vb" Inherits="Operation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>เพิ่ม/แก้ไข การปฎิบัติงาน</title>
    <style type="text/css">
        .style3
        {
            width: 201px;
        }
    </style>
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
                <div class="header">
                    <div class="nav2">
                        <h3 align="center">
                            เพิ่ม/แก้ไข การปฎิบัติงาน
                        </h3>
                    </div>
                </div>
                <h3>
                    <table width="99%">
                        <tr>
                            <td class="style3">
                                เลือกประเภทอุปกรณ์ :
                            </td>
                            <td class="style7">
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource1"
                                    DataTextField="Team" DataValueField="ID" AutoPostBack="True" RepeatDirection="Horizontal">
                                </asp:RadioButtonList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                    SelectCommand="SELECT Team, ID FROM sa.Team WHERE (office = @office)">
                                    <SelectParameters>
                                        <asp:SessionParameter DefaultValue="" Name="office" SessionField="UserOffice" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                การปฎิบัติงาน :
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="TextBox1" runat="server" Width="68%"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                                    ErrorMessage="กรอกการปฎิบัติ" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                <asp:LinkButton ID="Linkbutton10" runat="server" Width="157px" ValidationGroup="A">เพิ่มการปฏิบัติงาน</asp:LinkButton>
                            </td>
                            <td class="style4">
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        DataSourceID="SqlDataSource2" PageSize="20" DataKeyNames="ID" Width="99%" BackColor="LightGoldenrodYellow"
                        BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <Columns>
                            <asp:CommandField HeaderText="แก้ไขการปฎิบัติงาน" ShowEditButton="True" />
                            <%--<asp:BoundField DataField="id" HeaderText="ลำดับ" InsertVisible="False" 
                ReadOnly="True" SortExpression="id" />--%>
                            <asp:TemplateField HeaderText="การปฎิบัติงาน" SortExpression="PM_CM">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Height="22px" Text='<%# Bind("PM_CM") %>'
                                        Width="468px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("PM_CM") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
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
                </h3>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                    DeleteCommand="DELETE FROM sa.[Operation_Device] WHERE [Team] = @Team AND [PM_CM] = @PM_CM"
                    InsertCommand="INSERT INTO sa.[Operation_Device] ([Team], [PM_CM]) VALUES (@Team, @PM_CM)"
                    SelectCommand="sa_select_operation" UpdateCommand="UPDATE sa.[Operation_Device] SET [PM_CM] = @PM_CM WHERE [ID] = @ID"
                    SelectCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="Team" Type="String" />
                        <asp:Parameter Name="PM_CM" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Team" Type="String" />
                        <asp:Parameter Name="PM_CM" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="RadioButtonList1" Name="id_Team" PropertyName="SelectedValue"
                            Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="PM_CM" Type="String" />
                        <asp:Parameter Name="ID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <poy:tail ID="tail1" runat="server" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
