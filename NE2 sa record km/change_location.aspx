<%@ Page Language="VB" AutoEventWireup="false" CodeFile="change_location.aspx.vb"
    Inherits="change_location" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1 {
            width: 205px;
        }

        .style2 {
            width: 207px;
        }

        .style3 {
            width: 217px;
            height: 33px;
        }

        .style4 {
            height: 33px;
        }

        .style8 {
            height: 38px;
        }

        .style9 {
            width: 177px;
        }

        .style10 {
            height: 38px;
            width: 177px;
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
        <div class="page-container">
            <!-- For alternative headers START PASTE here -->
            <!-- A. HEADER -->
            <poy:header ID="UCmenu1" runat="server" />
            <div class="header">
                <div class="nav2">
                    <h3 align="center" style="color: #0000FF">แก้ไข รหัส/สถานที่ ของอุปกรณ์
                    </h3>
                </div>
            </div>
            <asp:ScriptManager ID="ScriptManager2" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <h3 style="color: #0000FF" align="center">
                        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" HorizontalAlign="Center"
                            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                            CellPadding="4" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False"
                            Width="50%">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="dbname" HeaderText="DBName" SortExpression="dbname" />
                                <asp:BoundField DataField="op_id" HeaderText="รหัสอุปกรณ์" SortExpression="op_id" />
                                <asp:BoundField DataField="location" HeaderText="Location" SortExpression="location" />
                            </Columns>
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                            SelectCommand="SELECT [dbname], [op_id], [location] FROM [SA_System].[sa].[Device_List] WHERE ([dbname] = @dbname)">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="dbname" QueryStringField="dbname" Type="String" DefaultValue="N3REC.001" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </h3>
                    <br />
                    <h3>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" Height="18px" RepeatDirection="Horizontal"
                            Width="432px" AutoPostBack="True">
                            <asp:ListItem Value="device">รหัสอุปกรณ์</asp:ListItem>
                            <asp:ListItem Value="location">สถานที่</asp:ListItem>
                            <asp:ListItem Value="property">คุณสมบัติ</asp:ListItem>
                        </asp:RadioButtonList>
                    </h3>
                    <asp:Panel ID="Panel1" runat="server" Visible="False" HorizontalAlign="Left">
                        <h3>
                            <table width="99%">
                                <tr>
                                    <td class="style1">รหัสเก่า
                                    </td>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Width="50%"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">รหัสใหม่
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox1" runat="server" Width="50%"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                                            ErrorMessage="กรุณาใส่รหัสใหม่" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">อนุมัติที่
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox2" runat="server" Width="50%"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox2"
                                            ErrorMessage="กรุณาใส่เลขที่อนุมัติ" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">หมายเหตุ
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox3" runat="server" Height="75px" TextMode="MultiLine" Width="50%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <asp:Button ID="Button1" runat="server" Text="แก้ไข" Width="99px" ValidationGroup="A" />
                                    </td>
                                    <td>&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </h3>
                    </asp:Panel>
                    <asp:Panel ID="Panel2" runat="server" Visible="False">
                        <h3>
                            <table width="99%">
                                <tr>
                                    <td class="style9">สถานที่เดิม
                                    </td>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Width="50%"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style9">สถานที่ใหม่
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox4" runat="server" Width="50%"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox4"
                                            ErrorMessage="กรุณาใส่สถานที่ใหม่" ForeColor="Red" ValidationGroup="B"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style9">อนุมัติที่
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox5" runat="server" Width="50%"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox5"
                                            ErrorMessage="กรุณาใส่เลขที่อนุมัติ" ForeColor="Red" ValidationGroup="B"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style9">หมายเหตุ
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox6" runat="server" Height="81px" TextMode="MultiLine" Width="50%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style10">
                                        <asp:Button ID="Button2" runat="server" Text="แก้ไข" Width="99px" ValidationGroup="B" />
                                    </td>
                                    <td class="style8">&nbsp;
                                    </td>
                                </tr>
                            </table>
                              </h3>
                    </asp:Panel>
                  

                   <asp:Panel ID="Panel3" runat="server">
                       <h3>
                           <table width="99%">
                               <tr>
                                   <td>
                                       <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
                                           DataSourceID="SqlDataSource4" EmptyDataText="No records found" BackColor="White"
                                           BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black"
                                           GridLines="Vertical" HorizontalAlign="Center" Width="99%">
                                           <AlternatingRowStyle BackColor="White" />
                                           <Columns>
                                               <%--<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />--%>
                                               <%--<asp:BoundField DataField="id" HeaderText="ลำดับ" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>--%>

                                               <%--<asp:BoundField DataField="dbname" HeaderText="dbname" 
                    SortExpression="dbname" />--%>
                                               <asp:BoundField DataField="property" HeaderText="คุณสมบัติ" SortExpression="property"
                                                   ReadOnly="True">
                                                   <ItemStyle HorizontalAlign="Center" />
                                               </asp:BoundField>
                                               <asp:BoundField DataField="detail" HeaderText="รายละเอียด" SortExpression="detail">
                                                   <ItemStyle HorizontalAlign="Center" />
                                               </asp:BoundField>
                                           </Columns>
                                           <EmptyDataRowStyle HorizontalAlign="Center" />
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
                                       <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                           DeleteCommand="DELETE FROM sa.[Setting_Property] WHERE [id] = @id" InsertCommand="INSERT INTO sa.[Setting_Property] ([dbname], [property], [detail], [type_frtu]) VALUES (@dbname, @property, @detail, @type_frtu)"
                                           SelectCommand="SELECT id, dbname, property, detail, id_type_frtu FROM sa.Setting_Property WHERE (dbname = @dbname) ORDER BY property DESC"
                                           UpdateCommand="UPDATE sa.[Setting_Property] SET [detail] = @detail WHERE [id] = @id">
                                           <DeleteParameters>
                                               <asp:Parameter Name="id" Type="Int32" />
                                           </DeleteParameters>
                                           <InsertParameters>
                                               <asp:Parameter Name="dbname" Type="String" />
                                               <asp:Parameter Name="property" Type="String" />
                                               <asp:Parameter Name="detail" Type="String" />
                                               <asp:Parameter Name="type_frtu" Type="String" />
                                           </InsertParameters>
                                           <SelectParameters>
                                               <asp:QueryStringParameter DefaultValue="N3PR0012" Name="dbname" QueryStringField="dbname"
                                                   Type="String" />
                                           </SelectParameters>
                                           <UpdateParameters>
                                               <%--<asp:Parameter Name="dbname" Type="String" />--%>
                                               <asp:Parameter Name="detail" Type="String" />
                                               <%--<asp:Parameter Name="type_frtu" Type="String" />--%>
                                               <asp:Parameter Name="id" Type="Int32" />
                                           </UpdateParameters>
                                       </asp:SqlDataSource>

                                   </td>
                                   <td class="auto-style1">


                                       <asp:Button ID="Button4" runat="server" Text="Move--&gt;" Width="110px" />


                                   </td>
                                   <td>ประเภทอุปกรณ์
                                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="DS_Type_Device" DataTextField="type_frtu" DataValueField="ID" Height="31px" Width="200px">
                                    </asp:DropDownList>
                                       <br />
                                       พื้นที่
                                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="office" DataValueField="office" Height="31px" Width="200px">
                                    </asp:DropDownList>
                                       <br />
                                       รหัสอุปกรณ์
                                    <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource6" DataTextField="opid_location" DataValueField="dbname" Height="31px" Width="200px">
                                    </asp:DropDownList>



                                       <br />
                                       <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="dbname,property,detail,id_type_frtu" DataSourceID="SqlDataSource5" EmptyDataText="No records found" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" Width="99%">
                                           <AlternatingRowStyle BackColor="White" />
                                           <Columns>
                                               <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                               <asp:BoundField DataField="dbname" HeaderText="dbname" ReadOnly="True" SortExpression="dbname" />
                                               <asp:BoundField DataField="property" HeaderText="property" ReadOnly="True" SortExpression="property" />
                                               <asp:BoundField DataField="detail" HeaderText="detail" ReadOnly="True" SortExpression="detail" />
                                               <asp:BoundField DataField="id_type_frtu" HeaderText="id_type_frtu" ReadOnly="True" SortExpression="id_type_frtu" />
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
                                       <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>" DeleteCommand="DELETE FROM sa.[Setting_Property] WHERE [id] = @id" InsertCommand="INSERT INTO sa.[Setting_Property] ([dbname], [property], [detail], [type_frtu]) VALUES (@dbname, @property, @detail, @type_frtu)" SelectCommand="SELECT id, dbname, property, detail, id_type_frtu FROM sa.Setting_Property WHERE (dbname = @dbname) ORDER BY property DESC" UpdateCommand="UPDATE sa.[Setting_Property] SET [detail] = @detail WHERE [id] = @id">
                                           <DeleteParameters>
                                               <asp:Parameter Name="id" Type="Int32" />
                                           </DeleteParameters>
                                           <InsertParameters>
                                               <asp:Parameter Name="dbname" Type="String" />
                                               <asp:Parameter Name="property" Type="String" />
                                               <asp:Parameter Name="detail" Type="String" />
                                               <asp:Parameter Name="type_frtu" Type="String" />
                                           </InsertParameters>
                                           <SelectParameters>
                                               <asp:ControlParameter ControlID="DropDownList3" DefaultValue="N3PR0012" Name="dbname" PropertyName="SelectedValue" Type="String" />
                                           </SelectParameters>
                                           <UpdateParameters>
                                               <asp:Parameter Name="detail" Type="String" />
                                               <asp:Parameter Name="id" Type="Int32" />
                                           </UpdateParameters>
                                       </asp:SqlDataSource>



                                   </td>
                               </tr>

                               <tr>
                                   <td class="style9">อนุมัติที่
                                   </td>
                                   <td class="auto-style1">
                                       <asp:TextBox ID="TextBox44" runat="server" Width="50%"></asp:TextBox>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="TextBox5"
                                           ErrorMessage="กรุณาใส่เลขที่อนุมัติ" ForeColor="Red" ValidationGroup="B"></asp:RequiredFieldValidator>
                                   </td>
                               </tr>
                               <tr>
                                   <td class="style9">หมายเหตุ
                                   </td>
                                   <td class="auto-style1">
                                       <asp:TextBox ID="TextBox7" runat="server" Height="81px" TextMode="MultiLine" Width="50%"></asp:TextBox>
                                   </td>
                               </tr>
                               <tr>
                                   <td class="style10">
                                       <asp:Button ID="Button5" runat="server" Text="แก้ไข" Width="99px" ValidationGroup="B" />
                                   </td>
                                   <td class="auto-style2">&nbsp;
                                   </td>
                               </tr>
                           </table>
                            </h3>
                   </asp:Panel>
                   
                <asp:SqlDataSource ID="DS_Device" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>" SelectCommand="sa_select_op_id" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" DefaultValue="" Name="P_area" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="DropDownList2" DefaultValue="36" Name="P_id_type" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                    <asp:SqlDataSource ID="DS_Type_Device" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>" SelectCommand="sa_select_type_frtu" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="ID_Team" SessionField="User_id_team" Type="Int32" />
                            <asp:SessionParameter Name="office" SessionField="UserOffice" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>" SelectCommand="sa_select_area" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="P_id_type" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>" SelectCommand="sa_select_op_id" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList2" Name="P_area" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="DropDownList1" Name="P_id_type" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>


            </ContentTemplate>
        </asp:UpdatePanel>
        <poy:tail ID="tail1" runat="server" />
        </div>
    </form>
</body>
</html>
