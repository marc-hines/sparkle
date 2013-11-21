<?php
/**
 * @class Request
 */
class Request {
    public $method;
    public $controller;
    public $action;
    public $id;
    public $params = array();
    public $senchaOptions;

    private $restful;

    public function __construct($params) {
        $this->restful = (isset($params["restful"])) ? $params["restful"] : false;
        $this->method = $_SERVER["REQUEST_METHOD"];
        $this->parseRequest();
    }

    public function isRestful() {
        return $this->restful;
    }

    protected function parseRequest() {

        if ($this->method == 'PUT') {   // <-- Have to jump through hoops to get PUT data

            $raw  = '';
            $httpContent = fopen('php://input', 'r');
            while ($kb = fread($httpContent, 1024)) {
                $raw .= $kb;
            }
            fclose($httpContent);
            $php_input = array();
            parse_str($raw, $php_input);
            if (isset($php_input['data'])) {
                $this->params =  json_decode(stripslashes($php_input['data']));
            } else {
                $php_input = json_decode(stripslashes($raw));
                if ($php_input) {
                    $this->params = $php_input;
                }
            }

        } else {

            if (isset($_REQUEST['data'])) {
                $this->params =  json_decode(stripslashes($_REQUEST['data']));
            } else {
                $raw  = '';
                $php_input = array();
                $httpContent = fopen('php://input', 'r');
                while ($kb = fread($httpContent, 1024)) {
                    $raw .= $kb;
                }
                fclose($httpContent);
                $php_input = array();
                $php_input = json_decode(stripslashes($raw));
                if ($php_input) {
                    $this->params = $php_input;
                }
            }
        }

        // $_SERVER["PATH_INFO"] looks like '/Users' or '/Users/6', zero position is empty
        $url_clean = trim($_SERVER["PATH_INFO"]);
        $url_components = explode ( '/' , $url_clean );

        if (isset($url_components[1])) {
             $this->controller = $url_components[1];
        }

        if (isset($url_components[2])) {
            $id_components = explode ( '?' , stripslashes($url_components[2]) );
            $this->id = $id_components[0];
            if (isset($id_components[1])) {
                $senchaOptions = $id_components[1];
            }
        }
    }
}

