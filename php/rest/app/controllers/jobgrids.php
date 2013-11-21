<?php
/*
 * Application controller extension
 */
class Jobgrids extends ApplicationController {
    /*
     * view
     * Retrieves row(s) from database.
     */
    public function view() {

        $res = new Response();
        $res->success = true;
        $res->message = "Loaded data";
        $res->data = Jobgrid::view($this->id, $this->params);
        return $res->to_json();
    }
    /*
     * destroy
     */
    public function destroy() {
        $res = new Response();
        $rec = Jobgrid::destroy($this->id, $this->params);
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

