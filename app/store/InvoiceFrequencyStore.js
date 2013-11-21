Ext.define('Sparkle.store.InvoiceFrequencyStore', {
    extend: 'Ext.data.Store',
    xtype: 'app-invoice-frequency-Store',

    requires: [
        'Ext.data.proxy.Rest'
    ],

    autoLoad: true,
    autoSync: false,
    autoDestroy: false,
    storeId: 'InvoiceFrequencyStore',
    model: 'Sparkle.model.InvoiceFrequencyModel',
    proxy: {
        type: 'rest',
        url: 'php/rest_api.php/invoicefrequencies/SHOW::ACTIVE',
        reader: {
            type: 'json',
            root: 'data'
        },
        writer: {
            type: 'json'
        }
    }

});
