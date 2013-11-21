Ext.define('Sparkle.controller.JobcodeActiveGridController', {
    extend: 'Ext.app.Controller',

    refs: [{
        ref: 'activeGrid',
        selector: 'gridpanel#JobcodeMainGrid'
    },{
        ref: 'jobcodeMainForm',
        selector: 'form#JobcodeMainForm'
    },{
        ref: 'jobcodeRefreshButton',
        selector: 'button#JobcodeRefreshButton'
    }],

    init: function() {
        this.control({
            'gridpanel#JobcodeMainGrid': {
                select: this.onGridSelect,
                itemmousedown: this.onGridSelect
            },
            'button#JobcodeSaveButton': {
                click: this.onSaveButton
            },
            'button#JobcodeAddButton': {
                click: this.onAddButton
            },
            'button#JobcodeDeleteButton': {
                click: this.onDeleteButton
            },
            'button#JobcodeRefreshButton': {
                click: this.onRefreshButton
            }
        });
    },

    onGridSelect: function( model, record, index, eOpts ) {
        var form = this.getJobcodeMainForm();
        if (record) {
            form.loadRecord(record);
            form.setDisabled(false);
        }
    },

    onSaveButton: function() {
        var form = this.getJobcodeMainForm();
        if (form.isValid()) {
            form.updateRecord();
        }
    },

    onAddButton: function() {
        // add a new empty record
        var grid = this.getActiveGrid();
        var store = grid.getStore();
        store.insert(0, new Sparkle.model.JobcodeModel());
        grid.getView().select(0);
    },

    onDeleteButton: function() {

        var form = this.getJobcodeMainForm();
        var grid = this.getActiveGrid();
        var selection = grid.getView().getSelectionModel().getSelection()[0];
        if (selection) {
            var store = grid.getStore();
            store.remove(selection);
            form.setDisabled(true);
        }

    },

    onRefreshButton: function() {
        
        var form = this.getJobcodeMainForm();
        form.setDisabled(true);
        var grid = this.getActiveGrid();
        var store = grid.getStore();
        store.load();

    }
 });