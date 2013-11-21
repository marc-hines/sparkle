<?php
/**
 * @class Jobcode
 *
 * $params->jobcode_dbid
 * $params->jobcode_id
 * $params->jobcode_desc
 * $params->jobcode_short_desc
 * $params->jobcode_category
 * $params->jobcode_deleted_sw
 * $params->jobcode_deleted_dt 
 * 
 */
class Jobcode extends Model {

    static function create($id, $params) {

    	global $db;

        $statement = $db->prepare('INSERT INTO jobcode( jobcode_id, jobcode_desc, jobcode_short_desc, jobcode_category, jobcode_deleted_sw ) VALUES( :jobcode_id, :jobcode_desc, :jobcode_short_desc, :jobcode_category, :jobcode_deleted_sw)');
        $statement->execute( array(':jobcode_id'=>$params->jobcode_id, ':jobcode_desc'=>$params->jobcode_desc, ':jobcode_short_desc'=>$params->jobcode_short_desc, ':jobcode_category'=>$params->jobcode_category, ':jobcode_deleted_sw'=>$params->jobcode_deleted_sw) );

        $dbid = $db->lastInsertId();
        return Jobcode::view('DBID::'.$dbid, $params);

    }

    static function view($id, $params) {

        global $db;

        $results = array();
        
        $sql = "SELECT ".
          "jobcode_dbid,".
          "jobcode_id,".
          "jobcode_desc,".
          "jobcode_short_desc,".
          "jobcode_category,".
          "jobcode_deleted_sw,".
          "jobcode_deleted_dt".
          " FROM jobcode";

        if (isset($id)) {
            $id_components = explode ( 'DBID::' , $id );
            if (isset($id_components[1])) {
                $sql = $sql." WHERE jobcode_dbid =".$id_components[1];
            } else if ($id=='SHOW::DELETED') {
                $sql = $sql." WHERE jobcode_deleted_sw ORDER BY jobcode_deleted_dt DESC";
            } else if ($id=='SHOW::ACTIVE') {
                $sql = $sql." WHERE NOT jobcode_deleted_sw ORDER BY jobcode_id";
            } else if ($id=='SHOW::ALL') {
                // No WHERE clause required
            } else {
                $sql = $sql." WHERE jobcode_id ='".$id_components[0]."'";
            }
        }

        foreach ($db->query($sql, PDO::FETCH_ASSOC) as $row) {
            array_push($results, $row);
        }

        return $results;
    }

    static function update($id, $params) {

    	global $db;

        $dbid = $params->jobcode_dbid;

        $statement = $db->prepare('UPDATE jobcode SET jobcode_id=:jobcode_id, jobcode_desc=:jobcode_desc, jobcode_short_desc=:jobcode_short_desc, jobcode_category=:jobcode_category, jobcode_deleted_sw=:jobcode_deleted_sw WHERE jobcode_dbid=:jobcode_dbid');
        $statement->execute( array(':jobcode_id'=>$params->jobcode_id, ':jobcode_desc'=>$params->jobcode_desc, ':jobcode_short_desc'=>$params->jobcode_short_desc, ':jobcode_category'=>$params->jobcode_category, ':jobcode_deleted_sw'=>$params->jobcode_deleted_sw, ':jobcode_dbid'=>$params->jobcode_dbid) );

        return Jobcode::view('DBID::'.$dbid, $params);
    }

    static function destroy($id, $params) {

    	global $db;

        $dbid = $params->jobcode_dbid;

        $statement = $db->prepare('UPDATE jobcode SET jobcode_deleted_sw = NOT(jobcode_deleted_sw) WHERE jobcode_dbid = :jobcode_dbid');
        $statement->execute( array(':jobcode_dbid' => $dbid) );

        return Jobcode::view('DBID::'.$dbid, $params);
    }
}
