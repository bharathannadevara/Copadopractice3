trigger DiscountTrigger on Opportunity (before insert, before update) 
{
	TriggerHandler.triggerDiscount(trigger.new);
}