<?php
/*
 * Application controller extension
 */
class Messages extends ApplicationController {
    /*
     * create
     */
    public function create() {
        $res = new Response();
        $rec = Message::create($this->id, $this->params);
        if ($rec) {
            $res->success = true;
            $res->message = "Created new Message" . $this->id;
            $res->data = $rec;
        } else {
            $res->message = "Failed to create Message " . $this->id;
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
        $res->data = Message::view($this->id, $this->params);
        return $res->to_json();
    }
    /*
     * update
     */
    public function update() {
        $res = new Response();
        $rec = Message::update($this->id, $this->params);
        if ($rec) {
            $res->success = true;
            $res->message = 'Updated Message ' . $this->id;
            $res->data = $rec;
        } else {
            $res->message = "Failed to find Message ". $this->id;
        }
        return $res->to_json();
    }
    /*
     * destroy
     */
    public function destroy() {
        $res = new Response();
        $rec = Message::destroy($this->id, $this->params);
        if ($rec) {
            $res->success = true;
            $res->message = 'Deleted Message ' . $this->id;
            $res->data = $rec;
        } else {
            $res->message = "Failed to delete Message " . $this->id;
        }
        return $res->to_json();
    }
}

