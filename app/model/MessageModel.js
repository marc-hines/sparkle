Ext.define('Sparkle.model.MessageModel', {
    extend: 'Ext.data.Model',
    xtype: 'app-Message-model',
    fields: [{
        name: 'message_dbid'
    }, {
        name: 'message_id'
    }, {
        name: 'message_desc'
    }, {
        name: 'message_deleted_sw'
    }, {
        name: 'message_deleted_dt'
    }],
    validations: [{
        type: 'length',
        field: 'message_id',
        min: 1
    }, {
        type: 'length',
        field: 'message_desc',
        min: 1
    }]
});
