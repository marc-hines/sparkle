<?php
/*
 * Application controller extension
 */
class Customers extends ApplicationController {
    /*
     * create
     */
    public function create() {
        $res = new Response();
        $rec = Customer::create($this->id, $this->params);
        if ($rec) {
            $res->success = true;
            $res->message = "Created new Customer" . $this->id;
            $res->data = $rec;
        } else {
            $res->message = "Failed to create Customer " . $this->id;
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
        $res->data = Customer::view($this->id, $this->params);
        return $res->to_json();
    }
    /*
     * update
     */
    public function update() {
        $res = new Response();
        $rec = Customer::update($this->id, $this->params);
        if ($rec) {
            $res->success = true;
            $res->message = 'Updated Customer ' . $this->id;
            $res->data = $rec;
        } else {
            $res->message = "Failed to find Customer ". $this->id;
        }
        return $res->to_json();
    }
    /*
     * destroy
     */
    public function destroy() {
        $res = new Response();
        $rec = Customer::destroy($this->id, $this->params);
        if ($rec) {
            $res->success = true;
            $res->message = 'Deleted Customer ' . $this->id;
            $res->data = $rec;
        } else {
            $res->message = "Failed to delete Customer " . $this->id;
        }
        return $res->to_json();
    }
}

