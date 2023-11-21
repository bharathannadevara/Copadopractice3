@isTest
public class AccountUpdaterTest {
    
    @isTest
    static void testUpdateIndustry() {
        // Create a test Account
        Account varAccount = new Account(Name='IBM', Industry='Technology');
        insert varAccount;

        // Call the method to update the Industry
        System.runAs(new User(Id = UserInfo.getUserId())) {
            String newIndustry = 'Finance';
            AccountUpdater.updateIndustry(varAccount.Id, newIndustry);
        }

        // Retrieve the updated Account
        Account updatedAccount = [SELECT Id, Industry FROM Account WHERE Id = :varAccount.Id LIMIT 1];

        // Verify that the Industry field is updated
        String expectedIndustry = 'Finance';
        System.assertEquals(expectedIndustry, updatedAccount.Industry, 'Industry field not updated correctly');
    }
}