<?php
/**
 * @class Job
 *
 */

class Job extends Model {

    static function create($id, $params) {

        global $db;

        $sql = "INSERT INTO customer( ".
            'job_customer_dbid,'. 
            'job_deleted_sw,'.
            'job_deleted_dt,'.
            'job_id,'.
            'job_name,'.
            'job_addr1,'.
            'job_addr2,'.
            'job_city,'.
            'job_state,'. 
            'job_zip,'.
            'job_phone1_desc,'.
            'job_phone1,'.
            'job_phone2_desc,'.
            'job_phone2,'.
            'job_phone3_desc,'.
            'job_phone3,'.
            'job_email1_desc,'.
            'job_email1,'.
            'job_email2_desc,'.
            'job_email2,'.
            'job_job_frequency_dbid,'.
            'job_fixed_amt,'. 
            'job_totwtm_amt,'. 
            'job_totjtm_amt,'. 
            'job_totwfe_amt,'. 
            'job_totjfe_amt'.
            ") VALUES(".
            ":job_customer_dbid,". 
            ":job_deleted_sw,".
            ":job_deleted_dt,".
            ":job_id,".
            ":job_name,".
            ":job_addr1,".
            ":job_addr2,".
            ":job_city,".
            ":job_state,". 
            ":job_zip,".
            ":job_phone1_desc,".
            ":job_phone1,".
            ":job_phone2_desc,".
            ":job_phone2,".
            ":job_phone3_desc,".
            ":job_phone3,".
            ":job_email1_desc,".
            ":job_email1,".
            ":job_email2_desc,".
            ":job_email2,".
            ":job_job_frequency_dbid,".
            ":job_fixed_amt,". 
            ":job_totwtm_amt,". 
            ":job_totjtm_amt,". 
            ":job_totwfe_amt,". 
            ":job_totjfe_amt".
            ")";

        $statement = $db->prepare($sql);
        $statement->execute( array(
            ":job_id"=>$params->job_id,
            ":job_deleted_sw"=>$params->job_deleted_sw,
            ":job_deleted_dt"=>$params->job_deleted_dt,
            ":job_name"=>$params->job_name,
            ":job_addr1"=>$params->job_addr1,
            ":job_addr2"=>$params->job_addr2,
            ":job_city"=>$params->job_city,
            ":job_state"=>$params->job_state,
            ":job_zip"=>$params->job_zip,
            ":job_phone1_desc"=>$params->job_phone1_desc,
            ":job_phone1"=>$params->job_phone1,
            ":job_phone2_desc"=>$params->job_phone2_desc,
            ":job_phone2"=>$params->job_phone2,
            ":job_phone3_desc"=>$params->job_phone3_desc,
            ":job_phone3"=>$params->job_phone3,
            ":job_email1_desc"=>$params->job_email1_desc,
            ":job_email1"=>$params->job_email1,
            ":job_email2_desc"=>$params->job_email2_desc,
            ":job_email2"=>$params->job_email2,
            ":job_job_frequency_dbid"=>$params->job_job_frequency_dbid,
            ":job_fixed_amt"=>$params->job_fixed_amt,
            ":job_totwtm_amt"=>$params->job_totwtm_amt,
            ":job_totjtm_amt"=>$params->job_totjtm_amt,
            ":job_totwfe_amt"=>$params->job_totwfe_amt,
            ":job_totjfe_amt"=>$params->job_totjfe_amt
            ) );

        $dbid = $db->lastInsertId();

        return Job::view('DBID::'.$dbid, $params);

    }

