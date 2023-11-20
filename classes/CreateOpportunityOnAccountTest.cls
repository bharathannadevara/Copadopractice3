@isTest
private class CreateOpportunityOnAccountTest {

    @isTest
    static void testCreateOpportunity() {
        // Test data setup (create a test Account with industry set to "Technology")
        Account testAccount = new Account(
            Name = 'Test Account',
            Industry = 'Technology'
        );
        insert testAccount;

        // Call the method to be tested
        Test.startTest();
        CreateOpportunityOnAccount.createOpportunity(new List<Account>{testAccount});
        Test.stopTest();

        // Query the Opportunities created
        List<Opportunity> createdOpportunities = [SELECT Id, Name, StageName, CloseDate, AccountId FROM Opportunity];

        // Assertion to check if the Opportunity was created as expected
        System.assertEquals(1, createdOpportunities.size());
        System.assertEquals('New Opportunity for Test Account', createdOpportunities[0].Name);
        System.assertEquals('Prospecting', createdOpportunities[0].StageName);
        System.assertEquals(Date.today().addMonths(1), createdOpportunities[0].CloseDate);
        System.assertEquals(testAccount.Id, createdOpportunities[0].AccountId);
    }
}