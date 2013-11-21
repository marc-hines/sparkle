<?php
/**
 * @class Customer
 *
 *
 */
class Customergrid extends Model {

    static function view($id, $params) {

        global $db;

        $sql = "SELECT ".
            "customer_dbid,".
            "customer_id,".
            "customer_deleted_sw,".
            "customer_deleted_dt,".
            "customer_attention,".
            "customer_name,".
            "customer_addr1,".
            "customer_addr2,".
            "customer_city,".
            "customer_state,".
            "customer_zip,".
            "customer_phone1_desc,".
            "customer_phone1,".
            "customer_phone2_desc,".
            "customer_phone2,".
            "customer_phone3_desc,".
            "customer_phone3,".
            "customer_email1_desc,".
            "customer_email1,".
            "customer_email2_desc,".
            "customer_email2,".
            "customer_notes,".
            "view_invoice_count,".
            "view_last_invoice_dt,".
            "view_job_count".
            " FROM customer_grid_view";

        if (isset($id)) {
            $id_components = explode ( 'DBID::' , $id );
            if (isset($id_components[1])) {
                $sql = $sql." WHERE customer_dbid =".$id_components[1];
            } else if ($id=='SHOW::DELETED') {
                $sql = $sql." WHERE customer_deleted_sw ORDER BY customer_deleted_dt DESC";
            } else if ($id=='SHOW::ACTIVE') {
                $sql = $sql." WHERE NOT customer_deleted_sw ORDER BY customer_id";
            } else if ($id=='SHOW::ALL') {
                // No WHERE clause required
            } else {
                $id_components = explode ( 'SEARCH::' , $id );
                if (isset($id_components[1])) {
                    $sql = $sql." WHERE NOT customer_deleted_sw AND customer_name like '%".$id_components[1]."%';";
                } else {
                    $sql = $sql." WHERE customer_id ='".$id_components[0]."'";
                }
            }
        }

        $results = array();

        foreach ($db->query($sql, PDO::FETCH_ASSOC) as $row) {

            $gridArray = array();
            $gridArray['customer_dbid'] = $row['customer_dbid'];
            $gridArray['customer_id'] = $row['customer_id'];
            $gridArray['customer_deleted_sw'] = $row['customer_deleted_sw'];
            $gridArray['customer_deleted_dt'] = $row['customer_deleted_dt'];
            $gridArray['customer_notes'] = $row['customer_notes'];
            $gridArray['view_invoice_count'] = $row['view_invoice_count'];
            $gridArray['view_last_invoice_dt'] = $row['view_last_invoice_dt'];
            $gridArray['view_job_count'] = $row['view_job_count'];

            $fullName = '';
            $value = trim($row['customer_name']);
            if ($value != null || $value !='' ) {
                $fullName = $value;
            }
            $value = trim($row['customer_attention']);
            if ($value != null && $value !='' ) {
                if ($fullName != null && $fullName !='' ) {
                    $fullName = $fullName . '<br>';
                }
                $fullName = $fullName . '<i>ATTN:</i> ' . $value;
            }
            $gridArray['grid_name'] = $fullName;

            $fullAddress = '';
            $value = trim($row['customer_addr1']);
            if ($value != null && $value !='' ) {
                $fullAddress = $value;
            }

            $value = trim($row['customer_addr2']);
            if ($value != null && $value !='' ) {
                if ($fullAddress != null && $fullAddress !='' ) {
                    $fullAddress = $fullAddress . '<br>';
                }
                $fullAddress = $fullAddress . $value;
            }

            $cityStateZip = '';
            $value = trim($row['customer_city']);
            if ($value != null && $value !='' ) {
                $cityStateZip = $cityStateZip . $value . ' ';
            }
            $value = trim($row['customer_state']);
            if ($value != null && $value !='' ) {
                $cityStateZip = $cityStateZip . $value . ', ';
            }
            $value = trim($row['customer_zip']);
            if ($value != null && $value !='' ) {
                $cityStateZip = $cityStateZip . $value ;
            }

            if ($cityStateZip != null && $cityStateZip !='' ) {
                if ($fullAddress != null && $fullAddress !='' ) {
                    $fullAddress = $fullAddress . '<br>';
                }
                $fullAddress = $fullAddress . $cityStateZip;
            }

            $gridArray['grid_addr'] = $fullAddress;

            $phones = '';
            $value = trim($row['customer_phone1']);
            if ($value != null && $value !='' ) {
                $descValue = trim($row['customer_phone1_desc']);
                $phones = $phones . '<i>'.$descValue.':</i> ' . $value ;
            }
            $value = trim($row['customer_phone2']);
            if ($value != null && $value !='' ) {
                if ($phones != null && $phones !='' ) {
                    $phones = $phones . '<br>';
                }
                $descValue = trim($row['customer_phone2_desc']);
                $phones = $phones . '<i>'.$descValue.':</i> ' . $value ;
            }
            $value = trim($row['customer_phone3']);
            if ($value != null && $value !='' ) {
                if ($phones != null && $phones !='' ) {
                    $phones = $phones .  '<br>';
                }
                $descValue = trim($row['customer_phone3_desc']);
                $phones = $phones . '<i>'.$descValue.':</i> ' . $value ;
            }
            $value = trim($row['customer_email1']);
            if ($value != null && $value !='' ) {
                if ($phones != null && $phones !='' ) {
                    $phones = $phones . '<br>';
                }
                $descValue = trim($row['customer_email1_desc']);
                $phones = $phones . '<i>'.$descValue.':</i> ' . $value ;
            }
            $value = trim($row['customer_email2']);
            if ($value != null && $value !='' ) {
                if ($phones != null && $phones !='' ) {
                    $phones = $phones . '<br>';
                }
                $descValue = trim($row['customer_email2_desc']);
                $phones = $phones . '<i>'.$descValue.':</i> ' . $value ;
            }

            $gridArray['grid_phones'] = $phones;

            array_push($results, $gridArray);
        }

        return $results;
    }

    static function destroy($id, $params) {

        global $db;

        $dbid = $params->customer_dbid;

        $statement = $db->prepare('UPDATE customer SET customer_deleted_sw = NOT(customer_deleted_sw) WHERE customer_dbid = :customer_dbid');
        $statement->execute( array(':customer_dbid' => $dbid) );

        return Customergrid::view('DBID::'.$dbid, $params);
    }

}

