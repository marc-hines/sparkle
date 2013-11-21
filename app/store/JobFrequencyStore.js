Ext.define('Sparkle.store.JobFrequencyStore', {
    extend: 'Ext.data.Store',
    xtype: 'app-job-frequency-Store',

    requires: [
        'Ext.data.proxy.Rest'
    ],

    autoLoad: true,
    autoSync: false,
    autoDestroy: false,
    storeId: 'JobFrequencyStore',
    model: 'Sparkle.model.JobFrequencyModel',
    proxy: {
        type: 'rest',
        url: 'php/rest_api.php/jobfrequencies/SHOW::ACTIVE',
        reader: {
            type: 'json',
            root: 'data'
        },
        writer: {
            type: 'json'
        }
    }

});
