Ext.define('Sparkle.model.JobModel', {
    extend: 'Ext.data.Model',
    xtype: 'app-job-model',
    fields: [{
        name: 'job_dbid', type: 'string'
    }, {
        name: 'job_id', type: 'string'
    }, {
        name: 'OLD_job_id', type: 'string'
    }, {
        name: 'job_customer_dbid', type: 'string'
    }, {
        name: 'OLD_job_customer_dbid', type: 'string'
    }, {
        name: 'job_name', type: 'string'
    }, {
        name: 'OLD_job_name', type: 'string'
    }, {
        name: 'job_addr1', type: 'string'
    }, {
        name: 'OLD_job_addr1', type: 'string'
    }, {
        name: 'job_addr2', type: 'string'
    }, {
        name: 'OLD_job_addr2', type: 'string'
    }, {
        name: 'job_city', type: 'string'
    }, {
        name: 'OLD_job_city', type: 'string'
    }, {
        name: 'job_state', type: 'string'
    }, {
        name: 'OLD_job_state', type: 'string'
    }, {
        name: 'job_zip', type: 'string'
    }, {
        name: 'OLD_job_zip', type: 'string'
    }, {
        name: 'job_phone1_desc', type: 'string'
    }, {
        name: 'OLD_job_phone1_desc', type: 'string'
    }, {
        name: 'job_phone1', type: 'string'
    }, {
        name: 'OLD_job_phone1', type: 'string'
    }, {
        name: 'job_phone2_desc', type: 'string'
    }, {
        name: 'OLD_job_phone2_desc', type: 'string'
    }, {
        name: 'job_phone2', type: 'string'
    }, {
        name: 'OLD_job_phone2', type: 'string'
    }, {
        name: 'job_phone3_desc', type: 'string'
    }, {
        name: 'OLD_job_phone3_desc', type: 'string'
    }, {
        name: 'job_phone3', type: 'string'
    }, {
        name: 'OLD_job_phone3', type: 'string'
    }, {
        name: 'job_email1_desc', type: 'string'
    }, {
        name: 'OLD_job_email1_desc', type: 'string'
    }, {
        name: 'job_email1', type: 'string'
    }, {
        name: 'OLD_job_email1', type: 'string'
    }, {
        name: 'job_email2_desc', type: 'string'
    }, {
        name: 'OLD_job_email2_desc', type: 'string'
    }, {
        name: 'job_email2', type: 'string'
    }, {
        name: 'OLD_job_email2', type: 'string'
    }, {
        name: 'job_job_frequency_dbid', type: 'string'
    }, {
        name: 'OLD_job_job_frequency_dbid', type: 'string'
    }, {
        name: 'job_fixed_amt', type: 'number'
    }, {
        name: 'OLD_job_fixed_amt', type: 'number'
    }, {
        name: 'job_totwtm_amt', type: 'number'
    }, {
        name: 'OLD_job_totwtm_amt', type: 'number'
    }, {
        name: 'job_totjtm_amt', type: 'number'
    }, {
        name: 'OLD_job_totjtm_amt', type: 'number'
    }, {
        name: 'job_totwfe_amt', type: 'number'
    }, {
        name: 'OLD_job_totwfe_amt', type: 'number'
    }, {
        name: 'job_totjfe_amt', type: 'number'
    }, {
        name: 'OLD_job_totjfe_amt', type: 'number'
    }, {
        name: 'job_entry_dt', type: 'date'
    }, {
        name: 'OLD_job_entry_dt', type: 'date'
    }, {
        name: 'job_deleted_sw', type: 'string'
    }, {
        name: 'OLD_job_deleted_sw', type: 'string'
    }, {
        name: 'job_deleted_dt', type: 'date'
    }, {
        name: 'OLD_job_deleted_dt', type: 'date'
    }],

    validations: [{
        type: 'length',
        field: 'job_id',
        min: 1
    }, {
        type: 'length',
        field: 'job_name',
        min: 1
    }]
});
