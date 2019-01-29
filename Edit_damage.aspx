<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Edit_damage.aspx.vb" Inherits="Edit_damage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 109px;
        }
        
        .style5
        {
            width: 177px;
            height: 24px;
        }
        .style6
        {
            height: 24px;
        }
        .style7
        {
            width: 177px;
        }
        .style8
        {
            height: 23px;
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
        <h3 align="center">
            รายละเอียดการปฎิบัติงาน
        </h3>
        <h3>
            <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3"
                Width="99%" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px"
                CellPadding="4" GridLines="Horizontal">
                <Columns>
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
                    <asp:BoundField DataField="sap_id" HeaderText="เลขใบสั่งงาน" SortExpression="sap_id" />
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
            SelectCommand="SELECT op_id, date_operate, operation, status_work, remark, sap_id FROM sa.View_pmcm_device WHERE (pmcm_id = @pmcm_id)">
            <SelectParameters>
                <asp:QueryStringParameter Name="pmcm_id" QueryStringField="pmcm_id" />
            </SelectParameters>
        </asp:SqlDataSource>
<%--        <h3 align="center">
            รูปภาพ-เอกสาร ของอุปกรณ์</h3>--%>
        <asp:Panel ID="pnlForm3" runat="server">
            <table width="99%">
                <tr>
                    <%--  <td><h3>
                            รูปภาพและเอกสาร :</h3>
                        </td>--%>
                    <td>
    <%--                    <h3>
                            <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" BorderStyle="None"
                                CssClass="Grid" DataSourceID="SqlDataSource5" EmptyDataText="No Picture found"
                                OnRowCommand="GridView5_RowCommand" Width="99%" DataKeyNames="RUN_ID" BackColor="White"
                                BorderColor="#DEDFDE" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                <RowStyle CssClass="shade" BackColor="#F7F7DE" />
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
                                <SelectedRowStyle CssClass="GridSelected" BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                <FooterStyle BackColor="#CCCC99" />
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" BackColor="#6B696B"
                                    Font-Bold="True" ForeColor="White" />
                                <AlternatingRowStyle CssClass="GridItemOdd" BackColor="White" />
                                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                <SortedAscendingHeaderStyle BackColor="#848384" />
                                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                <SortedDescendingHeaderStyle BackColor="#575357" />
                            </asp:GridView>
                        </h3>--%>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                            SelectCommand="SELECT * FROM sa.[Damage_PIC] WHERE ([pmcm_id] = @pmcm_id and damage_id = @id_damage)"
                            DeleteCommand="DELETE FROM sa.Device_PIC WHERE (pmcm_id = @pmcm_id)">
                            <SelectParameters>
                                <asp:QueryStringParameter DefaultValue="-1" Name="pmcm_id" QueryStringField="pmcm_id"
                                    Type="String" />
                                <asp:QueryStringParameter DefaultValue="-1" Name="id_damage" QueryStringField="id"
                                    Type="String" />
                            </SelectParameters>
                            <DeleteParameters>
                                <asp:Parameter Name="pmcm_id" />
                            </DeleteParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
            <h3>
                <%--<table width="99%">
                    <tr>
                        <td class="style7">
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
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Uploadfldpath"
                                ErrorMessage="เลือกไฟล์ที่ต้องการ Upload" ForeColor="Red" ValidationGroup="B"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            <asp:Label ID="lblStorepath" runat="server" class="visible">Store as</asp:Label>
                            (ชื่อไฟร์)
                        </td>
                        <td style="height: 23px">
                            <asp:TextBox ID="fldpath" runat="server" Text='<%# Bind("path") %>' Width="320px"></asp:TextBox>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            <asp:Label ID="Label1" runat="server" Text="คำอธิบายรูปภาพ"></asp:Label>
                        </td>
                        <td class="style6">
                            <asp:TextBox ID="TextBox4" runat="server" Width="320px"></asp:TextBox>
                        </td>
                    </tr>
                    <caption>
                        &nbsp; เพิ่มรูปภาพ/เอกสารประกอบ :
                    </caption>
                    <tr>
                        <td class="style7">
                            <asp:Button ID="Button1" runat="server" Text="เพิ่มรูปภาพ" ValidationGroup="B" />
                        </td>
                    </tr>
                </table>--%>
            </h3>
        </asp:Panel>
        <h3>
            <table width="99%">
                <tr>
                    <td class="style1">
                        อาการชำรุด :
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
                            DataTextField="damage_name" DataValueField="id_damage" Width="50%">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        สาเหตุ :
                    </td>
                    <td>
                        <asp:Panel ID="Panel1" runat="server" Visible="True">
                            <asp:TextBox ID="TextBox1" runat="server" Height="31px" Width="99%"></asp:TextBox>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        การแก้ไข :
                    </td>
                    <td>
                        <asp:Panel ID="Panel2" runat="server" Visible="True">
                            <asp:TextBox ID="TextBox2" runat="server" Height="154px" TextMode="MultiLine" Width="99%"></asp:TextBox>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
            <asp:LinkButton ID="LinkButton2" runat="server">Update</asp:LinkButton>
        </h3>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
            SelectCommand="SELECT id_damage, damage_name, product FROM sa.Damage_Type WHERE (id_type_frtu = @id_type_frtu) ORDER BY id_damage">
            <SelectParameters>
                <asp:QueryStringParameter Name="id_type_frtu" QueryStringField="id_type_frtu" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        </h3>
        <poy:tail ID="tail1" runat="server" />
    </div>
    </form>
</body>
</html>
