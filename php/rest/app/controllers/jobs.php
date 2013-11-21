<?php
/*
 * Application controller extension
 */
class Jobs extends ApplicationController {
    /*
     * create
     */
    public function create() {
        $res = new Response();
        $rec = Job::create($this->id, $this->params);
        if ($rec) {
            $res->success = true;
            $res->message = "Created new Job" . $this->id;
            $res->data = $rec;
        } else {
            $res->message = "Failed to create Job " . $this->id;
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
        $res->data = Job::view($this->id, $this->params);
        return $res->to_json();
    }
    /*
     * update
     */
    public function update() {
        $res = new Response();
        $rec = Job::update($this->id, $this->params);
        if ($rec) {
            $res->success = true;
            $res->message = 'Updated Job ' . $this->id;
            $res->data = $rec;
        } else {
            $res->message = "Failed to find Job " . $this->id;
        }
        return $res->to_json();
    }
    /*
     * destroy
     */
    public function destroy() {
        $res = new Response();
        $rec = Job::destroy($this->id, $this->params);
        if ($rec) {
            $res->success = true;
            $res->message = 'Deleted Job ' . $this->id;
            $res->data = $rec;
        } else {
            $res->message = "Failed to delete Job " . $this->id;
        }
        return $res->to_json();
    }
}

