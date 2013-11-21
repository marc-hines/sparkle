Ext.define('Sparkle.store.MessageStore', {
    extend: 'Ext.data.Store',
    xtype: 'app-message-Store',

    requires: [
        'Ext.data.proxy.Rest'
    ],

    autoLoad: true,
    autoSync: false,
    autoDestroy: false,
    storeId: 'MessageStore',
    model: 'Sparkle.model.MessageModel',
    proxy: {
        type: 'rest',
        url: 'php/rest_api.php/messages/SHOW::ACTIVE',
        reader: {
            type: 'json',
            root: 'data'
        },
        writer: {
            type: 'json'
        }
    }

});
