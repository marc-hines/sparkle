Ext.define('Sparkle.view.search.MainSearchView', {
    extend: 'Ext.container.Container',
    xtype: 'app-main-search-view',

    requires:[
        'Ext.layout.container.Fit',        
        'Ext.layout.container.Border'
    ],

    layout: {
        type: 'border'
    },

    title: 'Search',
    iconCls: 'icon-search',
    closable: true,
    itemId: 'MainSearchView',

    initComponent: function() {

        me = this;

        var searchResultsPanel =  Ext.create('Ext.Panel', {
            region: 'center',
            layout: 'fit'
        });

        var searchTextField = Ext.create('Ext.form.field.Text', {
            x: 0,
            y: 70,
            xtype: 'textfield',
            width: 380,
            itemId: 'mainsearchtextfield'
        });

        var searchCustomersButton = Ext.create('Ext.Button', {
            text: 'Search Customers',
            x: 0,
            y: 100,
            listeners: {
                click: function() {

                    var searchResultsGrid =  Ext.create('Sparkle.view.customer.CustomerGridPanel', {
                        xtype: 'app-customer-search-grid-view',
                        itemId: 'CustomerSearchGrid',
                        urlSuffix: 'SEARCH::'+searchTextField.getValue()
                    });
                    searchResultsPanel.removeAll(true,true);
                    searchResultsPanel.add([searchResultsGrid]);
                }
            }
        });

        var searchJobsButton = Ext.create('Ext.Button', {
            text: 'Search Jobs',
            x: 140,
            y: 100,
            listeners: {
                click: function() {

                    var searchResultsGrid =  Ext.create('Sparkle.view.job.JobGridPanel', {
                        xtype: 'app-job-search-grid-view',
                        itemId: 'JobSearchGrid',
                        urlSuffix: 'SEARCH::'+searchTextField.getValue()
                    });
                    searchResultsPanel.removeAll(true,true);
                    searchResultsPanel.add([searchResultsGrid]);
                }
            }
        });

        var searchSchedulesButton = Ext.create('Ext.Button', {
            text: 'Search Schedules',
            x: 250,
            y: 100,
            listeners: {
                click: function() {
                    alert('You clicked the button!');
                }
            }
        });

        Ext.apply(me, {

            items: [{
                region: 'north',
                minHeight: 130,
                maxHeight: 130,
                layout: {
                    type: 'hbox',
                },

                items: [{
                    flex: 1,
                    border: false
                },{
                    xtype: 'form',
                    border: false,
                    layout: {
                        type: 'absolute'
                    },
                    minWidth: 380,
                    maxWidth: 380,

                    items: [{
                        x: 0,
                        y: 0,
                        xtype: 'image',
                        src: 'resources/sparkle/images/glassmasterslogo.gif',
                        width: 380
                    }, searchTextField,
                       searchCustomersButton,
                       searchJobsButton,
                       searchSchedulesButton
                    ]
                },{
                    flex: 1,
                    border: false
                }]
            }, searchResultsPanel
            ]

        });

        me.callParent();

    }
});
