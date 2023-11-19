/**
* @description Utility class for calculating discounts based on Product Category and Customer Segment.
*/
public without sharing class DiscountCalculator {
    /**
    * @description Calculates bulk discounts based on unique Product Categories and Customer Segments.
    * @param productCategory Set of unique Product Categories.
    * @param customerSegment Set of unique Customer Segments.
    * @return calculateDiscount
    */
    public static Decimal calculateDiscount(String productCategory, String customerSegment) {
        Decimal discountPercentage = 0;
        
        List<Discount_Rules__mdt> rules;
		// Check if the Discount_Rules__mdt object is accessible
		if (Schema.sObjectType.Discount_Rules__mdt.isAccessible())
        {
            rules = [SELECT Discount_Percentage__c FROM Discount_Rules__mdt 
             					WHERE Product_Category__c = :productCategory 
             					AND Customer_Segment__c = :customerSegment];
        }
    	
        //Applicable_Discount__c product;
        //Applicable_Discount__c product = Applicable_Discount__c.getValues('Smartphone'); 
        
        
		if (rules != null && !rules.isEmpty()) 
        {
            discountPercentage = rules[0].Discount_Percentage__c;  
        }
        return discountPercentage;
    }
}