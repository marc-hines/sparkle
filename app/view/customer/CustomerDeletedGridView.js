Ext.define('Sparkle.view.customer.CustomerDeletedGridView', {

    extend: 'Sparkle.view.customer.CustomerGridPanel',
    xtype: 'app-customer-deleted-grid-view',
    title: 'Deleted Customers',
    iconCls: 'icon-customer',
    closable: true,
    itemId: 'CustomerDeletedGrid',
    urlSuffix: 'SHOW::DELETED'

});