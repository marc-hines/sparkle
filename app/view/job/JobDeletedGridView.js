Ext.define('Sparkle.view.job.JobDeletedGridView', {

    extend: 'Sparkle.view.job.JobGridPanel',
    xtype: 'app-job-deleted-grid-view',
    title: 'Deleted Jobs',
    iconCls: 'icon-job',
    closable: true,
    itemId: 'JobDeletedGridPanel',
    urlSuffix: 'SHOW::DELETED'

});