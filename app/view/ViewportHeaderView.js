Ext.define('Sparkle.view.ViewportHeaderView', {
    extend: 'Ext.container.Container',
    xtype: 'app-viewport-header',
    height: 34,
    layout: {
        type: 'hbox',
        align: 'middle'
    },
    
    initComponent: function() {

        me = this;

        me.items = [{
            xtype: 'component',
            id: 'app-header-title',
            html: 'Sparkle',
            flex: 1
        }];

        Sparkle.refs.ViewportHeaderView = me;

        me.callParent();

    }
});
