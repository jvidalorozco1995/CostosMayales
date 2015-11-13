<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="WebInforme.aspx.cs" Inherits="ArchivoCostosWeb.WebInforme" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">

        //metodo para ocultar parametros en jquery
        function OcultarParametros() {
            $('#parametros').hide('slow');
         }
        //metodo para mostrar el reporte
        function MostrarReporte() {
            $('#reporte').show('slow');
        }
        //metodo para ocultar el reporte
        function OcultarReporte() {
            $('#reporte').hide('slow');
        }
        //metodo para mostrar los parametros
        function MostrarParametros() {
            $('#parametros').show('slow');
        }
        //metodo para exportar a excel

        function llamarNuevaVentana() {

            var win = window.open("WebExportarExcelFechas.aspx", '1366002941508'/*, 'width=500,height=200,left=375,top=330'*/);

            setTimeout(function () { win.close(); }, 10000);
        }

    </script>



   <style>
                    #Progress
    {
       position: fixed;
        top: 39%; 
        left: 42%; 
        height:19%; 
        width:18%; 
        z-index: 100001;  
        background-color: #FFFFFF; 
        border:1px solid Gray; 
        background-image:url('images/loader.gif');
        background-repeat: no-repeat; 
        background-position:center;
    }
    #Background
    {
        position: fixed; 
        top: 0px; 
        bottom: 0px; 
        left: 0px; 
        right: 0px; 
        overflow: hidden; 
        padding: 0; 
        margin: 0; 
        background-color: #F0F0F0; 
        filter: alpha(opacity=80); 
        opacity: 0.8; 
        z-index: 100000;
    }


       #Reporte {
         overflow:scroll;
       
       
       }
   </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
       </asp:ScriptManager>
          <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
    <div id="parametros">
           <asp:Label ID="Label6" runat="server" Font-Names="CALIBRI" Font-Size="14pt" ForeColor="#B70000" Text="Informe"></asp:Label>
           <br />
           <br />
           <asp:Label ID="Label5" runat="server" Font-Names="CALIBRI" Font-Size="12pt" ForeColor="#B70000" Text="Proyecto"></asp:Label>
           <br />

           <asp:DropDownList ID="Cmbproyectos" runat="server" AutoPostBack="True" DataSourceID="SqlProyectos" DataTextField="Proyecto" DataValueField="Codigo" Height="19px" Width="230px"></asp:DropDownList>  
           <br />
           <asp:Label ID="Label2" runat="server" Font-Names="CALIBRI" Font-Size="12pt" ForeColor="#B70000" Text="Semana Actual"></asp:Label>
           <br />
           <asp:DropDownList ID="CmbSemanaActual" runat="server" AutoPostBack="True" DataSourceID="SqlFechasCombox" DataTextField="Fecha" DataValueField="Id" Height="19px" Width="230px">
           </asp:DropDownList>
           <br />
           <asp:Label ID="Label3" runat="server" Font-Names="CALIBRI" Font-Size="12pt" ForeColor="#B70000" Text="Semana Pasada"></asp:Label>
           <br />
           <asp:DropDownList ID="CmbSemanaPasada" runat="server" DataSourceID="SqlFechasCombox" DataTextField="Fecha" DataValueField="Id" Height="19px" Width="230px" AutoPostBack="True">
           </asp:DropDownList>
           <br />
           <asp:Label ID="Label4" runat="server" Font-Names="CALIBRI" Font-Size="12pt" ForeColor="#B70000" Text="Linea Base"></asp:Label>
           <br />
           <asp:DropDownList ID="CmbLineaBase" runat="server" Height="19px" Width="230px" AutoPostBack="True" DataSourceID="SqlLineaBase" DataTextField="Fecha" DataValueField="Id" Enabled="False">
           </asp:DropDownList>
      </div>
                            <asp:LinkButton ID="BtnEjecutar" runat="server" Font-Names="CALIBRI" Font-Size="12pt" ForeColor="#B70000" OnClick="BtnEjecutar_Click">Actualizar</asp:LinkButton>
