/**
 * @description TriggerHandler
 */
public class TriggerHandler 
{
    /**
     * @description triggerDiscount
     * @param newOpportunities list to pass discount parameters
     */
    public static void triggerDiscount(List<Opportunity> newOpportunities) 
    {
        for(Opportunity oppo : newOpportunities)
    {
        decimal discount = DiscountCalculator.calculateDiscount(oppo.Product_Category__c,oppo.Customer_Segment__c);
        oppo.Discount_Percentage__c = discount;
    }
    }
}