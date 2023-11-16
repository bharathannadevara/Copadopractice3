trigger DiscountTrigger on Opportunity (before insert, before update) 
{
		for(Opportunity oppo : trigger.new)
    {
        decimal discount = DiscountCalculator.calculateDiscount(oppo.Product_Category__c,oppo.Customer_Segment__c);
        oppo.Discount_Percentage__c = discount;
    }
}