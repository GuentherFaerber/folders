sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        onPress: function() {
            sap.ui.require([ "sap/m/library" ], ({URLHelper}) => URLHelper.redirect('www.sap.com', false));
            MessageToast.show("Custom handler invoked.");
        }
    };
});
