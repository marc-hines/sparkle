Ext.define('Sparkle.view.job.JobActiveGridView', {

    extend: 'Sparkle.view.job.JobGridPanel',
    xtype: 'app-job-active-grid-view',
    title: 'Active Jobs',
    iconCls: 'icon-job',
    closable: true,
    itemId: 'JobActiveGridPanel',
    urlSuffix: 'SHOW::ACTIVE'

});