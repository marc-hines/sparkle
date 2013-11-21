<?php
/**
 * @class Invoice
 *
 * $params->invoice_dbid
 * $params->invoice_customer_dbid
 * $params->invoice_deleted_sw 
 * $params->invoice_deleted_dt
 * $params->invoice_id 
 * $params->invoice_dt  
 * $params->invoice_desc  
 * $params->invoice_total_amt 
 * $params->invoice_status
 * $params->invoice_received_amt 
 * $params->invoice_balance_amt
 * $params->invoice_posted_dt 
 * $params->invoice_message 
 * 
 */
class Invoice extends Model {

    static function view($id, $params) {

        global $db;

        $sql = "SELECT ".
            "invoice_dbid,".
            "invoice_customer_dbid,".
            "invoice_deleted_sw,".
            "invoice_deleted_dt,".
            "invoice_id,".
            "invoice_dt,".
            "invoice_desc,".
            "invoice_total_amt,".
            "invoice_status,".
            "invoice_received_amt,".
            "invoice_balance_amt,".
            "invoice_posted_dt,".
            "invoice_message".
            " FROM invoice WHERE";

        if (isset($id)) {
            $id_components = explode ( 'DBID::' , $id );
            if (isset($id_components[1])) {
                $sql = $sql." invoice_dbid =".$id_components[1];
            } else if ($id=='SHOW::DELETED') {
                $sql = $sql." invoice_deleted_sw ORDER BY invoice_deleted_dt DESC LIMIT 1000";
            } else {
                $sql = $sql." invoice_id ='".$id_components[0]."'";
            }
        } else {
            $sql = $sql." NOT invoice_deleted_sw ORDER BY invoice_id LIMIT 25";
        }

        $results = array();

        foreach ($db->query($sql, PDO::FETCH_ASSOC) as $row) {
            array_push($results, $row);
        }

        return $results;
    }

}

