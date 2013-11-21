Ext.define('Sparkle.view.user.UserDeletedGridView', {
    extend: 'Ext.grid.GridPanel',
    // Use a BufferedRenderer plugin
    plugins: {
        ptype: 'bufferedrenderer'
    },
    
    requires: [
        'Ext.grid.*',
        'Sparkle.model.UserModel'
    ],
    xtype: 'app-user-deleted-grid-view',
    
    title: 'Deleted Users',
    iconCls: 'icon-user',
    closable: true,
    itemId: 'UserDeletedGrid',
    scroll: 'vertical',

    initComponent: function(){

        var me = this;

        var gridStore = Ext.create('Ext.data.Store', {
            extend: 'Ext.data.Store',
            xtype: 'app-user-deleted-grid-store',
            requires: [
                'Ext.data.proxy.Rest'
            ],

            autoLoad: true,
            autoSync: true,
            autoDestroy: true,
            model: 'Sparkle.model.UserModel',
            proxy: {
                type: 'rest',
                url: 'php/rest_api.php/users/SHOW::DELETED',
                reader: {
                    type: 'json',
                    root: 'data'
                },
                writer: {
                    type: 'json'
                }
            }
        });

        var deleteButtonText = 'Undelete User';

        var deleteButton = Ext.create('Ext.Button', {
            text: deleteButtonText,
            itemId: 'DeleteButton',
            iconCls: 'icon-delete',
            disabled: true,
            listeners: {
                click: function() {

                    var selection = me.getView().getSelectionModel().getSelection()[0];
                    if (selection) {
                        var store = me.getStore();
                        store.remove(selection);
                    }

                }
            }
        });

        var refreshButton = Ext.create('Ext.Button', {
            text: 'Refresh',
            itemId: 'RefreshButton',
            iconCls: 'icon-refresh',
            listeners: {
                click: function() {
                    deleteButton.setDisabled(true);
                    gridStore.load();
                }
            }
        });

        var dockedButtons = [];

        dockedButtons.push(refreshButton);
        dockedButtons.push('-');
        dockedButtons.push({xtype: 'tbfill'});
        dockedButtons.push(deleteButton);

        Ext.apply(me, {
            store: gridStore,
            columns: [{
                xtype: 'datecolumn',
                format: 'Y-m-d', 
                text: 'Deleted on',
                flex: 1,
                sortable: true,
                dataIndex:'user_deleted_dt',
            }, {
                text: 'User ID',
                flex: 1,
                sortable: true,
                dataIndex: 'user_id'
            }, {
                text: 'User Name',
                flex: 3,
                sortable: true,
                dataIndex: 'user_name'
            }, {
                header: 'Access Rights',
                flex: 2,
                sortable: true,
                dataIndex: 'user_access'
            }],

            dockedItems: [{
                xtype: 'toolbar',
                ui: 'footer',
                items: dockedButtons,

            }],

            listeners: {
                select: function() {
                    deleteButton.setDisabled(false);
                }
            }
    
        });

        me.callParent();

    }
});