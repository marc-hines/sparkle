Ext.define('Sparkle.view.job.JobEditView', {
    extend: 'Ext.panel.Panel',
    
    requires: [
        'Ext.form.*',
        'Ext.layout.container.Absolute',
        'Ext.layout.container.Accordion'
    ],
    
    xtype: 'app-job-edit-view',
    
    frame: false,
    iconCls: 'icon-job',
    closable: true,
    jobDbid: null,
    
    layout: 'accordion',
    defaults: {
        bodyPadding: 10
    },
    
    initComponent: function() {

        me = this;

        Ext.apply(me, {
            items: [{
                xtype: 'app-job-edit-panel',
                jobDbid: me.jobDbid
            },{
                html: 'placeholder'
            }]
        });

        me.callParent();
        
    }
});
