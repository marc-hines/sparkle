Ext.define('Sparkle.view.window.LoginWindow', {
    extend: 'Ext.window.Window',
    xtype: 'app-login-window',
    
    requires: [
        'Ext.form.*',
    ],
    
    height: 250,
    width: 500,
    layout: 'fit',
    frame: false,
    autoShow: true,
    //closable: false,
    modal: true,

    initComponent: function(){
        Ext.apply(this, {

            items: [{
                xtype: 'form',
                title: 'Login',
                itemId: 'LoginForm',
                bodyPadding: 20,
                frame: true,
                width: 500,
                defaultType: 'textfield',

                fieldDefaults: {
                    labelAlign: 'right',
                    labelWidth: 120,
                    msgTarget: 'side'
                },
                
                items: [{
                    allowBlank: false,
                    fieldLabel: 'User ID',
                    name: 'user',
                    emptyText: 'Your user id',
                    inputWidth: '200'
                },{
                    allowBlank: false,
                    fieldLabel: 'Password',
                    name: 'pass',
                    emptyText: 'Your password',
                    inputType: 'password',
                    inputWidth: '200'
                }],
                
                buttons: [{
                    text:'Login'
                }]

            }]
        });
        this.callParent();
    }
});