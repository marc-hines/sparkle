Ext.define('Sparkle.view.message.MessageActiveGridView', {
    extend: 'Ext.container.Container',
    
    requires: [
        'Ext.grid.*',
        'Ext.form.*',
        'Sparkle.model.MessageModel'
    ],
    xtype: 'app-message-active-grid-view',
    
    frame: false,
    title: 'Messages',
    iconCls: 'icon-message',
    closable: true,
    layout: {
        type: 'border'
    },
    
    initComponent: function(){

        var gridStore = Ext.create('Ext.data.Store', {
            extend: 'Ext.data.Store',
            xtype: 'app-message-active-grid-store',
            requires: [
                'Ext.data.proxy.Rest'
            ],

            autoLoad: true,
            autoSync: true,
            autoDestroy: true,
            model: 'Sparkle.model.MessageModel',
            proxy: {
                type: 'rest',
                url: 'php/rest_api.php/messages/SHOW::ACTIVE',
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
                title: 'Messages',
                xtype: 'gridpanel',
                itemId: 'MessageMainGrid',
                collapsible: true,
                split: true,
                width: 550,
                store: gridStore,
                scroll: 'vertical',

                columns: [{
                    text: 'Message ID',
                    flex: 1,
                    sortable: true,
                    dataIndex: 'message_id'
                }, {
                    text: 'Message',
                    flex: 3,
                    sortable: true,
                    dataIndex: 'message_desc'
                }],

                dockedItems: [{
                    xtype: 'toolbar',
                    ui: 'footer',
                    items: [{
                        text: 'Refresh',
                        itemId: 'MessageRefreshButton',
                        iconCls: 'icon-refresh',
                    },'-',{
                        text: 'Add Message',
                        itemId: 'MessageAddButton',
                        iconCls: 'icon-add',
                    }]
                }]
            }, {
                region: 'center',
                bodyPadding: 10,
                xtype: 'form',
                title:'Modify Message',
                itemId: 'MessageMainForm',
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
                    fieldLabel: 'Message ID',
                    name: 'message_id',
                    allowBlank: false,
                    inputWidth: '100'
                },{
                    xtype: 'app-text-area',
                    grow: false,
                    cols: 60,
                    rows: 8,
                    fieldLabel: 'Message',
                    name: 'message_desc',
                    allowBlank: false,
                    inputWidth: '550',
                }],

                dockedItems: [{
                    xtype: 'toolbar',
                    dock: 'top',
                    ui: 'footer',
                    defaults: {xtype: 'button'},
                    items: [{
                        text: 'Save Changes',
                        iconCls: 'icon-save',
                        itemId: 'MessageSaveButton',
                        alight: 'left',
                    },{
                        xtype: 'tbfill'
                    },{
                        text: 'Delete Message',
                        iconCls: 'icon-delete',
                        itemId: 'MessageDeleteButton',
                    }]
                }]

            }]
        });

        this.callParent();
    }
});