Ext.define('Sparkle.model.UserModel', {
    extend: 'Ext.data.Model',
    xtype: 'app-user-model',
    fields: [{
        name: 'user_dbid'
    }, {
        name: 'user_id'
    }, {
        name: 'user_name'
    }, {
        name: 'user_access'
    }, {
        name: 'user_password'
    }, {
        name: 'user_deleted_sw'
    }, {
        name: 'user_deleted_dt'
    }],
    validations: [{
        type: 'length',
        field: 'user_id',
        min: 1
    }, {
        type: 'length',
        field: 'user_name',
        min: 1
    }, {
        type: 'length',
        field: 'user_access',
        min: 1
    }, {
        type: 'length',
        field: 'user_password',
        min: 1
    }]
});