&nbsp;
        <asp:LinkButton ID="BtnComparar" runat="server" Font-Names="Calibri" Font-Size="12pt" ForeColor="#B70000" OnClick="BtnComparar_Click" Visible="false">Compararaciones Semana Pasada</asp:LinkButton>
        &nbsp;<asp:LinkButton ID="BtnCompararLineaBase" runat="server" Font-Names="Calibri" Font-Size="12pt" ForeColor="#B70000" OnClick="BtnCompararLineaBase_Click" Visible="false">Compararaciones Linea Base</asp:LinkButton>
    <%--  &nbsp;<asp:LinkButton ID="BtnProyectado" runat="server" Font-Names="Calibri" Font-Size="12pt" ForeColor="#B70000" OnClick="BtnProyectado_Click" >Proyectado por Presupuestos</asp:LinkButton>
    --%>  &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" Font-Names="Calibri" Font-Size="12pt" ForeColor="#B70000" OnClick="LinkButton1_Click" Visible="true" >Exportar Fechas Escogidas a Excel</asp:LinkButton>
    
                                 </ContentTemplate>
                        

                     </asp:UpdatePanel>     
     <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
       <div id="Background">



            </div>
        <div id="Progress" >
                <h7> <p style="text-align:center"> <b>Procesando Datos, Espere Por Favor... </b> </p> </h7>
            </div>
            
        </ProgressTemplate>
    </asp:UpdateProgress>
        <div id="reporte" style="display:none">
            <asp:LinkButton ID="BtnAtras"  runat="server" ForeColor="#B70000" Font-Names="Calibri" OnClick="BtnAtras_Click" >Atras</asp:LinkButton>
         <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Height="858px" Width="75%" PageCountMode="Actual" SizeToReportContent="True" ZoomPercent="75" ZoomMode="Percent">
             
             <LocalReport ReportPath="Informe.rdlc"> 
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DsFechasObra" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="DsGruposCostosDirectos" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource3" Name="DsDetallesCostosDirectos" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource4" Name="DsGruposCostosIndirectos" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource5" Name="DsDetallesCostosIndirectos" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource6" Name="DsProyeccionGastosGenerales" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource7" Name="DsConsolidadoCostosDirectos" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource8" Name="DsConsolidadoCostosIndirectos" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource9" Name="DsTotalProyecto" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource10" Name="DsConsolidadoCostosDirectosSemanaPasada" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource11" Name="DsConsolidadoCostosDirectosSemanaLineaBase" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource12" Name="DsConsolidadoCostosIndirectosSemanaPasada" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource13" Name="DsConsolidadoCostosIndirectosSemanaLineaBase" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource14" Name="DsGruposCostosDirectosSemanaPasada" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource15" Name="DsGruposCostosDirectosSemanaLineaBase" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource16" Name="DsProyectServer" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
            <asp:ObjectDataSource ID="ObjectDataSource16" runat="server" SelectMethod="GetData" TypeName="ArchivoCostosDataSetTableAdapters.MSP_EpmTask_UserViewTableAdapter" OldValuesParameterFormatString="original_{0}">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Cmbproyectos" Name="Obra" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource15" runat="server" SelectMethod="GetData" TypeName="ArchivoCostosDataSetTableAdapters.VistaGruposCostosIndirectosActivoSemanaLineaBaseTableAdapter" OldValuesParameterFormatString="original_{0}"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource14" runat="server" SelectMethod="GetData" TypeName="ArchivoCostosDataSetTableAdapters.VistaGruposCostosIndirectosActivoSemanaPasadaTableAdapter" OldValuesParameterFormatString="original_{0}"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource13" runat="server" SelectMethod="GetData" TypeName="ArchivoCostosDataSetTableAdapters.VistaConsolidadoCostosIndirectosSemanaLineaBaseTableAdapter" OldValuesParameterFormatString="original_{0}"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource12" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ArchivoCostosDataSetTableAdapters.VistaConsolidadoCostosIndirectosSemanaPasadaTableAdapter"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource11" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ArchivoCostosDataSetTableAdapters.VistaConsolidadoCostosDirectosSemanaLineaBaseTableAdapter"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource10" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ArchivoCostosDataSetTableAdapters.VistaConsolidadoCostosDirectosSemanaPasadaTableAdapter"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource9" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ArchivoCostosDataSetTableAdapters.TotalProyectoTableAdapter"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource8" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ArchivoCostosDataSetTableAdapters.VistaConsolidadoCostosIndirectosTableAdapter"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource7" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ArchivoCostosDataSetTableAdapters.VistaConsolidadoCostosDirectosTableAdapter"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource6" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ArchivoCostosDataSetTableAdapters.VistaProyecciondeGastosGeneralesTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Cmbproyectos" Name="Proyecto" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ArchivoCostosDataSetTableAdapters.VistaDetalleCostosIndirectosTableAdapter"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ArchivoCostosDataSetTableAdapters.VistaGruposCostosIndirectosActivoTableAdapter"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ArchivoCostosDataSetTableAdapters.VistaDetalleCostosDirectosTableAdapter"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ArchivoCostosDataSetTableAdapters.VistaGruposCostosDirectosTableAdapter"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ArchivoCostosDataSetTableAdapters.FechasObraTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Cmbproyectos" Name="Proyecto" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    
       <br />
       <br />
       <br />
       <br />
       <br />
       <br />
       <br />
       <br />
       <br />
       <br />
       <br />
       <br />
       <br />
       <br />
       <br />
    
        <asp:SqlDataSource ID="SqlPresupuestos" runat="server" ConnectionString="<%$ ConnectionStrings:ArchivoCostosConnectionString %>" SelectCommand="select codigoobrainmueble,NombreObra from ParametrizacionIncluida where Proyecto=@Proyecto">
            <SelectParameters>
                <asp:ControlParameter ControlID="Cmbproyectos" Name="Proyecto" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
       <asp:SqlDataSource ID="SqlProyectos" runat="server" ConnectionString="<%$ ConnectionStrings:ArchivoCostosConnectionString %>" SelectCommand="SELECT * FROM [Proyectos]"></asp:SqlDataSource>
       <asp:SqlDataSource ID="SqlLineaBase" runat="server" ConnectionString="<%$ ConnectionStrings:ArchivoCostosConnectionString %>" SelectCommand="SELECT * FROM [Fechas] WHERE (([Tipo] = @Tipo) AND ([Proyecto] = @Proyecto))">
           <SelectParameters>
               <asp:Parameter DefaultValue="True" Name="Tipo" Type="String" />
               <asp:ControlParameter ControlID="Cmbproyectos" Name="Proyecto" PropertyName="SelectedValue" Type="String" />
           </SelectParameters>
       </asp:SqlDataSource>
       <asp:SqlDataSource ID="SqlFechasCombox" runat="server" ConnectionString="<%$ ConnectionStrings:ArchivoCostosConnectionString %>" SelectCommand="SELECT * FROM [Fechas] WHERE (([Proyecto] = @Proyecto) AND ([Tipo]=@Tipo))">
           <SelectParameters>
               <asp:ControlParameter ControlID="Cmbproyectos" Name="Proyecto" PropertyName="SelectedValue" Type="String" />
               <asp:Parameter DefaultValue="False" Name="Tipo" Type="String" />
           </SelectParameters>
       </asp:SqlDataSource>
    <asp:SqlDataSource ID="CargarGrilla" runat="server" ConnectionString="<%$ ConnectionStrings:ArchivoCostosConnectionString %>" SelectCommand="ComparacionesModificacionesGRUPOS" SelectCommandType="StoredProcedure">
            <SelectParameters>
                
                <%--<asp:ControlParameter ControlID="RadioButtonList1" DefaultValue="0" Name="Opcion" PropertyName="SelectedValue" Type="Int32" />
                
                <asp:ControlParameter ControlID="DropDownList1" Name="Grupo" PropertyName="SelectedValue" Type="String" DefaultValue="CTC" />--%>
                <asp:ControlParameter Name="Fecha1" ControlID="CmbSemanaActual" PropertyName="SelectedValue"  Type="Int32" />
                <asp:ControlParameter Name="Fecha2" ControlID="CmbSemanaPasada"  PropertyName="SelectedValue" Type="Int32" />
                <asp:Parameter Name="Opcion" Type="Int32" DefaultValue="0" />
                <asp:Parameter Name="Grupo" DefaultValue="CTC" Type="String" />
            </SelectParameters>
          </asp:SqlDataSource>
    <%--Consulta para traer las lineas agregadas --%>
     <asp:SqlDataSource ID="LineasAgregadas" runat="server" ConnectionString="<%$ ConnectionStrings:ArchivoCostosConnectionString %>"  SelectCommand="  SELECT        referencia1, referencia2, referencia3, presupuesto, codcapi, capitulo, codunit, unitario, undunita, cantxppto, codinsu, insutipo, insumo, unidinsu, ctrlinven, 
                         validación, precioppto, consumounitario, consumototal, adic, precioaut, PrecioCompra, PrecioEntrado, Ped, aprob, comp, ent, sali, traslado, xcomp, xent, 
                         saldoxunit, SaldoXppto, vlrEnt, vlrEnttraslado, VlrCompradoxent, vlrxcomp, VlrTraslado, vlrproy, Vlrini, vlrejec
