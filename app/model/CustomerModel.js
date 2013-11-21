Ext.define('Sparkle.model.CustomerModel', {
    extend: 'Ext.data.Model',
    xtype: 'app-customer-model',

    fields: [{
        name: 'customer_dbid', type: 'string'
    }, {
        name: 'customer_id', type: 'string'
    }, {
        name: 'OLD_customer_id', type: 'string'
    }, {
        name: 'customer_attention', type: 'string'
    }, {
        name: 'OLD_customer_attention', type: 'string'
    }, {
        name: 'customer_name', type: 'string'
    }, {
        name: 'OLD_customer_name', type: 'string'
    }, {
        name: 'customer_addr1', type: 'string'
    }, {
        name: 'OLD_customer_addr1', type: 'string'
    }, {
        name: 'customer_addr2', type: 'string'
    }, {
        name: 'OLD_customer_addr2', type: 'string'
    }, {
        name: 'customer_city', type: 'string'
    }, {
        name: 'OLD_customer_city', type: 'string'
    }, {
        name: 'customer_state', type: 'string'
    }, {
        name: 'OLD_customer_state', type: 'string'
    }, {
        name: 'customer_zip', type: 'string'
    }, {
        name: 'OLD_customer_zip', type: 'string'
    }, {
        name: 'customer_phone1_desc', type: 'string'
    }, {
        name: 'OLD_customer_phone1_desc', type: 'string'
    }, {
        name: 'customer_phone1', type: 'string'
    }, {
        name: 'OLD_customer_phone1', type: 'string'
    }, {
        name: 'customer_phone2_desc', type: 'string'
    }, {
        name: 'OLD_customer_phone2_desc', type: 'string'
    }, {
        name: 'customer_phone2', type: 'string'
    }, {
        name: 'OLD_customer_phone2', type: 'string'
    }, {
        name: 'customer_phone3_desc', type: 'string'
    }, {
        name: 'OLD_customer_phone3_desc', type: 'string'
    }, {
        name: 'customer_phone3', type: 'string'
    }, {
        name: 'OLD_customer_phone3', type: 'string'
    }, {
        name: 'customer_email1_desc', type: 'string'
    }, {
        name: 'OLD_customer_email1_desc', type: 'string'
    }, {
        name: 'customer_email1', type: 'string'
    }, {
        name: 'OLD_customer_email1', type: 'string'
    }, {
        name: 'customer_email2_desc', type: 'string'
    }, {
        name: 'OLD_customer_email2_desc', type: 'string'
    }, {
        name: 'customer_email2', type: 'string'
    }, {
        name: 'OLD_customer_email2', type: 'string'
    }, {
        name: 'customer_notes', type: 'string'
    }, {
        name: 'OLD_customer_notes', type: 'string'
    }, {
        name: 'customer_ar_notes', type: 'string'
    }, {
        name: 'OLD_customer_ar_notes', type: 'string'
    }, {
        name: 'customer_po', type: 'string'
    }, {
        name: 'OLD_customer_po', type: 'string'
    }, {
        name: 'customer_invoice_frequency_dbid', type: 'string'
    }, {
        name: 'OLD_customer_invoice_frequency_dbid', type: 'string'
    }, {
        name: 'customer_invoice_behavior_dbid', type: 'string'
    }, {
        name: 'OLD_customer_invoice_behavior_dbid', type: 'string'
    }, {
        name: 'customer_message_dbid', type: 'string'
    }, {
        name: 'OLD_customer_message_dbid', type: 'string'
    }, {
        name: 'customer_deleted_sw', type: 'string'
    }, {
        name: 'OLD_customer_deleted_sw', type: 'string'
    }, {
        name: 'customer_deleted_dt', type: 'string'
    }, {
        name: 'OLD_customer_deleted_dt', type: 'string'
    }],
    validations: [{
        type: 'length',
        field: 'customer_id',
        min: 1
    }]
});
