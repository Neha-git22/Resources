public class AccountContactPhoneHandler {
    public static void AccountHandler(List<Contact> newContacts, Map<Id, Contact> oldContactMap) {
        Set<Id> accountIds = new Set<Id>();
        
      
        for (Contact contact : newContacts) {
            accountIds.add(contact.AccountId);
        }

        Map<Id, Set<String>> accountPhoneNumbersMap = new Map<Id, Set<String>>();

        List<Contact> contactList =[SELECT AccountId, Phone FROM Contact WHERE AccountId IN :accountIds];
        for (Contact contactDetail : contactList) {
            if (!accountPhoneNumbersMap.containsKey(contactDetail.AccountId)) {
                accountPhoneNumbersMap.put(contactDetail.AccountId, new Set<String>());
            }
            accountPhoneNumbersMap.get(contactDetail.AccountId).add(contactDetail.Phone);
        }

      
        for (Contact newContact : newContacts) {
            if (accountPhoneNumbersMap.containsKey(newContact.AccountId)) {
                Set<String> phoneNumbersInAccount = accountPhoneNumbersMap.get(newContact.AccountId);
               
                if (phoneNumbersInAccount.contains(newContact.Phone)) {
                    newContact.addError('The phone number of this contact is the same');
                }
            }
        }
    }
}