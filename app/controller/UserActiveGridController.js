Ext.define('Sparkle.controller.UserActiveGridController', {
    extend: 'Ext.app.Controller',

    refs: [{
        ref: 'userMainGrid',
        selector: 'gridpanel#UserMainGrid'
    },{
        ref: 'userMainForm',
        selector: 'form#UserMainForm'
    },{
        ref: 'userRefreshButton',
        selector: 'button#UserRefreshButton'
    }],

    init: function() {
        this.control({
            'gridpanel#UserMainGrid': {
                select: this.onGridSelect,
                itemmousedown: this.onGridSelect
            },
            'button#UserSaveButton': {
                click: this.onSaveButton
            },
            'button#UserAddButton': {
                click: this.onAddButton
            },
            'button#UserDeleteButton': {
                click: this.onDeleteButton
            },
            'button#UserRefreshButton': {
                click: this.onRefreshButton
            }
        });
    },

    onGridSelect: function( model, record, index, eOpts ) {
        var form = this.getUserMainForm();
        if (record) {
            form.loadRecord(record);
            form.setDisabled(false);
        }
    },

    onSaveButton: function() {
        var form = this.getUserMainForm();
        if (form.isValid()) {
            form.updateRecord();
        }
    },

    onAddButton: function() {
        // add a new empty record
        var grid = this.getUserMainGrid();
        var store = grid.getStore();
        store.insert(0, new Sparkle.model.UserModel());
        grid.getView().select(0);
    },

    onDeleteButton: function() {

        var form = this.getUserMainForm();
        var grid = this.getUserMainGrid();
        var selection = grid.getView().getSelectionModel().getSelection()[0];
        if (selection) {
            var store = grid.getStore();
            store.remove(selection);
            form.setDisabled(true);
        }

    },

    onRefreshButton: function() {
        
        var form = this.getUserMainForm();
        form.setDisabled(true);
        var grid = this.getUserMainGrid();
        var store = grid.getStore();
        store.load();

    }
 });