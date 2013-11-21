Ext.define('Sparkle.model.JobFrequencyModel', {
    extend: 'Ext.data.Model',
    xtype: 'app-job-frequency-model',

    fields: [{
        name: 'job_frequency_dbid', type: 'string'
    }, {
        name: 'job_frequency_id', type: 'string'
    }, {
        name: 'job_frequency_desc', type: 'string'
    }]
});
