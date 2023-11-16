@isTest
public class DiscountRuleTest 
{	
    @isTest
    public static void testApplyDiscount() 
    {
        Opportunity oppo = new Opportunity(
            Name = 'Super sale',
            Product_Category__c = label.Accessories_label,
            Customer_Segment__c = label.Headset_label,
            CloseDate = Date.today(),
            StageName = 'Closed Won');
        insert oppo;
        
        System.runAs(new user(Id = UserInfo.getUserId())) {
        DiscountCalculator.calculateDiscount(oppo.Product_Category__c, oppo.Customer_Segment__c);
            // now we can refer to the test user in your test
            //System.debug('Current user: ' + UserInfo.getUserId());
        }

        // Retrieve the updated discount record from the database
		List<Opportunity> rules = [SELECT Id, Discount_Percentage__c FROM Opportunity WHERE Id = :oppo.Id ];
        
        // Verify that the Days_Since_Opening__c field is updated with the expected value
        Decimal expectedDiscount = 30;  // Assuming the discount is 30
        System.assertEquals(expectedDiscount, rules[0].Discount_Percentage__c, 'Comparing expected and actual results');

    }
}