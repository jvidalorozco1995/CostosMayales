<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ErrorGenerico.aspx.cs" Inherits="ArchivoCostosWeb.ErrorGenerico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        /*cajas que te dibujan el div*/       
        #caja {
         width: 60%;
         margin: 0 auto;
         border:1px solid #B70000;
        }         

        #caja2 {
         width: 60%;
         margin: 0 auto;
         border:1px solid #808080;
        }    
    </style>
    <script src="js/jquery-1.2.6.min.js"></script>
    <script type="text/ecmascript">
        $( document ).ready(function() {
            setTimeout(function () {
                //restaurar la pagina atras
                javascript:history.back(1);
            }, 6000);
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
         <div id="caja" style="background:#B70000">
            <asp:Label ID="Label1" runat="server" Font-Bold="true" Text="Vuelve a Intentarlo..!"  Font-Names="Calibri" Font-Size="13pt" ForeColor="#FFFFFFF" ></asp:Label>
        </div>
         <div id="caja2" style="background-color: #EFF5A3">
             <p style="font-family:Calibri">
                 Ha ocurrido un error interno en el servidor, por favor vuelve a intentar mas tarde
                 o comunitace con el administrador de la pagina, seras dirigido a donde te encontrabas..
             </p>
        </div>
    </form>
</body>
</html>
