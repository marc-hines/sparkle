<?php
/*
 * Application controller extension
 */
class Jobcodes extends ApplicationController {
    /*
     * create
     */
    public function create() {
        $res = new Response();
        $rec = Jobcode::create($this->id, $this->params);
        if ($rec) {
            $res->success = true;
            $res->message = "Created new User" . $this->id;
            $res->data = $rec;
        } else {
            $res->message = "Failed to create User " . $this->id;
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
        $res->data = Jobcode::view($this->id, $this->params);
        return $res->to_json();
    }
    /*
     * update
     */
    public function update() {
        $res = new Response();
        $rec = Jobcode::update($this->id, $this->params);
        if ($rec) {
            $res->success = true;
            $res->message = 'Updated Jobcode ' . $this->id;
            $res->data = $rec;
        } else {
            $res->message = "Failed to find Jobcode " . $this->id;
        }
        return $res->to_json();
    }
    /*
     * destroy
     */
    public function destroy() {
        $res = new Response();
        $rec = Jobcode::destroy($this->id, $this->params);
        if ($rec) {
            $res->success = true;
            $res->message = 'Deleted Jobcode ' . $this->id;
            $res->data = $rec;
        } else {
            $res->message = "Failed to delete Jobcode " . $this->id;
        }
        return $res->to_json();
    }
}

