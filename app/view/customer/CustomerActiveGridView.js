Ext.define('Sparkle.view.customer.CustomerActiveGridView', {

    extend: 'Sparkle.view.customer.CustomerGridPanel',
    xtype: 'app-customer-active-grid-view',
    title: 'Active Customers',
    iconCls: 'icon-customer',
    closable: true,
    itemId: 'CustomerActiveGrid',
    urlSuffix: 'SHOW::ACTIVE'

});
