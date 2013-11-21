<?php
/**
 * @class Message
 *
 * 
 */
class Invoicefrequency extends Model {

    static function view($id, $params) {

        global $db;

        $sql = "SELECT ".
            "invoice_frequency_dbid,".
            "invoice_frequency_id,".
            "invoice_frequency_desc".
            " FROM invoice_frequency";

        if (isset($id)) {
            $id_components = explode ( 'DBID::' , $id );
            if (isset($id_components[1])) {
                $sql = $sql." WHERE invoice_frequency_dbid =".$id_components[1];
            } else if ($id=='SHOW::ACTIVE') {
                // No WHERE clause required
            } else if ($id=='SHOW::ALL') {
                // No WHERE clause required
            } else {
                $sql = $sql." WHERE invoice_frequency_id ='".$id_components[0]."'";
            }
        }

        $results = array();

        foreach ($db->query($sql, PDO::FETCH_ASSOC) as $row) {
            array_push($results, $row);
        }

        return $results;
    }
 
}
