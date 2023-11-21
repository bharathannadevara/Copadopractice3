/**
 * @description The AccountUpdater class provides a method to update the Industry field of an Account.
 */
public class AccountUpdater {
    /**
     * @description Updates the Industry field of an Account.
     * 
     * @param accountId The ID of the Account to update.
     * @param newIndustry The new Industry value to set.
     */
    public static void updateIndustry(String accountId, String newIndustry) {
        // Retrieve the Account record
        Account accToUpdate = [SELECT Id, Industry FROM Account WHERE Id = :accountId LIMIT 1];

        // Update the Industry field
        accToUpdate.Industry = newIndustry;

        if(Schema.sObjectType.Account.isCreateable()) {
        // Save the updated record
        update accToUpdate;
        }
    }
}