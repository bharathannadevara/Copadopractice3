/**
 * @description The CreateOpportunityOnAccount class provides a method to create new Opportunities
 * for Accounts with a specified industry.
 *
 * This class is declared as public without sharing, meaning it doesn't enforce sharing rules
 * and can access and modify records regardless of the user's sharing settings.
 */
public without sharing class CreateOpportunityOnAccount {
	/**
     * @description The createOpportunity method creates new Opportunities for specified Accounts.
     * It checks if the industry of an Account is "Technology" and creates an Opportunity
     * with specific details.
     *
     * @param newAccounts A list of Account records for which Opportunities need to be created.
     */
    // Method to create a new Opportunity for the specified industry
    public static void createOpportunity(List<Account> newAccounts) {
        List<Opportunity> opportunitiesToInsert = new List<Opportunity>();

        for (Account acc : newAccounts) {
            // Check if the industry is "Technology"
            if (acc.Industry == 'Technology') {
                Opportunity newOpportunity = new Opportunity(
                    Name = 'New Opportunity for ' + acc.Name,
                    StageName = 'Prospecting',
                    CloseDate = Date.today().addMonths(1),
                    AccountId = acc.Id
                );
                opportunitiesToInsert.add(newOpportunity);
            }
        }

        // Insert the new Opportunities
        
            if (!opportunitiesToInsert.isEmpty()) {
               if (Schema.sObjectType.Opportunity.isCreateable()) {
                insert opportunitiesToInsert;
            }
            
        }
    }
}