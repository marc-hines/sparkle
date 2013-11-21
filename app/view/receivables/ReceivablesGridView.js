Ext.define('Sparkle.view.receivables.ReceivablesGridView', {
    extend: 'Ext.grid.GridPanel',
    // Use a BufferedRenderer plugin
    plugins: {
        ptype: 'bufferedrenderer'
    },
    
    requires: [
        'Ext.grid.*',
        'Sparkle.model.ReceivablesGridModel'
    ],

    features: [{ ftype: 'grouping' }],

    xtype: 'app-receivables-grid-view',
    
    title: 'Receivables',
    iconCls: 'icon-receivable',
    closable: true,
    itemId: 'ReceivablesGrid',
    scroll: 'vertical',

    initComponent: function(){

        var gridStore = Ext.create('Ext.data.Store', {
            extend: 'Ext.data.Store',
            xtype: 'app-receivables-grid-store',
            requires: [
                'Ext.data.proxy.Rest'
            ],

            autoLoad: true,
            autoSync: true,
            autoDestroy: true,
            model: 'Sparkle.model.ReceivablesGridModel',
            proxy: {
                type: 'rest',
                url: 'php/rest_api.php/receivables/SHOW::ALL',
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
                flex: .7,
                sortable: true,
                dataIndex: 'invoice_id'
            }, {
                xtype: 'datecolumn',
                format: 'Y-m-d', 
                text: 'Date',
                flex: 1,
                sortable: true,
                dataIndex:'invoice_dt',
            }, {
                xtype: 'numbercolumn',
                format:'0,000.00',
                text: 'Invoice Amt',
                flex: 1,
                sortable: true,
                dataIndex: 'invoice_total_amt'
            }, {
                text: 'Desc',
                flex: 2,
                sortable: true,
                hidden: true,
                dataIndex: 'invoice_desc'
            }, {
                xtype: 'numbercolumn',
                format:'0,000.00',
                text: 'Current',
                flex: 1,
                sortable: true,
                dataIndex: 'blank_balance_current'
            }, {
                xtype: 'numbercolumn',
                format:'0,000.00',
                text: 'Due 31-60',
                flex: 1,
                sortable: true,
                dataIndex: 'blank_balance_31_60'
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
                text: 'Due 91-120',
                flex: 1,
                sortable: true,
                dataIndex: 'blank_balance_91_120'
            }, {
                xtype: 'numbercolumn',
                format:'0,000.00',
                text: 'Over 120',
                flex: 1,
                sortable: true,
                dataIndex: 'blank_balance_over_120'
            }, {
                xtype: 'numbercolumn',
                format:'0,000',
                text: 'Days Old',
                flex: 1,
                sortable: true,
                hidden: true,
                dataIndex: 'view_days_aged'
            }],

            dockedItems: [{
                xtype: 'toolbar',
                ui: 'footer',
                items: [{
                    text: 'Refresh',
                    itemId: 'ReceivablesGridRefreshButton',
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