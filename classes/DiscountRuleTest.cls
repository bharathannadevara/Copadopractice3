@isTest
public class DiscountRuleTest 
{	
    @isTest
    public static void testMetadataType() 
    {
        Opportunity oppo = new Opportunity(
            Name = 'Super sale',
            Product_Category__c = label.Accessories_label,
            Customer_Segment__c = label.Headset_label,
            CloseDate = Date.today(),
            StageName = 'Closed Won');
        insert oppo;
        
        System.runAs(new user(Id = UserInfo.getUserId())) 
        {
        DiscountCalculator.calculateDiscount(oppo.Product_Category__c, oppo.Customer_Segment__c);
            // now we can refer to the test user in our test
            //System.debug('Current user: ' + UserInfo.getUserId());
        }

        // Retrieve the updated discount record from the database
		List<Opportunity> rules = [SELECT Id, Discount_Percentage__c FROM Opportunity WHERE Id = :oppo.Id ];
        
        // Verify that the Days_Since_Opening__c field is updated with the expected value
        Decimal expectedDiscount = 30;  // Assuming the discount is 30
        System.assertEquals(expectedDiscount, rules[0].Discount_Percentage__c, 'Comparing expected and actual results');

    }
}
    /*@isTest
    static void testCustomSetting() 
    {
        // Set up test data - create a mock Applicable_Discount__c custom setting
        Applicable_Discount__c testProduct = new Applicable_Discount__c(
            Name = 'Smartphone',
            Product_Category__c = 'Electronics',
            Customer_Segment__c = 'Nokia'
            //CloseDate = Date.today(),
            //StageName = 'Closed Won');
            //Discount_Percentage__c = 15 // Set the desired discount percentage for testing
        );
        insert testProduct;

        // Call the DiscountCalculator method with the mock product
        //Decimal discount = DiscountCalculator.calculateDiscount(Applicable_Discount__c product);
        List<Opportunity> discount = [SELECT Id, Discount_Percentage__c FROM Opportunity WHERE Id = :testProduct.Id ];
	
        Decimal expectedDiscount = 15;
        // Assert that the discount is calculated correctly
        System.assertEquals(expectedDiscount, discount[0].Discount_Percentage__c, 'Discount calculation should match the test product percentage');
    }
}*/