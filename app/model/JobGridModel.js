Ext.define('Sparkle.model.JobGridModel', {
    extend: 'Ext.data.Model',
    xtype: 'app-job-grid-model',

    fields: [{
        name: 'customer_id', type: 'string'
    }, {
        name: 'job_id', type: 'string'
    }, {
        name: 'job_dbid', type: 'string'
    }, {
        name: 'job_deleted_sw', type: 'string'
    }, {
        name: 'job_deleted_dt', type: 'string'
    }, {
        name: 'job_phone1', type: 'string'
    }, {
        name: 'job_frequency_id', type: 'string'
    }, {
        name: 'grid_bill_to_addr', type: 'string'
    }, {
        name: 'grid_job_addr', type: 'string'
    }, {
        name: 'grid_prices', type: 'string'
    }, {
        name: 'view_last_invoice_dt', type: 'date'
    }]
});
