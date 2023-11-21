@isTest
public class CampaignCreatorTest {
    @isTest
    static void testCreateCampaign() {
        // Call the method to create a Campaign
        String campaignName = 'Iphone 15 Campaign';
        Date startDate = Date.today();
        Date endDate = startDate.addDays(30);

        System.runAs(new User(Id = UserInfo.getUserId())) {
        CampaignCreator.createCampaign(campaignName, startDate, endDate);
        }

        // Retrieve the created Campaign
        Campaign createdCampaign = [SELECT Id, Name, StartDate, EndDate FROM Campaign WHERE Name = :campaignName LIMIT 1];

        // Verify that the Campaign is created with the correct details
        System.assertEquals(campaignName, createdCampaign.Name, 'Campaign Name not set correctly');
        System.assertEquals(startDate, createdCampaign.StartDate, 'Start Date not set correctly');
        System.assertEquals(endDate, createdCampaign.EndDate, 'End Date not set correctly');
    }
}