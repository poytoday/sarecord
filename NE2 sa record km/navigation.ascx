<%@ Control Language="VB" AutoEventWireup="false" CodeFile="navigation.ascx.vb" Inherits="navigation" %>
<style type="text/css">

*{padding:0; margin:0;}
 </style>
&nbsp;<div class="main-navigation">
    <!-- Navigation Level 3 -->
    <div class="round-border-topright">
    </div>
    <h1 class="first">
        เมนูแนะนำ</h1>
    <!-- Navigation with grid style -->
    <dl class="nav3-grid">
        <%--   <dt><a href="car.aspx">ประวัติการใช้รถยนตร์</a>
            <dt><a href="load_report.aspx">Load Report</a>--%>
        <%--      <dt><a href="#">Status RTU Down</a></dt>
            <dd><a href="#">Long Time</a></dd>
            <dd><a href="#">Frequacy Time</a></dd>
        <dt><a href="load_report.aspx">Load Report</a></dt>
            <dd><a href="#">Peak Load</a></dd>
            <dd><a href="#">Monthly Report</a></dd>
            <dd><a href="#">Feeder Peak Load</a></dd>
        <dt><a href="#">Load 01</a></dt>
        <dt><a href="#">แจ้งอุปกรณ์ชำรุด</a></dt>
        <dt><a href="#">Alarm Maintenance</a></dt>--%>
        <%--      </dt>
        </dt>--%>
    </dl>
    <!-- Template infos -->
    <h1>
        จำนวนอุปกรณ์ที่รอการตรวจซ่อม
    </h1>
    <br />
    <h3>
        Web Application นี้ถูกพัฒนาขึ้นโดยทีมงาน DMS ผอค.กคร.น.3 เพื่อใช้ในการลงบันทึกการตรวจซ่อมและบำรุงรักษาอุปกรณ์ที่
        ผอค.ดูแล</h3>
    <%--<a href="cscs.aspx">cscs.page</a>--%>
    <%--<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/sf6db.mdb"
        SelectCommand="SELECT COUNT(data8) AS Expr1 FROM DATA WHERE (data8 <> 'สำเร็จ')">
    </asp:AccessDataSource>
    <p>
        <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/recdb.mdb"
            SelectCommand="SELECT COUNT(data8) AS Expr1 FROM DATA WHERE (data8 <> 'สำเร็จ')">
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDataSource3" runat="server" DataFile="~/App_Data/capdb.mdb"
            SelectCommand="SELECT COUNT(data8) AS Expr1 FROM DATA WHERE (data8 <> 'สำเร็จ')">
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDataSource4" runat="server" DataFile="~/App_Data/avrdb.mdb"
            SelectCommand="SELECT COUNT(data8) AS Expr1 FROM DATA WHERE (data8 <> 'สำเร็จ')">
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDataSource5" runat="server" DataFile="~/App_Data/comdb.mdb"
            SelectCommand="SELECT COUNT(data8) AS Expr1 FROM DATA WHERE (data8 <> 'สำเร็จ')">
        </asp:AccessDataSource>
        &nbsp;</p>--%>
    <%--
    <h1>
        Easyflex Series</h1>
    <p>
        A new designs series that is simple, easy and fresh. This template is ideal for
        those who have no or very little experience of XHTML/CSS and who prefer to edit
        the contents in FrontPage, Dreamweaver or other popular editors.</p>
    <h3>--%>
    <%--        Easyflex-1</h3>
    <p>
        Plan: Third Quarter 2007<br />
        <a href="http://www.1-2-3-4.info/webtemplates/">Check if available!</a></p>--%>
</div>