    static function view($id, $params) {

        global $db;

        $results = array();

        $sql = "SELECT ".
            'job_dbid,'.
            'job_customer_dbid,'. 
            'job_deleted_sw,'.
            'job_deleted_dt,'.
            'job_id,'.
            'job_name,'.
            'job_addr1,'.
            'job_addr2,'.
            'job_city,'.
            'job_state,'. 
            'job_zip,'.
            'job_phone1_desc,'.
            'job_phone1,'.
            'job_phone2_desc,'.
            'job_phone2,'.
            'job_phone3_desc,'.
            'job_phone3,'.
            'job_email1_desc,'.
            'job_email1,'.
            'job_email2_desc,'.
            'job_email2,'.
            'job_job_frequency_dbid,'.
            'job_fixed_amt,'. 
            'job_totwtm_amt,'. 
            'job_totjtm_amt,'. 
            'job_totwfe_amt,'. 
            'job_totjfe_amt'.
            ' FROM job';

        if (isset($id)) {
            $id_components = explode ( 'DBID::' , $id );
            if (isset($id_components[1])) {
                $sql = $sql." WHERE job_dbid =".$id_components[1];
            } else if ($id=='SHOW::DELETED') {
                $sql = $sql." WHERE job_deleted_sw ORDER BY job_deleted_dt DESC";
            } else if ($id=='SHOW::ACTIVE') {
                $sql = $sql." WHERE NOT job_deleted_sw ORDER BY job_id";
            } else if ($id=='SHOW::ALL') {
                // No WHERE clause required
            } else {
                $sql = $sql." WHERE job_id ='".$id_components[0]."'";
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

        $dbid = $params->job_dbid;

        $sqlColumns = array();
        $sqlValues = array();

        if ($params->job_id !== $params->OLD_job_id) {
            $sqlColumns["job_id=:job_id"] = null;
            $sqlValues[":job_id"] = $params->job_id;
        }

        if ($params->job_customer_dbid !== $params->OLD_job_customer_dbid) {
            $sqlColumns["job_customer_dbid=:job_customer_dbid"] = null;
            $sqlValues[":job_customer_dbid"] = $params->job_customer_dbid;
        }

        if ($params->job_name !== $params->OLD_job_name) {
            $sqlColumns["job_name=:job_name"] = null;
            $sqlValues[":job_name"] = $params->job_name;
        }

        if ($params->job_addr1 !== $params->OLD_job_addr1) {
            $sqlColumns["job_addr1=:job_addr1"] = null;
            $sqlValues[":job_addr1"] = $params->job_addr1;
        }

        if ($params->job_addr2 !== $params->OLD_job_addr2) {
            $sqlColumns["job_addr2=:job_addr2"] = null;
            $sqlValues[":job_addr2"] = $params->job_addr2;
        }

        if ($params->job_city !== $params->OLD_job_city) {
            $sqlColumns["job_city=:job_city"] = null;
            $sqlValues[":job_city"] = $params->job_city;
        }

        if ($params->job_state !== $params->OLD_job_state) {
            $sqlColumns["job_state=:job_state"] = null;
            $sqlValues[":job_state"] = $params->job_state;
        }

        if ($params->job_zip !== $params->OLD_job_zip) {
            $sqlColumns["job_zip=:job_zip"] = null;
            $sqlValues[":job_zip"] = $params->job_zip;
        }

        if ($params->job_phone1_desc !== $params->OLD_job_phone1_desc) {
            $sqlColumns["job_phone1_desc=:job_phone1_desc"] = null;
            $sqlValues[":job_phone1_desc"] = $params->job_phone1_desc;
        }

        if ($params->job_phone1 !== $params->OLD_job_phone1) {
            $sqlColumns["job_phone1=:job_phone1"] = null;
            $sqlValues[":job_phone1"] = $params->job_phone1;
        }

        if ($params->job_phone2_desc !== $params->OLD_job_phone2_desc) {
            $sqlColumns["job_phone2_desc=:job_phone2_desc"] = null;
            $sqlValues[":job_phone2_desc"] = $params->job_phone2_desc;
        }

        if ($params->job_phone2 !== $params->OLD_job_phone2) {
            $sqlColumns["job_phone2=:job_phone2"] = null;
            $sqlValues[":job_phone2"] = $params->job_phone2;
        }

        if ($params->job_phone3_desc !== $params->OLD_job_phone3_desc) {
            $sqlColumns["job_phone3_desc=:job_phone3_desc"] = null;
            $sqlValues[":job_phone3_desc"] = $params->job_phone3_desc;
        }

        if ($params->job_email1_desc !== $params->OLD_job_email1_desc) {
            $sqlColumns["job_email1_desc=:job_email1_desc"] = null;
            $sqlValues[":job_email1_desc"] = $params->job_email1_desc;
        }

        if ($params->job_email1 !== $params->OLD_job_email1) {
            $sqlColumns["job_email1=:job_email1"] = null;
            $sqlValues[":job_email1"] = $params->job_email1;
        }

        if ($params->job_email2_desc !== $params->OLD_job_email2_desc) {
            $sqlColumns["job_email2_desc=:job_email2_desc"] = null;
            $sqlValues[":job_email2_desc"] = $params->job_email2_desc;
        }

        if ($params->job_email2 !== $params->OLD_job_email2) {
            $sqlColumns["job_email2=:job_email2"] = null;
            $sqlValues[":job_email2"] = $params->job_email2;
        }

        if ($params->job_job_frequency_dbid !== $params->OLD_job_job_frequency_dbid) {
            $sqlColumns["job_job_frequency_dbid=:job_job_frequency_dbid"] = null;
            $sqlValues[":job_job_frequency_dbid"] = $params->job_job_frequency_dbid;
        }

        if ($params->job_fixed_amt !== $params->OLD_job_fixed_amt) {
            $sqlColumns["job_fixed_amt=:job_fixed_amt"] = null;
            $sqlValues[":job_fixed_amt"] = $params->job_fixed_amt;
        }

        if ($params->job_totwtm_amt !== $params->OLD_job_totwtm_amt) {
            $sqlColumns["job_totwtm_amt=:job_totwtm_amt"] = null;
            $sqlValues[":job_totwtm_amt"] = $params->job_totwtm_amt;
        }

        if ($params->job_totjtm_amt !== $params->OLD_job_totjtm_amt) {
            $sqlColumns["job_totjtm_amt=:job_totjtm_amt"] = null;
            $sqlValues[":job_totjtm_amt"] = $params->job_totjtm_amt;
        }

        if ($params->job_totwfe_amt !== $params->OLD_job_totwfe_amt) {
            $sqlColumns["job_totwfe_amt=:job_totwfe_amt"] = null;
            $sqlValues[":job_totwfe_amt"] = $params->job_totwfe_amt;
        }

        if ($params->job_totjfe_amt !== $params->OLD_job_totjfe_amt) {
            $sqlColumns["job_totjfe_amt=:job_totjfe_amt"] = null;
            $sqlValues[":job_totjfe_amt"] = $params->job_totjfe_amt;
        }

        if ($params->job_deleted_sw !== $params->OLD_job_deleted_sw) {
            $sqlColumns["job_deleted_sw=:job_deleted_sw"] = null;
            $sqlValues[":job_deleted_sw"] = $params->job_deleted_sw;
        }

        $sql = "UPDATE Job SET ";
        $sql .= implode(",", array_keys($sqlColumns));
        $sqlValues[":job_dbid"] = $params->job_dbid;
        $sql .= " WHERE job_dbid = :job_dbid";

        $statement = $db->prepare($sql);
        $statement->execute($sqlValues);
        
        return Job::view('DBID::'.$dbid, $params);
    }

    static function destroy($id, $params) {

    	global $db;

        $dbid = $params->job_dbid;

        $statement = $db->prepare('UPDATE job SET job_deleted_sw = NOT(job_deleted_sw) WHERE job_dbid = :job_dbid');
        $statement->execute( array(':job_dbid' => $dbid) );

        return Job::view('DBID::'.$dbid, $params);
    }
}
