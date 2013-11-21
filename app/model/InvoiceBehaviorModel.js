Ext.define('Sparkle.model.InvoiceBehaviorModel', {
    extend: 'Ext.data.Model',
    xtype: 'app-invoice-behavior-model',

    fields: [{
        name: 'invoice_behavior_dbid', type: 'string'
    }, {
        name: 'invoice_behavior_id', type: 'string'
    }, {
        name: 'invoice_behavior_desc', type: 'string'
    }]
});
