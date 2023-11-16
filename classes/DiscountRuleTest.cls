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


        // Retrieve the updated discount record from the database
		List<Opportunity> rules = [SELECT Id, Discount_Percentage__c FROM Opportunity WHERE Id = :oppo.Id ];
        
        // Verify that the Days_Since_Opening__c field is updated with the expected value
        Decimal expectedDiscount = 30;  // Assuming the discount is 30
        System.assertEquals(expectedDiscount, rules[0].Discount_Percentage__c);
        
        /*// Test applying discount
        Test.startTest();
        custommetadata_newclass.applyDiscount(opp.Customer_Segment__c, opp.category__c);
        Test.stopTest();
 		*/
    }
}