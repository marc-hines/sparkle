Ext.define('Sparkle.view.job.JobGridPanel', {
    extend: 'Ext.grid.GridPanel',
    // Use a BufferedRenderer plugin
    plugins: {
        ptype: 'bufferedrenderer'
    },
    
    requires: [
        'Ext.grid.*',
        'Sparkle.model.JobGridModel'
    ],
    xtype: 'app-job-grid-panel',
    
    urlSuffix: null,

    itemId: 'AppJobGridPanel',
    scroll: 'vertical',

    initComponent: function(){

        var me = this;

        var restUrl = 'php/rest_api.php/jobgrids/'+me.urlSuffix;

        var gridStore = Ext.create('Ext.data.Store', {
            extend: 'Ext.data.Store',
            xtype: 'app-job-active-grid-store',
            requires: [
                'Ext.data.proxy.Rest'
            ],

            autoLoad: true,
            autoSync: true,
            autoDestroy: true,
            model: 'Sparkle.model.JobGridModel',
            proxy: {
                type: 'rest',
                url: restUrl,
                reader: {
                    type: 'json',
                    root: 'data'
                },
                writer: {
                    type: 'json'
                }
            }
        });

        var deleteButtonText = 'Delete Job';
        if (me.urlSuffix == 'SHOW::DELETED') deleteButtonText = 'Undelete Job';

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

        var addButton = Ext.create('Ext.Button', {
            text: 'Add New Job',
            itemId: 'AddButton',
            iconCls: 'icon-add',
            listeners: {
                click: function() {
                    var viewId = 'JobEditView_New';
                    var tabpanel = Sparkle.refs.ViewportTabView;
                    var alreadyCreatedView = Ext.getCmp(viewId);
                    if (alreadyCreatedView == null) {
                        var view = Ext.create('Sparkle.view.job.JobEditView', {
                            title: 'New Job',
                            id: viewId,
                            job_dbid: null});
                        tabpanel.add(view);
                        tabpanel.setActiveTab(view);
                    } else {
                        tabpanel.setActiveTab(alreadyCreatedView);
                    }
                }
            }
        });

        var columsLayout = [];

        columsLayout.push({
            text: 'Job ID',
            flex: 1,
            sortable: true,
            dataIndex: 'job_id'
        });

        columsLayout.push({
            header: 'Job Address',
            flex: 2,
            sortable: true,
            dataIndex: 'grid_job_addr'
        });

        columsLayout.push({
            header: 'Job Phone',
            flex: 2,
            sortable: true,
            dataIndex: 'job_phone1'
        });

        columsLayout.push({
            header: 'Prices',
            flex: 2,
            sortable: true,
            dataIndex: 'grid_prices'
        });

        columsLayout.push({
            header: 'Frequency',
            flex: 1,
            sortable: true,
            dataIndex: 'job_frequency_id'
        });

        columsLayout.push({
            xtype: 'datecolumn',
            format: 'Y-m-d', 
            text: 'Last Invoiced',
            flex: 1,
            sortable: true,
            dataIndex:'view_last_invoice_dt',
        });

        if (me.urlSuffix == 'SHOW::DELETED' || me.urlSuffix == 'SHOW::ACTIVE') {

            columsLayout.push({
                text: 'Cust ID',
                flex: 1,
                sortable: true,
                dataIndex: 'customer_id'
            });

            columsLayout.push({
                text: 'Bill To',
                flex: 2,
                sortable: true,
                dataIndex: 'grid_bill_to_addr'
            });

        } 

        var dockedButtons = [];

        dockedButtons.push(refreshButton);
        dockedButtons.push('-');

        if (me.urlSuffix !== 'SHOW::DELETED' && me.urlSuffix !== 'SHOW::ACTIVE') {

        //if (me.urlSuffix !== 'SHOW::DELETED') {
            dockedButtons.push(addButton);
        }
        dockedButtons.push({xtype: 'tbfill'});
        dockedButtons.push(deleteButton);

        Ext.apply(me, {
            store: gridStore,
            columns: columsLayout,
            dockedItems: [{
                xtype: 'toolbar',
                ui: 'footer',
                items: dockedButtons,
            }],

            listeners: {
                select: function() {
                    deleteButton.setDisabled(false);
                },
                itemdblclick: function() {
                    if (me.urlSuffix !== 'SHOW::DELETED') {

                        var selection = me.getView().getSelectionModel().getSelection()[0];
                        if (selection) {

                            var tabpanel = Sparkle.refs.ViewportTabView;
                            var viewxtype = 'app-job-edit-view';
                            var viewId = viewxtype+'_'+selection.data.job_dbid;
                            var alreadyCreatedView = Ext.getCmp(viewId);
                            if (alreadyCreatedView == null) {
                                var view = Ext.create('Sparkle.view.job.JobEditView', {
                                    title: 'Job '+selection.data.job_id,
                                    id: viewId,
                                    jobDbid: selection.data.job_dbid});
                                tabpanel.add(view);
                                tabpanel.setActiveTab(view);
                            } else {
                                tabpanel.setActiveTab(alreadyCreatedView);
                            }
                        }
                    }
                }
            }

        });

        me.callParent();

    }
});