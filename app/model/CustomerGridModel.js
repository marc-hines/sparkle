Ext.define('Sparkle.model.CustomerGridModel', {
    extend: 'Ext.data.Model',
    xtype: 'app-customer-grid-model',

    fields: [{
        name: 'customer_dbid', type: 'string'
    }, {
        name: 'customer_id', type: 'string'
    }, {
        name: 'customer_deleted_sw', type: 'string'
    }, {
        name: 'customer_deleted_dt', type: 'string'
    }, {
        name: 'customer_notes', type: 'string'
    }, {
        name: 'view_invoice_count', type: 'number'
    }, {
        name: 'view_last_invoice_dt', type: 'date'
    }, {
        name: 'view_job_count', type: 'number'
    }, {
        name: 'grid_name', type: 'string'
    }, {
        name: 'grid_addr', type: 'string'
    }, {
        name: 'grid_phones', type: 'string'
    }]
});
