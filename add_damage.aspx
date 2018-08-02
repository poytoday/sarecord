<%@ Page Language="VB" AutoEventWireup="false" CodeFile="add_damage.aspx.vb" Inherits="add_damage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style2
        {
            width: 144px;
        }
        .style5
        {
            width: 141px;
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
        <poy:header ID="UCmenu1" runat="server" />
        <!-- For alternative headers START PASTE here -->
        <!-- A. HEADER -->
        <div class="header">
            <div class="nav2">
                <h3 align="center">
                    รายละเอียดการปฎิบัติงาน</h3>
            </div>
        </div>
        <h3>
            <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3"
                Width="99%" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px"
                CellPadding="4" GridLines="Horizontal">
                <Columns>
                 <asp:BoundField DataField="pmcm_id" HeaderText="Index" ReadOnly="True" SortExpression="pmcm_id" />
                    <asp:BoundField DataField="op_id" HeaderText="รหัสอุปกรณ์" SortExpression="op_id">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="date_operate" HeaderText="วันที่ดำเนินการ" SortExpression="date_operate"
                        DataFormatString="{0:dd/MMM/yyyy}" HtmlEncode="False">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="operation" HeaderText="การปฏิบัติงาน" SortExpression="operation" />
                    <asp:BoundField DataField="status_work" HeaderText="สถานะงาน" SortExpression="status_work">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="remark" HeaderText="หมายเหตุ" SortExpression="remark" />
                    <%--<asp:BoundField DataField="sap_id" HeaderText="เลขใบสั่งงาน" SortExpression="sap_id" />--%>
                </Columns>
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
        </h3>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
            SelectCommand="SELECT op_id, date_operate, operation, status_work, remark, sap_id,pmcm_id FROM sa.View_pmcm_device WHERE (pmcm_id = @pmcm_id)">
            <SelectParameters>
                <asp:QueryStringParameter Name="pmcm_id" QueryStringField="pmcm_id" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <div class="header">
            <div class="nav2">
                <h3 align="center">
                    <asp:Label ID="Label2" runat="server" Text="รายอาการชำรุด"></asp:Label></h3>
            </div>
        </div>
        <h3>
            <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4"
                Width="99%" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px"
                CellPadding="4" DataKeyNames="pmcm_id,damage_id">
                <Columns>
                    <asp:BoundField DataField="damage_name" HeaderText="อาการชำรุด" SortExpression="damage_name">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Cause" HeaderText="สาเหตุ" SortExpression="Cause" />
                    <asp:BoundField DataField="Correction" HeaderText="การแก้ไข" SortExpression="Correction" />
                    <%--<asp:BoundField DataField="pmcm_id" HeaderText="pmcm_id" 
                        SortExpression="pmcm_id" ReadOnly="True" />--%>
                </Columns>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>
        </h3>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
            SelectCommand="SELECT damage_name, Cause, Correction,damage_id, pmcm_id FROM sa.View_pmcm_damage_name WHERE (pmcm_id = @pmcm_id)">
            <SelectParameters>
                <asp:QueryStringParameter Name="pmcm_id" QueryStringField="pmcm_id" />
            </SelectParameters>
        </asp:SqlDataSource>
        <h3>
            <table width="99%">
                <tr>
                    <td>
                        เพิ่มอาการชำรุดใหม่ :
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server" Width="340px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox5"
                            ErrorMessage="ใส่อาการชำรุด" ForeColor="Red" ValidationGroup="AA"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:Button ID="Button3" runat="server" Text="เพิ่มหัวข้ออาการชำรุด" ValidationGroup="AA" />
                    </td>
                </tr>
            </table>
        </h3>
        <h3>
            <table width="99%" style="background-color: #C0C0C0">
                <tr>
                    <td class="style5">
                        อาการชำรุด :
                    </td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="ds_damage"
                            DataTextField="damage_name" DataValueField="id_damage" RepeatColumns="3" RepeatDirection="Horizontal"
                            AutoPostBack="True" ValidationGroup="C">
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="RadioButtonList1"
                            ErrorMessage="เลือกอาการชำรุด" ForeColor="Red" ValidationGroup="B"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        สาเหตุ :
                    </td>
                    <td>
                        <asp:Panel ID="Panel1" runat="server" Visible="True">
                            <asp:TextBox ID="TextBox1" runat="server" Height="148px" Width="99%" TextMode="MultiLine"></asp:TextBox>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        การแก้ไข :
                    </td>
                    <td>
                        <asp:Panel ID="Panel2" runat="server" Visible="True">
                            <asp:TextBox ID="TextBox3" runat="server" Height="154px" TextMode="MultiLine" Width="99%"></asp:TextBox>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                <td>
                        &nbsp;</td></tr>
            </table>
        </h3>
        <h3>
        <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" Text="ใช้วัสดูสิ้นเปลือง"
            ForeColor="#0066FF" /><br />
            </h3>
        <asp:Panel ID="pnlForm2" runat="server" Visible="False" Width="99%">
           
            <h3>
                <table width="99%" style="background-color: #FFFFCC">
                    <tr>
                        <td align="center" class="style7" width="99%">
                            วัสดุสิ้นเปลืองที่ใช้งาน
                        </td>
                    </tr>
                    <tr>
                        <td class="style6" width="99%" align="center">
                            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                                BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" 
                                BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource6" 
                                GridLines="Vertical" HorizontalAlign="Center"
                                PageSize="20" Width="60%" OnRowCommand="GridView1_RowCommand" 
                                DataKeyNames="id_material" ForeColor="Black">
                                <AlternatingRowStyle BorderStyle="Ridge" BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="Material" HeaderText="รายชื่อวัสดุ" SortExpression="Material" >
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="number_material" HeaderText="จำนวนที่ใช้" SortExpression="number_material" >
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="id_material" HeaderText="จำนวนที่ใช้" InsertVisible="False"
                                        ReadOnly="True" SortExpression="id_material" Visible="False" />
                                    <asp:ButtonField CommandName="cmdDelete" HeaderImageUrl="~/images/icon_delete.gif"
                                        Text="Delete">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:ButtonField>
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
                        </td>
                    </tr>
                </table>
            </h3>
             <h3>
                <table width="99%" style="background-color: #FFFFCC">
                    <tr>
                        <td>
                            วัสดุที่ใช้
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
                                DataTextField="material_type" DataValueField="material_type" Height="16px" Width="146px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                SelectCommand="SELECT material_type, office FROM sa.Material WHERE (office = @office)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="office" SessionField="UserOffice" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td>
                            จำนวน(ชิ้น)
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server" Width="124px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2"
                                ErrorMessage="กรอกจำนวน" ForeColor="Red" ValidationGroup="C"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:Button ID="Button4" runat="server" ForeColor="#0066FF" Text="เพิ่มว้สดุสิ้นเปลือง"
                                ValidationGroup="C" />
                        </td>
                    </tr>
                </table>
            </h3>
        </asp:Panel>
          <h3>
        <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Text="เพิ่มรูปภาพ"
            ForeColor="#CC00CC" /><br />
            </h3>
        <asp:Panel ID="pnlForm3" runat="server" Visible="False">
            <h3>
                <table width="99%" style="background-color: #CCFF99">
                    <tr>
                        <td align="center" width="99%">
                            รูปภาพ/เอกสารประกอบ
                        </td>
                    </tr>
                    <tr>
                        <td class="style6" width="99%" align="center">
                            <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False"
                                CssClass="Grid" DataSourceID="SqlDataSource5" EmptyDataText="No records found"
                                OnRowCommand="GridView5_RowCommand" Width="80%" DataKeyNames="RUN_ID" 
                                CellPadding="4" ForeColor="#333333" 
                                GridLines="None">
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
                                        SortExpression="Detail" />
                                    <asp:TemplateField HeaderText="View">
                                        <ItemTemplate>
                                            <a href='<%#"getfile.aspx?filename=upload/"+Server.UrlPathEncode(Convert.ToString(Eval("PATH_PIC")))+"&table=[dbo].[upload]"%>'>
                                                <asp:Image ID="imgpath" runat="server" AlternateText='<%#Convert.ToString(Eval("PATH_PIC"))%>'
                                                    ImageUrl="images/file.gif" Visible='<%# Not Convert.IsDBNull(Eval("PATH_PIC"))%>'>
                                                </asp:Image>
                                            </a>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:ButtonField CommandName="cmdDelete" HeaderImageUrl="~/images/icon_delete.gif"
                                        Text="Delete">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:ButtonField>
                                </Columns>
                                <SelectedRowStyle CssClass="GridSelected" BackColor="#C5BBAF" Font-Bold="True" 
                                    ForeColor="#333333" />
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
                                SelectCommand="SELECT * FROM sa.[Damage_PIC] WHERE ([pmcm_id] = @pmcm_id and damage_id = @id_damage)"
                                DeleteCommand="DELETE FROM sa.Device_PIC WHERE (pmcm_id = @pmcm_id)">
                                <SelectParameters>
                                    <asp:QueryStringParameter DefaultValue="-1" Name="pmcm_id" QueryStringField="pmcm_id"
                                        Type="String" />
                                    <asp:ControlParameter ControlID="RadioButtonList1" Name="id_damage" PropertyName="SelectedValue"
                                        Type="String" />
                                </SelectParameters>
                                <DeleteParameters>
                                    <asp:Parameter Name="pmcm_id" />
                                </DeleteParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
                <table style="background-color: #CCFF99" width="99%">
                    <tr>
                        <td style="width: 145px">
                            <asp:RadioButtonList ID="RadioButtonList2" runat="server" Height="56px" RepeatDirection="Horizontal"
                                Width="120px">
                                <asp:ListItem>Picture</asp:ListItem>
                                <asp:ListItem>File</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="RadioButtonList2"
                                ErrorMessage="เลือกประเภท" ForeColor="Red" ValidationGroup="B"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:FileUpload ID="Uploadfldpath" runat="server" onchange="var path=document.forms.form1.Uploadfldpath.value; var wpos=path.lastIndexOf('\\'); var upos=path.lastIndexOf('/'); var pos=wpos; if(upos&gt;wpos) pos=upos; document.forms.form1.fldpath.value=path.substr(pos+1);"
                                size="50" />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 23px; width: 145px;">
                            <asp:Label ID="lblStorepath" runat="server" class="visible">Store as</asp:Label>
                            (ชื่อไฟร์)
                        </td>
                        <td style="height: 23px">
                            <asp:TextBox ID="fldpath" runat="server" Text='<%# Bind("path") %>' Width="320px"></asp:TextBox>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 145px">
                            <asp:Label ID="Label1" runat="server" Text="คำอธิบายรูปภาพ"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox4" runat="server" Width="320px"></asp:TextBox>
                            <asp:Button ID="Button1" runat="server" ForeColor="Fuchsia" Text="เพิ่มรูปภาพ" ValidationGroup="B" />
                        </td>
                    </tr>
                </table>
            </h3>
        </asp:Panel>
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2"
            DataTextField="Max_damage" DataValueField="Max_damage" Visible="False">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
            SelectCommand="SELECT MAX(id) AS Max_damage FROM sa.Damage_List"></asp:SqlDataSource>
                        <asp:Button ID="Button2" runat="server" Text="เพิ่มอาการชำรุด" 
                            ValidationGroup="B" ForeColor="Lime" />
        
        <asp:SqlDataSource ID="ds_damage" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
            SelectCommand="SELECT id_damage, damage_name, id_type_frtu FROM sa.Damage_Type WHERE (id_type_frtu = @id_type_frtu) ORDER BY damage_name">
            <SelectParameters>
                <asp:QueryStringParameter Name="id_type_frtu" QueryStringField="id_type_frtu" DefaultValue="" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
            SelectCommand="SELECT Material, damage_id, number_material, office, pmcm_id, id_material FROM sa.Material_List2 WHERE (pmcm_id = @pmcm_id)"
            DeleteCommand="DELETE FROM sa.Material_List2  WHERE (pmcm_id = @pmcm_id) and id_material = @id_material">
            <SelectParameters>
                <asp:QueryStringParameter Name="pmcm_id" QueryStringField="pmcm_id" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="pmcm_id" />
                <asp:Parameter Name="id_material" />
            </DeleteParameters>
        </asp:SqlDataSource>
        <poy:tail ID="tail1" runat="server" />
    </div>
    </form>
</body>
</html>
