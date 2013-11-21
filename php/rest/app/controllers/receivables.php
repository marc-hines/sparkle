<?php
/*
 * Application controller extension
 */
class Receivables extends ApplicationController {
    /*
     * create
     */
    public function create() {
        $res = new Response();
        $res->message = "Failed to create Customer " . $this->id;
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
        $res->data = Receivable::view($this->id, $this->params);
        return $res->to_json();
    }
    /*
     * update
     */
    public function update() {
        $res = new Response();
        $res->message = "Failed to update Customer ". $this->id;
        return $res->to_json();
    }
    /*
     * destroy
     */
    public function destroy() {
        $res = new Response();
        $res->message = "Failed to swap Customer deleted status " . $this->id;
        return $res->to_json();
    }
}

