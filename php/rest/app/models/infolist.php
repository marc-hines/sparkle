<?php
/**
 * @class Message
 *
 * $params->message_dbid
 * $params->message_id
 * $params->message_desc
 * $params->message_deleted_sw
 * $params->message_deleted_dt 
 * 
 */
class Message extends Model {

    static function create($id, $params) {

    	global $db;

        $statement = $db->prepare('INSERT INTO message( message_id, message_desc ) VALUES( :message_id, :message_desc )');
        $statement->execute( array(':message_id'=>$params->message_id, ':message_desc'=>$params->message_desc) );

        $dbid = $db->lastInsertId();

        return Message::view('DBID::'.$dbid, $params);
    }

    static function view($id, $params) {

        global $db;

        $sql = "SELECT message_dbid, message_id, message_desc, message_deleted_sw, message_deleted_dt FROM message WHERE";
        if (isset($id)) {
            $id_components = explode ( 'DBID::' , $id );
            if (isset($id_components[1])) {
                $sql = $sql." message_dbid =".$id_components[1];
            } else if ($id=='SHOW::DELETED') {
                $sql = $sql." message_deleted_sw ORDER BY message_deleted_dt DESC LIMIT 500";
            } else {
                $sql = $sql." message_id ='".$id_components[0]."'";
            }
        } else {
            $sql = $sql." NOT message_deleted_sw ORDER BY message_id";
        }

        $results = array();

        foreach ($db->query($sql, PDO::FETCH_ASSOC) as $row) {
            array_push($results, $row);
        }

        return $results;
    }

    static function update($id, $params) {

    	global $db;

        $dbid = $params->message_dbid;

        $statement = $db->prepare('UPDATE message SET message_id=:message_id, message_desc=:message_desc, message_deleted_sw=:message_deleted_sw WHERE message_dbid = :message_dbid');
        $statement->execute( array(':message_id'=>$params->message_id, ':message_desc'=>$params->message_desc,':message_deleted_sw'=>$params->message_deleted_sw, ':message_dbid'=>$params->message_dbid ) );

        return Message::view('DBID::'.$dbid, $params);
    }

    static function destroy($id, $params) {

    	global $db;

        $dbid = $params->message_dbid;

        $statement = $db->prepare('UPDATE message SET message_deleted_sw = true WHERE message_dbid = :message_dbid');
        $statement->execute( array(':message_dbid' => $dbid) );

        return Message::view('DBID::'.$dbid, $params);
    }

}