FROM            dbo.VistaCostosPptoProgSemanaActual as t1


where not exists

(
SELECT        1
FROM            dbo.VistaCostosPptoProgSemanaPasada as t2
WHERE        (t2.referencia1 = t1.referencia1))">
        </asp:SqlDataSource>

      <asp:SqlDataSource ID="LineasRetiradas" runat="server" ConnectionString="<%$ ConnectionStrings:ArchivoCostosConnectionString %>"  SelectCommand="  SELECT        referencia1, referencia2, referencia3, presupuesto, codcapi, capitulo, codunit, unitario, undunita, cantxppto, codinsu, insutipo, insumo, unidinsu, ctrlinven, 
                         validación, precioppto, consumounitario, consumototal, adic, precioaut, PrecioCompra, PrecioEntrado, Ped, aprob, comp, ent, sali, traslado, xcomp, xent, 
                         saldoxunit, SaldoXppto, vlrEnt, vlrEnttraslado, VlrCompradoxent, vlrxcomp, VlrTraslado, vlrproy, Vlrini, vlrejec
FROM            dbo.VistaCostosPptoProgSemanaPasada as t1
     
WHERE
not exists

(
SELECT        1
FROM            dbo.VistaCostosPptoProgSemanaActual as t2
WHERE        (t2.referencia1 = t1.referencia1))">
        </asp:SqlDataSource>
  

    <%--Consulta para traer las lineas agregadas linea base --%>
       <asp:SqlDataSource ID="LineasAgregadasLineaBase" runat="server" ConnectionString="<%$ ConnectionStrings:ArchivoCostosConnectionString %>"  SelectCommand="  SELECT        referencia1, referencia2, referencia3, presupuesto, codcapi, capitulo, codunit, unitario, undunita, cantxppto, codinsu, insutipo, insumo, unidinsu, ctrlinven, 
                         validación, precioppto, consumounitario, consumototal, adic, precioaut, PrecioCompra, PrecioEntrado, Ped, aprob, comp, ent, sali, traslado, xcomp, xent, 
                         saldoxunit, SaldoXppto, vlrEnt, vlrEnttraslado, VlrCompradoxent, vlrxcomp, VlrTraslado, vlrproy, Vlrini, vlrejec
