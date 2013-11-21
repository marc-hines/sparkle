Ext.define('Sparkle.model.JobcodeModel', {
    extend: 'Ext.data.Model',
    xtype: 'app-jobcode-model',
    fields: [{
        name: 'jobcode_dbid'
    }, {
        name: 'jobcode_id'
    }, {
        name: 'jobcode_desc'
    }, {
        name: 'jobcode_short_desc'
    }, {
        name: 'jobcode_category'
    }, {
        name: 'jobcode_deleted_sw'
    }, {
        name: 'jobcode_deleted_dt'
    }],
    validations: [{
        type: 'length',
        field: 'jobcode_id',
        min: 1
    }, {
        type: 'length',
        field: 'jobcode_desc',
        min: 1
    }, {
        type: 'length',
        field: 'jobcode_short_desc',
        min: 1
    }, {
        type: 'length',
        field: 'jobcode_category',
        min: 1
    }]
});
