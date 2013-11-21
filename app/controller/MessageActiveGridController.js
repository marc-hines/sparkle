Ext.define('Sparkle.controller.MessageActiveGridController', {
    extend: 'Ext.app.Controller',

    refs: [{
        ref: 'messageMainGrid',
        selector: 'gridpanel#MessageMainGrid'
    },{
        ref: 'messageMainForm',
        selector: 'form#MessageMainForm'
    },{
        ref: 'messageRefreshButton',
        selector: 'button#MessageRefreshButton'
    }],

    init: function() {
        this.control({
            'gridpanel#MessageMainGrid': {
                select: this.onGridSelect,
                itemmousedown: this.onGridSelect
            },
            'button#MessageSaveButton': {
                click: this.onSaveButton
            },
            'button#MessageAddButton': {
                click: this.onAddButton
            },
            'button#MessageDeleteButton': {
                click: this.onDeleteButton
            },
            'button#MessageRefreshButton': {
                click: this.onRefreshButton
            }
        });
    },

    onGridSelect: function( model, record, index, eOpts ) {
        var form = this.getMessageMainForm();
        if (record) {
            form.loadRecord(record);
            form.setDisabled(false);
        }
    },

    onSaveButton: function() {
        var form = this.getMessageMainForm();
        if (form.isValid()) {
            form.updateRecord();
        }
    },

    onAddButton: function() {
        // add a new empty record
        var grid = this.getMessageMainGrid();
        var store = grid.getStore();
        store.insert(0, new Sparkle.model.MessageModel());
        grid.getView().select(0);
    },

    onDeleteButton: function() {

        var form = this.getMessageMainForm();
        var grid = this.getMessageMainGrid();
        var selection = grid.getView().getSelectionModel().getSelection()[0];
        if (selection) {
            var store = grid.getStore();
            store.remove(selection);
            form.setDisabled(true);
        }

    },

    onRefreshButton: function() {
        
        var form = this.getMessageMainForm();
        form.setDisabled(true);
        var grid = this.getMessageMainGrid();
        var store = grid.getStore();
        store.load();

    }
 });