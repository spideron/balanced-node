% if mode == 'definition': 
balanced.BankAccounts.verify

% else:
<%!
    import json

    def to_json( d ):
        return json.dumps( d , indent=4)
%>

var balanced_library = require('balanced-official');

var balanced = new balanced_library({
    marketplace_uri: "${ctx.marketplace_uri}",
    secret: "${ctx.api_key}"
});

balanced.BankAccounts.get("${request['uri']}", function(err, result) {
    balanced.BankAccounts.verify(result.verifications_uri, function(err, result) {
	/* . . . */
    });
});

% endif
