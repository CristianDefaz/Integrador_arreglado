<?php
require_once('cls_conexion.model.php');
class Clase_Pagos
{
    // ******************************************************************************************************************************************************************************************************************
    // ******************************************************************************************************************************************************************************************************************
    public function todos()
    {
        try {
            $con = new Clase_Conectar_Base_Datos();
            $con = $con->ProcedimientoConectar();
            $cadena = "SELECT productospago.*,clientes.Nombre FROM productospago
            INNER JOIN clientes ON productospago.ClienteID = clientes.ClienteID";
            $result = mysqli_query($con, $cadena);
            return $result;
        } catch (Throwable $th) {
            return $th->getMessage();
        } finally {
            $con->close();
        }
    }
    // ******************************************************************************************************************************************************************************************************************
    // ******************************************************************************************************************************************************************************************************************
    // public function uno($codigo)
    // {
    //     try {
    //         $con = new Clase_Conectar_Base_Datos();
    //         $con = $con->ProcedimientoConectar();
    //         $cadena = "SELECT * FROM `palabrasia` WHERE codigo=$codigo";
    //         $result = mysqli_query($con, $cadena);
    //         return $result;
    //     } catch (Throwable $th) {
    //         return $th->getMessage();
    //     } finally {
    //         $con->close();
    //     }
    // }
    // ******************************************************************************************************************************************************************************************************************
    // ******************************************************************************************************************************************************************************************************************
    // public function insertar($palabras)
    // {
    //     try {
    //         $con = new Clase_Conectar_Base_Datos();
    //         $con = $con->ProcedimientoConectar();
    //         $cadena = "INSERT INTO `palabrasia`(`palabras`) VALUES ('$palabras')";
    //         //$cadena =sprintf("INSERT INTO `palabrasia`(`Cedula`, `Nombres`, `Apellcodigoos`, `Telefono`, `Correo`, `Contrasenia`, `Rol`) VALUES('%s','%s','%s','%s','%s','%s','%s'",mysqli_real_escape_string($con,$Cedula));
    //         $result = mysqli_query($con, $cadena);
    //         return 'ok';
    //     } catch (Throwable $th) {
    //         return $th->getMessage();
    //     } finally {
    //         $con->close();
    //     }
    // }
    // ******************************************************************************************************************************************************************************************************************
    // ******************************************************************************************************************************************************************************************************************
    // public function actualizar($codigo, $palabras)
    // {
    //     try {
    //         $con = new Clase_Conectar_Base_Datos();
    //         $con = $con->ProcedimientoConectar();
    //         $cadena = "UPDATE `palabrasia` SET `palabras`='$palabras' WHERE `codigo`=$codigo";
    //         $result = mysqli_query($con, $cadena);
    //         return "ok";
    //     } catch (Throwable $th) {
    //         return $th->getMessage();
    //     } finally {
    //         $con->close();
    //     }
    // }
    // ******************************************************************************************************************************************************************************************************************
    // ******************************************************************************************************************************************************************************************************************
    // public function eliminar($codigo)
    // {
    //     try {
    //         $con = new Clase_Conectar_Base_Datos();
    //         $con = $con->ProcedimientoConectar();
    //         $cadena = "DELETE FROM  `palabrasia` WHERE `codigo`=$codigo";
    //         $result = mysqli_query($con, $cadena);
    //         return "ok";
    //     } catch (Throwable $th) {
    //         return $th->getMessage();
    //     } finally {
    //         $con->close();
    //     }
    // }
    // ******************************************************************************************************************************************************************************************************************
    // ******************************************************************************************************************************************************************************************************************

}
