trigger PreventConDupEmailtestt on Contact (before insert,before update) {
    // Map to store AccountId and corresponding set of email addresses
    Map<Id, Set<String>> accountEmailsMap = new Map<Id, Set<String>>();

    // Collect email addresses for each Account
    for (Contact newContact : Trigger.new) {
        // Check if the email is not empty and associated with an Account
        if (newContact.Email != null && newContact.AccountId != null) {
            if (!accountEmailsMap.containsKey(newContact.AccountId)) {
                accountEmailsMap.put(newContact.AccountId, new Set<String>());
            }

            // If the email is already in the set, add an error
            if (!accountEmailsMap.get(newContact.AccountId).add(newContact.Email)) {
                newContact.Email.addError('Duplicate email address for the same Account.');
            }
        }
    }


}