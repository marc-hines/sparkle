<?php
/**
 * @class Message
 *
 * 
 */
class Invoicebehavior extends Model {

    static function view($id, $params) {

        global $db;

        $sql = "SELECT ".
            "invoice_behavior_dbid,".
            "invoice_behavior_id,".
            "invoice_behavior_desc".
            " FROM invoice_behavior";

        if (isset($id)) {
            $id_components = explode ( 'DBID::' , $id );
            if (isset($id_components[1])) {
                $sql = $sql." WHERE invoice_behavior_dbid =".$id_components[1];
            } else if ($id=='SHOW::ACTIVE') {
                // No WHERE clause required
            } else if ($id=='SHOW::ALL') {
                // No WHERE clause required
            } else {
                $sql = $sql." WHERE invoice_behavior_id ='".$id_components[0]."'";
            }
        }

        $results = array();

        foreach ($db->query($sql, PDO::FETCH_ASSOC) as $row) {
            array_push($results, $row);
        }

        return $results;
    }
 
}
