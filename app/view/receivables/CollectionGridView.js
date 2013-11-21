Ext.define('Sparkle.view.receivables.CollectionGridView', {
    extend: 'Ext.grid.GridPanel',
    // Use a BufferedRenderer plugin
    plugins: {
        ptype: 'bufferedrenderer'
    },
    
    requires: [
        'Ext.grid.*',
        'Sparkle.model.CollectionGridModel'
    ],

    features: [{ ftype: 'grouping' }],

    xtype: 'app-collection-grid-view',
    
    title: 'Overdue Detail',
    iconCls: 'icon-receivable',
    closable: true,
    itemId: 'CollectionsGrid',
    scroll: 'vertical',

    initComponent: function(){

        var gridStore = Ext.create('Ext.data.Store', {
            extend: 'Ext.data.Store',
            xtype: 'app-collection-grid-store',
            requires: [
                'Ext.data.proxy.Rest'
            ],

            autoLoad: true,
            autoSync: true,
            autoDestroy: true,
            model: 'Sparkle.model.CollectionGridModel',
            proxy: {
                type: 'rest',
                url: 'php/rest_api.php/collections/SHOW::ALL',
                reader: {
                    type: 'json',
                    root: 'data'
                },
                writer: {
                    type: 'json'
                }
            },
            groupField: 'customer_id'
        });

        Ext.apply(this, {
            store: gridStore,
            columns: [{
                text: 'Cust ID',
                flex: 1,
                sortable: true,
                dataIndex: 'customer_id'
            }, {
                text: 'Name',
                flex: 2,
                sortable: true,
                dataIndex: 'customer_name'
            }, {
                text: 'Invoice',
                flex: 1,
                sortable: true,
                dataIndex: 'invoice_id'
            }, {
                xtype: 'datecolumn',
                format: 'Y-m-d', 
                text: 'Date',
                flex: 1,
                sortable: true,
                dataIndex:'invoice_dt'
            }, {
                xtype: 'numbercolumn',
                format:'0,000.00',
                text: 'Invoice Amt',
                flex: .9,
                sortable: true,
                dataIndex: 'invoice_total_amt'
            }, {
                text: 'Desc',
                flex: 1.3,
                sortable: true,
                hidden: true,
                dataIndex: 'invoice_desc'
            }, {
                xtype: 'numbercolumn',
                format:'0,000.00',
                text: 'Due 31-45',
                flex: .9,
                sortable: true,
                dataIndex: 'blank_balance_31_45'
            }, {
                xtype: 'numbercolumn',
                format:'0,000.00',
                text: 'Due 46-60',
                flex: .9,
                sortable: true,
                dataIndex: 'blank_balance_46_60'
            }, {
                xtype: 'numbercolumn',
                format:'0,000.00',
                text: 'Due 61-90',
                flex: .9,
                sortable: true,
                dataIndex: 'blank_balance_61_90'
            }, {
                xtype: 'numbercolumn',
                format:'0,000.00',
                text: 'Over 90',
                flex: .9,
                sortable: true,
                dataIndex: 'blank_balance_over_90'
            }, {
                xtype: 'numbercolumn',
                format:'0,000',
                text: 'Days Old',
                flex: .6,
                sortable: true,
                hidden: true,
                dataIndex: 'view_days_aged'
            }],

            dockedItems: [{
                xtype: 'toolbar',
                ui: 'footer',
                items: [{
                    text: 'Refresh',
                    itemId: 'CollectionGridRefreshButton',
                    iconCls: 'icon-refresh',
                    listeners: {
                        click: function() {
                            gridStore.load();
                        }
                    }
                }]
            }]
        });

        this.callParent();

    }
});