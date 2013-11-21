Ext.define('Sparkle.view.jobcode.JobcodeActiveGridView', {
    extend: 'Ext.container.Container',
    
    requires: [
        'Ext.grid.*',
        'Ext.form.*',
        'Sparkle.model.JobcodeModel'
    ],
    xtype: 'app-jobcode-active-grid-view',
    
    frame: false,
    title: 'Job Codes',
    iconCls: 'icon-jobcode',
    closable: true,
    layout: {
        type: 'border'
    },
    
    initComponent: function(){

        var gridStore = Ext.create('Ext.data.Store', {
            extend: 'Ext.data.Store',
            xtype: 'app-jobcode-active-grid-store',
            requires: [
                'Ext.data.proxy.Rest'
            ],

            autoLoad: true,
            autoSync: true,
            autoDestroy: true,
            model: 'Sparkle.model.JobcodeModel',
            proxy: {
                type: 'rest',
                url: 'php/rest_api.php/jobcodes/SHOW::ACTIVE',
                reader: {
                    type: 'json',
                    root: 'data'
                },
                writer: {
                    type: 'json'
                }
            }
        });

        Ext.apply(this, {

            items: [{
                region: 'west',
                title: 'Job Codes',
                xtype: 'gridpanel',
                itemId: 'JobcodeMainGrid',
                collapsible: true,
                split: true,
                width: 550,
                store: gridStore,
                scroll: 'vertical',

                columns: [{
                    text: 'Code',
                    flex: 1,
                    sortable: true,
                    dataIndex: 'jobcode_id'
                }, {
                    text: 'Full Description',
                    flex: 3,
                    sortable: true,
                    dataIndex: 'jobcode_desc'
                }, {
                    header: 'Short Description',
                    flex: 2,
                    sortable: true,
                    dataIndex: 'jobcode_short_desc'
                }, {
                    text: 'Category',
                    flex: 2,
                    sortable: true,
                    dataIndex: 'jobcode_category'
                }],

                dockedItems: [{
                    xtype: 'toolbar',
                    ui: 'footer',
                    items: [{
                        text: 'Refresh',
                        itemId: 'JobcodeRefreshButton',
                        iconCls: 'icon-refresh',
                    },'-',{
                        text: 'Add Job Code',
                        itemId: 'JobcodeAddButton',
                        iconCls: 'icon-add',
                    }]
                }]
            }, {
                region: 'center',
                bodyPadding: 10,
                xtype: 'form',
                title:'Modify Job Code',
                itemId: 'JobcodeMainForm',
                frame: false,
                layout: 'anchor',
                disabled: true,
                defaultType: 'textfield',

                fieldDefaults: {
                    labelAlign: 'right',
                    labelWidth: 120,
                    anchor: '100%',
                    msgTarget: 'side'
                },
    
                items: [{
                    fieldLabel: 'Job Code',
                    name: 'jobcode_id',
                    allowBlank: false,
                    inputWidth: '100'
                },{
                    fieldLabel: 'Full Description',
                    name: 'jobcode_desc',
                    allowBlank: false,
                    inputWidth: '300'
                },{
                    fieldLabel: 'Short Description',
                    name: 'jobcode_short_desc',
                    allowBlank: false,
                    inputWidth: '300'
                },{
                    fieldLabel: 'Category',
                    name: 'jobcode_category',
                    allowBlank: false,
                    inputWidth: '300'
                }],

                dockedItems: [{
                    xtype: 'toolbar',
                    dock: 'top',
                    ui: 'footer',
                    defaults: {xtype: 'button'},
                    items: [{
                        text: 'Save Changes',
                        iconCls: 'icon-save',
                        itemId: 'JobcodeSaveButton',
                        alight: 'left',
                    },{
                        xtype: 'tbfill'
                    },{
                        text: 'Delete Jobcode',
                        iconCls: 'icon-delete',
                        itemId: 'JobcodeDeleteButton',
                    }]
                }]
            }]
        });
        this.callParent();
    }
});