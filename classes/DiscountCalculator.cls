/**
* @description Utility class for calculating discounts based on Product Category and Customer Segment
*/
public without sharing class DiscountCalculator {
    /**
    * @description Calculates bulk discounts based on unique Product Categories and Customer Segments
    * @param productCategories Set of unique Product Categories.
    * @param customerSegments Set of unique Customer Segments.
    * @return Map containing discounts keyed by concatenation of Product Category and Customer Segment.
    */
    public static Decimal calculateDiscount(String productCategory, String customerSegment) {
        Decimal discountPercentage = 0;
        
        List<Discount_Rules__mdt> rules;
		if (!Schema.sObjectType.Discount_Rules__mdt.isAccessible()) 
        {
          // Query custom metadata to get discount rules based on criteria
          rules = [SELECT Discount_Percentage__c FROM Discount_Rules__mdt 
                                           WHERE Product_Category__c = :productCategory 
                                           AND Customer_Segment__c = :customerSegment];
        }
        
        Applicable_Discount__c product = Applicable_Discount__c.getValues('Smartphone'); // not used

		if (rules != null) 
        {
            discountPercentage = rules[0].Discount_Percentage__c;
        }
        
        return discountPercentage;
    }
}