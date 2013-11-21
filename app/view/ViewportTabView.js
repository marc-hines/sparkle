Ext.define('Sparkle.view.ViewportTabView', {
    extend: 'Ext.tab.Panel',

    xtype: 'app-viewport-tab-view',
    itemId: 'ViewportTabView',

    requires:[
        'Ext.tab.Panel'
    ],

    initComponent: function() {

        me = this;

        Sparkle.refs.ViewportTabView = me;

        me.callParent();
        
    }

});