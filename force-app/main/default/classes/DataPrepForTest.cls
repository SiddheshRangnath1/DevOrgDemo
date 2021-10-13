public class DataPrepForTest 
{
    public static void InsertData()
    {
        List<Customer_Master__c> custList = new List<Customer_Master__c>();
        for(integer i=1; i<3; i++)
        {
            Customer_Master__c objCust = new Customer_Master__c();
            objCust.Account_Name__c='Test Account1';
            objCust.Contact_Name__c = 'TestContact' +i  ;
            objCust.Contact_Mobile__c = '89898989898';
            objCust.Contact_Email__c ='Cust'+i+'@email.com';
            custList.add(objCust);
        }
        insert custList;
    }
}



/*
 ​[11:43 AM] Rishab Goyal ( Aethereus )
    public static void onAfterInsert(List<Account> AccountList)
{​​​
/*call after insert actions
For (Account Acc : AccountList)
{​​​
List<Customer_Master__c> ContactList = [Select ID, Contact_Name__c, Contact_Email__c, Contact_Mobile__c
from Customer_Master__c where Account_Name__c =:Acc.Name];
List<Contact> NewConList = new list<Contact>();
For(Customer_Master__c con: ContactList)
{​​​
Contact NewCon = new Contact (LastName = con.Contact_Name__c,
AccountId = Acc.Id,
Email = con.Contact_Email__c,
Phone = con.Contact_Mobile__c);
NewConList.add(NewCon);
}​​​
insert NewConList;
}​​​
}​​​

public static void onAfterInsert(List<Account> AccountList)
{​​​
//AccountList = trigger.new
/*call after insert actions
List<Contact> NewConList = new list<Contact>();
//Collect All the names
Set<String> allAccountNameSet = new Set<String>();
for (Account acc : AccountList)
{​​​
allAccountNameSet.add(acc.Name);
}​​​
//Query for CustomerMasterRecords in the DB with Same Name
List<Customer_Master__c> ContactList = [Select ID, Contact_Name__c, Contact_Email__c, Contact_Mobile__c,Account_Name__c
from Customer_Master__c where Account_Name__c in :allAccountNameSet];
 For (Account Acc : AccountList)
{​​​
//Acc = SOCompany
For(Customer_Master__c con: ContactList)
{​​​
if(con.Account_Name__c==acc.Name)
{​​​
Contact NewCon = new Contact (LastName = con.Contact_Name__c,
AccountId = Acc.Id,
Email = con.Contact_Email__c,
Phone = con.Contact_Mobile__c);
NewConList.add(NewCon);
}​​​
}​​​
}​​​
 insert NewConList;
}​​​

 List<Contact> NewConList = new list<Contact>();
//String is Account Name, Account corresponding to that account name
Map<String,Account> accMap = new Map<String,Account>();
 //Collect All the names
Set<String> allAccountNameSet = new Set<String>();
for (Account acc : AccountList)
{​​​
allAccountNameSet.add(acc.Name);
 accMap.put(acc.Name,acc);
}​​​
 'Aethereus' : Account( Id: '123123adasdas',Name:'Aethereus')
'SOCompany' : Account( Id: '123123adasdas',Name:'Aethereus')

//Query for CustomerMasterRecords in the DB with Same Name
List<Customer_Master__c> ContactList = [Select ID, Contact_Name__c, Contact_Email__c, Contact_Mobile__c,Account_Name__c
from Customer_Master__c where Account_Name__c in :allAccountNameSet];

List<Customer_Master__c> ContactList = [Select ID, Contact_Name__c, Contact_Email__c, Contact_Mobile__c,Account_Name__c
from Customer_Master__c where Account_Name__c in :allAccountNameSet];
 For(Customer_Master__c con: ContactList)
{​​​
Contact NewCon = new Contact (LastName = con.Contact_Name__c,
Email = con.Contact_Email__c,
Phone = con.Contact_Mobile__c);
Aethereus
newCon.AccountId = accMap.get(con.Account_Name__c).Id;//fetch AccountId Somehow from con.Account_Name__c
NewConList.add(NewCon);
}​​​

 accMap.get()
*/