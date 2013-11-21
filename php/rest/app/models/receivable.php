<?php
/**
 * @class Receivable
 *
 *
 */
class Receivable extends Model {

    static function view($id, $params) {

        global $db;

        $sql = "SELECT ".
            'customer_dbid,'.
            'customer_id,'.
            'invoice_dbid,'.
            'invoice_id,'.
            'invoice_dt,'.
            'invoice_total_amt,'.
            'view_days_aged,'.
            'view_balance_current,'.
            'view_balance_31_60,'.
            'view_balance_61_90,'.
            'view_balance_91_120,'.
            'view_balance_over_120,'.
            'invoice_desc,'.
            'customer_attention,'.
            'customer_name,'.
            'customer_addr1,'.
            'customer_addr2,'.
            'customer_city,'.
            'customer_state,'.
            'customer_zip,'.
            'customer_phone1_desc,'.
            'customer_phone1,'.
            'customer_phone2_desc,'.
            'customer_phone2,'.
            'customer_phone3_desc,'.
            'customer_phone3,'.
            'customer_email1_desc,'.
            'customer_email1,'.
            'customer_email2_desc,'.
            'customer_email2,'.
            'customer_po'.
            " FROM ar_ageing_view";

        if (isset($id)) {
            $id_components = explode ( 'DBID::' , $id );
            if (isset($id_components[1])) {
                $sql = $sql." WHERE customer_dbid =".$id_components[1];
            } else if ($id=='SHOW::ALL') {
                // No WHERE clause required
            } else {
                $sql = $sql." WHERE customer_id ='".$id_components[0]."'";
            }
        }
        $sql = $sql." ORDER BY customer_id,invoice_dt DESC" ;

        $results = array();

        foreach ($db->query($sql, PDO::FETCH_ASSOC) as $row) {
            array_push($results, $row);
        }

        return $results;
    }
}
