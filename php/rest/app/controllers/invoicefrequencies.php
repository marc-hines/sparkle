<?php
/*
 * Application controller extension
 */
class Invoicefrequencies extends ApplicationController {
    /*
     * create
     */
    public function create() {
        $res = new Response();
        $res->message = "Failed to create Message " . $this->id;
        return $res->to_json();
    }
    /*
     * view
     * Retrieves row(s) from database.
     */
    public function view() {

        $res = new Response();
        $res->success = true;
        $res->message = "Loaded data";
        $res->data = Invoicefrequency::view($this->id, $this->params);
        return $res->to_json();
    }
    /*
     * update
     */
    public function update() {
        $res = new Response();
        $res->message = "Failed to find Message ". $this->id;
        return $res->to_json();
    }
    /*
     * destroy
     */
    public function destroy() {
        $res = new Response();
        $res->message = "Failed to delete Message " . $this->id;
        return $res->to_json();
    }
}

