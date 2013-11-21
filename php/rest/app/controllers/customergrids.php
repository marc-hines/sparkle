<?php
/*
 * Application controller extension
 */
class Customergrids extends ApplicationController {
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
        $res->data = Customergrid::view($this->id, $this->params);
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
        $rec = Customergrid::destroy($this->id, $this->params);
        if ($rec) {
            $res->success = true;
            $res->message = 'Swapped Customer deleted status ' . $this->id;
            $res->data = $rec;
        } else {
            $res->message = "Failed to swap Customer deleted status " . $this->id;
        }
        return $res->to_json();
    }
}

