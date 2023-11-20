public class CreateOpportunityOnAccount {

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
            insert opportunitiesToInsert;
        }
    }
}