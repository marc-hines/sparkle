Ext.define('Sparkle.store.InvoiceBehaviorStore', {
    extend: 'Ext.data.Store',
    xtype: 'app-invoice-behavior-Store',

    requires: [
        'Ext.data.proxy.Rest'
    ],

    autoLoad: true,
    autoSync: false,
    autoDestroy: false,
    storeId: 'InvoiceBehaviorStore',
    model: 'Sparkle.model.InvoiceBehaviorModel',
    proxy: {
        type: 'rest',
        url: 'php/rest_api.php/invoicebehaviors/SHOW::ACTIVE',
        reader: {
            type: 'json',
            root: 'data'
        },
        writer: {
            type: 'json'
        }
    }

});
