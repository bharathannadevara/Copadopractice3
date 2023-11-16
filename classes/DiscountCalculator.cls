/**
* @description Utility class for calculating discounts based on Product Category and Customer Segment
*/
public class DiscountCalculator {
    /**
    * @description Calculates bulk discounts based on unique Product Categories and Customer Segments
    */
    public static Decimal calculateDiscount(String productCategory, String customerSegment) {
        Decimal discountPercentage = 0;

        // Query custom metadata to get discount rules based on criteria
        List<Discount_Rules__mdt> rules = [SELECT Discount_Percentage__c 
                                           FROM Discount_Rules__mdt 
                                           WHERE Product_Category__c = :productCategory 
                                           AND Customer_Segment__c = :customerSegment];
        
        Applicable_Discount__c product = Applicable_Discount__c.getValues('Smartphone');

		if (rules != null) 
        {
            discountPercentage = rules[0].Discount_Percentage__c;
        }
        
        return discountPercentage;
    }
}