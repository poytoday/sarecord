<%@ Control Language="VB" AutoEventWireup="false" CodeFile="header.ascx.vb" Inherits="header" %>
<style type="text/css">
    .style1
    {
        height: 80px;
    }
    .style2
    {
        height: 80px;
        width: 273px;
    }
    </style>
<div class="header">
    <!-- A.1 HEADER TOP -->
    <div class="header-top">
        <!-- Sitelogo and sitename -->
        <a class="sitelogo" href="#" title="Go to Start page"></a>
        <div class="sitename">
            <h1>
                <a href="index.html" title="Go to Start page">�ѹ�֡����ѵ��ػ�ó�<span style="font-weight: normal;
                    font-size: 50%;">&nbsp;KM Version</span></a></h1>
            <h2>
                ���.�.�</h2>
        </div>
        <!-- Navigation Level 0 -->
        <div class="nav0">
            <ul>
                <li><a href="#" title="Pagina home in Italiano">
                    <img src="./img/flag_italy.gif" alt="Image description" /></a></li>
                <li><a href="#" title="Homepage auf Deutsch">
                    <img src="./img/flag_germany.gif" alt="Image description" /></a></li>
                <li><a href="#" title="Hemsidan p&aring; svenska">
                    <img src="./img/flag_sweden.gif" alt="Image description" /></a></li>
            </ul>
        </div>
        <!-- Navigation Level 1 -->
        <div class="nav1">
            <ul>
                <li><a href="#" title="Go to Start page">Home</a></li>
                <li><a href="#" title="Get to know who we are">About</a></li>
                <li><a href="#" title="Get in touch with us">Contact</a></li>
                <li><a href="#" title="Get an overview of website">Sitemap</a></li>
            </ul>
        </div>
    </div>
    <!-- A.2 HEADER MIDDLE -->
    <div class="header-middle">
        <!-- Site message -->
        <div class="sitemessage">
            <h1>
                ���»�Ժѵԡ����к��ا�ѡ��</h1>
            <h1>
                Enjoy Your Data</h1>
            <h3>
                <a href="details.aspx">&rsaquo;&rsaquo;&nbsp;More details<asp:GridView ID="GridView1"
                    runat="server" AutoGenerateColumns="False" DataKeyNames="userid" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                        <asp:BoundField DataField="team" HeaderText="team" SortExpression="team" />
                        <asp:BoundField DataField="office" HeaderText="office" SortExpression="office" />
                        <asp:BoundField DataField="userid" HeaderText="userid" ReadOnly="True" SortExpression="userid" />
                    </Columns>
                </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Deviec_SA_V1ConnectionString %>"
                        SelectCommand="SELECT name, team, office, userid FROM sa.[user] WHERE (userid = @userid)">
                        <SelectParameters>
                            <asp:SessionParameter Name="userid" SessionField="UserLogin" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </a>
            </h3>
        </div>
    </div>
    <!-- A.3 HEADER BOTTOM -->
    <div class="header-bottom">
        <!-- Navigation Level 2 (Drop-down menus) -->
        <div class="nav2">
            <!-- Navigation item -->
            <ul>
                <li><a href="#">Start</a>
                    <ul>
                        <li><a href="Login.aspx">Login/Logout</a></li>
                        <li><a href=" recevice_person.aspx">My Order Work</a></li>
                        <li><a href="frist.aspx">My Work</a></li>
                        <li><a href="mylink.aspx">My link</a></li>
                        <li><a href="me_pmcm_list.aspx">My operation</a></li>
                         <li><a href="recevice_person_issue.aspx">My Issuse</a></li>
                        <li><a href="person.aspx">Me</a></li>
                    </ul>
                </li>
                <!-- Navigation item -->
                <li><a href="#">Record<!--[if IE 7]><!--></a><!--<![endif]--><!--[if lte IE 6]><table><tr><td><![endif]-->
                    <ul>
                        <li><a href="Default.aspx">ŧ����ѵ��ػ�ó�</a></li>
                         <li><a href=" healt_index.aspx"> Healt Index Recloser</a></li>
                        <%--<li><a href="layout5.html">Layout-5 (3-col)</a></li>--%>
                    </ul>
                    <!--[if lte IE 6]></td></tr></table></a><![endif]-->
                </li>
                <li><a href="#">Cattalog<!--[if IE 7]><!--></a><!--<![endif]--><!--[if lte IE 6]><table><tr><td><![endif]-->
                    <ul>
                        <li><a href="office.aspx">Ἱ�</a></li>
                        <li><a href="Team2.aspx">������ҹ</a></li>
                        <li><a href="Device_type.aspx">�������ػ�ó�</a></li>
                        <li><a href="Device.aspx">�ػ�ó�</a></li>
                        <li><a href="add_property.aspx">��Ǣ�ͤس���ѵ�</a></li>
                        <li><a href="add_detail_property.aspx">��������´�س���ѵ�</a></li>
                        <li><a href="Materaial.aspx">��ʴ�������ͧ</a></li>
                        <li><a href="Operation.aspx">��û�Ժѵԧҹ</a></li>
                        <li><a href="Damage.aspx">�ҡ�ê��ش</a></li>
                        <li><a href="order_type.aspx">ʶҹС���Ѻ�ҹ</a></li>
                    </ul>
                    <!--[if lte IE 6]></td></tr></table></a><![endif]-->
                </li>
                <li><a href="#">Grid Report<!--[if IE 7]><!--></a><!--<![endif]--><!--[if lte IE 6]><table><tr><td><![endif]-->
                    <ul>
                        <li><a href="wait_work.aspx">�ҹ����ʹ��Թ���</a></li>
                        <li><a href="Report_name_work_wait.aspx">�ҹ�;�ѡ�ҹ���Թ���</a></li>
                        <li><a href="Report_material.aspx">��ʴ�������ͧ</a></li>
                        <li><a href="Device_list.aspx">��������´�ػ�ó�</a></li>
                        <li><a href="Report_Date.aspx">�ҹ�����ǧ����</a></li>
                        <li><a href="report_work_by_time.aspx">����ѵԧҹ����ش</a></li>
                        <li><a href="select_detail_proprety.aspx">�س���ѵ��ػ�ó�</a></li>
                        <li><a href=" report_for_vor9.aspx">�����ػ�ó���С�û�Ժѵԧҹ</a></li>
                    </ul>
                    <!--[if lte IE 6]></td></tr></table></a><![endif]-->
                </li>
                <li><a href="#">KM<!--[if IE 7]><!--></a><!--<![endif]--><!--[if lte IE 6]><table><tr>
                    <td class="style2"><![endif]-->
                    <ul>
                        <li><a href="report_km1.aspx">�������ҡ�ê��ش</a></li>
                        <li><a href="Report_damage_his.aspx">����ѵ��ҡ�ê��ش</a></li>
                        <li><a href="report_damage_his_date.aspx">����ѵ��ҡ�ê��ش(��ǧ����)</a></li>
                        <li><a href="km_name_damage.aspx">��ѡ�ҹ->�ҡ�ê��ش</a></li>
                        <li><a href="km_name_damage_date.aspx">��ѡ�ҹ->�ҡ�ê��ش(��ǧ����)</a></li>
                    </ul>
                    <!--[if lte IE 6]></td></tr></table></a><![endif]-->
                </li>
                <li><a href="#">��ش����ҹ����<!--[if IE 7]><!--></a><!--<![endif]--><!--[if lte IE 6]><table><tr><td><![endif]-->
                    <ul>
                        <li><a href="send_damage.aspx">���ػ�ó���ش<a></li>
                        <li><a href="receive_damage2.aspx">�Ѻ�ҹ����</a></li>
                        <%--<li><a href="list_receive_damage.aspx">���¡�٧ҹ����</a></li>--%>
                        <li><a href="order_section_sum.aspx">��Ǩ�ͺ�ҹ�ҡ��黯Ժѵ�(˼.)</a></li>
                        <li><a href="order_section_his.aspx">���¡�٧ҹ���ʶҹ�(˼.)</a></li>
                        <li><a href="order_region_sum.aspx">��Ǩ�ͺ�ҹ�ҡ˹��§ҹ(͡.)</a></li>
                        <li><a href="order_region_his.aspx">���¡�٧ҹ���ʶҹ�(͡.)</a></li>
                        <%--<li><a href="list_location.aspx">����ѵԡ�������ػ�ó�</a></li>--%>
                    </ul>
                    <!--[if lte IE 6]></td></tr></table></a><![endif]-->
                </li>
                <li><a href="#">Location<!--[if IE 7]><!--></a><!--<![endif]--><!--[if lte IE 6]><table><tr>
                    <td class="style1"><![endif]-->
                    <ul>
                        <li><a href="list_location.aspx">����ѵԡ�������ػ�ó�</a></li>
                        <li><a href="list_changed_location_opid.aspx">����ѵԡ�������ػ�ó�</a></li>
                        <li><a href="list_changed_location_location.aspx">����ѵԡ������¹����ʶҹ���</a></li>
                        <li><a href="list_changed_location_dbname.aspx">����ѵԡ������¹�����ػ�ó�</a></li>
                    </ul>
                    <!--[if lte IE 6]></td></tr></table></a><![endif]-->
                </li>
                <li><a href="#">Delete/Edit</a>
                    <ul>
                        <li><a href="delete_device.aspx">ź�ػ�ó�</a></li>
                        <li><a href="damage_chang.aspx">�����ҡ�ê��ش</a></li>
                    </ul>
                </li>
                <li><a href="#">Administrator</a>
                    <ul>
                        <li><a href="admin_check_user.aspx">��ª��ͼ����ҹ</a></li>
                        <li><a href="all_section.aspx">��ª���Ἱ�</a></li>
                        <li><a href="admin_flag.aspx">��������ҹ</a></li>
                         <li><a href="all_device_admin.aspx">��¡���ػ�ó�</a></li>
                         <li><a href="admin_promisstion_page.aspx">Promisstion Page</a></li>
                         
                        
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <div class="header-breadcrumbs">
        <div class="searchform">
            <%--<fieldset>
                <input value=" Search..." name="field" class="field" />
                <input type="submit" value="GO!" name="button" class="button" />
            </fieldset>--%>
        </div>
    </div>
</div>
