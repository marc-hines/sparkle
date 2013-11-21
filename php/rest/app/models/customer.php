<?php
/**
 * @class Customer
 *
 * $params->customer_dbid
 * $params->customer_deleted_sw 
 * $params->customer_deleted_dt
 * $params->customer_id 
 * $params->customer_attention  
 * $params->customer_name  
 * $params->customer_addr1  
 * $params->customer_addr2 
 * $params->customer_city 
 * $params->customer_state 
 * $params->customer_zip 
 * $params->customer_phone1 
 * $params->customer_phone2  
 * $params->customer_fax   
 * $params->customer_email 
 * $params->customer_notes
 * $params->customer_ar_notes
 * $params->customer_net 
 * $params->customer_po 
 * $params->customer_message_dbid 
 * 
 */
class Customer extends Model {


    static function create($id, $params) {

        global $db;

        $sql = "INSERT INTO customer( ".
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
            "customer_phone1,".
            "customer_phone2,".
            "customer_fax,".
            "customer_email,".
            "customer_notes,".
            "customer_ar_notes,".
            "customer_net,".
            "customer_po,".
            "customer_invoice_behavior_dbid,".
            "customer_invoice_frequency_dbid,".
            "customer_message_dbid".
            ") VALUES(".
            ":customer_id,".
            ":customer_deleted_sw,".
            ":customer_deleted_dt,".
            ":customer_attention,".
            ":customer_name,".
            ":customer_addr1,".
            ":customer_addr2,".
            ":customer_city,".
            ":customer_state,".
            ":customer_zip,".
            ":customer_phone1,".
            ":customer_phone2,".
            ":customer_fax,".
            ":customer_email,".
            ":customer_notes,".
            ":customer_ar_notes,".
            ":customer_net,".
            ":customer_po,".
            ":customer_invoice_behavior_dbid,".
            ":customer_invoice_frequency_dbid,".
            ":customer_message_dbid".
            ")";

        $statement = $db->prepare($sql);
        $statement->execute( array(
            ":customer_id"=>$params->customer_id,
            ":customer_deleted_sw"=>$params->customer_deleted_sw,
            ":customer_deleted_dt"=>$params->customer_deleted_dt,
            ":customer_attention"=>$params->customer_attention,
            ":customer_name"=>$params->customer_name,
            ":customer_addr1"=>$params->customer_addr1,
            ":customer_addr2"=>$params->customer_addr2,
            ":customer_city"=>$params->customer_city,
            ":customer_state"=>$params->customer_state,
            ":customer_zip"=>$params->customer_zip,
            ":customer_phone1"=>$params->customer_phone1,
            ":customer_phone2"=>$params->customer_phone2,
            ":customer_fax"=>$params->customer_fax,
            ":customer_email"=>$params->customer_email,
            ":customer_notes"=>$params->customer_notes,
            ":customer_ar_notes"=>$params->customer_ar_notes,
            ":customer_net"=>$params->customer_net,
            ":customer_po"=>$params->customer_po,
            ":customer_invoice_behavior_dbid"=>$params->customer_invoice_behavior_dbid,
            ":customer_invoice_frequency_dbid"=>$params->customer_invoice_frequency_dbid,
            ":customer_message_dbid"=>$params->customer_message_dbid
            ) );

        $dbid = $db->lastInsertId();

        return Customer::view('DBID::'.$dbid, $params);
    }

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
            "customer_ar_notes,".
            "customer_po,".
            "customer_invoice_behavior_dbid,".
            "customer_invoice_frequency_dbid,".
            "customer_message_dbid".
            " FROM customer";

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
                $sql = $sql." WHERE customer_id ='".$id_components[0]."'";
            }
        }

        $results = array();
        $rowForEditing = array();

        foreach ($db->query($sql, PDO::FETCH_ASSOC) as $row) {

            foreach ($row as $key => $value) {
                $rowForEditing[$key] = $value;
                $rowForEditing['OLD_'.$key] = $value;
            }
            array_push($results, $rowForEditing);

        }

        return $results;
    }

    static function update($id, $params) {

        global $db;

        $dbid = $params->customer_dbid;

        $sqlColumns = array();
        $sqlValues = array();

        if ($params->customer_id !== $params->OLD_customer_id) {
            $sqlColumns["customer_id=:customer_id"] = null;
            $sqlValues[":customer_id"] = $params->customer_id;
        }

        if ($params->customer_deleted_sw !== $params->OLD_customer_deleted_sw) {
            $sqlColumns["customer_deleted_sw=:customer_deleted_sw"] = null;
            $sqlValues[":customer_deleted_sw"] = $params->customer_deleted_sw;
        }

        if ($params->customer_attention !== $params->OLD_customer_attention) {
            $sqlColumns["customer_attention=:customer_attention"] = null;
            $sqlValues[":customer_attention"] = $params->customer_attention;
        }

        if ($params->customer_name !== $params->OLD_customer_name) {
            $sqlColumns["customer_name=:customer_name"] = null;
            $sqlValues[":customer_name"] = $params->customer_name;
        }

        if ($params->customer_addr1 !== $params->OLD_customer_addr1) {
            $sqlColumns["customer_addr1=:customer_addr1"] = null;
            $sqlValues[":customer_addr1"] = $params->customer_addr1;
        }

        if ($params->customer_addr2 !== $params->OLD_customer_addr2) {
            $sqlColumns["customer_addr2=:customer_addr2"] = null;
            $sqlValues[":customer_addr2"] = $params->customer_addr2;
        }

        if ($params->customer_city !== $params->OLD_customer_city) {
            $sqlColumns["customer_city=:customer_city"] = null;
            $sqlValues[":customer_city"] = $params->customer_city;
        }

        if ($params->customer_state !== $params->OLD_customer_state) {
            $sqlColumns["customer_state=:customer_state"] = null;
            $sqlValues[":customer_state"] = $params->customer_state;
        }

        if ($params->customer_zip !== $params->OLD_customer_zip) {
            $sqlColumns["customer_zip=:customer_zip"] = null;
            $sqlValues[":customer_zip"] = $params->customer_zip;
        }

        if ($params->customer_phone1_desc !== $params->OLD_customer_phone1_desc) {
            $sqlColumns["customer_phone1_desc=:customer_phone1_desc"] = null;
            $sqlValues[":customer_phone1_desc"] = $params->customer_phone1_desc;
        }

        if ($params->customer_phone1 !== $params->OLD_customer_phone1) {
            $sqlColumns["customer_phone1=:customer_phone1"] = null;
            $sqlValues[":customer_phone1"] = $params->customer_phone1;
        }

        if ($params->customer_phone2_desc !== $params->OLD_customer_phone2_desc) {
            $sqlColumns["customer_phone2_desc=:customer_phone2_desc"] = null;
            $sqlValues[":customer_phone2_desc"] = $params->customer_phone2_desc;
        }

        if ($params->customer_phone2 !== $params->OLD_customer_phone2) {
            $sqlColumns["customer_phone2=:customer_phone2"] = null;
            $sqlValues[":customer_phone2"] = $params->customer_phone2;
        }

        if ($params->customer_phone3_desc !== $params->OLD_customer_phone3_desc) {
            $sqlColumns["customer_phone3_desc=:customer_phone3_desc"] = null;
            $sqlValues[":customer_phone3_desc"] = $params->customer_phone3_desc;
        }

        if ($params->customer_phone3 !== $params->OLD_customer_phone3) {
            $sqlColumns["customer_phone3=:customer_phone3"] = null;
            $sqlValues[":customer_phone3"] = $params->customer_phone3;
        }

        if ($params->customer_email1_desc !== $params->OLD_customer_email1_desc) {
            $sqlColumns["customer_email1_desc=:customer_email1_desc"] = null;
            $sqlValues[":customer_email1_desc"] = $params->customer_email1_desc;
        }

        if ($params->customer_email1 !== $params->OLD_customer_email1) {
            $sqlColumns["customer_email1=:customer_email1"] = null;
            $sqlValues[":customer_email1"] = $params->customer_email1;
        }

        if ($params->customer_email2_desc !== $params->OLD_customer_email2_desc) {
            $sqlColumns["customer_email2_desc=:customer_email2_desc"] = null;
            $sqlValues[":customer_email2_desc"] = $params->customer_email2_desc;
        }

        if ($params->customer_email2 !== $params->OLD_customer_email2) {
            $sqlColumns["customer_email2=:customer_email2"] = null;
            $sqlValues[":customer_email2"] = $params->customer_email2;
        }

        if ($params->customer_po !== $params->OLD_customer_po) {
            $sqlColumns["customer_po=:customer_po"] = null;
            $sqlValues[":customer_po"] = $params->customer_po;
        }

        if ($params->customer_invoice_behavior_dbid !== $params->OLD_customer_invoice_behavior_dbid) {
            $sqlColumns["customer_invoice_behavior_dbid=:customer_invoice_behavior_dbid"] = null;
            $sqlValues[":customer_invoice_behavior_dbid"] = $params->customer_invoice_behavior_dbid;
        }

        if ($params->customer_invoice_frequency_dbid !== $params->OLD_customer_invoice_frequency_dbid) {
            $sqlColumns["customer_invoice_frequency_dbid=:customer_invoice_frequency_dbid"] = null;
            $sqlValues[":customer_invoice_frequency_dbid"] = $params->customer_invoice_frequency_dbid;
        }

        if ($params->customer_message_dbid !== $params->OLD_customer_message_dbid) {
            $sqlColumns["customer_message_dbid=:customer_message_dbid"] = null;
            $sqlValues[":customer_message_dbid"] = $params->customer_message_dbid;
        }

        $sql = "UPDATE customer SET ";
        $sql .= implode(",", array_keys($sqlColumns));
        $sqlValues[":customer_dbid"] = $params->customer_dbid;
        $sql .= " WHERE customer_dbid = :customer_dbid";

        $statement = $db->prepare($sql);
        $statement->execute($sqlValues);
        
        return Customer::view('DBID::'.$dbid, $params);

    }

    static function destroy($id, $params) {

        global $db;

        $dbid = $params->customer_dbid;

        $statement = $db->prepare('UPDATE customer SET customer_deleted_sw = true WHERE customer_dbid = :customer_dbid');
        $statement->execute( array(':customer_dbid' => $dbid) );

        return Customer::view('DBID::'.$dbid, $params);
    }

}

