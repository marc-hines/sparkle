Ext.define('Sparkle.model.InvoiceModel', {
    extend: 'Ext.data.Model',
    xtype: 'app-invoice-model',

    fields: [{
        name: 'invoice_dbid', type: 'string'
    }, {
        name: 'invoice_customer_dbid', type: 'string'
    }, {
        name: 'invoice_id', type: 'string'
    }, {
        name: 'invoice_dt', type: 'string'
    }, {
        name: 'invoice_desc', type: 'string'
    }, {
        name: 'invoice_total_amt', type: 'string'
    }, {
        name: 'invoice_status', type: 'string'
    }, {
        name: 'invoice_received_amt', type: 'string'
    }, {
        name: 'invoice_balance_amt', type: 'string'
    }, {
        name: 'invoice_posted_dt', type: 'string'
    }, {
        name: 'invoice_message', type: 'string'
    }, {
        name: 'invoice_deleted_sw', type: 'string'
    }, {
        name: 'invoice_deleted_dt', type: 'string'
    }]
});
