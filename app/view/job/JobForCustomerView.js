Ext.define('Sparkle.view.job.JobForCustomerView', {

    extend: 'Sparkle.view.job.JobGridPanel',
    xtype: 'app-job-for-customer-view',
    title: 'Customer Jobs',
    closable: false,
    customerDbid: null,

    initComponent: function(){

        var me = this;

        Ext.apply(me, {
            urlSuffix: 'CUSTOMER_DBID::' + me.customerDbid
        });

        me.callParent();

    }

});