FROM            dbo.VistaCostosPptoProgSemanaActual as t1


where not exists

(
SELECT        1
FROM            dbo.VistaCostosPptoProgSemanaLineaBase as t2
WHERE        (t2.referencia1 = t1.referencia1))">
        </asp:SqlDataSource>

    <%--Consulta para traer las lineas retiradas --%>
     <asp:SqlDataSource ID="LineasRetiradasLineaBase" runat="server" ConnectionString="<%$ ConnectionStrings:ArchivoCostosConnectionString %>"  SelectCommand="  SELECT        referencia1, referencia2, referencia3, presupuesto, codcapi, capitulo, codunit, unitario, undunita, cantxppto, codinsu, insutipo, insumo, unidinsu, ctrlinven, 
                         validación, precioppto, consumounitario, consumototal, adic, precioaut, PrecioCompra, PrecioEntrado, Ped, aprob, comp, ent, sali, traslado, xcomp, xent, 
                         saldoxunit, SaldoXppto, vlrEnt, vlrEnttraslado, VlrCompradoxent, vlrxcomp, VlrTraslado, vlrproy, Vlrini, vlrejec
FROM            dbo.VistaCostosPptoProgSemanaLineaBase as t1
     
WHERE
not exists

(
SELECT        1
FROM            dbo.VistaCostosPptoProgSemanaActual as t2
WHERE        (t2.referencia1 = t1.referencia1))">
        </asp:SqlDataSource>


       </asp:Content>
