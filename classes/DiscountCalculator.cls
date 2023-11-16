public class DiscountCalculator {
    public static Decimal calculateDiscount(String productCategory, String customerSegment) {
        Decimal discountPercentage = 0;

        // Query custom metadata to get discount rules based on criteria
        List<Discount_Rules__mdt> rules = [SELECT Discount_Percentage__c 
                                           FROM Discount_Rules__mdt 
                                           WHERE Product_Category__c = :productCategory 
                                           AND Customer_Segment__c = :customerSegment];
        system.debug('Rules= '+rules);
        
        Applicable_Discount__c product = Applicable_Discount__c.getValues('Smartphone');

        /*if (rules != null && !rules.isEmpty()) 
        {
            // Assuming you want to consider the first rule if there are multiple
            discountPercentage = rules[0].Discount_Percentage__c;
        }*/

		if (rules != null) 
        {
            discountPercentage = rules[0].Discount_Percentage__c;
        }
        system.debug('discountPercentage= '+discountPercentage);
        return discountPercentage;
    }
}