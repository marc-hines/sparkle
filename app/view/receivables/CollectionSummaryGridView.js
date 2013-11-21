Ext.define('Sparkle.view.receivables.CollectionSummaryGridView', {
    extend: 'Ext.grid.GridPanel',
    // Use a BufferedRenderer plugin
    plugins: {
        ptype: 'bufferedrenderer'
    },
    
    requires: [
        'Ext.grid.*',
        'Sparkle.model.CollectionSummaryGridModel'
    ],

    xtype: 'app-collection-summary-grid-view',
    
    title: 'Overdue Summary',
    iconCls: 'icon-receivable',
    closable: true,
    itemId: 'CollectionsSummaryGrid',
    scroll: 'vertical',

    initComponent: function(){

        var gridStore = Ext.create('Ext.data.Store', {
            extend: 'Ext.data.Store',
            xtype: 'app-collection-summary-grid-store',
            requires: [
                'Ext.data.proxy.Rest'
            ],

            autoLoad: true,
            autoSync: true,
            autoDestroy: true,
            model: 'Sparkle.model.CollectionSummaryGridModel',
            proxy: {
                type: 'rest',
                url: 'php/rest_api.php/collectionsummaries/SHOW::ALL',
                reader: {
                    type: 'json',
                    root: 'data'
                },
                writer: {
                    type: 'json'
                }
            }
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
                xtype: 'numbercolumn',
                format:'0,000',
                text: 'Count',
                flex: .7,
                sortable: true,
                hidden: true,
                dataIndex: 'view_invoice_count'
            }, {
                xtype: 'numbercolumn',
                format:'0,000.00',
                text: 'Due 31-45',
                flex: 1,
                sortable: true,
                dataIndex: 'blank_balance_31_45'
            }, {
                xtype: 'numbercolumn',
                format:'0,000.00',
                text: 'Due 46-60',
                flex: 1,
                sortable: true,
                dataIndex: 'blank_balance_46_60'
            }, {
                xtype: 'numbercolumn',
                format:'0,000.00',
                text: 'Due 61-90',
                flex: 1,
                sortable: true,
                dataIndex: 'blank_balance_61_90'
            }, {
                xtype: 'numbercolumn',
                format:'0,000.00',
                text: 'Over 90',
                flex: 1,
                sortable: true,
                dataIndex: 'blank_balance_over_90'
            }, {
                xtype: 'numbercolumn',
                format:'0,000.00',
                text: 'Total',
                flex: 1,
                sortable: true,
                dataIndex: 'view_total_overdue'
            }, {
                text: 'A/R Notes',
                flex: 3,
                sortable: true,
                dataIndex: 'customer_ar_notes'
            }, {
                text: 'Notes',
                flex: 2,
                sortable: true,
                dataIndex: 'customer_notes'
            }],

            dockedItems: [{
                xtype: 'toolbar',
                ui: 'footer',
                items: [{
                    text: 'Refresh',
                    itemId: 'CollectionSummaryGridRefreshButton',
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