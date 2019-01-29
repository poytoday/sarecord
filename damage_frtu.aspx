<%@ Page Language="VB" AutoEventWireup="false" CodeFile="damage_frtu.aspx.vb" Inherits="damage_frtu" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="poy" TagName="header" Src="~/header3.ascx" %>
<%@ Register TagPrefix="poy" TagName="navigation" Src="~/navigation.ascx" %>
<%@ Register TagPrefix="poy" TagName="tail" Src="~/tail.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1 {
            width: 606px;
        }

        .style2 {
            height: 23px;
            width: 188px;
        }

        .style4 {
            height: 32px;
        }

        .style5 {
            width: 606px;
            height: 32px;
        }

        .style7 {
            width: 606px;
            height: 26px;
        }

        .style9 {
            width: 606px;
            height: 46px;
        }

        .style12 {
            width: 188px;
        }

        .style15 {
            width: 606px;
            height: 36px;
        }

        .style17 {
            width: 180px;
            height: 42px;
        }
        .auto-style1 {
            width: 174px;
            height: 32px;
        }
        .auto-style2 {
            width: 174px;
        }
    </style>
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
  
     <script type='text/javascript' src='//code.jquery.com/jquery-1.11.0.js'></script>
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
            <!-- For alternative headers END PASTE here -->
            <!-- B. MAIN -->
                    <div class="header">
                        <div class="nav2">
                            <h3 align="center">ลงประวัติการปฏิบัติงาน</h3>
                        </div>
                    </div>
                    <h3>
                        <table width="99%">
                            <tr>
                                <td>ประเภทอุปกรณ์
                                </td>
                                <td class="style15">
                                    <asp:DropDownList ID="DD_Type_Device" runat="server" AutoPostBack="True" DataSourceID="DS_Type_Device"
                                        DataTextField="type_frtu" DataValueField="ID" Width="309px" Height="31px">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DD_Type_Device"
                                        ErrorMessage="เลือกประเภทอุปกรณ์" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>พื้นที่
                                </td>
                                <td class="style7">
                                    <asp:DropDownList ID="DD_Area" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1"
                                        DataTextField="office" DataValueField="office" Width="310px" Height="31px">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DD_Area"
                                        ErrorMessage="เลือกพื้นที่" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>รหัสอุปกรณ์
                                </td>
                                <td class="style9">
                                    <asp:DropDownList ID="DD_Device" runat="server" AutoPostBack="True" DataSourceID="DS_Device"
                                        DataTextField="opid_location" DataValueField="dbname" Height="31px" Width="310px">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DD_Device"
                                        ErrorMessage="เลือกรหัสอุปกรณ์" ForeColor="Red" ValidationGroup="A"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            </table>
                        
            <table width="99%">
                <tr>
                    <td class="style7">
                        แผนก</td>
                    <td>
                        <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="DS_Team" DataTextField="office"
                            DataValueField="office" RepeatColumns="3" Width="99%">
                        </asp:CheckBoxList>
                    </td>
                </tr>
              
                <tr>
                    <td class="style7">
                        อาการชำรุด
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Height="124px" Width="491px" TextMode="MultiLine"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox1"
                            ErrorMessage="กรอกอาการชำรุด" ForeColor="Red" ValidationGroup="A1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        วันที่ชำรุด
                    </td>
                    <td>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                        <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66"
                            BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
                            ForeColor="#663399" Height="200px" ShowGridLines="True" Visible="False" Width="220px">
                            <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                            <OtherMonthDayStyle ForeColor="#CC9966" />
                            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                            <SelectorStyle BackColor="#FFCC66" />
                            <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                            <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                        </asp:Calendar>
                        <asp:Button ID="Button1" runat="server" Text="วันที่" />
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        เลขหนังสือ
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" Height="28px" Width="495px"></asp:TextBox>
                    </td>
                </tr>
              
                <tr>
                    <td class="style7">
                        หมายเหตุ</td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server" Height="151px" Width="502px" 
                            TextMode="MultiLine"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                            ErrorMessage="กรอกการดำเนินการ" ForeColor="Red" ValidationGroup="A1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        <asp:LinkButton ID="LinkButton2" runat="server" ValidationGroup="A1">เพิ่มการแจ้งอุปกรณ์ชำรุด</asp:LinkButton>
                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="DS_MAX_ID_PMCM"
                            DataTextField="MAX_id" DataValueField="MAX_id" Visible="False">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="DS_MAX_ID_PMCM" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                            SelectCommand="SELECT MAX( receive_damage_id) AS MAX_id FROM sa.Receive_damage">
                        </asp:SqlDataSource>
                       <br/> <asp:Label ID="Label2" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
                         
            <poy:tail ID="tail1" runat="server" />
        </div>
    </form>
</body>
</html>
