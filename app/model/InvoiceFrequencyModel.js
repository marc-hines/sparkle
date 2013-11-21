Ext.define('Sparkle.model.InvoiceFrequencyModel', {
    extend: 'Ext.data.Model',
    xtype: 'app-invoice-frequency-model',

    fields: [{
        name: 'invoice_frequency_dbid', type: 'string'
    }, {
        name: 'invoice_frequency_id', type: 'string'
    }, {
        name: 'invoice_frequency_desc', type: 'string'
    }]
});
