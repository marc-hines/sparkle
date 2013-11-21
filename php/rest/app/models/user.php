<?php
/**
 * @class User
 *
 * $params->user_dbid
 * $params->user_id
 * $params->user_name
 * $params->user_access
 * $params->user_password
 * $params->user_deleted_sw
 * $params->user_deleted_dt 
 * 
 */
class User extends Model {

    static function create($id, $params) {

    	global $db;

        $statement = $db->prepare('INSERT INTO user( user_id, user_name, user_access, user_password, user_deleted_sw ) VALUES( :user_id, :user_name, :user_access, :user_password, :user_deleted_sw)');
        $statement->execute( array(':user_id'=>$params->user_id, ':user_name'=>$params->user_name, ':user_access'=>$params->user_access, ':user_password'=>$params->user_password, ':user_deleted_sw'=>$params->user_deleted_sw) );

        $dbid = $db->lastInsertId();

        return User::view('DBID::'.$dbid, $params);
    }

    static function view($id, $params) {

        global $db;

        $sql = "SELECT ".
           "user_dbid,".
           "user_id,".
           "user_name,".
           "user_access,".
           "user_password,".
           "user_deleted_sw,".
           "user_deleted_dt".
           " FROM user";

        if (isset($id)) {
            $id_components = explode ( 'DBID::' , $id );
            if (isset($id_components[1])) {
                $sql = $sql." WHERE user_dbid =".$id_components[1];
            } else if ($id=='SHOW::DELETED') {
                $sql = $sql." WHERE user_deleted_sw ORDER BY user_deleted_dt DESC";
            } else if ($id=='SHOW::ACTIVE') {
                $sql = $sql." WHERE NOT user_deleted_sw ORDER BY user_id";
            } else if ($id=='SHOW::ALL') {
                // No WHERE clause required
            } else {
                $sql = $sql." WHERE user_id ='".$id_components[0]."'";
            }
        }

        $results = array();

        foreach ($db->query($sql, PDO::FETCH_ASSOC) as $row) {
            array_push($results, $row);
        }

        return $results;
    }

    static function update($id, $params) {

    	global $db;

        $dbid = $params->user_dbid;

        $statement = $db->prepare('UPDATE user SET user_id=:user_id, user_name=:user_name, user_access=:user_access, user_password=:user_password, user_deleted_sw=:user_deleted_sw WHERE user_dbid=:user_dbid');
        $statement->execute( array(':user_id'=>$params->user_id, ':user_name'=>$params->user_name, ':user_access'=>$params->user_access, ':user_password'=>$params->user_password, ':user_deleted_sw'=>$params->user_deleted_sw, ':user_dbid'=>$params->user_dbid) );

        return User::view('DBID::'.$dbid, $params);
    }

    static function destroy($id, $params) {

    	global $db;

        $dbid = $params->user_dbid;

        $statement = $db->prepare('UPDATE user SET user_deleted_sw = NOT(user_deleted_sw) WHERE user_dbid = :user_dbid');
        $statement->execute( array(':user_dbid' => $dbid) );

        return User::view('DBID::'.$dbid, $params);
    }
}
