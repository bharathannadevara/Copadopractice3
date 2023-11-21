/**
 * @description The CampaignCreator class provides a method to create a new Campaign record.
 */
public class CampaignCreator {
    /**
     * @description Creates a new Campaign with the specified details.
     *
     * @param campaignName The name of the Campaign.
     * @param startDate The start date of the Campaign.
     * @param endDate The end date of the Campaign.
     */
    public static void createCampaign(String campaignName, Date startDate, Date endDate) {
        Campaign newCampaign = new Campaign(
            Name = campaignName,
            StartDate = startDate,
            EndDate = endDate
        );
		
        if(Schema.sObjectType.Campaign.isCreateable()) {
        insert newCampaign;
    	}
    }
}