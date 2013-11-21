<?php
/**
 * @class Message
 *
 * 
 */
class Jobfrequency extends Model {

    static function view($id, $params) {

        global $db;

        $sql = "SELECT ".
            "job_frequency_dbid,".
            "job_frequency_id,".
            "job_frequency_desc".
            " FROM job_frequency";

        if (isset($id)) {
            $id_components = explode ( 'DBID::' , $id );
            if (isset($id_components[1])) {
                $sql = $sql." WHERE job_frequency_dbid =".$id_components[1];
            } else if ($id=='SHOW::ACTIVE') {
                // No WHERE clause required
            } else if ($id=='SHOW::ALL') {
                // No WHERE clause required
            } else {
                $sql = $sql." WHERE job_frequency_id ='".$id_components[0]."'";
            }
        }

        $results = array();

        foreach ($db->query($sql, PDO::FETCH_ASSOC) as $row) {
            array_push($results, $row);
        }

        return $results;
    }
 
}
