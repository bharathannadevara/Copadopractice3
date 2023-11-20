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

        // Create a test user with specific profile or permission set
        /*Profile testProfile = [SELECT Id FROM Profile WHERE Name = 'Standard User' LIMIT 1]; // Replace 'Standard User' with the actual profile name
        User testUser = new User(
            FirstName = 'Test',
            LastName = 'User',
            Alias = 'tuser',
            Email = 'testuser@example.com',
            UserName = 'testuser@example.com',
            ProfileId = testProfile.Id,
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            TimeZoneSidKey = 'America/Los_Angeles'
        );
        insert testUser;*/

        // Call the method to be tested within a System.runAs() block
        System.runAs(new user(Id = UserInfo.getUserId())) {
            CreateOpportunityOnAccount.createOpportunity(new List<Account>{testAccount});
        }

        // Query the Opportunities created
        List<Opportunity> createdOpportunities = [SELECT Id, Name, StageName, CloseDate, AccountId FROM Opportunity];

        // Assertion to check if the Opportunity was created as expected
        System.assertEquals(1, createdOpportunities.size(), 'One Opportunity should have been created');
        Opportunity createdOpportunity = createdOpportunities[0];
        System.assertEquals('New Opportunity for Test Account', createdOpportunity.Name, 'Incorrect Opportunity Name');
        System.assertEquals('Prospecting', createdOpportunity.StageName, 'Incorrect Opportunity Stage');
        System.assertEquals(Date.today().addMonths(1), createdOpportunity.CloseDate, 'Incorrect Close Date');
        System.assertEquals(testAccount.Id, createdOpportunity.AccountId, 'Incorrect AccountId');

    }
}