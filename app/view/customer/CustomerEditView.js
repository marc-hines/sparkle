Ext.define('Sparkle.view.customer.CustomerEditView', {
    extend: 'Ext.panel.Panel',
    
    requires: [
        'Ext.form.*',
        'Ext.layout.container.Absolute',
        'Ext.layout.container.Accordion'
    ],
    
    xtype: 'app-customer-edit-view',
    
    frame: false,
    iconCls: 'icon-customer',
    closable: true,
    customerDbid: null,
    
    layout: 'accordion',
    defaults: {
        bodyPadding: 10
    },
    
    initComponent: function() {

        me = this;

        Ext.apply(me, {
            items: [{
                xtype: 'app-customer-edit-panel',
                customerDbid: me.customerDbid
            }, {
                xtype: 'app-job-for-customer-view',
                customerDbid: me.customerDbid
            }, {
                xtype: 'app-receivables-customer-edit-panel',
                customerDbid: me.customerDbid
            }]
        });

        me.callParent();
        
    }
});
