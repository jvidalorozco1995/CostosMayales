<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LineasRetiradas.aspx.cs" Inherits="WebCostosPresupuestos.LineasRetiradas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="css/pagina.css" type="text/css" /> 
    <style type="text/css">
        .auto-style1 {
            text-align: left;
        }
        .auto-style2 {
            height: 38px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="LINEAS RETIRADAS"></asp:Label>
                </td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    &nbsp;<asp:Label ID="Label4" runat="server" Text="Proyecto"></asp:Label>
                </td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:TextBox ID="TxtProyecto" runat="server" Enabled="False" Width="226px" xmlns:asp="#Fecha"  ></asp:TextBox>
                       </td>
                <td style="text-align: left">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">Semana Actual</td>
                <td style="text-align: left">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:TextBox ID="TxtSemanaActual" runat="server" Enabled="False" Width="226px" xmlns:asp="#Fecha"  ></asp:TextBox>
                    </td>
                <td style="text-align: left">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    Semana Pasada</td>
                <td style="text-align: left">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:TextBox ID="TxtSemanaPasada" runat="server" Enabled="False" Width="226px" xmlns:asp="#Fecha"  ></asp:TextBox>
                    </td>
                <td style="text-align: left">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td style="text-align: left">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Button ID="BtnExportar" runat="server" OnClick="BtnExportar_Click" Text="Exportar a Excel" Width="242px" />
                </td>
                <td style="text-align: left">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1" colspan="2">
                        
                           
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" Height="118px" Width="441px" DataSourceID="LineasRetiradasSQLDATASOURCE" EmptyDataText="No hay lineasretiradas para mostrar">
                        <Columns>
                            <asp:BoundField DataField="referencia1" HeaderText="referencia1" SortExpression="referencia1" />
                            <asp:BoundField DataField="referencia2" HeaderText="referencia2" SortExpression="referencia2" />
                            <asp:BoundField DataField="referencia3" HeaderText="referencia3" SortExpression="referencia3" />
                            <asp:BoundField DataField="presupuesto" HeaderText="presupuesto" SortExpression="presupuesto" />
                            <asp:BoundField DataField="codcapi" HeaderText="codcapi" SortExpression="codcapi" />
                            <asp:BoundField DataField="capitulo" HeaderText="capitulo" SortExpression="capitulo" />
                            <asp:BoundField DataField="codunit" HeaderText="codunit" SortExpression="codunit" />
                            <asp:BoundField DataField="unitario" HeaderText="unitario" SortExpression="unitario" />
                            <asp:BoundField DataField="undunita" HeaderText="undunita" SortExpression="undunita" />
                            <asp:BoundField DataField="cantxppto" HeaderText="cantxppto" SortExpression="cantxppto" />
                            <asp:BoundField DataField="codinsu" HeaderText="codinsu" SortExpression="codinsu" />
                            <asp:BoundField DataField="insutipo" HeaderText="insutipo" SortExpression="insutipo" />
                            <asp:BoundField DataField="insumo" HeaderText="insumo" SortExpression="insumo" />
                            <asp:BoundField DataField="unidinsu" HeaderText="unidinsu" SortExpression="unidinsu" />
                            <asp:BoundField DataField="ctrlinven" HeaderText="ctrlinven" SortExpression="ctrlinven" />
                            <asp:BoundField DataField="validación" HeaderText="validación" SortExpression="validación" />
                            <asp:BoundField DataField="precioppto" HeaderText="precioppto" SortExpression="precioppto" />
                            <asp:BoundField DataField="consumounitario" HeaderText="consumounitario" SortExpression="consumounitario" />
                            <asp:BoundField DataField="consumototal" HeaderText="consumototal" SortExpression="consumototal" />
                            <asp:BoundField DataField="adic" HeaderText="adic" SortExpression="adic" />
                            <asp:BoundField DataField="precioaut" HeaderText="precioaut" SortExpression="precioaut" />
                            <asp:BoundField DataField="PrecioCompra" HeaderText="PrecioCompra" SortExpression="PrecioCompra" />
                            <asp:BoundField DataField="PrecioEntrado" HeaderText="PrecioEntrado" SortExpression="PrecioEntrado" />
                            <asp:BoundField DataField="Ped" HeaderText="Ped" SortExpression="Ped" />
                            <asp:BoundField DataField="aprob" HeaderText="aprob" SortExpression="aprob" />
                            <asp:BoundField DataField="comp" HeaderText="comp" SortExpression="comp" />
                            <asp:BoundField DataField="ent" HeaderText="ent" SortExpression="ent" />
                            <asp:BoundField DataField="sali" HeaderText="sali" SortExpression="sali" />
                            <asp:BoundField DataField="traslado" HeaderText="traslado" SortExpression="traslado" />
                            <asp:BoundField DataField="xcomp" HeaderText="xcomp" SortExpression="xcomp" />
                            <asp:BoundField DataField="xent" HeaderText="xent" SortExpression="xent" />
                            <asp:BoundField DataField="saldoxunit" HeaderText="saldoxunit" SortExpression="saldoxunit" />
                            <asp:BoundField DataField="SaldoXppto" HeaderText="SaldoXppto" SortExpression="SaldoXppto" />
                            <asp:BoundField DataField="vlrEnt" HeaderText="vlrEnt" SortExpression="vlrEnt" />
                            <asp:BoundField DataField="vlrEnttraslado" HeaderText="vlrEnttraslado" SortExpression="vlrEnttraslado" />
                            <asp:BoundField DataField="VlrCompradoxent" HeaderText="VlrCompradoxent" SortExpression="VlrCompradoxent" />
                            <asp:BoundField DataField="vlrxcomp" HeaderText="vlrxcomp" SortExpression="vlrxcomp" />
                            <asp:BoundField DataField="VlrTraslado" HeaderText="VlrTraslado" SortExpression="VlrTraslado" />
                            <asp:BoundField DataField="vlrproy" HeaderText="vlrproy" SortExpression="vlrproy" />
                            <asp:BoundField DataField="Vlrini" HeaderText="Vlrini" SortExpression="Vlrini" />
                            <asp:BoundField DataField="vlrejec" HeaderText="vlrejec" SortExpression="vlrejec" />
                        </Columns>
                    </asp:GridView>
                                
                               
                </td>
            </tr>
        </table>
    
            <div>
                <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="LblActual" runat="server" Text="LblActual" Visible="False"></asp:Label>
                    <br />
                    <asp:Label ID="LblPasada" runat="server" Text="LblPasada" Visible="False"></asp:Label>
                </td>
               
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:SqlDataSource ID="LineasRetiradasSQLDATASOURCE" runat="server" ConnectionString="<%$ ConnectionStrings:ArchivoCostosConnectionString %>" SelectCommand="  SELECT        referencia1, referencia2, referencia3, presupuesto, codcapi, capitulo, codunit, unitario, undunita, cantxppto, codinsu, insutipo, insumo, unidinsu, ctrlinven, 
                         validación, precioppto, consumounitario, consumototal, adic, precioaut, PrecioCompra, PrecioEntrado, Ped, aprob, comp, ent, sali, traslado, xcomp, xent, 
                         saldoxunit, SaldoXppto, vlrEnt, vlrEnttraslado, VlrCompradoxent, vlrxcomp, VlrTraslado, vlrproy, Vlrini, vlrejec
FROM            dbo.CostosPorFechas as t1
WHERE        (IdFecha = @SemanaActual)  

and not exists

(
SELECT        1
FROM            dbo.VistaCostosPptoProg as t2
WHERE        (IdFecha = @SemanaPasada and t2.referencia1 = t1.referencia1))" OnSelecting="LineasRetiradasSQLDATASOURCE_Selecting">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="LblPasada" Name="SemanaActual" PropertyName="Text" Type="String" DefaultValue="" />
                            <asp:ControlParameter ControlID="LblActual" Name="SemanaPasada" PropertyName="Text" Type="String" DefaultValue="" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
                    </table>               

            </div>
    </div>
    </form>
     
                    </body>
</html>
