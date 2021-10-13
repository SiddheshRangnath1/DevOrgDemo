@isTest
private class UpdateContactBatchTest 
{    
    @isTest static void test() 
    {
        Test.startTest();
        UpdateContactBatch updCon = new UpdateContactBatch();
        Id batchId = Database.executeBatch(updCon);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(10, [select count() from Contact]);
    }
}