<?php
/*
 * Baseclass for all Models
 */
class Model {

    /*
     * Default create function, normally overwritten by the model
     * that extends this class.  This is the default behavior
     * in case the class does not override it.
     */

    static function create($id, $params) {
        $results = array();
        return $results;
    }

    /*
     * Default view function, normally overwritten by the model
     * that extends this class.  This is the default behavior
     * in case the class does not override it.
     */
    static function view($id, $params) {
        $results = array();
        return $results;

    }

    /*
     * Default update function, normally overwritten by the model
     * that extends this class.  This is the default behavior
     * in case the class does not override it.
     */
    static function update($id, $params) {
        $results = array();
        return $results;
    }

    /*
     * Default destroy function, normally overwritten by the model
     * that extends this class.  This is the default behavior
     * in case the class does not override it.
     */
    static function destroy($id, $params) {
        $results = array();
        return $results;
    }

}
