Ext.define('Sparkle.view.Viewport', {
    extend: 'Ext.container.Viewport',
    requires:[
        'Ext.layout.container.Fit',        
        'Ext.layout.container.Border'
    ],

    layout: {
        type: 'border'
    },

    items: [{
        region: 'north',
        xtype: 'app-viewport-header'
    },{
        region: 'west',
        xtype: 'app-viewport-menu-view',
        title: 'Functions',
        collapsible: true,
        split: true,
        width: 180
    },{
        region: 'center',
        xtype: 'app-viewport-tab-view'
    }]

});