Ext.define('Sparkle.controller.UserDeletedGridController', {
    extend: 'Ext.app.Controller',

    refs: [{
        ref: 'deletedGrid',
        selector: 'gridpanel#UserDeletedGrid'
    },{
        ref: 'viewportTabView',
        selector: 'tabpanel#ViewportTabView'
    },{
        ref: 'deleteButton',
        selector: 'button#UserDeletedGridDeleteButton'
    }],

    init: function() {
        this.control({
            'gridpanel#UserDeletedGrid': {
                select: this.onGridSelect,
                itemmousedown: this.onGridSelect
            },
            'button#UserDeletedGridRefreshButton': {
                click: this.onRefreshButton
            },
            'button#UserDeletedGridDeleteButton': {
                click: this.onDeleteButton
            }
        });
    },

    onGridSelect: function( model, record, index, eOpts ) {

        var button = this.getDeleteButton();
        button.setDisabled(false);

    },

    onDeleteButton: function() {

        var grid = this.getDeletedGrid();
        var selection = grid.getView().getSelectionModel().getSelection()[0];
        if (selection) {
            var store = grid.getStore();
            store.remove(selection);
        }

    },

    onRefreshButton: function() {
        
        var button = this.getDeleteButton();
        button.setDisabled(true);
        var grid = this.getDeletedGrid();
        var store = grid.getStore();
        store.load();

    }

 });