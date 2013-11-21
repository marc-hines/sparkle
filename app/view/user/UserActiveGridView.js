Ext.define('Sparkle.view.user.UserActiveGridView', {
    extend: 'Ext.container.Container',
    
    requires: [
        'Ext.grid.*',
        'Ext.form.*',
        'Sparkle.model.UserModel'
    ],
    xtype: 'app-user-active-grid-view',
    
    frame: false,
    title: 'Users',
    iconCls: 'icon-user',
    closable: true,
    layout: {
        type: 'border'
    },
    
    initComponent: function(){

        var gridStore = Ext.create('Ext.data.Store', {
            extend: 'Ext.data.Store',
            xtype: 'app-user-active-gridstore',
            requires: [
                'Ext.data.proxy.Rest'
            ],

            autoLoad: true,
            autoSync: true,
            autoDestroy: true,
            model: 'Sparkle.model.UserModel',
            proxy: {
                type: 'rest',
                url: 'php/rest_api.php/users/SHOW::ACTIVE',
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
                itemId: 'UserMainGrid',
                collapsible: true,
                split: true,
                width: 550,
                store: gridStore,
                scroll: 'vertical',

                columns: [{
                    text: 'User ID',
                    flex: 1,
                    sortable: true,
                    dataIndex: 'user_id'
                }, {
                    text: 'User Name',
                    flex: 3,
                    sortable: true,
                    dataIndex: 'user_name'
                }, {
                    header: 'Access Rights',
                    flex: 2,
                    sortable: true,
                    dataIndex: 'user_access'
                }],

                dockedItems: [{
                    xtype: 'toolbar',
                    ui: 'footer',
                    items: [{
                        text: 'Refresh',
                        itemId: 'UserRefreshButton',
                        iconCls: 'icon-refresh',
                    },'-',{
                        text: 'Add User',
                        itemId: 'UserAddButton',
                        iconCls: 'icon-add',
                    }]
                }]
            }, {
                region: 'center',
                bodyPadding: 10,
                xtype: 'form',
                title:'Modify User',
                itemId: 'UserMainForm',
                frame: false,
                layout: 'anchor',
                disabled: true,
                defaultType: 'textfield',

                fieldDefaults: {
                    labelAlign: 'right',
                    labelWidth: 120,
                    //anchor: '100%',
                    msgTarget: 'side'
                },
    
                items: [{
                    fieldLabel: 'User',
                    name: 'user_id',
                    allowBlank: false,
                    inputWidth: '150'
                },{
                    fieldLabel: 'User Name',
                    name: 'user_name',
                    allowBlank: false,
                    inputWidth: '300'
                },{
                    xtype: 'combobox',
                    fieldLabel: 'Access Rights',
                    store: {
                        fields: ['dbvalue', 'desc'],
                        data : [
                            {"dbvalue":"user",       "desc":"User level access only"},
                            {"dbvalue":"user,admin", "desc":"User and Adminstrative level access"},
                            {"dbvalue":"admin",      "desc":"Adminstrative level access only"}
                        ]
                    },
                    queryMode: 'local',
                    displayField: 'desc',
                    valueField: 'dbvalue',
                    name: 'user_access',
                    allowBlank: false,
                    editable: false,
                    inputWidth: '300'
                },{
                    fieldLabel: 'Password',
                    name: 'user_password',
                    allowBlank: false,
                    inputWidth: '150',
                    inputType: 'password'
                }],

                dockedItems: [{
                    xtype: 'toolbar',
                    dock: 'top',
                    ui: 'footer',
                    defaults: {xtype: 'button'},
                    items: [{
                        text: 'Save Changes',
                        iconCls: 'icon-save',
                        itemId: 'UserSaveButton',
                        alight: 'left',
                    },{
                        xtype: 'tbfill'
                    },{
                        text: 'Delete User',
                        iconCls: 'icon-delete',
                        itemId: 'UserDeleteButton',
                    }]
                }]

            }]
        });

        this.callParent();
    }
});