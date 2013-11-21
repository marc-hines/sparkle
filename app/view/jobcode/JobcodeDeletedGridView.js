Ext.define('Sparkle.view.jobcode.JobcodeDeletedGridView', {
    extend: 'Ext.grid.GridPanel',
    // Use a BufferedRenderer plugin
    plugins: {
        ptype: 'bufferedrenderer'
    },
    
    requires: [
        'Ext.grid.*',
        'Sparkle.model.JobcodeModel'
    ],
    xtype: 'app-jobcode-deleted-grid-view',
    
    title: 'Deleted jobcodes',
    iconCls: 'icon-jobcode',
    closable: true,
    itemId: 'JobcodeDeletedGrid',
    scroll: 'vertical',

    initComponent: function(){

        var me = this;

        var gridStore = Ext.create('Ext.data.Store', {
            extend: 'Ext.data.Store',
            xtype: 'app-jobcode-deleted-grid-store',
            requires: [
                'Ext.data.proxy.Rest'
            ],

            autoLoad: true,
            autoSync: true,
            autoDestroy: true,
            model: 'Sparkle.model.JobcodeModel',
            proxy: {
                type: 'rest',
                url: 'php/rest_api.php/jobcodes/SHOW::DELETED',
                reader: {
                    type: 'json',
                    root: 'data'
                },
                writer: {
                    type: 'json'
                }
            }
        });

        var deleteButtonText = 'Undelete Jobcode';

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
                dataIndex:'jobcode_deleted_dt',
            }, {
                text: 'Jobcode',
                flex: 1,
                sortable: true,
                dataIndex: 'jobcode_id'
            }, {
                text: 'Full Description',
                flex: 2,
                sortable: true,
                dataIndex: 'jobcode_desc'
            }, {
                text: 'Short Description',
                flex: 2,
                sortable: true,
                dataIndex: 'jobcode_short_desc'
            }, {
                header: 'Category',
                flex: 2,
                sortable: true,
                dataIndex: 'jobcode_category'
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