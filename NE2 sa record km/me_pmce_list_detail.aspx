<%@ Page Language="VB" AutoEventWireup="false" CodeFile="me_pmce_list_detail.aspx.vb"
    Inherits="me_pmce_list_detail" %>

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
        .style3
        {
            width: 709px;
        }
        .style5
        {
            width: 705px;
        }
        .style10
        {
            width: 260px;
        }
        .style11
        {
            width: 290px;
            height: 36PX;
        }
        .style16
        {
            width: 354px;
            height: 36PX;
        }
        .style20
        {
            width: 174px;
        }
        .style21
        {
            width: 354px;
        }
        .style22
        {
            width: 332px;
        }
        .style23
        {
            width: 360px;
            height: 140px;
        }
        .style24
        {
            width: 333px;
        }
        .style25
        {
            width: 360px;
        }
        .style27
        {
            width: 342px;
            height: 140px;
        }
        .style28
        {
            width: 342px;
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
                <!-- For alternative headers END PASTE here -->
                <!-- B. MAIN -->
                <h3>
                    <table width="99%">
                        <tr>
                            <td class="style11">
                                รหัสอุปกรณ์ :
                            </td>
                            <td class="style24">
                                <asp:Label ID="Label2" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                เลขใบสั่งงาน :
                            </td>
                            <td class="style22">
                                <asp:Label ID="Label3" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                การปฎิบัติงาน :
                            </td>
                            <td class="style10">
                                <asp:Label ID="Label4" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                วันที่ดำเนินการ
                                <br />
                                วัน/เดือน/ปี:
                            </td>
                            <td class="style3">
                                <asp:Label ID="Label5" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                จำนวนวันในการปฏิบัติงาน :
                            </td>
                            <td class="style5">
                                <asp:Label ID="Label6" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                <asp:Label ID="Label1" runat="server" Text="สถานะอุปกรณ์"></asp:Label>
                                &nbsp;:
                            </td>
                            <td class="style10">
                                <asp:Label ID="Label7" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                หมายเหตุ :
                            </td>
                            <td class="style20">
                                <asp:Label ID="Label8" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <table width="99%">
                        <tr>
                            <td class="style28">
                                ผู้ดำเนินการ :
                            </td>
                            <td>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                    SelectCommand="SELECT * FROM sa.[View_name_name_list_pmcmid]"></asp:SqlDataSource>
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                                    Width="99%" EmptyDataText="No records found" DataKeyNames="id,Emp_id,pmcm_id"
                                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                                    CellPadding="3">
                                    <Columns>
                                        <asp:BoundField DataField="Emp_id" HeaderText="รหัสประจำตัว" SortExpression="Emp_id">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="name" HeaderText="ชื่อ-สกุล" SortExpression="name">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="position" HeaderText="ตำแหน่ง" SortExpression="position">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <%--  <asp:ButtonField CommandName="cmdEdit" HeaderImageUrl="~/images/icon_view.gif" Text="Edit" />
                                        <asp:ButtonField CommandName="cmdDelet" HeaderImageUrl="~/images/icon_view.gif" Text="Delete" />
                                        <asp:ButtonField CommandName="cmdAdd" HeaderImageUrl="~/images/icon_view.gif" Text="Add" />--%>
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
                            <td class="style27">
                                อาการชำรุด :
                            </td>
                            <td>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                    SelectCommand="SELECT id, pmcm_id, damage_id, Cause, Correction, damage_name, id_type_frtu FROM sa.View_damage_list WHERE (pmcm_id = @pmcm_id)">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="pmcm_id" QueryStringField="pmcm_id" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2"
                                    Width="99%" EmptyDataText="ไม่มีอาการชำรุด" DataKeyNames="pmcm_id,damage_id,id,id_type_frtu"
                                    CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="damage_name" HeaderText="อาการชำรุด" SortExpression="damage_name">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Cause" HeaderText="สาเหตุ" SortExpression="Cause">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Correction" HeaderText="การแก้ไข" SortExpression="Correction">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <%-- <asp:ButtonField CommandName="cmdEdit" HeaderImageUrl="~/images/icon_view.gif" Text="Edit" />
                                        <asp:ButtonField CommandName="cmdDelet" HeaderImageUrl="~/images/icon_view.gif" Text="Delete" />
                                        <asp:ButtonField CommandName="cmdAdd" HeaderImageUrl="~/images/icon_view.gif" Text="Add" />--%>
                                    </Columns>
                                    <EmptyDataRowStyle HorizontalAlign="Center" />
                                    <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
                                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                    <RowStyle ForeColor="#333333" BackColor="#FFFBD6" />
                                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                    <SortedDescendingHeaderStyle BackColor="#820000" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td class="style28">
                                วัสดุสิ้นเปลืองที่ใช้งาน :
                            </td>
                            <td class="style6" width="99%" align="center">
                                <asp:GridView ID="GridView3" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                                    BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                                    CellPadding="4" DataSourceID="SqlDataSource6" GridLines="Vertical" HorizontalAlign="Center"
                                    PageSize="20" Width="60%"  DataKeyNames="id_material"
                                    ForeColor="Black" EmptyDataText="ไม่มีการใช้วัสดุสิ้นเปลือง">
                                    <AlternatingRowStyle BorderStyle="Ridge" BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="Material" HeaderText="รายชื่อวัสดุ" 
                                            SortExpression="Material" >
                                        <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="number_material" HeaderText="จำนวนที่ใช้" 
                                            SortExpression="number_material" >
                                        <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="id_material" HeaderText="จำนวนที่ใช้" InsertVisible="False"
                                            ReadOnly="True" SortExpression="id_material" Visible="False" >
                                        <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <%--<asp:ButtonField CommandName="cmdDelete" HeaderImageUrl="~/images/icon_delete.gif"
                                        Text="Delete">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:ButtonField>--%>
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
                                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                    DeleteCommand="DELETE FROM sa.Material_List2  WHERE (pmcm_id = @pmcm_id) and id_material = @id_material"
                                    SelectCommand="SELECT Material, damage_id, number_material, office, pmcm_id, id_material FROM sa.Material_List2 WHERE (pmcm_id = @pmcm_id)">
                                    <SelectParameters>
                                        <asp:QueryStringParameter DefaultValue="-1" Name="pmcm_id" QueryStringField="pmcm_id"
                                            Type="String" />
                                    </SelectParameters>
                                    <DeleteParameters>
                                        <asp:Parameter Name="pmcm_id" />
                                        <asp:Parameter Name="id_material" />
                                    </DeleteParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td class="style27">
                                รูปภาพและเอกสาร :
                            </td>
                            <td style="width: 726px">
                                <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" BorderStyle="Double"
                                    CssClass="Grid" DataSourceID="SqlDataSource5" EmptyDataText="หรือเอกสารประกอบ"
                                    Width="100%" DataKeyNames="RUN_ID" BackColor="White" BorderColor="#336666" BorderWidth="3px"
                                    CellPadding="4" GridLines="Horizontal">
                                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle CssClass="shade" BackColor="White" ForeColor="#333333" />
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
                                        <%--<asp:ButtonField CommandName="cmdDelete" HeaderImageUrl="~/images/icon_delete.gif"
                                        Text="Delete">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:ButtonField>--%>
                                    </Columns>
                                    <SelectedRowStyle CssClass="GridSelected" BackColor="#339966" Font-Bold="True" ForeColor="White" />
                                    <FooterStyle BackColor="White" ForeColor="#333333" />
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" BackColor="#336666"
                                        Font-Bold="True" ForeColor="White" />
                                    <AlternatingRowStyle CssClass="GridItemOdd" />
                                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                    <SortedAscendingHeaderStyle BackColor="#487575" />
                                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                    <SortedDescendingHeaderStyle BackColor="#275353" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                                    SelectCommand="SELECT * FROM sa.[Damage_PIC] WHERE ([pmcm_id] = @pmcm_id )">
                                    <SelectParameters>
                                        <asp:QueryStringParameter DefaultValue="-1" Name="pmcm_id" QueryStringField="pmcm_id"
                                            Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                       
                    </table>
                    <table width="99%">
                     <tr>
                            <td class="style25">
                                ข้อแนะนำ ผู้บริหารหน่วยงาน. :
                            </td>
                            <td>
                                <asp:Label ID="Label9" runat="server" ForeColor="Blue" Font-Bold="True">-</asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style16">
                                สถานะงาน :
                            </td>
                            <td>
                                <asp:Label ID="Label10" runat="server" ForeColor="Blue">-</asp:Label>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style21">
                                ข้อแนะนำ ผู้บริหารองค์กร:
                            </td>
                            <td>
                                <asp:Label ID="Label11" runat="server" ForeColor="Blue" Font-Bold="True" Font-Italic="True">-</asp:Label>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style21">
                                &nbsp;<td>
                                    &nbsp;
                                </td>
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                    <poy:tail ID="tail1" runat="server" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
