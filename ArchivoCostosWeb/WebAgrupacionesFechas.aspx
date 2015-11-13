<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="WebAgrupacionesFechas.aspx.cs" Inherits="ArchivoCostosWeb.WebAgrupacionesFechas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    
  <title></title>
    <style type="text/css">

        .Grilla {
            /*display:none;*/
            overflow:auto; 
            width:100%; 
            height:675px; 
            align:left;
        }
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }

        .footer { height: 15px; width: 100%; background: #BCC51A url(grd_footer.png) repeat-x top; } 
        .footer td{border: none} 
        .footer th{border: none}

       .Grid td
        {
            background-color: white;
            color: black;
            font-size: 10pt;
            line-height: 200%;
        }

        .Grid th
        {
            background-color: #ffffff;
            color:black;
            height:12px;
            font-size: 8pt;
            line-height: 200%;
        }
        .ChildGrid td
        {
            background-color: #ffffff;
            color: black;
            font-size: 10pt;
            line-height: 200%;
        }
        .ChildGrid th
        {
             background-color: #ffffff;
            color: black;
            font-size: 10pt;
            line-height: 200%;
        }

        

        .Nested_ChildGrid td
        {
             background-color: #ffffff;
            color:black;
            font-size: 10pt;
            line-height: 200%;
        }
        .Nested_ChildGrid th
        {
            background-color: #ffffff !important;
             color:black;
            font-size: 10pt;
            line-height: 200%;
        }
        .Grid {
            text-align: justify;
        }
        .alternateDataRow th{

            background-color: #0EC652;
            color: black;
            font-size: 10pt;
            line-height: 200%;
        }
    </style>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("[id*=imgOrdersShow]").each(function () {
                if ($(this)[0].src.indexOf("minus") != -1) {
                    $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>");
                    $(this).next().remove();
                   
                }
            });
            $("[id*=imgProductsShow]").each(function () {
                if ($(this)[0].src.indexOf("minus") != -1) {
                    $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>");
                    $(this).next().remove();
                }
            });

            $("[id*=imgSemanaShow]").each(function () {
                if ($(this)[0].src.indexOf("minus") != -1) {
                    $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>");
                    $(this).next().remove();
                }
            });

        });
    </script>
 
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
   


     
          <asp:ScriptManager ID="ScriptManager1" runat="server">
          </asp:ScriptManager>
          <asp:Label ID="Label2" runat="server" Font-Names="Calibri" Font-Size="18pt" ForeColor="#B70000" Text="Configuración de Lineas Base"></asp:Label>
                &nbsp;<div id="Grilla" class="Grilla">
               

                    <asp:GridView ID="gvProyectos" runat="server" AutoGenerateColumns="False" CssClass="Grid" GridLines="horizontal"
        DataKeyNames="Proyecto" Height="155px" CellPadding="4" ShowHeader="False" Width="705px" OnRowDataBound="gvProyectos_RowDataBound" EmptyDataText="No Hay Fechas Guardadas,Hasta el Momento">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="imgOrdersShow" runat="server" OnClick="Show_Hide_OrdersGrid"
                        ImageUrl="~/images/plus.GIF" CommandArgument="Show" />
                    <asp:Panel ID="pnlOrders" runat="server" Visible="false" Style="position: relative">
                         <asp:GridView ID="gvMeses" runat="server" AutoGenerateColumns="false" PageSize="12"
                            AllowPaging="true" OnPageIndexChanging="OnOrdersGrid_PageIndexChanging" CssClass="ChildGrid"  GridLines="none"
                            DataKeyNames="Proyecto,Mes" ShowHeader="False" OnRowDataBound="gvMeses_RowDataBound">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgProductsShow" runat="server" OnClick="Show_Hide_ProductsGrid"
                                            ImageUrl="~/images/plus.GIF" CommandArgument="Show" />
                                        <asp:Panel ID="pnlProducts" runat="server" Visible="false" Style="position: relative">
                                           
                                            <asp:GridView ID="gvSemanas" runat="server" AutoGenerateColumns="false" PageSize="12"
                                                AllowPaging="true" OnPageIndexChanging="OnProductsGrid_PageIndexChanging" CssClass="Nested_ChildGrid" HeaderStyle-Height="12px" Font-Size="X-Small"
                                                DataKeyNames="Proyecto,Mes,Semana" GridLines="none" CellPadding="4" ShowHeader="False">
                                                <Columns>
                                                     <asp:TemplateField>
                                                         <ItemTemplate>
                                                            <asp:ImageButton ID="imgSemanaShow" runat="server" OnClick="Show_Hide_SemanasGrid"
                                                                ImageUrl="~/images/plus.GIF" CommandArgument="Show"/>
                                                             <asp:Panel ID="pnlSemanas" runat="server" Visible="false" Style="position: relative">

                                                        
                                                                         <asp:GridView ID="gvFechas" runat="server" AutoGenerateColumns="false" PageSize="12" CellPadding="4"
                                                                            AllowPaging="true" GridLines="Both" OnPageIndexChanging="OnSemanasGrid_PageIndexChanging"  OnRowDataBound="GridView1_RowDataBound" Height="12px" HeaderStyle-Height="12px" Font-Size="X-Small" >

                                                                            <Columns>
                                                                                     <asp:BoundField  DataField="Id"  ItemStyle-Height="12px"    HeaderStyle-Width="180px"  HeaderStyle-ForeColor="#b70000"  HeaderText="Id"  Visible="False"  />
                                                                                     <asp:BoundField  DataField="Fecha" ItemStyle-Height="12px"   HeaderStyle-Width="180px" HeaderStyle-ForeColor="#b70000"  HeaderText="Fecha"   />
                                                                                     <asp:BoundField  DataField="Semana"  ItemStyle-Height="12px"    HeaderStyle-Width="180px" HeaderStyle-ForeColor="#b70000"  HeaderText="Semana"  Visible="False"  />
                                                                                     <asp:BoundField  DataField="Mes" ItemStyle-Height="12px"   HeaderStyle-Width="180px" HeaderStyle-ForeColor="#b70000"  HeaderText ="Mes"  Visible="False"  />
                                                                                     <asp:BoundField  DataField="Proyecto" ItemStyle-Height="12px"   HeaderStyle-Width="180px"  HeaderStyle-ForeColor="#b70000"  HeaderText="Proyecto"  />
               <asp:TemplateField HeaderText="Tipo " SortExpression="Tipo" HeaderStyle-ForeColor="#b70000" >
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Tipo") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblTipo" runat="server" Text='<%# Bind("Tipo") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Borrar " HeaderStyle-ForeColor="#b70000" >
                    <ItemTemplate>
                        <asp:ImageButton ID="ImgEliminar" runat="server" Height="16px" OnCommand="ImgEliminar_Command" OnClientClick="return ('Estas Seguro(a) de Eliminar esta fecha, Recuerda que tiene información de un proyecto almacenado?');" CommandArgument='<%# Eval("Id") %>' ImageUrl="~/images/delete.gif"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ConvertirLB " HeaderStyle-ForeColor="#b70000" >
                    <ItemTemplate>
                        <asp:ImageButton ID="ImgLB" runat="server" Height="16px" OnCommand="ImgLB_Command" OnClientClick="return confirm('Estas Seguro(a) de convertir esta fecha en linea base?');" ImageUrl="~/images/convertirLB.gif"  CommandArgument='<%# Eval("Id") %>'/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField  HeaderText="Excel" HeaderStyle-ForeColor="#b70000" >
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/Excel.png" OnClick="ImageButton1_Click" OnCommand="ImageButton1_Command" CommandArgument='<%# Eval("Id") %>' />
                    </ItemTemplate>
                </asp:TemplateField>



                                                                                
                                                                                
                                                                                
                                                                             </Columns>
                                                                        </asp:GridView>
                                                       
                                                                    
                                                                </asp:Panel>
                                                          </ItemTemplate>
                                                     </asp:TemplateField>
                                                     <asp:BoundField ItemStyle-Width="1200px" ControlStyle-Width="1200px" HeaderStyle-Height="16px" FooterStyle-BorderWidth="1200px" HeaderStyle-Width="1200px" DataField="Semana" HeaderText="Semana"  HeaderStyle-ForeColor="#b70000" />
                                                     <asp:BoundField ItemStyle-Width="1200px" ControlStyle-Width="1200px" HeaderStyle-Height="16px" FooterStyle-BorderWidth="1200px" HeaderStyle-Width="1200px" DataField="Mes" HeaderText="Mes" Visible="False" HeaderStyle-ForeColor="#b70000" />
                                                     <asp:BoundField ItemStyle-Width="1200px" ControlStyle-Width="1200px" HeaderStyle-Height="16px" FooterStyle-BorderWidth="1200px" HeaderStyle-Width="1200px" DataField="Proyecto" HeaderText="Proyecto"  Visible="False" HeaderStyle-ForeColor="#b70000"/>
                                                 </Columns>
                                            </asp:GridView>
                                        </asp:Panel>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField ItemStyle-Width="1200px" ControlStyle-Width="1200px" FooterStyle-BorderWidth="1200px" HeaderStyle-Height="16px" HeaderStyle-Width="1200px" DataField="Id" HeaderText="Id" HeaderStyle-ForeColor="#b70000" Visible="False"/>
                                <asp:BoundField ItemStyle-Width="1200px" ControlStyle-Width="1200px" FooterStyle-BorderWidth="1200px" HeaderStyle-Height="16px" HeaderStyle-Width="1200px" DataField="Mes" HeaderText="Mes"   HeaderStyle-ForeColor="#b70000"/>
                                <asp:BoundField ItemStyle-Width="1200px" ControlStyle-Width="1200px" FooterStyle-BorderWidth="1200px" HeaderStyle-Height="16px" HeaderStyle-Width="1200px" DataField="Proyecto" HeaderText="Proyecto" Visible="False" HeaderStyle-ForeColor="#b70000" />
                            </Columns>
                        </asp:GridView>
                    </asp:Panel>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField  ControlStyle-Width="1200px" FooterStyle-BorderWidth="1200px" HeaderStyle-Width="1200px"   HeaderStyle-Height="16px" DataField="Proyecto" HeaderStyle-ForeColor="#b70000" HeaderText="Proyecto" >

            </asp:BoundField>
        </Columns>
    </asp:GridView>
                    
      

          </div>
    
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ArchivoCostosConnectionString %>" SelectCommand="SELECT [referencia1],
 [referencia2],
 [referencia3], 
[presupuesto], 
[codcapi], 
[capitulo], 
[codunit],
[unitario],
[undunita],
[cantxppto],
[codinsu],
[insumo],
[insutipo],
[unidinsu],
[ctrlinven], [validación], [precioppto], [consumounitario], [consumototal], [adic], [precioaut], [PrecioCompra], [PrecioEntrado], [vlrproy], [VlrTraslado], [xent], [xcomp], [traslado], [sali], [ent], [comp], [aprob], [Ped], [saldoxunit], [SaldoXppto], [vlrEnt], [vlrEnttraslado], [VlrCompradoxent], [vlrxcomp], [vlrejec], [Vlrini], [vlrproyejec] FROM [CostosPptoProg] WHERE ([IdFecha] = @IdFecha)">
            <SelectParameters>
                <asp:SessionParameter Name="IdFecha" SessionField="Fecha" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

    </asp:Content>
 