<?php
/**
 * @class Receivable
 *
 *
 */
class Collectionsummary extends Model {

    static function view($id, $params) {

        global $db;

        $sql = "SELECT ".
            'customer_dbid,'.
            'customer_id,'.
            'customer_name,'.
            'view_invoice_count,'.
            'view_balance_31_45,'.
            'view_balance_46_60,'.
            'view_balance_61_90,'.
            'view_balance_over_90,'.
            'customer_notes,'.
            'customer_ar_notes'.
            " FROM ar_collections_summary_view";

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
        $sql = $sql." ORDER BY customer_id" ;

        $results = array();

        foreach ($db->query($sql, PDO::FETCH_ASSOC) as $row) {
            array_push($results, $row);
        }

        return $results;
    }
}
