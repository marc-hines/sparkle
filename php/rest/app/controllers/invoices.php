<?php
/*
 * Application controller extension
 */
class Invoices extends ApplicationController {
    /*
     * create
     */
    public function create() {
        $res = new Response();
        $rec = false;//$rec = Invoice::create($this->id, $this->params);
        if ($rec) {
            $res->success = true;
            $res->message = "Created new Invoice" . $this->id;
            $res->data = $rec;
        } else {
            $res->message = "Failed to create Invoice " . $this->id;
        }
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
        $res->data = Invoice::view($this->id, $this->params);
        return $res->to_json();
    }
    /*
     * update
     */
    public function update() {
        $res = new Response();
        $rec = false;//$rec = Invoice::update($this->id, $this->params);
        if ($rec) {
            $res->success = true;
            $res->message = 'Updated Invoice ' . $this->id;
            $res->data = $rec;
        } else {
            $res->message = "Failed to find Invoice ". $this->id;
        }
        return $res->to_json();
    }
    /*
     * destroy
     */
    public function destroy() {
        $res = new Response();
        $rec = false;//$rec = Invoice::destroy($this->id, $this->params);
        if ($rec) {
            $res->success = true;
            $res->message = 'Deleted Invoice ' . $this->id;
            $res->data = $rec;
        } else {
            $res->message = "Failed to delete Invoice " . $this->id;
        }
        return $res->to_json();
    }
}

